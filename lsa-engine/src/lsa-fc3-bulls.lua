BullsGenerator = {}

function BullsGenerator.centerMapNeutralBulls()
    local mission = env.mission
    local neutralBulls = mission.coalition.neutrals.bullseye
    local mapCenter = mission.map

    mapCenter.centerY = neutralBulls.y
    mapCenter.centerX = neutralBulls.x

    local contents = LSA.serializeWithCycles("mission", mission)
    WriteFile(LSA.settings.path .. "\\mission", contents)
end

function BullsGenerator.generate()
    local mission = env.mission
    local redBulls = mission.coalition.red.bullseye
    local blueBulls = mission.coalition.blue.bullseye
    local fc3 = { "MiG-29A", "MiG-29S", "MiG-29G", "Su-27", "J-11A", "Su-33", "Su-25", "Su-25T", "F-15C", "A-10A" }
    local function isFc3(type)
        for _, value in ipairs(fc3) do
            if value == type then
                return true
            end
        end
        return false
    end

    local function addFc3Bulls(group, bulls)
        if isFc3(group.units[1].type) then
            group.route.points[2] = {
                ["alt"] = 6000,
                ["action"] = "Turning Point",
                ["alt_type"] = "BARO",
                ["speed"] = 281.64208196089,
                ["task"] =
                {
                    ["id"] = "ComboTask",
                    ["params"] =
                    {
                        ["tasks"] =
                        {
                        },
                    },
                },
                ["type"] = "Turning Point",
                ["ETA"] = 1355.024615831,
                ["ETA_locked"] = false,
                ["y"] = bulls.y,
                ["x"] = bulls.x,
                ["formation_template"] = "",
                ["speed_locked"] = true,
            }
        end
    end

    for _, country in ipairs(mission.coalition.red.country) do
        if country.plane ~= nil and country.plane.group ~= nil then
            for _, planeGroup in ipairs(country.plane.group) do
                addFc3Bulls(planeGroup, redBulls)
            end
        end
    end
    for _, country in ipairs(mission.coalition.blue.country) do
        if country.plane ~= nil and country.plane.group ~= nil then
            for _, planeGroup in ipairs(country.plane.group) do
                addFc3Bulls(planeGroup, blueBulls)
            end
        end
    end

    local contents = LSA.serializeWithCycles("mission", mission)
    WriteFile(LSA.settings.path .. "\\mission", contents)
end