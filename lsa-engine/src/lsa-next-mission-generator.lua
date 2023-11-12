NextMissionGenerator = {}

function NextMissionGenerator.generate()
    -- save current state of the running mission
    LSA.saveState()

    -- we will calculate the "next day" for the mission
    -- and set it in the mission table
    -- we will then write the mission file and create a .miz file
    -- that will contain the modified mission (effectively making the mission start on the next day)
    local mission = env.mission
    local year, month, day = NextMissionGenerator.__nextDay()

    -- re-assign to mission (note that the year does not move)
    -- when reaching the end of year it will reset to the start of the year
    mission.date.Day = day
    mission.date.Month = month
    mission.date.Year = year

    -- set mission start time
    mission.start_time = NextMissionGenerator.__startTime(month, day)

    -- set the temperature and qnh
    local temperature, qnh = NextMissionGenerator.__temperatureAndQnh(month)
    mission.weather.season.temperature = temperature
    mission.weather.qnh = qnh

    -- set the wind speed and direction
    local winds = NextMissionGenerator.__windSpeedAndDirection()
    mission.weather.wind.atGround = winds.atGround
    mission.weather.wind.at2000 = winds.at2000
    mission.weather.wind.at8000 = winds.at8000

    -- set clouds and base
    local preset, base = NextMissionGenerator.__cloudsAndBase(month)
    mission.weather.clouds.preset = preset
    mission.weather.clouds.base = base

    -- [TODO] other weather related elements (fog, turbulence, visibility, ice halo...)

    -- generate the new miz file with the modified settings
    NextMissionGenerator.__newMiz()

    -- write server information file
    NextMissionGenerator.__serverInformationFile()

    -- tell the mission scripting engine to load the new .miz file
    NextMissionGenerator.__loadMission()
end

function NextMissionGenerator.__nextDay()
    local mission = env.mission
    local day = mission.date.Day
    local month = mission.date.Month
    local year = mission.date.Year

    -- calculate next day
    local begin = os.time({
        year = year,
        month = month,
        day = day,
        hour = 0,
        minute = 0,
        second = 0
    })
    local h24 = 24 * (60 * 60)
    local nextDay = os.date("*t", begin + h24)

    day = tonumber(nextDay.day) or day
    month = tonumber(nextDay.month) or month
    year = tonumber(year)

    return year, month, day
end

function NextMissionGenerator.__startTime(month, day)
    local weatherTemplates = WeatherTemplates

    local weather = weatherTemplates[month]
    local sessionLengthSeconds = LSA.settings.sessionLengthSeconds
    if day % 2 == 0 then
        -- when the day is a multiple of 2
        -- we will start the mission close to sunrise (morning)
        return weather.sunrise
    elseif day % 3 == 0 then
        -- when the day is a multiple of 3
        -- we will start the mission the session length before sunset (evening)
        return weather.sunset - sessionLengthSeconds
    else
        -- when the day is neither a multiple of 2 or of 3
        -- we will start the mission at 12:00 (midday)
        local midday = 43200
        return midday
    end
end

function NextMissionGenerator.__temperatureAndQnh(month)
    local weatherTemplates = WeatherTemplates
    local weather = weatherTemplates[month]
    local temperature = math.random(weather.minTemp, weather.maxTemp)
    local qnh = math.random(weather.minQnh, weather.maxQnh)

    return temperature, qnh
end

function NextMissionGenerator.__windSpeedAndDirection()
    local winds = {}

    local maxGroundWindSpeed = 6
    local minGroundWindSpeed = 0
    local groundWindSpeed = math.random(minGroundWindSpeed, maxGroundWindSpeed)
    local groundWindDir = math.random(0, 359)
    winds.atGround = { speed = groundWindSpeed, dir = groundWindDir }

    local maxWindSpeedAtTwo = 17
    local minWindSpeedAtTwo = 6
    local windSpeedAtTwo = math.random(minWindSpeedAtTwo, maxWindSpeedAtTwo)
    local windDirAtTwo = math.random(0, 359)
    winds.at2000 = { speed = windSpeedAtTwo, dir = windDirAtTwo }

    local maxWindSpeedAtEight = 25
    local minWindSpeedAtEight = 17
    local windSpeedAtEight = math.random(minWindSpeedAtEight, maxWindSpeedAtEight)
    local windDirAtEight = math.random(0, 359)
    winds.at8000 = { speed = windSpeedAtEight, dir = windDirAtEight }

    return winds
end

function NextMissionGenerator.__cloudsAndBase(month)
    local weatherTemplates = WeatherTemplates
    local weather = weatherTemplates[month]
    -- set clouds and base
    local randomIndex = math.random(1, #weather.clouds)
    local preset = weather.clouds[randomIndex]
    local base = weather.base

    return preset, base
end

function NextMissionGenerator.__newMizFileName()
    local day = env.mission.date.Day
    return "LSA_NEXT_" .. day .. ".miz"
end

function NextMissionGenerator.__newMiz()
    -- serialize the mission so it can be written to the .miz
    local missionString = "mission=" .. Serializer.compact(env.mission)

    -- write the mission file
    WriteFile(LSA.settings.path .. "\\mission", missionString)

    local newMizFileName = NextMissionGenerator.__newMizFileName()
    -- copy original miz to a new file
    local cmd = string.format("cd %s & copy %s %s", LSA.settings.path, "LSA.miz", newMizFileName)
    Log.debug("Executing command: %s", cmd)
    os.execute(cmd)

    -- update the mission inside the new miz file
    Zip.archive(newMizFileName, "mission")
end

function NextMissionGenerator.__serverInformationFile()
    local year = env.mission.date.Year
    local month = env.mission.date.Month
    local day = env.mission.date.Day
    local serverInformation = {
        missionYear = year,
        missionMonth = month,
        missionDay = day,
        missionFile = NextMissionGenerator.__newMizFileName()
    }

    local serverInformationContents = "return " .. Serializer.compact(serverInformation)
    WriteFile(LSA.settings.path .. "\\server.state.lua", serverInformationContents)
end

function NextMissionGenerator.__loadMission()
    local fileName = NextMissionGenerator.__newMizFileName()
    local command = string.format("a_load_mission(\"%s\")", fileName)
    Log.debug("Calling mission scripting command: " .. command)
    net.dostring_in('mission', command)
end