Asset = {
    assets = {}
}

function Asset.state()
    return Asset.assets
end

function Asset.next()
    LSA.state.counters.asset = (LSA.state.counters.asset or 0) + 1
    return LSA.state.counters.asset
end

function Asset.new(template, side, location)
    local groupName = Dashed(template.name, Asset.next())
    local playerFront = LSA.newPos(location, {
        distance = LSA.settings.crateSpawnDistance,
        angle = location.heading
    })

    local asset = {
        name = groupName,
        side = side,
        cost = template.cost,
        taskName = template.taskName,
        units = {},
        killedOn = nil
    }

    for i, unitTemplate in ipairs(template.units) do
        local unitName = Dashed(groupName, i)
        local unitLocation = LSA.newPos(playerFront, {
            distance = unitTemplate.distance,
            angle = unitTemplate.angle
        })

        local unitWrp = UnitWrp.new(
            unitName,
            unitTemplate.type,
            unitLocation,
            unitTemplate.heading,
            nil,
            side
        )

        table.insert(asset.units, unitWrp)
    end

    return asset
end

function Asset.spawn(asset)
    local scheme = Asset.__scheme(asset)
    local group = LSA.spawnGroup2(scheme, asset.side)
    
    if asset.taskName ~= nil then
        local tasking = LSA.groupTaskings()
        tasking[asset.taskName](group)
    end

    Asset.assets[asset.name] = asset
    for _, unitWrp in ipairs(asset.units) do
        RefUnits.new(unitWrp.name, unitWrp)
    end

    return group
end

function Asset.__scheme(asset)
    local group = {
        ["visible"] = false,
        ["hidden"] = false,
        ["hiddenOnMFD"] = true,
        ["tasks"] = {},
        ["units"] = {},
        ["uncontrollable"] = true,
        ["task"] = "Ground Nothing",
        ["name"] = asset.name,
        ["start_time"] = 0 -- spawn immediately
    }

    for _, unit in ipairs(asset.units) do
        table.insert(group.units, {
            ["skill"] = LSA.settings.defaultUnitSkillLevel,
            ["coldAtStart"] = false,
            ["type"] = unit.type,
            ["y"] = unit.location.y,
            ["x"] = unit.location.x,
            ["name"] = unit.name,
            ["heading"] = math.rad(unit.heading),
            ["playerCanDrive"] = true,
        })
    end

    return group
end

---Deploys the given asset.
---@param player table
---@param template table
---@param category string
function Asset.deploy(player, template, category)
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    -- find supplies within distance limits
    -- only non-recovered crates can be used to spawn deployables
    local crates = Supplies.findNear(player)
    local totalSupplies = 0
    for _, crate in ipairs(crates) do
        totalSupplies = totalSupplies + crate.units
    end

    -- check if there are enough supplies on the crate
    if totalSupplies < template.cost then
        local message = string.format(Text.NOT_ENOUGH_SUPPLIES_ON_CRATE, totalSupplies, template.cost)
        LSA.messagePlayer(player, message)
        return
    end

    -- check if the location in front of player (where we will spawn the item) is unobstructed
    -- if LSA.isPlayerFrontObstructed(player, deployable.space) then
    --     LSA.messagePlayer(player, Text.CANNOT_SPAWN)
    --     return
    -- end

    if category == DeployableTemplates.Categories.FAC then
        local playerFront = LSA.newPos(playerPosition, {
            distance = LSA.settings.crateSpawnDistance,
            angle = playerPosition.heading
        })
        local unit = template.units[1]

        local fac = FAC.new(
            template.name,
            unit.type,
            player.side,
            template.cost,
            unit.freq,
            unit.modulation,
            playerFront,
            playerPosition.heading + 180)

        FAC.spawn(fac)
    else
        local asset = Asset.new(
            template,
            player.side,
            playerPosition
        )

        Asset.spawn(asset)
    end

    -- reduce the supplies on the crates
    local toPay = template.cost
    for _, crate in ipairs(crates) do
        toPay = Supplies.consume(crate, toPay)
    end

    if totalSupplies == template.cost then
        LSA.messagePlayer(player, Text.NO_SUPPLIES_LEFT_CRATE)
    else
        local message = string.format(Text.SUPPLIES_LEFT_CRATE, totalSupplies - template.cost)
        LSA.messagePlayer(player, message)
    end
end

---Returns the asset by the given name.
---@param name string
---@return table|nil
function Asset.findByName(name)
    return Asset.assets[name]
end

---Removes the asset by the given name.
---@param assetName string
function Asset.remove(assetName)
    local group = LSA.getGroup(assetName)
    if group == nil then return end
    group:destroy()

    Log.debug(assetName)
    Dump(Asset.assets[assetName])
    Asset.assets[assetName] = nil
    Dump(Asset.assets[assetName])
end

function Asset.updateLocations()
    for _, asset in pairs(Asset.assets) do
        for _, assetUnit in ipairs(asset.units) do
            local unit = LSA.getUnit(assetUnit.name)
            if unit ~= nil then
                local unitPosition = unit:getPosition()
                local heading = LSA.heading(unitPosition)
                local location = ToVec2(unitPosition.p)
                assetUnit.location = location
                assetUnit.heading = heading
            end
        end
    end
end

---Returns the cost of the asset by the given name.
---@param name string
---@return integer
function Asset.getCost(name)
    local asset = Asset.assets[name]
    if asset == nil then return 0 end

    return asset.cost
end