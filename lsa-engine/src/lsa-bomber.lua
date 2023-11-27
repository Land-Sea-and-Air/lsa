Bomber = {
    bombers = {},
    speed = 1500,
    altitude = 9000,
    departureSpeed = 400,
    departureAlt = 2000,
    approachSpeed = 300,
    approachAlt = 2000,
}

---Creates a new bomber instance.
---@param name string
---@param type string
---@param baseName string
---@param location table
---@param statics table
---@return table
function Bomber.new(name, type, baseName, location, statics)
    local bomber = {
        name = name,
        type = type,
        baseName = baseName,
        location = location,
        statics = statics,
        killedOn = nil,
        usedOn = nil,
    }

    return bomber
end

function Bomber.isDead(bomber)
    return bomber.killedOn ~= nil
end

function Bomber.spawn(bomber)
    if Bomber.isDead(bomber) then return end
    if Bomber.isUsed(bomber) then return end

    for _, static in ipairs(bomber.statics) do
        local scheme = StaticWrp.__scheme(static)
        LSA.spawnStatic2(scheme, static.side)

        Bomber.bombers[bomber.name] = bomber
        RefStatics.new(static.name, static)
    end
end

function Bomber.repair(bomber)
    if bomber == nil then return end

    bomber.killedOn = nil
    bomber.usedOn = nil

    for _, static in ipairs(bomber.statics) do
        StaticWrp.repair(static)
    end
end

---Returns the bomber of the given base.
---@param baseName string
---@return table|nil
function Bomber.__findByBase(baseName)
    for _, bomber in pairs(Bomber.bombers) do
        if bomber.baseName == baseName then
            return bomber
        end
    end
    return nil
end

---Returns the bomber by the name.
---@param name string
---@return table|nil
function Bomber.__findByName(name)
    local bomber = Bomber.bombers[name]
    if bomber == nil then
        Log.trace("Could not find a bomber by the name %s", name)
    end

    return bomber
end

---Process land events of bombers.
---@param unitName string
function Bomber.onLandEvent(unitName)
    local bomber = Bomber.__findByName(unitName)
    if bomber ~= nil then
        TS.task("despawn bomber", function()
            local unit = LSA.getUnit(unitName)
            if unit ~= nil then
                unit:destroy()
            end
        end, {}, 10 * 60) -- [TODO] move to settings and fine tune
    end
end

function Bomber.__isBomber(staticName)
    for _, bomber in pairs(Bomber.bombers) do
        for _, static in ipairs(bomber.statics) do
            if static.name == staticName and static.role == "bomber" then
                return true
            end
        end
    end
    return false
end

function Bomber.onLostStatic(event)
    local static = event.initiator
    local staticName = static:getName()
    if Bomber.__isBomber(staticName) then
        local bomber = Bomber.__findByStaticName(staticName)
        Bomber.__kill(bomber)
    end
end

function Bomber.__findByStaticName(staticName)
    for _, bomber in pairs(Bomber.bombers) do
        for _, static in ipairs(bomber.statics) do
            if static.name == staticName then
                return bomber
            end
        end
    end

    return nil
end

function Bomber.onLostUnit(event)
    local unit = event.initiator
    local unitName = unit:getName()
    local bomber = Bomber.__findByName(unitName)
    if bomber ~= nil then
        Bomber.__kill(bomber)
    end
end

function Bomber.__kill(bomber)
    bomber.killedOn = LSA.getNow()
end

function Bomber.__setAsUsed(bomber)
    bomber.usedOn = LSA.getNow()
end

function Bomber.__isUnused(bomber)
    return bomber.usedOn == nil
end

function Bomber.isUsed(bomber)
    return bomber.usedOn ~= nil
end

function Bomber.__isAlive(bomber)
    return bomber.killedOn == nil
end

---Dispatches a bomber.
---@param side number
---@param from table
---@param to table
---@return boolean
---@return string
function Bomber.dispatch(side, from, to)
    local origin = LSA.findBase(from)
    local destination = LSA.findBase(to)

    if origin == nil or destination == nil then
        return false, string.format("Unable, target is not valid.")
    end

    if origin.side ~= side then
        Log.debug("Can't call bombers of the other side")
        return false, string.format("Unable, origin is not valid.")
    end

    if destination.side == side then
        Log.debug("Can't bomb your own bases")
        return false, string.format("Unable, target is not valid.")
    end

    local bomber = Bomber.__findByBase(origin.name)
    if bomber == nil then
        Log.debug("Base %s has no bombers", origin.name)
        return false, string.format("Unable, base %s has no bombers.", origin.name)
    end
    
    if not Bomber.isUsed(bomber) ~= "ready" then
        Log.debug("There is no bomber available at %s", origin.name)
        return false, string.format("Unable, there is no bomber available at %s.", origin.name)
    end

    -- despawn the statics that represent the bomber
    Bomber.__despawnStatics(bomber)
    -- mark the bomber as used
    Bomber.__setAsUsed(bomber)

    local scheme = Bomber.__scheme(bomber)
    local schemeRoute = Bomber.__schemeRoute(origin, bomber.location, destination.location)
    scheme.route = schemeRoute

    -- spawn the bomber
    TS.task("spawn bomber", function()
        local group = LSA.spawnAircraft(scheme, side)
        assert(group ~= nil)

        RefUnits.new(bomber.name, bomber)

        local unit = group:getUnit(1)
        TS.task("bomber target", function(_, time)
            if not unit:isExist() then return nil end
            if unit:getLife() <= 0 then return nil end

            local pos = ToVec2(unit:getPoint())
            local distance = Distance(pos, destination.location)

            if distance > 5000 then -- [TODO] move to settings
                return time + 1
            end

            TS.task("destroy base", Base.destroy, destination)
            return nil
        end)

    end)

    return true,
        string.format("Roger, %s on the way, bombing mission from %s to %s.", scheme.units[1].callsign.name,
            origin.name,
            destination.name)
end

function Bomber.explode(bomber)
    for _, static in ipairs(bomber.statics) do
        LSA.explodeStatic(static.name)
    end
end

function Bomber.isAvailable(bomber)
    if bomber == nil then return false end
    if bomber.usedOn == nil and bomber.killedOn == nil then return true end

    local date = nil
    if bomber.usedOn ~= nil and bomber.killedOn == nil then
        -- if the bomber was used but wasn't killed, 
        -- calculate next availability using the usedOn date
        date = bomber.usedOn
    else
        -- for any other situation use the killedOn date
        date = bomber.killedOn
    end
    
    local waitPeriod = LSA.settings.waitPeriodForNewBomber
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

---Despawn the supporting statics associated with the bomber.
---@param bomber table
function Bomber.__despawnStatics(bomber)
    for _, static in ipairs(bomber.statics) do
        local staticObject = StaticObject.getByName(static.name)
        staticObject:destroy()
    end
end

---Create a bomber scheme
---@param bomber table
---@return table
function Bomber.__scheme(bomber)
    local name = bomber.name
    local type = bomber.type
    local location = bomber.location
    local alt = land.getHeight(location)
    local callsign = CallsignGenerator.bomberCallsign(type)

    return {
        ["task"] = "Pinpoint Strike",
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
                ["y"] = location.y,
                ["x"] = location.x,
                ["name"] = name,
                ["callsign"] = callsign,
            },
        },
        ["y"] = location.y,
        ["x"] = location.x,
        ["name"] = name,
        ["communication"] = true,
        ["start_time"] = 0,
    }
end

---Creates a bombers route from an airdrome to a target point.
---@param airdrome table
---@param parkingLocation table
---@param target table
---@return table
function Bomber.__schemeRoute(airdrome, parkingLocation, target)
    local route = {
        points = {}
    }

    local takeOffPoint = LSA.getTakeoffPoint(airdrome.id, parkingLocation)
    local departurePoint = LSA.getDeparturePoint(airdrome.location, Bomber.departureSpeed, Bomber.departureAlt)
    local attackPoint = LSA.getAttackPoint(target, Bomber.speed, Bomber.altitude)
    local ingressPoint = LSA.getIngressPoint(target, Bomber.speed, Bomber.altitude)
    local egressPoint = LSA.getEgressPoint(target, Bomber.speed, Bomber.altitude)
    local approachPoint = LSA.getApproachPoint(airdrome.location, Bomber.approachSpeed, Bomber.approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, Bomber.speed, Bomber.altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, Bomber.approachSpeed, Bomber.approachAlt)

    table.insert(route.points, takeOffPoint)
    table.insert(route.points, departurePoint)
    table.insert(route.points, ingressPoint)
    table.insert(route.points, attackPoint)
    table.insert(route.points, egressPoint)
    table.insert(route.points, descentPoint)
    table.insert(route.points, approachPoint)
    table.insert(route.points, landPoint)

    return route
end