Tanker = {
    tankers = {},
    speed = 600,
    altitude = 9000,
    duration = 8100,
    departureSpeed = 400,
    departureAlt = 2000,
    approachSpeed = 300,
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
        killedOn = nil,
        status = "ready"
    }

    return tanker
end

function Tanker.isDead(tanker)
    return tanker.killedOn ~= nil
end

function Tanker.kill(tanker)
    tanker.killedOn = Now()
end

function Tanker.spawn(tanker)
    if Tanker.isDead(tanker) then return end

    for _, static in ipairs(tanker.statics) do
        local scheme = StaticWrp.__scheme(static)
        LSA.spawnStatic2(scheme, static.side)

        Tanker.tankers[tanker.name] = tanker
        RefStatics.new(static.name, static)
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

function Tanker.onLostStatic(staticName)
    local tanker = Tanker.__findByName(staticName)
    if tanker ~= nil then
        Tanker.kill(tanker)
        Tanker.__removeByName(staticName)
    end
end

function Tanker.onLostUnit(unitName)
    local tanker = Tanker.__findByName(unitName)
    if tanker ~= nil then
        Tanker.kill(tanker)
        Tanker.__removeByName(unitName)
    end
end

function Tanker.available(tanker)
    return true
end

function Tanker.__removeByName(name)
    local tanker = Tanker.tankers[name]
    if tanker == nil then
        Log.trace("Tanker %s does not exist", name)
        return
    end
    Tanker.tankers[name] = nil
end

---Returns the tanker by the base name.
---@param baseName string
---@return table|nil
function Tanker.__findByBase(baseName)
    for _, tanker in pairs(Tanker.tankers) do
        if tanker.baseName == baseName then
            return tanker
        end
    end
    return nil
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
    local schemeRoute = Tanker.__schemeRoute(origin, tanker.location, destination, 600, 9000, 8100, track, tanker.tacan)
    scheme.route = schemeRoute

    TS.task("spawn tanker", function()
        local group = LSA.spawnAircraft(scheme, side)
        assert(group ~= nil)

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

    local approachSpeed = LSA.kmhToMps(Tanker.approachSpeed)
    local approachAlt = Tanker.approachAlt
    local tacan = tanker.tacan
    local tankerTask = LSA.getTankerTask()
    local tacanTask = LSA.getTacanTask(tacan.callsign, tacan.mode, tacan.channel, tacan.freq)
    local currentPoint = LSA.getWaypoint(ToVec2(tankerUnit:getPoint()), Tanker.speed, Tanker.altitude)
    currentPoint.task = LSA.getComboTask({ tankerTask, tacanTask })
    local tankerOrbitPoint = LSA.getOrbitPoint(destination, Tanker.speed, Tanker.altitude, Tanker.duration, track)
    local approachPoint = LSA.getApproachPoint(airdrome.location, approachSpeed, approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, Tanker.speed, Tanker.altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, approachSpeed, approachAlt)

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

---Despawns the supporting statics associated with the tanker.
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
---@param speed number
---@param altitude number
---@param duration number
---@param track number
---@param tacan table
---@return table
function Tanker.__schemeRoute(airdrome, parkingLocation, orbit, speed, altitude, duration, track, tacan)
    local route = {
        points = {}
    }

    local departureAlt = Tanker.departureAlt
    local approachAlt = Tanker.approachAlt
    local departureSpeed = LSA.kmhToMps(Tanker.departureSpeed)
    local approachSpeed = LSA.kmhToMps(Tanker.approachSpeed)
    speed = LSA.kmhToMps(speed)

    local takeOffPoint = LSA.getTakeoffPoint(airdrome.id, parkingLocation)
    local tankerTask = LSA.getTankerTask()
    local tacanTask = LSA.getTacanTask(tacan.callsign, tacan.mode, tacan.channel, tacan.freq)
    takeOffPoint.task = LSA.getComboTask({ tankerTask, tacanTask })
    local departurePoint = LSA.getDeparturePoint(airdrome.location, departureSpeed, departureAlt)
    local tankerOrbitPoint = LSA.getOrbitPoint(orbit, speed, altitude, duration, track)
    local approachPoint = LSA.getApproachPoint(airdrome.location, approachSpeed, approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, speed, altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, approachSpeed, approachAlt)

    table.insert(route.points, takeOffPoint)
    table.insert(route.points, departurePoint)
    table.insert(route.points, tankerOrbitPoint)
    table.insert(route.points, descentPoint)
    table.insert(route.points, approachPoint)
    table.insert(route.points, landPoint)

    return route
end