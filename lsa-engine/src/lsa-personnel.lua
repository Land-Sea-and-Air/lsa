Personnel = {
    personnel = {}
}

function Personnel.next()
    LSA.state.counters.personnel = (LSA.state.counters.personnel or 0) + 1
    return LSA.state.counters.personnel
end

function Personnel.new(template, side)
    local groupName = Dashed(template.name, Personnel.next())

    local units = {}
    for i, unitTemplate in ipairs(template.types) do
        local unitName = Dashed(groupName, i)
        local unitType = unitTemplate.type

        local unitWrp = UnitWrp.new(
            unitName,
            unitType,
            nil,
            0,
            nil,
            side
        )

        -- [REVIEW]
        unitWrp.distance = unitTemplate.distance
        unitWrp.angle = unitTemplate.angle
        unitWrp.heading = unitTemplate.heading

        table.insert(units, unitWrp)
    end

    local group = {
        name = groupName,
        mass = template.mass,
        seats = #units,
        units = units,
        transportName = nil,
        side = side,
        killedOn = nil
    }

    return group
end

function Personnel.state()
    return Personnel.personnel
end

function Personnel.__scheme(personnel)
    local p1 = personnel.units[1]
    local group = {
        ["visible"] = false,
        ["hiddenOnMFD"] = true,
        ["tasks"] = {},
        ["uncontrollable"] = false,
        ["task"] = "Ground Nothing",
        ["route"] =
        {
            ["spans"] = {},
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = land.getHeight(p1.location),
                    ["type"] = "Turning Point",
                    ["ETA"] = 0,
                    ["alt_type"] = "BARO",
                    ["formation_template"] = "",
                    ["y"] = p1.location.y,
                    ["x"] = p1.location.x,
                    ["ETA_locked"] = true,
                    ["speed"] = 0,
                    ["action"] = "Off Road",
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] = {},
                        },
                    },
                    ["speed_locked"] = true,
                },
            },
        },
        ["hidden"] = false,
        ["units"] = {},
        ["y"] = p1.location.y,
        ["x"] = p1.location.x,
        ["name"] = personnel.name,
        ["start_time"] = 0,
    }

    for _, unit in ipairs(personnel.units) do
        if UnitWrp.isAlive(unit) then
            table.insert(group.units, {
                ["skill"] = LSA.settings.defaultUnitSkillLevel,
                ["coldAtStart"] = false,
                ["type"] = unit.type,
                ["y"] = unit.location.y,
                ["x"] = unit.location.x,
                ["name"] = unit.name,
                ["heading"] = math.rad(unit.heading),
                ["playerCanDrive"] = false,
            })
        end
    end
    return group
end

function Personnel.spawn(personnel, location, heading)
    if location ~= nil and heading ~= nil then
        local offset = { distance = LSA.settings.personnelSpawnDistance, angle = heading }
        local inFront = LSA.newPos(location, offset)

        for _, unit in ipairs(personnel.units) do
            local offset2 = { distance = unit.distance, angle = unit.angle - (360 - heading) }
            local unitLocation = LSA.newPos(inFront, offset2)

            UnitWrp.setLocation(unit, unitLocation, heading + 180)
        end
    end
    local scheme = Personnel.__scheme(personnel)
    local group = LSA.spawnGroup2(scheme, personnel.side)

    Personnel.personnel[personnel.name] = personnel
    for _, unitWrp in ipairs(personnel.units) do
        RefUnits.new(unitWrp.name, unitWrp)
    end

    return group
end

---Returns index of the personnel on the given transport name.
---@param transportName string
---@return integer|nil
function Personnel.__findByTransportName(transportName)
    for index, personnel in pairs(Personnel.personnel) do
        if personnel.transportName == transportName then
            return index
        end
    end
    return nil
end

---Finds personnel by the associated group name.
---@param name string
---@return table|nil
function Personnel.find(name)
    return Personnel.personnel[name]
end

function Personnel.isPersonnel(name)
    return Personnel.personnel[name] ~= nil
end

---Returns the personnel on the given transport name.
---@param transportName string
---@return table|nil
function Personnel.byTransport(transportName)
    local index = Personnel.__findByTransportName(transportName)
    return Personnel.personnel[index]
end

---Loads personnel into transport.
---@param name string
---@param player table
function Personnel.load(name, player)
    local personnel = Personnel.personnel[name]
    if personnel == nil then return end

    personnel.transportName = player.unitName

    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.addWeight(unitWrp, personnel.mass)

    -- despawn the container
    local group = LSA.getGroup(name)
    group:destroy()

    -- inform player
    local unitWrp = RefUnits.get(player.unitName)
    local total = UnitWrp.getWeight(unitWrp)
    local message = string.format("Personnel loaded (%s KG)", personnel.mass)
    LSA.messagePlayer(player, message)
    message = string.format("Total on-board: %s KG", total)
    LSA.messagePlayer(player, message, 10, false)
end

---Unloads personnel from the transport.
---@param player table
function Personnel.unload(player)
    local personnel = Personnel.byTransport(player.unitName)
    if personnel == nil then return end

    local playerPosition = Player.position(player)
    local group = Personnel.spawn(personnel, playerPosition, playerPosition.heading)
    assert(group ~= nil)

    personnel.transportName = ""

    LSA.outSoundForUnit(player.unitId, "solid_copy.ogg")

    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.removeWeight(unitWrp, personnel.mass)

    local unitWrp = RefUnits.get(player.unitName)
    local total = UnitWrp.getWeight(unitWrp)
    local message = string.format("Cargo unloaded (%s KG)", personnel.mass)
    LSA.messagePlayer(player, message)
    message = string.format("Total on-board: %s KG", total)
    LSA.messagePlayer(player, message, 10, false)
end

---Returns personnel near the player.
---@param player table
---@return table|nil
function Personnel.near(player)
    local playerPosition = Player.position(player)
    local name = LSA.findFriendlyPersonnelAt(player, playerPosition)
    if name == nil then
        Log.debug("No personnel to disband")
        LSA.messagePlayer(player, Text.NO_PERSONNEL_NEARBY)
        return nil
    end

    return Personnel.find(name)
end

---Disbands nearby personnel.
---@param player table
function Personnel.disband(player)
    local personnel = Personnel.near(player)
    if personnel == nil then return end
    local logi = LogiCenter.near(player)
    if logi == nil then return end

    local group = LSA.getGroup(personnel.name)
    group:destroy()

    Personnel.personnel[personnel.name] = nil
end

function Personnel.bringTo(player, template)
    local playerPosition = Player.position(player)
    local personnel = Personnel.new(template, player.side)
    local group = Personnel.spawn(personnel, playerPosition, playerPosition.heading)
    assert(group ~= nil)

    personnel.transportName = ""

    LSA.outSoundForUnit(player.unitId, "Affirm.ogg")
    Personnel.personnel[personnel.name] = personnel
end

function Personnel.updateLocations()
    for _, personnel in pairs(Personnel.personnel) do
        for _, personnelUnit in ipairs(personnel.units) do
            local unit = LSA.getUnit(personnelUnit.name)
            if unit ~= nil then
                local unitPosition = unit:getPosition()
                local heading = LSA.heading(unitPosition)
                local location = ToVec2(unitPosition.p)
                personnelUnit.location = location
                personnelUnit.heading = heading
            end
        end
    end
end