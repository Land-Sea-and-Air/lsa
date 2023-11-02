BaseZoneTypeMapper = {}

---Gets a random zone for a given type.
---@param zones table
---@param type string
---@return table|nil
function BaseZoneTypeMapper.__getRandomZone(zones, type)
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

---Returns the distinct type in the templates.
---@param templates table
---@return table
function BaseZoneTypeMapper.__getDistinctTemplateTypes(templates)
    local types = {}
    for _, template in ipairs(templates) do
        types[template.type] = template.type
    end
    return types
end

---Returns a map of zones per type.
---@param base table
---@param templates table
---@return table
function BaseZoneTypeMapper.__getZonesMap(base, templates)
    local types = BaseZoneTypeMapper.__getDistinctTemplateTypes(templates)
    local collector = {}
    for _, type in pairs(types) do
        BaseZoneTypeMapper.__mapZonesForType(collector, base, type)
    end

    return collector
end

---Creates the map of zones for a given type
---@param collector table
---@param base table
---@param type string
function BaseZoneTypeMapper.__mapZonesForType(collector, base, type)
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