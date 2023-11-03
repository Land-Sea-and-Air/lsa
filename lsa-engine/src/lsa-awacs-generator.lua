AwacsGenerator = {}

function AwacsGenerator.generate(base)
    local templates = AwacsGenerator.__getTemplates(base)

    local zones = BaseZoneTypeMapper.__getZonesMap(base, templates)
    local aircraft = {}

    for i, template in ipairs(templates) do
        local zone = BaseZoneTypeMapper.__getRandomZone(zones, template.type)
        if zone ~= nil then
            local statics = AwacsGenerator.__generateSupportingStatics(template, base, zone, i)
            -- [REVIEW] this means that the template should always include the awacs as its first static
            local awacsStatic = template.statics[1]

            local awacsName = Dashed(base.name, template.type, i)
            local awacsType = awacsStatic.type
            local awacsSide = base.side
            local awacsFreq = awacsStatic.freq
            local awacsModulation = awacsStatic.modulation
            local awacsLocation = LSA.newPos(zone.location, awacsStatic, zone.heading)

            local awacs = Awacs.new(
                awacsName,
                awacsType,
                awacsSide,
                awacsFreq,
                awacsModulation,
                base.name,
                statics,
                awacsLocation
            )

            table.insert(aircraft, awacs)
        end
    end

    return aircraft
end

function AwacsGenerator.__generateSupportingStatics(template, base, zone, i)
    local statics = {}
    for j, awacsStatic in ipairs(template.statics) do
        local staticName = Dashed(base.name, "Awacs", i, j)
        local staticType = awacsStatic.type
        local staticHeading = zone.heading + awacsStatic.heading
        local staticRole = awacsStatic.role

        local staticLocation = LSA.newPos(zone.location, awacsStatic, zone.heading)
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

---Get the awacs templates from a base template.
---@param base table
---@return table
function AwacsGenerator.__getTemplates(base)
    local sideName = LSA.side(base.side)
    return AwacsTemplates[sideName]
end