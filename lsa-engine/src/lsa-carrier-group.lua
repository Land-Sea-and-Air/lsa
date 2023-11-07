CarrierGroup = {
}

function CarrierGroup.new(name, side)
    local carrierGroup = {
        name = name,
        units = {},
        side = side,
        commands = {}
    }

    return carrierGroup
end

function CarrierGroup.addUnit(carrierGroup, unit)
    table.insert(carrierGroup.units, unit)
end

function CarrierGroup.repair(carrierGroup)
    if carrierGroup ~= nil then
        for _, vessel in ipairs(carrierGroup.units) do
            Vessel.repair(vessel)
        end
    end
end

function CarrierGroup.setCommands(carrierGroup, commands)
    if carrierGroup ~= nil then
        carrierGroup.commands = commands
    end
end

function CarrierGroup.generate(airbaseName)
    local unit = Unit.getByName(airbaseName)
    if unit == nil then return end

    local group = unit:getGroup()
    if group == nil then return end

    -- make sure only one unit (the carrier) is in the group
    if #group:getUnits() > 1 then return end

    local groupName = group:getName()
    local unitTypeName = unit:getTypeName()
    local unitLocation = ToVec2(unit:getPoint())
    local unitCoalition = unit:getCoalition()

    local templates = LSA.byCoalition(unitCoalition, CarrierTemplates.red, CarrierTemplates.blue)
    local template = templates[unitTypeName]
    if template == nil then return end

    local carrierGroup = CarrierGroup.new(groupName, unitCoalition)
    CarrierGroup.setCommands(carrierGroup, template.commands)

    for i, vesselTemplate in ipairs(template.units) do
        local vesselName = Dashed(carrierGroup.name, i)
        if vesselTemplate.role == "carrier" then
            vesselName = carrierGroup.name
        end
        local vesselLocation = LSA.newPos(unitLocation, vesselTemplate)
        local vessel = Vessel.new(vesselName, vesselTemplate, vesselLocation, unitCoalition)
        CarrierGroup.addUnit(carrierGroup, vessel)
    end

    LSA.state.carriers[carrierGroup.name] = carrierGroup
end

function CarrierGroup.spawn(carrierGroup)
    if CarrierGroup.isDead(carrierGroup) then return end

    local scheme = CarrierGroup.__scheme(carrierGroup)
    local group = LSA.spawnShip2(scheme, carrierGroup.side)

    for _, unit in ipairs(carrierGroup.units) do
        RefUnits.new(unit.name, unit)
    end

    if group ~= nil then
        local commands = LSA.carrierCommands()
        local carrierUnit = carrierGroup.units[1]
        local unitName = carrierUnit.name
        local frequency = carrierUnit.freq
        local modulation = carrierUnit.modulation

        -- set frequency
        commands["RADIO"](unitName, { frequency = frequency, modulation = modulation })

        if carrierGroup.commands ~= nil then
            for _, command in ipairs(carrierGroup.commands) do
                Log.debug("Running command " .. command.name .. " for " .. unitName)
                commands[command.name](unitName, command.args)
            end
        end
    end

    Log.debug("Spawned carrier group %s", carrierGroup.name)
    Log.debug("Carrier group object id %s", group["id_"])
    local arb = Airbase.getByName(carrierGroup.name)
    Log.debug("Airbase name %s", arb:getName())
    Log.debug("Airbase object id %s", arb["id_"])
    return group
end

function CarrierGroup.__scheme(carrierGroup)
    local group = LSA.getGroup(carrierGroup.name)
    local unit = group:getUnit(1)

    local schemeGroup = {
        ["visible"] = false,
        ["groupId"] = group:getID(),
        ["tasks"] = {},
        ["hidden"] = false,
        ["units"] = {},
        ["uncontrollable"] = true,
        ["name"] = carrierGroup.name,
        ["hiddenOnMFD"] = true,
        ["start_time"] = 0,
        ["task"] = "Ground Nothing",
    }

    for i, vessel in ipairs(carrierGroup.units) do
        local schemeUnit = {
            ["heading"] = math.rad(vessel.heading),
            ["modulation"] = vessel.modulation,
            ["skill"] = LSA.settings.defaultUnitSkillLevel,
            ["y"] = vessel.location.y,
            ["x"] = vessel.location.x,
            ["name"] = vessel.name,
            ["type"] = vessel.type,
            ["frequency"] = vessel.freq,
        }

        if i == 1 then
            schemeUnit.unitId = unit:getID()
            schemeUnit.name = unit:getName()
        end

        table.insert(schemeGroup.units, schemeUnit)
    end

    return schemeGroup
end

function CarrierGroup.isDead(carrierGroup)
    return not CarrierGroup.isAlive(carrierGroup)
end

function CarrierGroup.isAlive(carrierGroup)
    local carrier = CarrierGroup.getCarrier(carrierGroup)
    return Vessel.isAlive(carrier)
end

function CarrierGroup.isAvailable(carrierGroup)
    local carrier = CarrierGroup.getCarrier(carrierGroup)
    return Vessel.isAvailable(carrier)
end

---Returns the vessel in the role of carrier.
---@param carrierGroup table
---@return table|nil
function CarrierGroup.getCarrier(carrierGroup)
    for _, vessel in ipairs(carrierGroup.units) do
        if Vessel.isCarrier(vessel) then
            return vessel
        end
    end

    return nil
end

function CarrierGroup.updateLocations()
    for _, carrier in pairs(LSA.state.carriers) do
        for _, vessel in ipairs(carrier.units) do
            Vessel.updateLocation(vessel)
        end
    end
end