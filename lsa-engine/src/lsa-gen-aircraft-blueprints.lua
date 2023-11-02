AircraftBluePrintGenerator = {}

function AircraftBluePrintGenerator.generate()
    local aircraftBlueprints = {}
    local initPoint = {
        ["alt"] = 2000,
        ["action"] = "From Ground Area",
        ["alt_type"] = "BARO",
        ["speed"] = 125,
        ["task"] =
        {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                }, -- end of ["tasks"]
            },     -- end of ["params"]
        },         -- end of ["task"]
        ["type"] = "TakeOffGround",
        ["ETA"] = 0,
        ["ETA_locked"] = true,
        ["y"] = 0,
        ["x"] = 0,
        ["formation_template"] = "",
        ["speed_locked"] = true,
    } -- end of [1]

    local function newGroup(group)
        local unit = group.units[1]
        assert(unit ~= nil)

        group.groupId = nil
        group.name = ""
        group.x = 0
        group.y = 0
        unit.unitId = nil
        unit.name = ""
        unit.x = 0
        unit.y = 0

        group.route.points = {}
        table.insert(group.route.points, initPoint)

        return group
    end

    for _, country in ipairs(env.mission.coalition.red.country) do
        if country.plane ~= nil and country.plane.group then
            for _, group in ipairs(country.plane.group) do
                if StartsWith(group.name, "Template") then
                    local unit = group.units[1]
                    assert(unit ~= nil)

                    aircraftBlueprints[unit.type] = newGroup(group)
                end
            end
        end
        if country.helicopter ~= nil and country.helicopter.group then
            for _, group in ipairs(country.helicopter.group) do
                if StartsWith(group.name, "Template") then
                    local unit = group.units[1]
                    assert(unit ~= nil)

                    aircraftBlueprints[unit.type] = newGroup(group)
                end
            end
        end
    end

    for _, country in ipairs(env.mission.coalition.blue.country) do
        if country.plane ~= nil and country.plane.group then
            for _, group in ipairs(country.plane.group) do
                if StartsWith(group.name, "Template") then
                    local unit = group.units[1]
                    assert(unit ~= nil)

                    aircraftBlueprints[unit.type] = newGroup(group)
                end
            end
        end

        if country.helicopter ~= nil and country.helicopter.group then
            for _, group in ipairs(country.helicopter.group) do
                if StartsWith(group.name, "Template") then
                    local unit = group.units[1]
                    assert(unit ~= nil)

                    aircraftBlueprints[unit.type] = newGroup(group)
                end
            end
        end
    end

    local contents = Serialize(aircraftBlueprints)
    WriteFile(LSA.settings.path .. "\\lsa-aircraft-blueprints-tmp.lua", contents)
end