Awacs = {
    aircraft = {},
    speed = 600,
    altitude = 9000,
    duration = 8100,
    departureSpeed = 400,
    departureAlt = 2000,
    approachSpeed = 300,
    approachAlt = 2000
}

---Creates a new Awacs instance.
---@param name string
---@param type string
---@param side string
---@param freq number
---@param modulation string
---@param baseName string
---@param statics table
---@param location table
---@return table
function Awacs.new(name, type, side, freq, modulation, baseName, statics, location)
    local awacsCallsign = CallsignGenerator.awacsCallsign()
    local callsignIndex, flightNr, memberNr = unpack(awacsCallsign)

    local awacs = {
        name = name,
        type = type,
        freq = freq,
        modulation = modulation,
        baseName = baseName,
        statics = statics,
        location = location,
        callsign = {
            name = awacsCallsign.name,
            index = callsignIndex,
            flightNr = flightNr,
            memberNr = memberNr,
        },
        side = side,
        killedOn = nil,
        usedOn = nil,
    }

    return awacs
end

function Awacs.isDead(awacs)
    return awacs.killedOn ~= nil
end

function Awacs.kill(awacs)
    awacs.killedOn = LSA.getNow()
end

function Awacs.spawn(awacs)
    if Awacs.isDead(awacs) then return end
    if Awacs.isUsed(awacs) then return end

    for _, static in ipairs(awacs.statics) do
        local scheme = StaticWrp.__scheme(static)
        LSA.spawnStatic2(scheme, static.side)

        Awacs.aircraft[awacs.name] = awacs
        RefStatics.new(static.name, static)
    end
end

---Process land events of Awacs.
---@param unitName string
function Awacs.onLandEvent(unitName)
    local awacs = Awacs.__findByName(unitName)
    if awacs ~= nil then
        TS.task("despawn awacs", function()
            local unit = LSA.getUnit(unitName)
            if unit ~= nil then
                unit:destroy()
            end
        end, {}, 10 * 60) -- [TODO] move to settings and fine tune
    end
end

function Awacs.__findByStaticName(staticName)
    for _, awacs in pairs(Awacs.aircraft) do
        for _, static in ipairs(awacs.statics) do
            if static.name == staticName then
                return awacs
            end
        end
    end

    return nil
end

function Awacs.onLostStatic(event)
    local static = event.initiator
    local staticName = static:getName()
    local awacs = Awacs.__findByStaticName(staticName)
    if awacs ~= nil then
        Awacs.kill(awacs)
    end
end

function Awacs.onLostUnit(event)
    local unit = event.initiator
    local unitName = unit:getName()
    local awacs = Awacs.__findByName(unitName)
    if awacs ~= nil then
        Awacs.kill(awacs)
    end
end

function Awacs.isAlive(awacs)
    return awacs.killedOn == nil
end

function Awacs.isUsed(awacs)
    return awacs.usedOn ~= nil
end

function Awacs.isUnused(awacs)
    return awacs.userOn == nil
end

function Awacs.isAvailable(awacs)
    if awacs == nil then return false end
    if awacs.usedOn == nil and awacs.killedOn == nil then return true end

    local date = nil
    if awacs.usedOn ~= nil and awacs.killedOn == nil then
        -- if the awacs was used but wasn't killed, 
        -- calculate next availability using the usedOn date
        date = awacs.usedOn
    else
        -- for any other situation use the killedOn date
        date = awacs.killedOn
    end
    
    local waitPeriod = LSA.settings.waitPeriodForNewAwacs
    local today = LSA.getToday()
    
    -- if the current date is greater than the used date
    -- the we can just subtract the current with the used date
    -- and compare with the wait period
    if today >= date then
        return today - date > waitPeriod
    end

    -- because the mission loops in a given year
    -- when the date of used is greater than the current date
    -- we need to add a year's worth of seconds to the current date
    -- effectively moving the current date to next year
    -- then subtract the used date to the new current date
    -- and compare with the wait period
    local yearLengthInSeconds = LSA.getYearLengthInSeconds(env.mission.date.Year)
    return (today + yearLengthInSeconds) - date > waitPeriod
end

function Awacs.repair(awacs)
    if awacs == nil then return end

    awacs.killedOn = nil
    awacs.usedOn = nil

    for _, static in ipairs(awacs.statics) do
        StaticWrp.repair(static)
    end
end

function Awacs.__removeByName(name)
    local awacs = Awacs.aircraft[name]
    if awacs == nil then
        Log.trace("Awacs %s does not exist", name)
        return
    end
    Awacs.aircraft[name] = nil
end

---Returns the awacs by the base name.
---@param baseName string
---@return table|nil
function Awacs.__findByBase(baseName)
    for _, awacs in pairs(Awacs.aircraft) do
        if awacs.baseName == baseName then
            return awacs
        end
    end
    return nil
end

---Returns the awacs by the name.
---@param unitName string
---@return table|nil
function Awacs.__findByName(unitName)
    local awacs = Awacs.aircraft[unitName]
    if awacs == nil then
        Log.trace("Could not find a awacs by the name %s", unitName)
    end
    return awacs
end

---Returns the awacs that matches the predicate.
---@param predicate function
---@return table|nil
function Awacs.__find(predicate)
    for _, awacs in pairs(Awacs.aircraft) do
        if predicate(awacs) then
            return awacs
        end
    end
    return nil
end

function Awacs.explode(awacs)
    for _, static in ipairs(awacs.statics) do
        LSA.explodeStatic(static.name)
    end
end

---Dispatches a awacs.
---@param side number
---@param fromName string
---@param destination table
---@param track number
---@return boolean
---@return string
function Awacs.dispatch(side, fromName, destination, track)
    local origin = LSA.findBase(fromName)

    if origin == nil or destination == nil then
        return false, string.format("Unable, destination is not valid.")
    end

    if origin.side ~= side then
        Log.debug("Can't call awacs of the other side")
        return false, string.format("Unable, origin is not valid.")
    end

    local awacs = Awacs.__find(function(t)
        return t.baseName == fromName
    end)

    if awacs == nil then
        Log.debug("Base %s has no awacs", origin.name)
        return false, string.format("Unable, base %s has no awacs.", origin.name)
    end
    
    if Awacs.isUsed(awacs) then
        Log.debug("There is no awacs available at %s", origin.name)
        return false, string.format("Unable, there is no awacs available at %s.", origin.name)
    end

    track = math.ceil(track)
    if track < 0 or track > 360 then
        return false, string.format("Unable, %s is not a valid track.", track)
    end

    -- despawn the statics that represent the awacs
    Awacs.__despawnStatics(awacs)
    -- mark the awacs as used
    Awacs.__setUsed(awacs)

    -- spawn the awacs
    local scheme = Awacs.__scheme(awacs)
    local schemeRoute = Awacs.__schemeRoute(origin, awacs.location, destination, 8100, track)
    scheme.route = schemeRoute

    TS.task("spawn awacs", function()
        local group = LSA.spawnAircraft(scheme, side)
        assert(group ~= nil)
    end)
    return true, string.format("Roger, %s on the way.", awacs.callsign.name)
end

function Awacs.__setUsed(awacs)
    if awacs == nil then return end
    awacs.usedOn = LSA.getNow()
end

---Returns the awacs by the callsign.
---@param callsign string
---@return table|nil
function Awacs.__findByCallsign(callsign)
    for _, awacs in pairs(Awacs.aircraft) do
        if awacs.callsign.name == callsign then
            return awacs
        end
    end
    return nil
end

function Awacs.relocate(callsign, markCoalition, destination, track)
    local awacs = Awacs.__findByCallsign(callsign)
    if awacs == nil then return false, string.format("Unable, no awacs with callsign %s.", callsign) end

    if awacs.side ~= markCoalition then return false, string.format("Unable, %s is not on our side.", callsign) end

    local awacsUnit = LSA.getUnit(awacs.name)
    if awacsUnit == nil then return false, string.format("Unable, invalid awacs.") end

    local airdrome = LSA.findBase(awacs.baseName)
    if airdrome == nil then return false, string.format("Unable, invalid awacs base.") end

    local tacan = awacs.tacan
    local awacsTask = LSA.getAwacsTask()
    local tacanTask = LSA.getTacanTask(tacan.callsign, tacan.mode, tacan.channel, tacan.freq)
    local currentPoint = LSA.getWaypoint(ToVec2(awacsUnit:getPoint()), Awacs.speed, Awacs.altitude)
    currentPoint.task = LSA.getComboTask({ awacsTask, tacanTask })
    local awacsOrbitPoint = LSA.getOrbitPoint(destination, Awacs.speed, Awacs.altitude, Awacs.duration, track)
    local approachPoint = LSA.getApproachPoint(airdrome.location, Awacs.approachSpeed, Awacs.approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, Awacs.speed, Awacs.altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, Awacs.approachSpeed, Awacs.approachAlt)

    local route = { points = {} }
    table.insert(route.points, currentPoint)
    table.insert(route.points, awacsOrbitPoint)
    table.insert(route.points, descentPoint)
    table.insert(route.points, approachPoint)
    table.insert(route.points, landPoint)

    local awacsCtrl = awacsUnit:getController()
    awacsCtrl:pushTask({
        id = 'Mission',
        params = {
            airborne = true,
            route = route
        }
    })

    -- [TODO] show the relocating message with a grid
    return true, string.format("Roger, %s relocating.", awacs.callsign.name)
end

---Despawns the supporting statics associated with the awacs.
---@param awacs table
function Awacs.__despawnStatics(awacs)
    for _, static in ipairs(awacs.statics) do
        local staticObject = StaticObject.getByName(static.name)
        staticObject:destroy()
    end
end

---Creates a awacs scheme.
---@param awacs table
---@return table
function Awacs.__scheme(awacs)
    local name = awacs.name
    local location = awacs.location
    local type = awacs.type
    local freq = LSA.hzToMhz(awacs.freq)
    local modulation = LSA.getRadioModulation(awacs.modulation)
    local callsign = awacs.callsign
    local alt = land.getHeight(location)

    return {
        ["modulation"] = modulation,
        ["task"] = "AWACS",
        ["route"] = {},
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = alt,
                ["alt_type"] = "BARO",
                ["skill"] = LSA.settings.defaultUnitSkillLevel,
                ["type"] = type,
                ["psi"] = 0,
                ["y"] = location.y,
                ["x"] = location.x,
                ["name"] = name,
                ["callsign"] = {
                    ["name"] = callsign.name,
                    [1] = callsign.index,
                    [2] = callsign.flightNr,
                    [3] = callsign.memberNr
                },
            },
        },
        ["y"] = location.y,
        ["x"] = location.x,
        ["name"] = name,
        ["communication"] = true,
        ["start_time"] = 0,
        ["frequency"] = freq,
    }
end

---Creates a awacs route from an airdrome to an orbit point.
---@param airdrome table
---@param parkingLocation table
---@param orbit table
---@param duration number
---@param track number
---@return table
function Awacs.__schemeRoute(airdrome, parkingLocation, orbit, duration, track)
    local route = {
        points = {}
    }

    local takeOffPoint = LSA.getTakeoffPoint(airdrome.id, parkingLocation)
    local awacsTask = LSA.getAwacsTask()
    takeOffPoint.task = LSA.getComboTask({ awacsTask })
    local departurePoint = LSA.getDeparturePoint(airdrome.location, Awacs.departureSpeed, Awacs.departureAlt)
    local awacsOrbitPoint = LSA.getOrbitPoint(orbit, Awacs.speed, Awacs.altitude, duration, track)
    local approachPoint = LSA.getApproachPoint(airdrome.location, Awacs.approachSpeed, Awacs.approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, Awacs.speed, Awacs.altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, Awacs.approachSpeed, Awacs.approachAlt)

    table.insert(route.points, takeOffPoint)
    table.insert(route.points, departurePoint)
    table.insert(route.points, awacsOrbitPoint)
    table.insert(route.points, descentPoint)
    table.insert(route.points, approachPoint)
    table.insert(route.points, landPoint)

    return route
end