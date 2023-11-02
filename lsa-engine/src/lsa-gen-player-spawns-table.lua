PlayerSpawnsGenerator = {}

function PlayerSpawnsGenerator.generate()
    local templates = {}
    local airdromeTemplate = {
        blue = {
            fixed =
            {
                {
                    type = "A-10A",
                    nickname = "Warthog",
                    parkings = {
                        { parking = 1, heading = 183 },
                    }
                },
                {
                    type = "A-10C",
                    nickname = "Warthog",
                    parkings = {
                        { parking = 2, heading = 183 },
                    }
                },
                {
                    type = "A-10C_2",
                    nickname = "Warthog",
                    parkings = {
                        { parking = 3, heading = 183 },
                        { parking = 4, heading = 183 },
                    }
                },
                {
                    type = "F-15C",
                    nickname = "Eagle",
                    parkings = {
                        { parking = 5, heading = 183 },
                        { parking = 6, heading = 183 },
                    }
                },
                {
                    type = "F-16C_50",
                    nickname = "Viper",
                    parkings = {
                        { parking = 7, heading = 183 },
                        { parking = 8, heading = 183 },
                    }
                },
                {
                    type = "F-15ESE",
                    nickname = "StrikeEagle",
                    parkings = {
                        { parking = 9,  heading = 183 },
                        { parking = 10, heading = 183 },
                    }
                },
                {
                    type = "F-14B",
                    nickname = "Tomcat",
                    parkings = {
                        { parking = 11, heading = 183 },
                        { parking = 12, heading = 183 },
                    }
                },
                {
                    type = "M-2000C",
                    nickname = "M2K",
                    parkings = {
                        { parking = 13, heading = 183 },
                        { parking = 14, heading = 183 },
                    }
                },
                {
                    type = "AV8BNA",
                    nickname = "Harrier",
                    parkings = {
                        { parking = 15, heading = 183 },
                        { parking = 16, heading = 183 },
                    }
                },
                {
                    type = "F-5E-3",
                    nickname = "TigerII",
                    parkings = {
                        { parking = 17, heading = 183 },
                        { parking = 18, heading = 183 },
                    }
                },
            },
            rotary =
            {
                {
                    type = "UH-1H",
                    nickname = "Huey",
                    parkings = {
                        { parking = 19, heading = 093 },
                        { parking = 20, heading = 093 },
                    }
                },
                {
                    type = "AH-64D_BLK_II",
                    nickname = "Apache",
                    parkings = {
                        { parking = 21, heading = 273 },
                        { parking = 22, heading = 273 },
                        { parking = 23, heading = 273 },
                    }
                },
            }
        },
        red = {
            fixed =
            {
                {
                    type = "Su-25",
                    nickname = "Frogfoot",
                    parkings = {
                        { parking = 1, heading = 183 },
                        { parking = 2, heading = 183 },
                    }
                },
                {
                    type = "Su-25T",
                    nickname = "Frogfoot",
                    parkings = {
                        { parking = 3, heading = 183 },
                        { parking = 4, heading = 183 },
                    }
                },
                {
                    type = "AJS37",
                    nickname = "Viggen",
                    parkings = {
                        { parking = 5, heading = 183 },
                        { parking = 6, heading = 183 },
                    }
                },
                {
                    type = "Su-27",
                    nickname = "Flanker",
                    parkings = {
                        { parking = 7, heading = 183 },
                        { parking = 8, heading = 183 },
                    }
                },
                {
                    type = "MiG-29A",
                    nickname = "Fulcrum",
                    parkings = {
                        { parking = 9,  heading = 183 },
                        { parking = 10, heading = 183 },
                    }
                },
                {
                    type = "J-11A",
                    nickname = "FlankerL",
                    parkings = {
                        { parking = 11, heading = 183 },
                        { parking = 12, heading = 183 },
                    }
                },
                {
                    type = "MiG-21Bis",
                    nickname = "Fishbed",
                    parkings = {
                        { parking = 13, heading = 183 },
                        { parking = 14, heading = 183 },
                    }
                },
                {
                    type = "JF-17",
                    nickname = "Thunder",
                    parkings = {
                        { parking = 15, heading = 183 },
                        { parking = 16, heading = 183 },
                    }
                },
            },
            rotary =
            {
                {
                    type = "Mi-8MT",
                    nickname = "Hip",
                    parkings = {
                        { parking = 17, heading = 093 },
                        { parking = 18, heading = 093 },
                    }
                },
                {
                    type = "Mi-24P",
                    nickname = "Hind",
                    parkings = {
                        { parking = 19, heading = 273 },
                        { parking = 20, heading = 273 },
                        { parking = 21, heading = 273 },
                    }
                },
                {
                    type = "Ka-50",
                    nickname = "Shark",
                    parkings = {
                        { parking = 22, heading = 044 },
                        { parking = 23, heading = 044 },
                        { parking = 24, heading = 044 },
                    }
                },
                {
                    type = "Ka-50_3",
                    nickname = "Shark3",
                    parkings = {
                        { parking = 25, heading = 044 },
                        { parking = 26, heading = 044 },
                        { parking = 27, heading = 044 },
                    }
                },
            }
        }
    }
    local farpTemplate = {
        blue =
        {
            fixed = {},
            rotary =
            {
                {
                    type = "UH-1H",
                    nickname = "Huey",
                    parkings = {
                        { parking = 1, heading = 044 },
                        { parking = 2, heading = 044 },
                        { parking = 3, heading = 044 },
                    }
                },
                {
                    type = "AH-64D_BLK_II",
                    nickname = "Apache",
                    parkings = {
                        { parking = 4, heading = 044 },
                        { parking = 5, heading = 044 },
                        { parking = 6, heading = 044 },
                    }
                },
                {
                    type = "SA342L",
                    nickname = "GazelleL",
                    parkings = {
                        { parking = 7, heading = 044 },
                        { parking = 8, heading = 044 },
                    }
                },
                {
                    type = "SA342M",
                    nickname = "GazelleM",
                    parkings = {
                        { parking = 9,  heading = 044 },
                        { parking = 10, heading = 044 },
                    }
                },
                {
                    type = "SA342Minigun",
                    nickname = "GazelleMg",
                    parkings = {
                        { parking = 11, heading = 044 },
                        { parking = 12, heading = 044 },
                    }
                },
            }
        },
        red =
        {
            fixed = {},
            rotary =
            {
                {
                    type = "Mi-8MT",
                    nickname = "Hip",
                    parkings = {
                        { parking = 1, heading = 044 },
                        { parking = 2, heading = 044 },
                        { parking = 3, heading = 044 },
                    }
                },
                {
                    type = "Mi-24P",
                    nickname = "Hind",
                    parkings = {
                        { parking = 4, heading = 044 },
                        { parking = 5, heading = 044 },
                        { parking = 6, heading = 044 },
                    }
                },
                {
                    type = "Ka-50",
                    nickname = "Shark",
                    parkings = {
                        { parking = 7, heading = 044 },
                        { parking = 8, heading = 044 },
                        { parking = 9, heading = 044 },
                    }
                },
                {
                    type = "Ka-50_3",
                    nickname = "Shark3",
                    parkings = {
                        { parking = 10, heading = 044 },
                        { parking = 11, heading = 044 },
                        { parking = 12, heading = 044 },
                    }
                },
            }
        }
    }
    local shipTemplate = {
        blue = {
            fixed = {
                {
                    type = "F-14B",
                    nickname = "Tomcat",
                    parkings = {
                        { parking = 1, heading = 0 },
                        { parking = 2, heading = 0 },
                    }
                },
                {
                    type = "FA-18C_hornet",
                    nickname = "Hornet",
                    parkings = {
                        { parking = 3, heading = 0 },
                        { parking = 4, heading = 0 },
                    }
                },
            },
            rotary = {

            },
        },
        red = {
            fixed = {
                {
                    type = "Su-33",
                    nickname = "FlankerD",
                    parkings = {
                        { parking = 1, heading = 0 },
                        { parking = 2, heading = 0 },
                        { parking = 3, heading = 0 },
                        { parking = 4, heading = 0 },
                    }
                },
            },
            rotary = {

            },
        }
    }

    ---Calculates angle between the parking zone and the heading zone.
    ---@param airbaseName string
    ---@param parkingNr number
    ---@return number
    local function calculateHeading(airbaseName, parkingNr)
        local parkingZoneName = Dashed(airbaseName, "Parking", parkingNr)
        local parkingZone = LSA.getZone(parkingZoneName)
        if parkingZone == nil then return 0 end

        local headingZoneName = Dashed(airbaseName, "Parking", "Heading", parkingNr)
        local headingZone = LSA.getZone(headingZoneName)
        if headingZone ~= nil then
            return Angle(parkingZone.location, headingZone.location)
        end

        if parkingZone.properties ~= nil then
            for key, value in ipairs(parkingZone.properties) do
                if key == "Heading" then
                    return value
                end
            end
        end

        return 0
    end

    ---Updates heading of the parking spot.
    ---@param airbaseName string
    ---@param list table
    local function updateHeading(airbaseName, list)
        for _, item in ipairs(list) do
            for _, parking in ipairs(item.parkings) do
                local heading = calculateHeading(airbaseName, parking.parking)
                parking.heading = heading
            end
        end
    end

    for _, airbase in pairs(world.getAirbases()) do
        local airbaseName = airbase:getName()
        local airbaseDesc = airbase:getDesc()
        local airbaseType = airbaseDesc.category

        if airbaseType == Airbase.Category.AIRDROME then
            local copy = DeepCopy(airdromeTemplate)
            updateHeading(airbaseName, copy.red.fixed)
            updateHeading(airbaseName, copy.red.rotary)
            updateHeading(airbaseName, copy.blue.fixed)
            updateHeading(airbaseName, copy.blue.rotary)

            templates[airbaseName] = copy
        end
        if airbaseType == Airbase.Category.HELIPAD then
            local copy = DeepCopy(farpTemplate)
            updateHeading(airbaseName, copy.red.fixed)
            updateHeading(airbaseName, copy.red.rotary)
            updateHeading(airbaseName, copy.blue.fixed)
            updateHeading(airbaseName, copy.blue.rotary)
            templates[airbaseName] = copy
        end
        if airbaseType == Airbase.Category.SHIP then
            local carrier = airbase:getUnit(1):getGroup():getUnit(1)
            Log.debug("airbaseName %s , carrier %s", airbaseName, carrier:getName())
            if airbaseName == carrier:getName() then
                local copy = DeepCopy(shipTemplate)
                templates[airbaseName] = copy
            end
        end
    end

    local contents = "return" .. Serialize(templates)
    WriteFile(LSA.settings.path .. "\\lsa-player-spawns-tmp.lua", contents)
end