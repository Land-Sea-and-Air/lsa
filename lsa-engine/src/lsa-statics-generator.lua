StaticsGenerator = {}

---Generates instances of statics from the templates for a given base (statics, repairs, logistics).
---@param base table
---@param dead boolean|nil
---@return table
---@return table
---@return table
function StaticsGenerator.generate(base, dead)
    local statics = {}
    local repairs = {}
    local logistics = {}
    if dead == nil then
        dead = false
    end

    local templates = StaticsGenerator.__getTemplates(base)

    local zones = BaseZoneTypeMapper.__getZonesMap(base, templates)
    for i, template in ipairs(templates) do
        local zone = BaseZoneTypeMapper.__getRandomZone(zones, template.type)
        if zone == nil then break end

        for j, staticTemplate in ipairs(template.statics) do
            local static = StaticsGenerator.__generateSimpleStatic(base, template, staticTemplate, zone, i, j, dead)
            if template.type == "Repairs" then
                table.insert(repairs, static)
            elseif template.type == "Logistics" then
                table.insert(logistics, static)
            else
                table.insert(statics, static)
            end
        end
    end

    return statics, repairs, logistics
end

function StaticsGenerator.__generateSimpleStatic(base, template, staticTemplate, zone, i, j, dead)
    local staticName = Dashed(base.name, template.type, i, j)
    local staticType = staticTemplate.type
    local staticLocation = LSA.newPos(zone.location, staticTemplate, zone.heading)
    local staticHeading = staticTemplate.heading + zone.heading
    local staticBaseName = base.name
    local staticSide = base.side
    local staticRole = staticTemplate.role

    local static = StaticWrp.new(
        staticName,
        staticType,
        staticLocation,
        staticHeading,
        staticBaseName,
        staticSide,
        staticRole)

    if dead then
        StaticWrp.kill(static)
    end

    return static
end

---Get the static templates from a base template.
---@param base table
---@return table
function StaticsGenerator.__getTemplates(base)
    local side = LSA.side(base.side)
    local baseTemplates = BaseTemplates.templates()

    if base.template ~= nil then
        local baseTemplateName = base.template
        local baseTemplate = baseTemplates[baseTemplateName]
        if baseTemplate == nil then return {} end

        return baseTemplate.statics[side] or {}
    end

    if base.type == Airbase.Category.AIRDROME then
        return baseTemplates[DefaultBaseTemplate.name].statics[side]
    end
    if base.type == Airbase.Category.HELIPAD then
        return baseTemplates[FarpBaseTemplate.name].statics[side]
    end

    return {}
end