Tanker = {
    tankers = {},
    duration = 8100,
    speed = 560, --kmh
    altitude = 9000,
    departureSpeed = 400, --kmh
    departureAlt = 2000,
    approachSpeed = 300,  --kmh
    approachAlt = 2000
}

---Creates a new Tanker instance.
---@param name string
---@param type string
---@param side string
---@param method string
---@param freq number
---@param modulation string
---@param baseName string
---@param tacan table|nil
---@param statics table
---@param location table
---@return table
function Tanker.new(name, type, side, method, freq, modulation, baseName, tacan, statics, location)
    local tankerCallsign = CallsignGenerator.tankerCallsign()
    local callsignIndex, flightNr, memberNr = unpack(tankerCallsign)

    local tanker = {
        name = name,
        type = type,
        method = method,
        freq = freq,
        modulation = modulation,
        tacan = tacan,
        baseName = baseName,
        statics = statics,
        location = location,
        callsign = {
            name = tankerCallsign.name,
            index = callsignIndex,
            flightNr = flightNr,
            memberNr = memberNr,
        },
        side = side,
        usedOn = nil,
        killedOn = nil,
        status = "ready"
    }

    return tanker
end

function Tanker.isDead(tanker)
    return tanker.killedOn ~= nil
end

function Tanker.isAlive(tanker)
    return tanker.killedOn == nil
end

function Tanker.isUsed(tanker)
    return tanker.usedOn ~= nil
end

function Tanker.isUnused(tanker)
    return tanker.usedOn == nil
end

function Tanker.kill(tanker)
    tanker.killedOn = LSA.getNow()
end

function Tanker.spawn(tanker)
    if Tanker.isDead(tanker) then return end
    if Tanker.isUsed(tanker) then return end

    for _, static in ipairs(tanker.statics) do
        local scheme = StaticWrp.__scheme(static)
        LSA.spawnStatic2(scheme, static.side)

        Tanker.tankers[tanker.name] = tanker
        RefStatics.new(static.name, static)
    end
end

function Tanker.repair(tanker)
    if tanker == nil then return end

    tanker.killedOn = nil
    tanker.usedOn = nil

    for _, static in ipairs(tanker.statics) do
        StaticWrp.repair(static)
    end
end

---Process land events of tankers.
---@param unitName string
function Tanker.onLandEvent(unitName)
    local tanker = Tanker.__findByName(unitName)
    if tanker ~= nil then
        TS.task("despawn tanker", function()
            local unit = LSA.getUnit(unitName)
            if unit ~= nil then
                unit:destroy()
            end
        end, {}, 10 * 60) -- [TODO] move to settings and fine tune
        tanker.status = "landed"
    end
end

function Tanker.__findByStaticName(staticName)
    for _, tanker in pairs(Tanker.tankers) do
        for _, static in ipairs(tanker.statics) do
            if static.name == staticName then
                return tanker
            end
        end
    end

    return nil
end

function Tanker.__isTanker(staticName)
    for _, tanker in pairs(Tanker.tankers) do
        for _, static in ipairs(tanker.statics) do
            if static.name == staticName and static.role == "tanker" then
                return true
            end
        end
    end
    return false
end

function Tanker.onLostStatic(event)
    local static = event.initiator
    local staticName = static:getName()
    if Tanker.__isTanker(staticName) then
        local tanker = Tanker.__findByStaticName(staticName)
        Tanker.kill(tanker)
    end
end

function Tanker.onLostUnit(event)
    local unit = event.initiator
    local unitName = unit:getName()
    local tanker = Tanker.__findByName(unitName)
    if tanker ~= nil then
        Tanker.kill(tanker)
    end
end

function Tanker.isAvailable(tanker)
    if Tanker.isUnused(tanker) and Tanker.isAlive(tanker) then return true end

    local date = tanker.usedOn or tanker.killedOn
    local waitPeriod = LSA.settings.waitPeriodForNewTanker
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
    local yearLengthInSeconds = LSA.getYearLengthInSeconds(env.mission.date.year)
    return (today + yearLengthInSeconds) - date > waitPeriod
end

---Returns the tanker by the name.
---@param unitName string
---@return table|nil
function Tanker.__findByName(unitName)
    local tanker = Tanker.tankers[unitName]
    if tanker == nil then
        Log.trace("Could not find a tanker by the name %s", unitName)
    end
    return tanker
end

---Returns the tanker that matches the predicate.
---@param predicate function
---@return table|nil
function Tanker.__find(predicate)
    for _, tanker in pairs(Tanker.tankers) do
        if predicate(tanker) then
            return tanker
        end
    end
    return nil
end

function Tanker.explode(tanker)
    if tanker.status ~= "ready" then return end
    for _, static in ipairs(tanker.statics) do
        LSA.explodeStatic(static.name)
    end
end

---Dispatches a tanker.
---@param side number
---@param fromName string
---@param destination table
---@param method string
---@param track number
---@return boolean
---@return string
function Tanker.dispatch(side, fromName, destination, method, track)
    local origin = LSA.findBase(fromName)

    if origin == nil or destination == nil then
        return false, string.format("Unable, destination is not valid.")
    end

    if origin.side ~= side then
        Log.debug("Can't call tankers of the other side")
        return false, string.format("Unable, origin is not valid.")
    end

    local tanker = Tanker.__find(function(t)
        return t.baseName == fromName and t.method == method
    end)

    if tanker == nil then
        Log.debug("Base %s has no tanker of type %s", origin.name, method)
        return false, string.format("Unable, base %s has no tanker of type %s.", origin.name, method)
    end
    if tanker.status ~= "ready" then
        Log.debug("There is no tanker available at %s", origin.name)
        return false, string.format("Unable, there is no tanker available at %s.", origin.name)
    end

    track = math.ceil(track)
    if track < 0 or track > 360 then
        return false, string.format("Unable, %s is not a valid track.", track)
    end

    -- despawn the statics that represent the tankers
    Tanker.__despawnStatics(tanker)

    -- spawn the tanker
    local scheme = Tanker.__scheme(tanker)
    local schemeRoute = Tanker.__schemeRoute(origin, tanker.location, destination, 8100, track, tanker.tacan)
    scheme.route = schemeRoute

    TS.task("spawn tanker", function()
        local group = LSA.spawnAircraft(scheme, side)
        assert(group ~= nil)

        tanker.usedOn = LSA.getNow()
        tanker.status = "airborne"
    end)
    return true, string.format("Roger, %s on the way.", tanker.callsign.name)
end

---Returns the tanker by the callsign.
---@param callsign string
---@return table|nil
function Tanker.__findByCallsign(callsign)
    for _, tanker in pairs(Tanker.tankers) do
        if tanker.callsign.name == callsign then
            return tanker
        end
    end
    return nil
end

function Tanker.relocate(callsign, markCoalition, destination, track)
    local tanker = Tanker.__findByCallsign(callsign)
    if tanker == nil then return false, string.format("Unable, no tanker with callsign %s.", callsign) end

    if tanker.side ~= markCoalition then return false, string.format("Unable, %s is not on our side.", callsign) end

    local tankerUnit = LSA.getUnit(tanker.name)
    if tankerUnit == nil then return false, string.format("Unable, invalid tanker.") end

    local airdrome = LSA.findBase(tanker.baseName)
    if airdrome == nil then return false, string.format("Unable, invalid tanker base.") end

    local approachAlt = Tanker.approachAlt
    local tacan = tanker.tacan
    local tankerTask = LSA.getTankerTask()
    local tacanTask = LSA.getTacanTask(tacan.callsign, tacan.mode, tacan.channel, tacan.freq)
    local currentPoint = LSA.getWaypoint(ToVec2(tankerUnit:getPoint()), Tanker.speed, Tanker.altitude)
    currentPoint.task = LSA.getComboTask({ tankerTask, tacanTask })
    local tankerOrbitPoint = LSA.getOrbitPoint(destination, Tanker.speed, Tanker.altitude, Tanker.duration, track)
    local approachPoint = LSA.getApproachPoint(airdrome.location, Tanker.approachSpeed, approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, Tanker.speed, Tanker.altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, Tanker.approachSpeed, approachAlt)

    local route = { points = {} }
    table.insert(route.points, currentPoint)
    table.insert(route.points, tankerOrbitPoint)
    table.insert(route.points, descentPoint)
    table.insert(route.points, approachPoint)
    table.insert(route.points, landPoint)

    local tankerCtrl = tankerUnit:getController()
    tankerCtrl:pushTask({
        id = 'Mission',
        params = {
            airborne = true,
            route = route
        }
    })

    -- [TODO] show the relocating message with a grid
    return true, string.format("Roger, %s relocating.", tanker.callsign.name)
end

---Despawn the supporting statics associated with the tanker.
---@param tanker table
function Tanker.__despawnStatics(tanker)
    for _, static in ipairs(tanker.statics) do
        local staticObject = StaticObject.getByName(static.name)
        staticObject:destroy()
    end
end

---Creates a tanker scheme.
---@param tanker table
---@return table
function Tanker.__scheme(tanker)
    local name = tanker.name
    local location = tanker.location
    local type = tanker.type
    local freq = LSA.hzToMhz(tanker.freq)
    local modulation = LSA.getRadioModulation(tanker.modulation)
    local callsign = tanker.callsign
    local alt = land.getHeight(location)

    return {
        ["modulation"] = modulation,
        ["task"] = "Refueling",
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

---Creates a tanker route from an airdrome to an orbit point.
---@param airdrome table
---@param parkingLocation table
---@param orbit table
---@param duration number
---@param track number
---@param tacan table
---@return table
function Tanker.__schemeRoute(airdrome, parkingLocation, orbit, duration, track, tacan)
    local route = {
        points = {}
    }

    local takeOffPoint = LSA.getTakeoffPoint(airdrome.id, parkingLocation)
    local tankerTask = LSA.getTankerTask()
    local tacanTask = LSA.getTacanTask(tacan.callsign, tacan.mode, tacan.channel, tacan.freq)
    takeOffPoint.task = LSA.getComboTask({ tankerTask, tacanTask })
    local departurePoint = LSA.getDeparturePoint(airdrome.location, Tanker.departureSpeed, Tanker.departureAlt)
    local tankerOrbitPoint = LSA.getOrbitPoint(orbit, Tanker.speed, Tanker.altitude, duration, track)
    local approachPoint = LSA.getApproachPoint(airdrome.location, Tanker.approachSpeed, Tanker.approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, Tanker.speed, Tanker.altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, Tanker.approachSpeed, Tanker.approachAlt)

    table.insert(route.points, takeOffPoint)
    table.insert(route.points, departurePoint)
    table.insert(route.points, tankerOrbitPoint)
    table.insert(route.points, descentPoint)
    table.insert(route.points, approachPoint)
    table.insert(route.points, landPoint)

    return route
end