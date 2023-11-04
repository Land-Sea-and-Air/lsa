GroupGenerator = {}

function GroupGenerator.generate(base, dead)
    local collector = {}
    if dead == nil then
        dead = false
    end

    local templates = GroupGenerator.__getTemplates(base)
    local zones = GroupGenerator.__getZonesMap(base, templates)
    for i, template in ipairs(templates) do
        local groups = template.groups
        local units = template.units

        if groups ~= nil then
            GroupGenerator.__generateSingleUnitGroup(base, template, zones, collector, dead)
        elseif units ~= nil then
            GroupGenerator.__generateMultiUnitGroup(base, template, zones, i, collector, dead)
        end
    end

    return collector
end

---Generates a single group containing a single unit.
---@param base table
---@param template table
---@param zones table
---@param collector table
function GroupGenerator.__generateSingleUnitGroup(base, template, zones, collector, dead)
    for j, groupTemplate in ipairs(template.groups) do
        local randomZone = GroupGenerator.__getRandomZone(zones, template.type)
        if randomZone ~= nil then
            local groupName = Dashed(base.name, template.type, j)
            local unitName = Dashed(groupName, "1")

            local unitLocation = LSA.newPos(randomZone.location, groupTemplate, randomZone.heading)
            local unitWrp = UnitWrp.new(
                unitName,
                groupTemplate.type,
                unitLocation,
                groupTemplate.heading + randomZone.heading,
                base.name,
                base.side
            )

            if dead then
                UnitWrp.kill(unitWrp)
            end

            local groupWrp = GroupWrp.new(groupName, { unitWrp }, base.name, base.side)
            GroupWrp.setTaskName(groupWrp, template.taskName)
            table.insert(collector, groupWrp)
        end
    end
end

---Generates a single group containing a multiple units.
---@param base table
---@param template table
---@param zones table
---@param i number
---@param collector table
function GroupGenerator.__generateMultiUnitGroup(base, template, zones, i, collector, dead)
    local groupName = Dashed(base.name, template.type, i)

    local randomZone = GroupGenerator.__getRandomZone(zones, template.type)
    if randomZone ~= nil then
        local units = {}
        for j, unitTemplate in ipairs(template.units) do
            local unitName = Dashed(groupName, j)
            local unitLocation = LSA.newPos(randomZone.location, unitTemplate, randomZone.heading)
            local unitWrp = UnitWrp.new(
                unitName,
                unitTemplate.type,
                unitLocation,
                unitTemplate.heading + randomZone.heading,
                base.name,
                base.side
            )

            if dead then
                UnitWrp.kill(unitWrp)
            end

            table.insert(units, unitWrp)
        end

        local groupWrp = GroupWrp.new(groupName, units, base.name, base.side)
        GroupWrp.setTaskName(groupWrp, template.taskName)
        table.insert(collector, groupWrp)
    end
end

---Gets a random zone for a given type.
---@param zones table
---@param type string
---@return table|nil
function GroupGenerator.__getRandomZone(zones, type)
    if zones[type] == nil then
        return nil
    end

    local zoneTypeCount = #zones[type]
    if zoneTypeCount == 0 then
        return nil
    end

    local zoneIndex = math.random(1, zoneTypeCount)

    local zone = zones[type][zoneIndex]

    table.remove(zones[type], zoneIndex)

    return zone
end

---Returns a map of zones per type.
---@param base table
---@param templates table
---@return table
function GroupGenerator.__getZonesMap(base, templates)
    local types = GroupGenerator.__getDistinctTemplateTypes(templates)

    local collector = {}
    for _, type in pairs(types) do
        GroupGenerator.__mapZonesForType(collector, base, type)
    end

    return collector
end

---Returns the distinct type in the templates.
---@param templates table
---@return table
function GroupGenerator.__getDistinctTemplateTypes(templates)
    local types = {}
    for _, template in ipairs(templates) do
        types[template.type] = template.type
    end
    return types
end

---Creates the map of zones for a given type
---@param collector table
---@param base table
---@param type string
function GroupGenerator.__mapZonesForType(collector, base, type)
    local name = Dashed(base.name, "Spawn", type)
    local count = 0
    local index = 0

    while true do -- this cycle will exit when there are no more trigger zones for the given type
        count = count + 1
        index = index + 1

        local triggerZoneName = Dashed(name, index)
        local triggerZone = LSA.getZone(triggerZoneName)
        if triggerZone == nil then break end

        if triggerZone ~= nil then
            if collector[type] == nil then
                collector[type] = {}
            end

            local heading = base.orientation
            for _, property in ipairs(triggerZone.properties) do
                if property.key == "Heading" then
                    heading = property.value
                end
            end

            local zone = {
                name = triggerZoneName,
                radius = triggerZone.radius,
                location = triggerZone.location,
                heading = heading
            }

            table.insert(collector[type], zone)
        end
    end
end

---Get the groups templates from a base template.
---@param base table
---@return table
function GroupGenerator.__getTemplates(base)
    local side = LSA.side(base.side)
    local baseTemplates = BaseTemplates.templates()

    if base.template ~= nil then
        local baseTemplateName = base.template
        local baseTemplate = baseTemplates[baseTemplateName]
        if baseTemplate == nil then return {} end

        return baseTemplate.groups[side] or {}
    end

    if base.type == Airbase.Category.AIRDROME then
        return baseTemplates[DefaultBaseTemplate.name].groups[side]
    end
    if base.type == Airbase.Category.HELIPAD then
        return baseTemplates[FarpBaseTemplate.name].groups[side]
    end

    return {}
end