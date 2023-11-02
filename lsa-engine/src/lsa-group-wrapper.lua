GroupWrp = {}

function GroupWrp.new(name, units, baseName, side)
    local group = {
        name = name,
        units = units,
        baseName = baseName,
        side = side,
        killedOn = nil
    }

    return group
end

function GroupWrp.__scheme(groupWrp)
    local groupScheme = LSA.groupScheme2(groupWrp.name)
    for i, unit in ipairs(groupWrp.units) do
        if UnitWrp.isAlive(unit) then
            local unitName = Dashed(groupWrp.name, i)
            local unitScheme = LSA.unitScheme2(unitName, unit.location, unit.type, unit.heading)
            table.insert(groupScheme.units, unitScheme)
        end
    end

    return groupScheme
end

function GroupWrp.isKilled(groupWrp)
    return groupWrp.killedOn ~= nil
end

function GroupWrp.spawn(groupWrp)
    if GroupWrp.isKilled(groupWrp) then return end

    local scheme = GroupWrp.__scheme(groupWrp)
    local group = LSA.spawnGroup2(scheme, groupWrp.side)

    for _, unit in ipairs(groupWrp.units) do
        RefUnits.new(unit.name, unit)
    end
    
    return group
end

function GroupWrp.repair(groupWrp)
    for _, unit in ipairs(groupWrp.units) do
        UnitWrp.repair(unit)
    end

    local scheme = GroupWrp.__scheme(groupWrp)
    LSA.clearAndSpawnGroup(scheme, groupWrp.side)

    groupWrp.killedOn = nil
end