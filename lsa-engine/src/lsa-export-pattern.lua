PatternExporter = {}

function PatternExporter.export()
    local getAngle = function(x, y)
        local arctan = math.atan2(y, x)
        local deg = math.deg(arctan)
        if deg < 0 then
            deg = deg + 360
        end
        local value = math.ceil(deg)
        return value
    end

    local getDistance = function(x, y)
        local sqrt = math.sqrt(x ^ 2 + y ^ 2)
        local value = math.ceil(sqrt)
        return value
    end

    local getHeading = function(x, y)
        local arctan = math.atan2(y, x)
        local deg = math.deg(arctan)
        if deg < 0 then
            deg = deg + 360
        end
        local value = math.ceil(deg)
        return value
    end

    local getCenter = function(list, index)
        for _, item in ipairs(list) do
            if item:getName() == "Center-" .. index then
                return item
            end
        end
    end

    local getItem = function(typeName, distance, angle, heading)
        distance = distance or 0
        angle = angle or 0
        heading = heading or 0

        return { type = typeName, distance = distance, angle = angle, heading = heading }
    end

    local staticPatterns = {}
    for i = 1, 10, 1 do
        local zone = trigger.misc.getZone("Export-Statics-Pattern-" .. i)
        if zone == nil then
            break
        end

        local pattern = { statics = {} }

        local pos2d = ToVec2(zone.point)
        local statics = LSA.findStaticsAt(pos2d.x, pos2d.y, zone.radius)

        local centerPiece = getCenter(statics, i)
        assert(centerPiece ~= nil, "could not find center")
        local centerPieceHdg = getHeading(centerPiece:getPosition().x.x, centerPiece:getPosition().x.z)
        table.insert(pattern.statics, getItem(centerPiece:getTypeName(), 0, 0, centerPieceHdg))

        local c = ToVec2(centerPiece:getPoint())
        for _, static in ipairs(statics) do
            if static:getName() ~= "Center-" .. i then
                local p = ToVec2(static:getPoint())

                local typeName = static:getTypeName()

                local distance = getDistance((p.x - c.x), (p.y - c.y))
                local angle = getAngle((p.x - c.x), (p.y - c.y))
                local heading = getHeading(static:getPosition().x.x, static:getPosition().x.z)

                table.insert(pattern.statics, getItem(typeName, distance, angle, heading))
            end
        end

        table.insert(staticPatterns, pattern)
    end

    local unitPatterns = {}
    for i = 1, 10, 1 do
        local zone = trigger.misc.getZone("Export-Units-Pattern-" .. i)
        if zone == nil then
            break
        end

        local pattern = { units = {} }

        local pos2d = ToVec2(zone.point)
        local groups = LSA.findGroupsAt(pos2d.x, pos2d.y, zone.radius)

        local centerPiece = nil
        for _, group in ipairs(groups) do
            for _, unit in ipairs(group:getUnits()) do
                if unit:getName() == "Center-" .. i then
                    centerPiece = unit
                end
            end
        end

        assert(centerPiece ~= nil, "could not find center")

        local centerPieceHdg = getHeading(centerPiece:getPosition().x.x, centerPiece:getPosition().x.z)
        table.insert(pattern.units,
            { type = centerPiece:getTypeName(), distance = 0, angle = 0, heading = centerPieceHdg })
        local c = ToVec2(centerPiece:getPoint())
        for _, group in ipairs(groups) do
            for _, unit in ipairs(group:getUnits()) do
                if unit:getName() ~= "Center-" .. i then
                    local p = ToVec2(unit:getPoint())

                    local typeName = unit:getTypeName()

                    local distance = getDistance((p.x - c.x), (p.y - c.y))
                    local angle = getAngle((p.x - c.x), (p.y - c.y))
                    local heading = getHeading(unit:getPosition().x.x, unit:getPosition().x.z)

                    table.insert(pattern.units,
                        { type = typeName, distance = distance, angle = angle, heading = heading })
                end
            end
        end

        table.insert(unitPatterns, pattern)
    end

    local groupPatterns = {}
    for i = 1, 10, 1 do
        local zone = trigger.misc.getZone("Export-Groups-Pattern-" .. i)
        if zone == nil then
            break
        end

        local pattern = { groups = {} }

        local pos2d = ToVec2(zone.point)
        local groups = LSA.findGroupsAt(pos2d.x, pos2d.y, zone.radius)

        local centerPiece = nil
        for _, group in ipairs(groups) do
            for _, unit in ipairs(group:getUnits()) do
                if unit:getName() == "Center-" .. i then
                    centerPiece = unit
                end
            end
        end

        assert(centerPiece ~= nil, "could not find center")

        local centerPieceHdg = getHeading(centerPiece:getPosition().x.x, centerPiece:getPosition().x.z)
        table.insert(pattern.groups,
            { type = centerPiece:getTypeName(), distance = 0, angle = 0, heading = centerPieceHdg })
        local c = ToVec2(centerPiece:getPoint())
        for _, group in ipairs(groups) do
            for _, unit in ipairs(group:getUnits()) do
                if unit:getName() ~= "Center-" .. i then
                    local p = ToVec2(unit:getPoint())

                    local typeName = unit:getTypeName()

                    local distance = getDistance((p.x - c.x), (p.y - c.y))
                    local angle = getAngle((p.x - c.x), (p.y - c.y))
                    local heading = getHeading(unit:getPosition().x.x, unit:getPosition().x.z)

                    table.insert(pattern.groups,
                        { type = typeName, distance = distance, angle = angle, heading = heading })
                end
            end
        end

        table.insert(groupPatterns, pattern)
    end

    local contents = "local sp = {\n"
    for _, pattern in ipairs(staticPatterns) do
        contents = contents .. "{\n"
        contents = contents .. " statics = {\n"
        for _, static in ipairs(pattern.statics) do
            contents =
                contents ..
                string.format(
                    '{ type = "%s", distance = %03d, angle = %03d, heading = %03d },\n',
                    static.type,
                    static.distance,
                    static.angle,
                    static.heading
                )
        end
        contents = contents .. "},\n"
        contents = contents .. "},\n"
    end
    contents = contents .. "}\n"

    contents = contents .. "local up = {\n"
    for _, pattern in ipairs(unitPatterns) do
        contents = contents .. "{\n"
        contents = contents .. " units = {\n"
        for _, unit in ipairs(pattern.units) do
            contents =
                contents ..
                string.format(
                    '{ type = "%s", distance = %03d, angle = %03d, heading = %03d },\n',
                    unit.type,
                    unit.distance,
                    unit.angle,
                    unit.heading
                )
        end
        contents = contents .. "},\n"
        contents = contents .. "},\n"
    end
    contents = contents .. "}"

    contents = contents .. "local gp = {\n"
    for _, pattern in ipairs(groupPatterns) do
        contents = contents .. "{\n"
        contents = contents .. " groups = {\n"
        for _, group in ipairs(pattern.groups) do
            contents =
                contents ..
                string.format(
                    '{ type = "%s", distance = %03d, angle = %03d, heading = %03d },\n',
                    group.type,
                    group.distance,
                    group.angle,
                    group.heading
                )
        end
        contents = contents .. "},\n"
        contents = contents .. "},\n"
    end
    contents = contents .. "}"

    WriteFile(LSA.settings.path .. "\\lsa-pattern.lua", contents)
end