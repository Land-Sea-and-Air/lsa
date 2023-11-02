TankerTemplates = {}
TankerTemplates.red = {
    {
        type = "Tankers",
        statics = {
            {
                type = "IL-78M",
                distance = 000,
                angle = 000,
                heading = 000,
                role = "tanker",
                freq = 125000000,
                modulation = "AM",
                method = "basket",
                tacan = {
                    channel = 41,
                    modeChannel = "Y",
                    frequency = 1128000000,
                    callsign = "BAS",
                }
            },
            { type = "Infantry AK ver2", distance = 034, angle = 087, heading = 000 },
            { type = "Infantry AK ver2", distance = 025, angle = 045, heading = 000 },
            { type = "Infantry AK ver2", distance = 020, angle = 341, heading = 000 },
            { type = "ATZ-10",           distance = 035, angle = 103, heading = 000 },
            { type = "ATZ-10",           distance = 020, angle = 063, heading = 000 },
        },
    },
}
TankerTemplates.blue = {
    {
        type = "Tankers",
        statics = {
            {
                type = "KC-135",
                distance = 000,
                angle = 000,
                heading = 000,
                role = "tanker",
                freq = 252000000,
                modulation = "AM",
                method = "boom",
                tacan = {
                    channel = 64,
                    modeChannel = "Y",
                    frequency = 1025000000,
                    callsign = "BOO",
                }
            },
            { type = "M978 HEMTT Tanker", distance = 020, angle = 063, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 030, angle = 103, heading = 000 },
            { type = "Soldier M4",        distance = 020, angle = 341, heading = 000 },
            { type = "Soldier M4",        distance = 025, angle = 045, heading = 000 },
            { type = "Soldier M4",        distance = 029, angle = 087, heading = 000 },
        },
    },
    {
        type = "Tankers",
        statics = {
            {
                type = "KC135MPRS",
                distance = 000,
                angle = 000,
                heading = 000,
                role = "tanker",
                freq = 254000000,
                modulation = "AM",
                method = "basket",
                tacan = {
                    channel = 66,
                    modeChannel = "Y",
                    frequency = 1027000000,
                    callsign = "BAS",
                }
            },
            { type = "M978 HEMTT Tanker", distance = 020, angle = 063, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 030, angle = 103, heading = 000 },
            { type = "Soldier M4",        distance = 020, angle = 341, heading = 000 },
            { type = "Soldier M4",        distance = 025, angle = 045, heading = 000 },
            { type = "Soldier M4",        distance = 029, angle = 087, heading = 000 },
        },
    },
}