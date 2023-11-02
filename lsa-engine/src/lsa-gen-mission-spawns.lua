local aircraftBlueprints = AircraftBlueprints

SlotGenerator = {}

function SlotGenerator.findCountry(name, countries)
    for _, country in ipairs(countries) do
        if country.name == name then
            return country
        end
    end
    assert(false, "Could not find the country")
end

---Creates a single new player spawn.
---@param airbaseName string
---@param spawnName string
---@param spawn table
---@param parking table
---@return table
function SlotGenerator.newPlayerSpawn(airbaseName, spawnName, spawn, parking)
    local parkingZoneName = Dashed(airbaseName, "Parking", parking.parking)
    local aircraft = DeepCopy(aircraftBlueprints[spawn.type])
    aircraft.name = spawnName
    aircraft.units[1].name = spawnName
    aircraft.units[1].heading = math.rad(parking.heading)

    local zone = LSA.getZone(parkingZoneName)
    assert(zone ~= nil)
    local parkingPos = zone.location

    aircraft.route.points[1].x = parkingPos.x
    aircraft.route.points[1].y = parkingPos.y
    aircraft.units[1].x = parkingPos.x
    aircraft.units[1].y = parkingPos.y
    aircraft.units[1].callsign = SlotGenerator.makeCallsign(aircraft.units[1].type)
    aircraft.x = parkingPos.x
    aircraft.y = parkingPos.y

    return aircraft
end

---Returns a valid callsign for the slot.
---@param type string
function SlotGenerator.makeCallsign(type)
    return CallsignGenerator.fighterCallsign(type)
end

function SlotGenerator.newShipPlayerSpawn(airbaseName, spawnName, spawn)
    local aircraft = DeepCopy(aircraftBlueprints[spawn.type])
    aircraft.name = spawnName
    aircraft.units[1].name = spawnName
    aircraft.units[1].callsign = SlotGenerator.makeCallsign(aircraft.units[1].type)

    local carrier = Airbase.getByName(airbaseName):getUnit(1):getGroup():getUnit(1)
    local parkingPos = ToVec2(carrier:getPoint())

    local point1 = aircraft.route.points[1]
    point1.x = parkingPos.x
    point1.y = parkingPos.y
    point1.action = "From Parking Area"
    point1.type = "TakeOffParking"
    Log.debug("Carrier name: %s id: %s", carrier:getName(), carrier:getID())
    point1["linkUnit"] = tonumber(carrier:getID())
    point1["helipadId"] = tonumber(carrier:getID())

    Log.debug("linkUnit %s", aircraft.route.points[1]["linkUnit"])
    Log.debug("helipadId %s", aircraft.route.points[1]["helipadId"])
    local unit1 = aircraft.units[1]
    unit1.x = parkingPos.x
    unit1.y = parkingPos.y
    unit1["parking"] = "1"
    unit1["parking_id"] = "1"
    aircraft.x = parkingPos.x
    aircraft.y = parkingPos.y

    return aircraft
end

---Generates player spawns.
---@param airbaseName string
---@param spawns table
---@param collector table
---@return nil
function SlotGenerator.generatePlayerSpawns(airbaseName, spawns, collector)
    for i, spawn in ipairs(spawns) do
        for j, parking in ipairs(spawn.parkings) do
            local spawnName = Dashed(airbaseName, spawn.nickname, i, j)
            pcall(function()
                local playerSpawn = SlotGenerator.newPlayerSpawn(airbaseName, spawnName, spawn, parking)
                table.insert(collector, playerSpawn)
            end)
        end
    end
end

function SlotGenerator.generateShipPlayerSpawns(airbaseName, spawns, collector)
    for i, spawn in ipairs(spawns) do
        for j, _ in ipairs(spawn.parkings) do
            local spawnName = Dashed(airbaseName, spawn.nickname, i, j)
            pcall(function()
                local playerSpawn = SlotGenerator.newShipPlayerSpawn(airbaseName, spawnName, spawn)
                table.insert(collector, playerSpawn)
            end)
        end
    end
end

function SlotGenerator.generate()
    local spawnTemplates = PlayerSpawns

    -- extension possibility
    -- consider adding the slot to Russia, USA, or the country that built the airframe
    -- or is known to use the aiframe a lot

    -- find CJTF Red
    local countryRed = SlotGenerator.findCountry("CJTF Red", env.mission.coalition.red.country)
    -- find CJTF Blue
    local countryBlue = SlotGenerator.findCountry("CJTF Blue", env.mission.coalition.blue.country)

    countryRed.plane = {}
    countryRed.plane.group = {}

    countryBlue.plane = {}
    countryBlue.plane.group = {}

    countryRed.helicopter = {}
    countryRed.helicopter.group = {}

    countryBlue.helicopter = {}
    countryBlue.helicopter.group = {}

    for airbaseName, spawnTemplate in pairs(spawnTemplates) do
        local airbase = Airbase.getByName(airbaseName)
        assert(airbase ~= nil)
        local airbaseDesc = airbase:getDesc()
        local airbaseType = airbaseDesc.category

        if airbaseType ~= Airbase.Category.SHIP then
            SlotGenerator.generatePlayerSpawns(airbaseName, spawnTemplate.red.fixed, countryRed.plane.group)
            SlotGenerator.generatePlayerSpawns(airbaseName, spawnTemplate.blue.fixed, countryBlue.plane.group)
            SlotGenerator.generatePlayerSpawns(airbaseName, spawnTemplate.red.rotary, countryRed.helicopter.group)
            SlotGenerator.generatePlayerSpawns(airbaseName, spawnTemplate.blue.rotary, countryBlue.helicopter.group)
        else
            if airbase:getCoalition() == coalition.side.RED then
                SlotGenerator.generateShipPlayerSpawns(airbaseName, spawnTemplate.red.fixed, countryRed.plane.group)
                SlotGenerator.generateShipPlayerSpawns(airbaseName, spawnTemplate.red.rotary, countryRed.helicopter
                    .group)
            end
            if airbase:getCoalition() == coalition.side.BLUE then
                SlotGenerator.generateShipPlayerSpawns(airbaseName, spawnTemplate.blue.fixed, countryBlue.plane.group)
                SlotGenerator.generateShipPlayerSpawns(airbaseName, spawnTemplate.blue.rotary,
                    countryBlue.helicopter.group)
            end
        end
    end

    local contents = LSA.serializeWithCycles("mission", env.mission)
    WriteFile(LSA.settings.path .. "\\mission", contents)
end