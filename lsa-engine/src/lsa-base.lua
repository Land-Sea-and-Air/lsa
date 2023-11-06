Base = {}

function Base.new(airbase)
    local airbaseName = airbase:getName()
    local airbaseDesc = airbase:getDesc()
    local airbaseType = airbaseDesc.category

    local airbaseId = airbase:getID()
    local airbaseSide = airbase:getCoalition()
    local airbaseOrientation = LSA.getAirbaseOrientation(airbase, airbaseType)
    local airbaseLocation = ToVec2(airbase:getPoint())

    local longestRunwayLocation = nil
    if airbaseType == Airbase.Category.AIRDROME then
        local longestRunway = LSA.getLongestRunway(airbase)
        longestRunwayLocation = ToVec2(longestRunway.position)
    end

    local apronPolygons = LSA.getApronPolygons(airbaseName)
    
    local base = {
        id = airbaseId,     -- dcs id
        name = airbaseName, -- dcs name
        type = airbaseType,
        side = airbaseSide,
        location = airbaseLocation,
        longestRunwayLocation = longestRunwayLocation,
        template = LSA.airbaseTemplateTypes[airbaseName],
        lastAttackAt = nil,
        orientation = airbaseOrientation,
        apron = {
            name = Dashed(airbaseName, "Apron"),
            polygons = apronPolygons,
            markupId = nil
        },
        patrol = {
            name = Dashed(airbaseName, "Patrol"),
        },
        perimeter = {
            name = Dashed(airbaseName, "Perimeter"),
            markupId = nil
        },
        capture = {
            name = Dashed(airbaseName, "Capture-Zone"),
            scheduled = nil,
            markupId = nil
        },
        groups = {},
        statics = {},
        repairs = {},
        logistics = {},
        bombers = {},
        tankers = {},
        awacs = {},
    }
    return base
end

function Base.createEmpty(airbase)
    local airbaseName = airbase:getName()
    local airbaseDesc = airbase:getDesc()
    local airbaseType = airbaseDesc.category

    local airbaseId = airbase:getID()
    local airbaseSide = airbase:getCoalition()
    local airbaseOrientation = LSA.getAirbaseOrientation(airbase, airbaseType)
    local airbaseLocation = ToVec2(airbase:getPoint())

    local longestRunwayLocation = nil
    if airbaseType == Airbase.Category.AIRDROME then
        local longestRunway = LSA.getLongestRunway(airbase)
        longestRunwayLocation = ToVec2(longestRunway.position)
    end

    local apronPolygons = LSA.getApronPolygons(airbaseName)

    return {
        id = airbaseId,     -- dcs id
        name = airbaseName, -- dcs name
        type = airbaseType,
        side = airbaseSide,
        location = airbaseLocation,
        longestRunwayLocation = longestRunwayLocation,
        template = LSA.airbaseTemplateTypes[airbaseName],
        lastAttackAt = nil,
        orientation = airbaseOrientation,
        apron = {
            name = Dashed(airbaseName, "Apron"),
            polygons = apronPolygons,
            markupId = nil
        },
        patrol = {
            name = Dashed(airbaseName, "Patrol"),
        },
        perimeter = {
            name = Dashed(airbaseName, "Perimeter"),
            markupId = nil
        },
        capture = {
            name = Dashed(airbaseName, "Capture-Zone"),
            scheduled = nil,
            markupId = nil
        },
    }
end

function Base.hasRepairs(base)
    for _, static in ipairs(base.repairs) do
        if StaticWrp.isAlive(static) and StaticWrp.isRepairs(static) then
            return true
        end
    end
    return false
end

function Base.isUnderAttack(base)
    if base.lastAttackAt == nil then
        return false
    end

    local currentTime = timer.getTime()
    local interlude = math.floor(currentTime - base.lastAttackAt)
    return interlude <= LSA.settings.baseAttackCooldownDelay
end

function Base.attacked(base, time)
    base.lastAttackAt = time
end

---Returns the strength of the base in percentage.
---@param base table
---@return number
function Base.strength(base)
    local aliveStatics = 0
    local aliveUnits = 0

    local totalStatics = 0
    for _, static in ipairs(base.statics) do
        totalStatics = totalStatics + 1
        if StaticWrp.isAlive(static) then
            aliveStatics = aliveStatics + 1
        end
    end

    local totalUnits = 0
    for _, group in ipairs(base.groups) do
        for _, unit in ipairs(group.units) do
            totalUnits = totalUnits + 1
            if UnitWrp.isAlive(unit) then
                aliveUnits = aliveUnits + 1
            end
        end
    end

    return (aliveStatics + aliveUnits) / (totalStatics + totalUnits) * 100
end

function Base.canRepair(base)
    local hasRepairBuildings = Base.hasRepairs(base)
    local isUnderAttack = Base.isUnderAttack(base)

    local strength = Base.strength(base)
    return hasRepairBuildings and not isUnderAttack and strength < 100
end

function Base.repair(base)
    -- force cleanup
    for _, group in ipairs(base.groups) do
        for _, unit in ipairs(group.units) do
            if UnitWrp.isDead(unit) then
                LSA.removeJunk(unit.location)
                LSA.removeObj(unit.location)
            end
        end
    end

    for _, static in ipairs(base.statics) do
        if StaticWrp.isDead(static) then
            LSA.removeJunk(static.location)
            LSA.removeObj(static.location)
        end
    end

    for _, static in ipairs(base.logistics) do
        if StaticWrp.isDead(static) then
            LSA.removeJunk(static.location)
            LSA.removeObj(static.location)
        end
    end

    TS.task("repair", function()
        for _, group in ipairs(base.groups) do
            for _, unit in ipairs(group.units) do
                if UnitWrp.isDead(unit) then
                    GroupWrp.repair(group)
                end
            end
        end

        for _, static in ipairs(base.statics) do
            if StaticWrp.isDead(static) then
                StaticWrp.respawn(static)
            end
        end

        for _, static in ipairs(base.logistics) do
            if StaticWrp.isDead(static) then
                StaticWrp.respawn(static)
            end
        end
    end)
end

function Base.isUnderSiege(base)
    local captureZone = LSA.getZone(base.capture.name)
    if captureZone == nil then
        return false
    end

    local center = captureZone.location
    local radius = captureZone.radius

    local specialForces = LSA.searchNamedUnit("Special-Forces", center.x, center.y, radius)
    if specialForces == nil then
        return false
    end

    local isEnemy = specialForces ~= nil and specialForces:getCoalition() ~= base.side

    return isEnemy
end

function Base.isCapturable(base)
    local enemyPresent = Base.isUnderSiege(base)
    local baseStrength = Base.strength(base)

    local capturable = enemyPresent and baseStrength < LSA.settings.minimumBaseStrength
    return capturable
end

function Base.destroy(base)
    TS.task("explode groups", function()
        local delay = math.random(1, 5)
        for _, group in ipairs(base.groups) do
            for _, unit in ipairs(group.units) do
                if UnitWrp.isAlive(unit) then
                    TS.task("explode " .. unit.name, LSA.explodeUnit, unit.name, delay)
                    delay = delay + math.random(1, 5)
                end
            end
        end
    end)

    TS.task("explode statics", function()
        local delay = math.random(1, 5)
        for _, static in ipairs(base.statics) do
            if StaticWrp.isAlive(static) then
                TS.task("explode " .. static.name, LSA.explodeStatic, static.name, delay)
                delay = delay + math.random(1, 5)
            end
        end
    end)

    TS.task("explode repairs", function()
        local delay = math.random(1, 5)
        for _, static in ipairs(base.repairs) do
            if StaticWrp.isAlive(static) then
                TS.task("explode " .. static.name, LSA.explodeStatic, static.name, delay)
                delay = delay + math.random(1, 5)
            end
        end
    end)

    TS.task("explode logistics", function()
        local delay = math.random(1, 5)
        for _, static in ipairs(base.logistics) do
            if StaticWrp.isAlive(static) then
                TS.task("explode " .. static.name, LSA.explodeStatic, static.name, delay)
                delay = delay + math.random(1, 5)
            end
        end
    end)

    TS.task("explode bombers", function()
        local delay = math.random(1, 5)
        for _, bomber in ipairs(base.bombers) do
            if StaticWrp.isAlive(bomber) then
                TS.task("explode " .. bomber.name, Bomber.explode, bomber, delay)
                delay = delay + math.random(1, 5)
            end
        end
    end)

    TS.task("explode tankers", function()
        local delay = math.random(1, 5)
        for _, tanker in ipairs(base.tankers) do
            if StaticWrp.isAlive(tanker) then
                TS.task("explode " .. tanker.name, Tanker.explode, tanker, delay)
                delay = delay + math.random(1, 5)
            end
        end
    end)
    -- [TODO] awacs
end

function Base.spawn(base)
    LSA.setBaseCoalition(base)
    LSA.paintBaseZones(base)

    for _, group in ipairs(base.groups) do
        GroupWrp.spawn(group)
    end

    for _, static in ipairs(base.statics) do
        StaticWrp.spawn(static)
    end
    for _, static in ipairs(base.logistics) do
        StaticWrp.spawn(static)
    end
    for _, static in ipairs(base.repairs) do
        StaticWrp.spawn(static)
    end

    for _, tanker in ipairs(base.tankers) do
        Tanker.spawn(tanker)
    end

    for _, bomber in ipairs(base.bombers) do
        Bomber.spawn(bomber)
    end

    for _, awacs in ipairs(base.awacs) do
        Awacs.spawn(awacs)
    end

    Base.markLogistics(base.logistics[1])
end

function Base.markLogistics(static)
    if static == nil then return end

    local color = LSA.markups.colors.opaque.Green
    local fill = LSA.markups.colors.faint.Green

    local zone = {}
    zone.location = static.location
    zone.radius = 50

    static.markupId = LSA.paintCircle(zone, color, fill, static.side)
end

function Base.unmarkLogistics(static)
    if static == nil then return end

    trigger.action.removeMark(static.markupId)
    static.markupId = nil
end

function Base.capture(base)
    LSA.BaseRepairsFunctionIds[base.name] = nil
    local previousOwner = base.side

    Base.destroy(DeepCopy(base))
    Base.occupy(base)

    local newOwner = base.side

    return newOwner, previousOwner
end

function Base.occupy(base)
    Base.__setBaseCoalition(base)
    LSA.paintBasePerimeter(base)
    base.lastAttackAt = nil
    LSA.BaseCaptureFunctionIds[base.name] = nil

    Base.unmarkLogistics(base.logistics[1])

    base.statics, base.repairs, base.logistics = StaticsGenerator.generate(base, true)
    base.groups = GroupGenerator.generate(base, true)

    Base.markLogistics(base.logistics[1])

    CfxSSBClient.setSlotAccessByAirfieldOwner()
end

function Base.rebuildRepairs(baseName)
    local base = Base.find(baseName)
    if base == nil then return end

    for _, repairs in ipairs(base.repairs) do
        StaticWrp.respawn(repairs)
    end
end

function Base.__setBaseCoalition(base)
    Airbase.getByName(base.name):setCoalition(base.side)
end

function Base.find(baseName)
    local base = LSA.state.bases[baseName]
    if base == nil then
        Log.debug("No base found by the name %s", baseName)
    end

    return base
end

function Base.isApronArea(base, position)
    -- check if the player is at one of them
    for _, apronPolygon in ipairs(base.apron.polygons) do
        if InPolygon(position.x, position.y, apronPolygon) then
            return true
        end
    end

    return false
end

function Base.onLostStatic(event)
    local staticName = event.initiator:getName()
    local s = RefStatics.get(staticName)
    if s ~= nil and s.baseName ~= nil then
        local base = Base.find(s.baseName)
        Base.attacked(base, event.time)
    end
end

function Base.onLostUnit(event)
    local unitName = event.initiator:getName()
    local unit = RefUnits.get(unitName)
    if unit ~= nil and unit.baseName ~= nil then
        local base = Base.find(unit.baseName)
        Base.attacked(base, event.time)
    end
end