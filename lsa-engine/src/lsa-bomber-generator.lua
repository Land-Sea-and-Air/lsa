BomberGenerator = {}

function BomberGenerator.generate(base)
    if not LSA.settings.bombersEnabled then return {} end
    
    local templates = BomberGenerator.__getTemplates(base)

    local zones = BaseZoneTypeMapper.__getZonesMap(base, templates)
    local bombers = {}

    for i, template in ipairs(templates) do
        local zone = BaseZoneTypeMapper.__getRandomZone(zones, template.type)
        if zone ~= nil then
            local statics = BomberGenerator.__generateSupportingStatics(template, base, zone, i)
            -- [REVIEW] this means that the template should always include the bomber as its first static
            local bomberStatic = template.statics[1]

            local bomberName = Dashed(base.name, template.type, i)
            local bomberType = bomberStatic.type
            local bomberLocation = LSA.newPos(zone.location, bomberStatic, zone.heading)

            local bomber = Bomber.new(
                bomberName,
                bomberType,
                base.name,
                bomberLocation,
                statics
            )

            table.insert(bombers, bomber)
        end
    end

    return bombers
end

function BomberGenerator.__generateSupportingStatics(template, base, zone, i)
    local statics = {}
    for j, bomberStatic in ipairs(template.statics) do
        local staticName = Dashed(base.name, "Bomber", i, j)
        local staticType = bomberStatic.type
        local staticHeading = zone.heading + bomberStatic.heading
        local staticRole = bomberStatic.role

        local staticLocation = LSA.newPos(zone.location, bomberStatic, zone.heading)
        local static = StaticWrp.new(
            staticName,
            staticType,
            staticLocation,
            staticHeading,
            base.name,
            base.side,
            staticRole
        )
        table.insert(statics, static)
    end
    return statics
end

---Get the bomber templates from a base template.
---@param base table
---@return table
function BomberGenerator.__getTemplates(base)
    local sideName = LSA.side(base.side)
    return BomberTemplates[sideName]
end