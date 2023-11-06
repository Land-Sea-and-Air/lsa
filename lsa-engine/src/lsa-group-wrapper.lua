GroupWrp = {}

function GroupWrp.new(name, units, baseName, side)
    local group = {
        name = name,
        units = units,
        baseName = baseName,
        side = side,
        taskName = nil,
        killedOn = nil
    }

    return group
end

function GroupWrp.setTaskName(groupWrp, taskName)
    if groupWrp ~= nil then
        groupWrp.taskName = taskName
    end
end

function GroupWrp.__scheme(groupWrp)
    local groupScheme = LSA.groupScheme(groupWrp.name)
    for i, unit in ipairs(groupWrp.units) do
        if UnitWrp.isAlive(unit) then
            local unitName = Dashed(groupWrp.name, i)
            local unitScheme = LSA.unitScheme(unitName, unit.location, unit.type, unit.heading)
            table.insert(groupScheme.units, unitScheme)
        end
    end

    return groupScheme
end

function GroupWrp.isDead(groupWrp)
    for _, unit in ipairs(groupWrp.units) do
        if UnitWrp.isAlive(unit) then
            return false
        end
    end

    return true
end

function GroupWrp.spawn(groupWrp)
    if GroupWrp.isDead(groupWrp) then return end

    local scheme = GroupWrp.__scheme(groupWrp)
    local group = LSA.spawnGroup2(scheme, groupWrp.side)

    for _, unit in ipairs(groupWrp.units) do
        RefUnits.new(unit.name, unit)
    end

    if groupWrp.taskName ~= nil then
        local tasking = LSA.groupTaskings()
        tasking[groupWrp.taskName](group)
    end

    return group
end

function GroupWrp.repair(groupWrp)
    for _, unit in ipairs(groupWrp.units) do
        UnitWrp.repair(unit)
    end

    groupWrp.killedOn = nil
    local scheme = GroupWrp.__scheme(groupWrp)
    LSA.clearAndSpawnGroup(scheme, groupWrp.side)
end