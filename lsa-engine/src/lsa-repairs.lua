Repairs = {
    crates = {},
    type = "container_cargo",
    name = "Repairs",
}

function Repairs.new(baseName)
    return {
        mass = 1500, -- [TODO] move this to the settings as before
        baseName = baseName,
        transportName = "",
        staticName = "",
    }
end

---Spawns a container.
---@param position table
---@param side number
---@return string
function Repairs.__spawnContainer(position, side)
    local offset = { distance = LSA.settings.crateSpawnDistance, angle = position.heading }
    local inFront = LSA.newPos(position, offset)
    local scheme = LSA.schemeStatic(Repairs.name, Repairs.type, inFront, position.heading + 90)
    local static = LSA.spawnStatic2(scheme, side)
    assert(static ~= nil)

    return scheme.name
end

function Repairs.__findByStaticName(staticName)
    for _, crate in ipairs(Repairs.crates) do
        if crate.staticName == staticName then
            return crate
        end
    end
    return nil
end

function Repairs.__findByTransportName(transportName)
    for i, crate in ipairs(Repairs.crates) do
        if crate.transportName == transportName then
            return i
        end
    end
    return nil
end

function Repairs.__removeByStaticName(staticName)
    for i, crate in ipairs(Repairs.crates) do
        if crate.staticName == staticName then
            table.remove(Repairs.crates, i)
            local static = StaticObject.getByName(staticName)
            assert(static ~= nil)
            static:destroy()
            return
        end
    end
end

---Returns true if unit is transporting repairs, false otherwise.
function Repairs.hasRepairs(transportName)
    return Repairs.__findByTransportName(transportName) ~= nil
end

function Repairs.byTransport(transportName)
    local i = Repairs.__findByTransportName(transportName)
    if i ~= nil then
        return Repairs.crates[i]
    end
    return nil
end

function Repairs.unload(player)
    local playerPosition = Player.position(player)

    local crate = Repairs.byTransport(player.unitName)
    if crate == nil then return end

    local staticName = Repairs.__spawnContainer(playerPosition, player.side)
    crate.staticName = staticName
    crate.transportName = ""

    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.removeWeight(unitWrp, crate.mass)

    local total = UnitWrp.getWeight(unitWrp)
    local message = string.format("Cargo unloaded (%s KG)", crate.mass)
    LSA.messagePlayer(player, message)
    message = string.format("Total on-board: %s KG", total)
    LSA.messagePlayer(player, message, 10, false)
end

function Repairs.unpack(player, container)
    local crate = Repairs.__findByStaticName(container:getName())
    assert(crate ~= nil)

    local baseName = LSA.findBasePlayerLandedOn(player)
    local base = LSA.findBase(baseName)
    assert(base ~= nil)

    if base.name == crate.baseName then
        local message = string.format("Unable, repairs must come from a different base.")
        LSA.messagePlayer(player, message)
        return
    end

    if base.side ~= player.side then
        local message = string.format("Unable, can't repair a base that is not under our coalition control.")
        LSA.messagePlayer(player, message)
        return
    end

    Base.rebuildRepairs(base.name)
    Repairs.__removeByStaticName(container:getName())
    container:destroy()
end

function Repairs.restore(container)
    local staticName = container:getName()
    Repairs.__removeByStaticName(staticName)
end

function Repairs.__alreadySpawned(player, playerPosition)
    local offset = { distance = LSA.settings.crateSpawnDistance, angle = playerPosition.heading }
    local playerFront = LSA.newPos(playerPosition, offset)
    local cargoObjects = LSA.findCargo(playerFront, 50) -- [TODO] move to settings
    for _, cargoObject in ipairs(cargoObjects) do
        if cargoObject:getTypeName() == LSA.settings.crateType and cargoObject:getCoalition() == player.side then
            LSA.messagePlayer(player, Text.CRATE_ALREADY_SPAWNED)
            return
        end
    end
end

function Repairs.bringTo(player)
    local playerPosition = Player.position(player)
    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    -- is the player close to a logistics center
    local logistics = LSA.findFriendlyLogistics(player.side, playerPosition)
    if logistics == nil then
        LSA.messagePlayer(player, Text.NEED_LOGISTICS_CENTER)
        return
    end

    if Repairs.__alreadySpawned(player, playerPosition) then return end

    local crate = Repairs.new(logistics.baseName)

    LSA.outSoundForUnit(player.unitId, "standby.ogg")
    local staticName = Repairs.__spawnContainer(playerPosition, player.side)
    crate.staticName = staticName
    crate.transportName = ""

    table.insert(Repairs.crates, crate)
end

function Repairs.isRepairs(staticName)
    local repairs = Repairs.__findByStaticName(staticName)
    return repairs ~= nil
end

function Repairs.clear(transportName)
    local i = Repairs.__findByTransportName(transportName)
    if i ~= nil then
        Repairs.crates[i] = nil
    end
end

function Repairs.load(player, container)
    local crate = Repairs.__findByStaticName(container:getName())
    assert(crate ~= nil)

    -- store information about the current cargo for the current player
    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.addWeight(unitWrp, crate.mass)
    crate.transportName = player.unitName
    crate.staticName = ""

    -- despawn the container
    container:destroy()

    -- inform player
    local message = string.format("Loaded %s KG", crate.mass)
    LSA.messagePlayer(player, message)

    local unitWrp = RefUnits.get(player.unitName)
    local total = UnitWrp.getWeight(unitWrp)
    message = string.format("Total on-board: %s KG", total)
    LSA.messagePlayer(player, message, 10, false)
end