CarrierTemplates = {}

CarrierTemplates.red = {
    KUZNECOW = {
        units = {
            { type = "KUZNECOW",          distance = 000, angle = 000, heading = 000, freq = 110000000, modulation = "AM" },
            { type = "NEUSTRASH",         distance = 600, angle = 235, heading = 000, freq = 110200000, modulation = "AM" },
            { type = "Ship_Tilde_Supply", distance = 600, angle = 125, heading = 000, freq = 110300000, modulation = "AM" },
        }
    },
    CV_1143_5 = {
        units = {
            { type = "CV_1143_5",         distance = 000, angle = 000, heading = 000, freq = 112000000, modulation = "AM" },
            { type = "NEUSTRASH",         distance = 600, angle = 235, heading = 000, freq = 112100000, modulation = "AM" },
            { type = "Ship_Tilde_Supply", distance = 600, angle = 125, heading = 000, freq = 112200000, modulation = "AM" },
        }
    },
}

CarrierTemplates.blue = {
    Stennis = {
        commands = {
            {
                name = "TACAN",
                args = {
                    channel = 76,
                    modeChannel = "X",
                    frequency = 1163000000,
                    callsign = "STS",
                }
            },
        },
        units = {
            { type = "Stennis",           distance = 000, angle = 000, heading = 000, freq = 270000000, modulation = "AM" },
            { type = "PERRY",             distance = 600, angle = 235, heading = 000, freq = 270100000, modulation = "AM" },
            { type = "Ship_Tilde_Supply", distance = 600, angle = 125, heading = 000, freq = 270200000, modulation = "AM" },
        }
    },
    CVN_71 = {
        commands = {
            {
                name = "TACAN",
                args = {
                    channel = 78,
                    modeChannel = "X",
                    frequency = 1165000000,
                    callsign = "ROT",
                }
            },
        },
        units = {
            { type = "CVN_71",            distance = 000, angle = 000, heading = 000, freq = 271000000, modulation = "AM" },
            { type = "PERRY",             distance = 600, angle = 235, heading = 000, freq = 271100000, modulation = "AM" },
            { type = "Ship_Tilde_Supply", distance = 600, angle = 125, heading = 000, freq = 271200000, modulation = "AM" },
        }
    },
}