TriggerZoneExporter = {}

function TriggerZoneExporter.addHeadingProperty(exportedZones)
    for zoneName, exportedZone in pairs(exportedZones) do
        local index = LastIndexOf(zoneName, "-")
        local name = string.sub(zoneName, 1, index - 1)
        local nr = string.sub(zoneName, index + 1)

        local headingZoneName = string.format("%s-Heading-%s", name, nr)
        local headingZone = exportedZones[headingZoneName]

        if headingZone ~= nil then
            local heading = Angle(exportedZone.location, headingZone.location)
            table.insert(exportedZone.properties, { key = "Heading", value = tostring(heading) })
        end
    end
end

function TriggerZoneExporter.removeHeadingZones(exportedZones)
    for zoneName, _ in pairs(exportedZones) do
        if string.find(zoneName, "Heading") ~= nil then
            exportedZones[zoneName] = nil
        end
    end
end

function TriggerZoneExporter.export()
    local missionZones = env.mission.triggers.zones
    local exportedZones = {}

    for _, missionZone in ipairs(missionZones) do
        local exportedZone = {
            name = missionZone.name,
            location = { x = missionZone.x, y = missionZone.y },
            radius = missionZone.radius,
            properties = missionZone.properties or {},
            verticies = missionZone.verticies or {}
        }

        exportedZones[exportedZone.name] = exportedZone
    end

    return exportedZones
end

function TriggerZoneExporter.removeTriggerZonesFromMission()
    local contents = LSA.serializeWithCycles("mission", env.mission)
    local backupFilePath = string.format("%s\\%s.%s.backup", LSA.settings.path, "mission", os.time())
    WriteFile(backupFilePath, contents)

    env.mission.triggers.zones = {}
    contents = LSA.serializeWithCycles("mission", env.mission)
    WriteFile(LSA.settings.path .. "\\mission", contents)
end

function TriggerZoneExporter.exportToFile(exportedZones)
    local contents = Serialize(exportedZones)
    local filePath = string.format("%s\\%s", LSA.settings.path, "lsa-zones-tmp.lua")
    WriteFile(filePath, contents)
end