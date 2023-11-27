Vessel = {}

function Vessel.new(name, template, location, side)
    local vessel = {
        name = name,
        type = template.type,
        heading = template.heading,
        freq = template.freq,
        modulation = template.modulation,
        angle = template.angle,
        distance = template.distance,
        location = location,
        role = template.role or "escort",
        side = side,
        killedOn = nil
    }

    return vessel
end

function Vessel.isAlive(vessel)
    if vessel == nil then return false end
    return vessel.killedOn == nil
end

function Vessel.isDead(vessel)
    if vessel == nil then return false end
    return vessel.killedOn ~= nil
end

function Vessel.onLostUnit(event)
    local unitName = event.initiator:getName()
    local unit = RefUnits.get(unitName)
    if unit ~= nil then
        Vessel.kill(unit)
    end
end

function Vessel.kill(vessel)
    if vessel ~= nil then
        vessel.killedOn = LSA.getNow()
    end
end

function Vessel.repair(vessel)
    if vessel ~= nil then
        vessel.killedOn = nil
    end
end

function Vessel.isCarrier(vessel)
    if vessel ~= nil then
        return vessel.role == "carrier"
    end
    return false
end

function Vessel.isAvailable(vessel)
    if vessel == nil or vessel.role ~= "carrier" or vessel.killedOn == nil then
        return false
    end

    local killedOn = vessel.killedOn
    local waitPeriod = LSA.settings.waitPeriodForNewCarrier
    local today = LSA.getNow()

    -- if the current date is greater than the kill date
    -- the we can just subtract the current with the kill date
    -- and compare with the wait period
    if today >= killedOn then
        return today - killedOn > waitPeriod
    end

    -- because the mission loops in a given year
    -- when the date of kill is greater than the current date
    -- we need to add a year's worth of seconds to the current date
    -- effectively moving the current date to next year
    -- then subtract the kill date to the new current date
    -- and compare with the wait period
    local yearLengthInSeconds = LSA.getYearLengthInSeconds(env.mission.date.Year)
    return (today + yearLengthInSeconds) - killedOn > waitPeriod
end

function Vessel.updateLocation(vessel)
    if vessel ~= nil and Vessel.isAlive(vessel) then
        local unit = LSA.getUnit(vessel.name)
        if unit ~= nil then
            local currentPosition = ToVec2(unit:getPoint())
            vessel.x = currentPosition.x
            vessel.y = currentPosition.y
        end
    end
end