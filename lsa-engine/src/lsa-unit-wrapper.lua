UnitWrp = {}

---Creates a new instance of UnitWrp.
---@param name string
---@param type string
---@param location table
---@param heading number
---@param baseName string|nil
---@param side number
---@return table
function UnitWrp.new(name, type, location, heading, baseName, side)
    local unit = {
        name = name,
        type = type,
        location = location,
        heading = heading,
        baseName = baseName,
        side = side,
        weight = 0,
        killedOn = nil
    }

    return unit
end

function UnitWrp.isDead(unitWrp)
    return unitWrp.killedOn ~= nil
end

function UnitWrp.isAlive(unitWrp)
    return unitWrp.killedOn == nil
end

function UnitWrp.kill(unitWrp)
    unitWrp.killedOn = Now()
end

function UnitWrp.repair(unitWrp)
    unitWrp.killedOn = nil
end

function UnitWrp.onUnitLost(event)
    local unitName = event.initiator:getName()
    local unit = RefUnits.get(unitName)
    if unit ~= nil then
        UnitWrp.kill(unit)
    end
end

function UnitWrp.getWeight(unitWrp)
    if unitWrp ~= nil then
        return unitWrp.weight
    end
    return 0
end

function UnitWrp.addWeight(unitWrp, weight)
    if unitWrp ~= nil then
        unitWrp.weight = unitWrp.weight + weight
        trigger.action.setUnitInternalCargo(unitWrp.name, unitWrp.weight)
    end
end

function UnitWrp.removeWeight(unitWrp, weight)
    if unitWrp ~= nil then
        unitWrp.weight = math.max(unitWrp.weight - weight, 0)
        trigger.action.setUnitInternalCargo(unitWrp.name, unitWrp.weight)
    end
end

function UnitWrp.onHit(event)
    local unitName = event.target:getName()
    local unit = RefUnits.get(unitName)
    if unit ~= nil and unit.baseName ~= nil then
        local base = Base.find(unit.baseName)
        if base ~= nil then
            Base.attacked(base, event.time)
        end
    end
end

function UnitWrp.setLocation(unitWrp, location, heading)
    unitWrp.heading = heading
    unitWrp.location = {
        x = location.x,
        y = location.y
    }
end