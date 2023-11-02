Supplies = {
    crates = {},
    type = "container_cargo",
    name = "Supplies",
    recovered = false,
}

---Creates a new instance of instance.
---@param side number
---@param units number|nil
---@return table
function Supplies.new(side, units)
    return {
        mass = 100,         -- [TODO] move this to the settings as before
        units = units or 5, -- [TODO] same
        transportName = "",
        staticName = "",
        side = side
    }
end

function Supplies.__findByStaticName(staticName)
    for _, crate in ipairs(Supplies.crates) do
        if crate.staticName == staticName then
            return crate
        end
    end
    return nil
end

function Supplies.__removeByStaticName(staticName)
    for i, crate in ipairs(Supplies.crates) do
        if crate.staticName == staticName then
            table.remove(Supplies.crates, i)
            local static = StaticObject.getByName(staticName)
            assert(static ~= nil)
            static:destroy()
            return
        end
    end
end

---Returns the index of the supplies being transported by the given name.
---@param transportName string
---@return integer|nil
function Supplies.__findByTransportName(transportName)
    for i, crate in ipairs(Supplies.crates) do
        if crate.transportName == transportName then
            return i
        end
    end
    return nil
end

---Spawns a container.
---@param position table
---@param side number
---@return string
function Supplies.__spawnContainer(position, side)
    local offset = { distance = LSA.settings.crateSpawnDistance, angle = position.heading }
    local inFront = LSA.newPos(position, offset)
    local scheme = LSA.schemeStatic(Supplies.name, Supplies.type, inFront, position.heading + 90)
    local static = LSA.spawnStatic(scheme, side)
    assert(static ~= nil)

    return scheme.name
end

function Supplies.isSupplies(staticName)
    local supplies = Supplies.__findByStaticName(staticName)
    return supplies ~= nil
end

function Supplies.clear(transportName)
    local i = Supplies.__findByTransportName(transportName)
    if i ~= nil then
        Supplies.crates[i] = nil
    end
end

---Returns supplies near the player.
---@param player table
---@param includeAll boolean|nil
---@return table
function Supplies.findNear(player, includeAll)
    if includeAll == nil then
        includeAll = false
    end
    local playerPosition = Player.position(player)
    local containers = LSA.findCargosAt(playerPosition.x, playerPosition.y, LSA.settings.maxSearchRadiusMeters)
    if #containers < 1 then
        local message = string.format(LSA.text.NO_SUPPLIES_NEARBY, LSA.settings.maxSearchRadiusMeters)
        LSA.messagePlayer(player, message)
        return {}
    end

    local aux = {}
    local crates = {}
    for _, container in ipairs(containers) do
        aux[container:getName()] = true
    end
    for _, crate in ipairs(Supplies.crates) do
        if aux[crate.staticName] == true and (includeAll or not crate.recovered) then
            table.insert(crates, crate)
        end
    end

    return crates
end

function Supplies.consume(crate, amount)
    assert(crate ~= nil)

    local remaining = 0

    if crate.units > amount then
        crate.units = crate.units - amount
        remaining = 0
    elseif crate.units == amount then
        crate.units = 0
        remaining = 0
    elseif crate.units < amount then
        remaining = amount - crate.units
        crate.units = 0
    end

    if crate.units == 0 then
        Supplies.__removeByStaticName(crate.staticName)
    end

    return remaining
end

---Calculates the weight of a crate.
---@param crate table
---@return number
function Supplies.weight(crate)
    assert(crate ~= nil)
    return crate.mass * crate.units
end

function Supplies.__alreadySpawned(player, playerPosition)
    local offset = { distance = LSA.settings.crateSpawnDistance, angle = playerPosition.heading }
    local playerFront = LSA.newPos(playerPosition, offset)
    local cargoObjects = LSA.findCargo(playerFront, 50) -- [TODO] move to settings
    for _, cargoObject in ipairs(cargoObjects) do
        if cargoObject:getTypeName() == LSA.settings.crateType and cargoObject:getCoalition() == player.side then
            LSA.messagePlayer(player, LSA.text.CRATE_ALREADY_SPAWNED)
            return
        end
    end
end

function Supplies.bringTo(player)
    local playerPosition = Player.position(player)
    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, LSA.text.LAND_FIRST)
        return
    end

    -- is the player close to a logistics center
    local logisticsCenter = LSA.findFriendlyLogistics(player.side, playerPosition)
    if logisticsCenter == nil then
        LSA.messagePlayer(player, LSA.text.NEED_LOGISTICS_CENTER)
        return
    end

    if Supplies.__alreadySpawned(player, playerPosition) then return end

    local crate = Supplies.new(player.side)
    if not LSA.hasFactionEnoughSupplies(player.side, crate.units) then
        LSA.messagePlayer(player, LSA.text.NOT_ENOUGH_SUPPLIES_FACTION)
        return
    end

    LSA.outSoundForUnit(player.unitId, "standby.ogg")
    local staticName = Supplies.__spawnContainer(playerPosition, player.side)
    crate.staticName = staticName
    crate.transportName = ""

    table.insert(Supplies.crates, crate)

    LSA.decreaseFactionSupplies(player.side, crate.units)
end

function Supplies.load(player, container)
    local crate = Supplies.__findByStaticName(container:getName())
    if crate == nil then return end

    -- store information about the current cargo for the current player
    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.addWeight(unitWrp, Supplies.weight(crate))
    crate.transportName = player.unitName
    crate.staticName = ""

    -- despawn the container
    container:destroy()

    -- inform player
    local message = string.format("Loaded %s KG", Supplies.weight(crate))
    LSA.messagePlayer(player, message)

    local unitWrp = RefUnits.get(player.unitName)
    local total = UnitWrp.getWeight(unitWrp)
    message = string.format("Total on-board: %s KG", total)
    LSA.messagePlayer(player, message, 10, false)
end

function Supplies.byTransport(transportName)
    local i = Supplies.__findByTransportName(transportName)
    if i ~= nil then
        return Supplies.crates[i]
    end
    return nil
end

function Supplies.unload(player)
    local playerPosition = Player.position(player)

    local crate = Supplies.byTransport(player.unitName)
    if crate == nil then return end

    local staticName = Supplies.__spawnContainer(playerPosition, player.side)
    crate.staticName = staticName
    crate.transportName = ""

    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.removeWeight(unitWrp, Supplies.weight(crate))

    local unitWrp = RefUnits.get(player.unitName)
    local total = UnitWrp.getWeight(unitWrp)
    local message = string.format("Cargo unloaded (%s KG)", Supplies.weight(crate))
    LSA.messagePlayer(player, message)
    message = string.format("Total on-board: %s KG", total)
    LSA.messagePlayer(player, message, 10, false)
end

---Returns true if unit is transporting supplies, false otherwise.
---@param transportName string
---@return boolean
function Supplies.hasSupplies(transportName)
    return Supplies.__findByTransportName(transportName) ~= nil
end

---Returns the supplies to the owner side.
---@param name string
function Supplies.restore(name)
    local supplies = Supplies.__findByStaticName(name)
    if supplies == nil then return end

    LSA.increaseFactionSupplies(supplies.side, supplies.units)
    Supplies.__removeByStaticName(name)
end

function Supplies.recover(player)
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, LSA.text.LAND_FIRST)
        return
    end

    local unit = LSA.findNearestUnit(player)
    if unit == nil then
        LSA.messagePlayer(player, "Unable, there is nothing to recover nearby.")
        return
    end
    local group = unit:getGroup()
    local assetName = group:getName()
    local assetCost = Asset.getCost(assetName)

    LSA.outSoundForUnit(player.unitId, "standby.ogg")
    -- if a crate of supplies exists nearby
    local crates = Supplies.findNear(player)
    if #crates > 0 then
        -- use the existing crate to store the supplies
        local crate = crates[1]
        crate.units = crate.units + assetCost
        crate.recovered = true

        Asset.remove(assetName)

        LSA.messagePlayer(player,
            string.format("Crate now has %s supplies", crate.units)
        )
        LSA.messagePlayer(player,
            string.format("This crate must be returned to base. It cannot be used to deploy assets."),
            10, false)
        return
    else
        -- otherwise spawn a new crate
        Asset.remove(assetName)

        TS.task("spawn crate", function()
            local crate = Supplies.new(player.side, assetCost)
            local staticName = Supplies.__spawnContainer(playerPosition, player.side)
            crate.staticName = staticName
            crate.transportName = ""
            crate.recovered = true

            table.insert(Supplies.crates, crate)

            LSA.messagePlayer(player,
                string.format("Create now has %s supplies", crate.units)
            )
            LSA.messagePlayer(player,
                string.format("This crate must be returned to base. It cannot be used to deploy assets."),
                10, false)
        end)
    end
end