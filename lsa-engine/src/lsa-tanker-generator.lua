TankerGenerator = {}

function TankerGenerator.generate(base)
    local templates = TankerGenerator.__getTemplates(base)

    local zones = BaseZoneTypeMapper.__getZonesMap(base, templates)
    local tankers = {}

    for i, template in ipairs(templates) do
        local zone = BaseZoneTypeMapper.__getRandomZone(zones, template.type)
        if zone == nil then break end

        local statics = TankerGenerator.__generateSupportingStatics(template, base, zone, i)
        -- [REVIEW] this means that the template should always include the tanker as its first static
        local tankerStatic = template.statics[1]

        local tankerName = Dashed(base.name, template.type, i)
        local tankerType = tankerStatic.type
        local tankerSide = base.side
        local tankerFreq = tankerStatic.freq
        local tankerModulation = tankerStatic.modulation
        local tankerMethod = tankerStatic.method
        local tankerTacan = tankerStatic.tacan
        local tankerLocation = LSA.newPos(zone.location, tankerStatic, zone.heading)

        local tanker = Tanker.new(
            tankerName,
            tankerType,
            tankerSide,
            tankerMethod,
            tankerFreq,
            tankerModulation,
            base.name,
            tankerTacan,
            statics,
            tankerLocation
        )

        table.insert(tankers, tanker)
    end

    return tankers
end

function TankerGenerator.__generateSupportingStatics(template, base, zone, i)
    local statics = {}
    for j, tankerStatic in ipairs(template.statics) do
        local staticName = Dashed(base.name, "Tanker", i, j)
        local staticType = tankerStatic.type
        local staticHeading = zone.heading + tankerStatic.heading
        local staticRole = tankerStatic.role

        local staticLocation = LSA.newPos(zone.location, tankerStatic, zone.heading)
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

---Get the tanker templates from a base template.
---@param base table
---@return table
function TankerGenerator.__getTemplates(base)
    local sideName = LSA.side(base.side)
    return TankerTemplates[sideName]
end