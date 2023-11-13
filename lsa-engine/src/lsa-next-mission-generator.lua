NextMissionGenerator = {}

function NextMissionGenerator.generate()
    -- save current state of the running mission
    LSA.saveState()

    -- extract mission from the original (template) miz
    local newMission = NextMissionGenerator.__getMissionTemplate()

    -- we will calculate the "next day" for the mission
    -- and set it in the mission table
    -- we will then write the mission file and create a .miz file
    -- that will contain the modified mission (effectively making the mission start on the next day)
    local currentMission = env.mission
    local year, month, day = NextMissionGenerator.__nextDay(currentMission)

    -- re-assign to mission (note that the year does not move)
    -- when reaching the end of year it will reset to the start of the year
    newMission.date.Day = day
    newMission.date.Month = month
    newMission.date.Year = year

    -- set mission start time
    newMission.start_time = NextMissionGenerator.__startTime(month, day)

    -- set the temperature and qnh
    local temperature, qnh = NextMissionGenerator.__temperatureAndQnh(month)
    newMission.weather.season.temperature = temperature
    newMission.weather.qnh = qnh

    -- set the wind speed and direction
    local winds = NextMissionGenerator.__windSpeedAndDirection()
    newMission.weather.wind.atGround = winds.atGround
    newMission.weather.wind.at2000 = winds.at2000
    newMission.weather.wind.at8000 = winds.at8000

    -- set clouds and base
    local preset, base = NextMissionGenerator.__cloudsAndBase(month)
    newMission.weather.clouds.preset = preset
    newMission.weather.clouds.base = base

    -- [TODO] other weather related elements (fog, turbulence, visibility, ice halo...)

    -- get the new miz file name
    local newMizFileName = NextMissionGenerator.__newMizFileName(newMission)
    
    -- generate the new miz file with the modified settings
    NextMissionGenerator.__newMiz(newMizFileName, newMission)

    -- write server information file
    NextMissionGenerator.__serverInformationFile(newMizFileName, newMission)

    -- tell the mission scripting engine to load the new .miz file
    NextMissionGenerator.__loadMission(newMizFileName)
end

function NextMissionGenerator.__getMissionTemplate()
    Zip.extract("LSA.miz", "mission")
    local contents = ReadFile(LSA.settings.path .. "\\mission")
    local getTemplateMission = Loader.loadString(string.format("local %s return mission", contents))
    return getTemplateMission()
end

---Calculates the next day from a given mission.
---@param mission table
---@return number?
---@return number
---@return number
function NextMissionGenerator.__nextDay(mission)
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

---Gets mission start time.
---@param month number
---@param day number
---@return integer
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

---Gets temperature and QNH.
---@param month number
---@return integer
---@return integer
function NextMissionGenerator.__temperatureAndQnh(month)
    local weatherTemplates = WeatherTemplates
    local weather = weatherTemplates[month]
    local temperature = math.random(weather.minTemp, weather.maxTemp)
    local qnh = math.random(weather.minQnh, weather.maxQnh)

    return temperature, qnh
end

---Gets wind speed and direction.
---@return table
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

---Gets new clouds and base.
---@param month number
---@return string
---@return integer
function NextMissionGenerator.__cloudsAndBase(month)
    local weatherTemplates = WeatherTemplates
    local weather = weatherTemplates[month]
    -- set clouds and base
    local randomIndex = math.random(1, #weather.clouds)
    local preset = weather.clouds[randomIndex]
    local base = weather.base

    return preset, base
end

---Gets the new miz file name
---@param mission table
---@return string
function NextMissionGenerator.__newMizFileName(mission)
    local day = mission.date.Day
    return "LSA_NEXT_" .. day .. ".miz"
end

---Creates the new miz file.
---@param missionFileName string
---@param mission table
function NextMissionGenerator.__newMiz(missionFileName, mission)
    -- serialize the mission so it can be written to the .miz
    local missionString = "mission=" .. Serializer.compact(mission)

    -- write the mission file
    WriteFile(LSA.settings.path .. "\\mission", missionString)


    -- copy original miz to a new file
    local cmd = string.format("cd /d %s & copy %s %s", LSA.settings.path, "LSA.miz", missionFileName)
    Log.debug("Executing command: %s", cmd)
    os.execute(cmd)

    -- update the mission inside the new miz file
    Zip.archive(missionFileName, "mission")
end

---Writes the server information file.
---@param missionFileName string
---@param mission table
function NextMissionGenerator.__serverInformationFile(missionFileName, mission)
    local year = mission.date.Year
    local month = mission.date.Month
    local day = mission.date.Day
    
    local serverInformation = {
        missionYear = year,
        missionMonth = month,
        missionDay = day,
        missionFile = missionFileName
    }

    local serverInformationContents = "return " .. Serializer.compact(serverInformation)
    WriteFile(LSA.settings.path .. "\\server.state.lua", serverInformationContents)
end

---Loads the new mission.
---@param missionFileName string
function NextMissionGenerator.__loadMission(missionFileName)
    local command = string.format("a_load_mission(\"%s\")", missionFileName)
    Log.debug("Calling mission scripting command: " .. command)
    net.dostring_in('mission', command)
end