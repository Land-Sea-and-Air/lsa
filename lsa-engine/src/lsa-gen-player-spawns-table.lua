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
                        1,
                    }
                },
                {
                    type = "A-10C",
                    nickname = "Warthog",
                    parkings = {
                        2,
                    }
                },
                {
                    type = "A-10C_2",
                    nickname = "Warthog",
                    parkings = {
                        3,
                        4,
                    }
                },
                {
                    type = "F-15C",
                    nickname = "Eagle",
                    parkings = {
                        5,
                        6,
                    }
                },
                {
                    type = "F-16C_50",
                    nickname = "Viper",
                    parkings = {
                        7,
                        8,
                    }
                },
                {
                    type = "F-15ESE",
                    nickname = "StrikeEagle",
                    parkings = {
                        9,
                        10,
                    }
                },
                {
                    type = "F-14B",
                    nickname = "Tomcat",
                    parkings = {
                        11,
                        12,
                    }
                },
                {
                    type = "M-2000C",
                    nickname = "M2K",
                    parkings = {
                        13,
                        14,
                    }
                },
                {
                    type = "AV8BNA",
                    nickname = "Harrier",
                    parkings = {
                        15,
                        16,
                    }
                },
                {
                    type = "F-5E-3",
                    nickname = "TigerII",
                    parkings = {
                        17,
                        18,
                    }
                },
            },
            rotary =
            {
                {
                    type = "UH-1H",
                    nickname = "Huey",
                    parkings = {
                        19,
                        20,
                    }
                },
                {
                    type = "AH-64D_BLK_II",
                    nickname = "Apache",
                    parkings = {
                        21,
                        22,
                        23,
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
                        1,
                        2,
                    }
                },
                {
                    type = "Su-25T",
                    nickname = "Frogfoot",
                    parkings = {
                        3,
                        4,
                    }
                },
                {
                    type = "AJS37",
                    nickname = "Viggen",
                    parkings = {
                        5,
                        6,
                    }
                },
                {
                    type = "Su-27",
                    nickname = "Flanker",
                    parkings = {
                        7,
                        8,
                    }
                },
                {
                    type = "MiG-29A",
                    nickname = "Fulcrum",
                    parkings = {
                        9,
                        10,
                    }
                },
                {
                    type = "J-11A",
                    nickname = "FlankerL",
                    parkings = {
                        11,
                        12,
                    }
                },
                {
                    type = "MiG-21Bis",
                    nickname = "Fishbed",
                    parkings = {
                        13,
                        14,
                    }
                },
                {
                    type = "JF-17",
                    nickname = "Thunder",
                    parkings = {
                        15,
                        16,
                    }
                },
            },
            rotary =
            {
                {
                    type = "Mi-8MT",
                    nickname = "Hip",
                    parkings = {
                        17,
                        18,
                    }
                },
                {
                    type = "Mi-24P",
                    nickname = "Hind",
                    parkings = {
                        19,
                        20,
                        21,
                    }
                },
                {
                    type = "Ka-50",
                    nickname = "Shark",
                    parkings = {
                        22,
                        23,
                        24,
                    }
                },
                {
                    type = "Ka-50_3",
                    nickname = "Shark3",
                    parkings = {
                        25,
                        26,
                        27,
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
                        1, 2, 3
                    }
                },
                {
                    type = "AH-64D_BLK_II",
                    nickname = "Apache",
                    parkings = {
                        4, 5, 6
                    }
                },
                {
                    type = "SA342L",
                    nickname = "GazelleL",
                    parkings = {
                        7, 8
                    }
                },
                {
                    type = "SA342M",
                    nickname = "GazelleM",
                    parkings = {
                        9, 10
                    }
                },
                {
                    type = "SA342Minigun",
                    nickname = "GazelleMg",
                    parkings = {
                        11, 12
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
                        1, 2, 3
                    }
                },
                {
                    type = "Mi-24P",
                    nickname = "Hind",
                    parkings = {
                        4, 5, 6
                    }
                },
                {
                    type = "Ka-50",
                    nickname = "Shark",
                    parkings = {
                        7, 8, 9
                    }
                },
                {
                    type = "Ka-50_3",
                    nickname = "Shark3",
                    parkings = {
                        10, 11, 12
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
                        1, 2
                    }
                },
                {
                    type = "FA-18C_hornet",
                    nickname = "Hornet",
                    parkings = {
                        3, 4
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
                        1, 2, 3, 4
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
                local heading = calculateHeading(airbaseName, parking)
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
            -- updateHeading(airbaseName, copy.red.fixed)
            -- updateHeading(airbaseName, copy.red.rotary)
            -- updateHeading(airbaseName, copy.blue.fixed)
            -- updateHeading(airbaseName, copy.blue.rotary)

            templates[airbaseName] = copy
        end
        if airbaseType == Airbase.Category.HELIPAD then
            local copy = DeepCopy(farpTemplate)
            -- updateHeading(airbaseName, copy.red.fixed)
            -- updateHeading(airbaseName, copy.red.rotary)
            -- updateHeading(airbaseName, copy.blue.fixed)
            -- updateHeading(airbaseName, copy.blue.rotary)
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

    local contents = "return" .. Serializer.block(templates, {comment=false})
    WriteFile(LSA.settings.path .. "\\lsa-player-spawns-tmp.lua", contents)
end