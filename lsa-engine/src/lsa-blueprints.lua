Templates = {}

Templates.carriers = {}
Templates.carriers.red = {
    KUZNECOW = {
        vessels = {
            { type = "KUZNECOW",          distance = 000, angle = 000, heading = 000, freq = 110000000, modulation = "AM" },
            { type = "NEUSTRASH",         distance = 600, angle = 235, heading = 000, freq = 110200000, modulation = "AM" },
            { type = "Ship_Tilde_Supply", distance = 600, angle = 125, heading = 000, freq = 110300000, modulation = "AM" },
        }
    },
    CV_1143_5 = {
        vessels = {
            { type = "CV_1143_5",         distance = 000, angle = 000, heading = 000, freq = 112000000, modulation = "AM" },
            { type = "NEUSTRASH",         distance = 600, angle = 235, heading = 000, freq = 112100000, modulation = "AM" },
            { type = "Ship_Tilde_Supply", distance = 600, angle = 125, heading = 000, freq = 112200000, modulation = "AM" },
        }
    },
}
Templates.carriers.blue = {
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
        vessels = {
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
        vessels = {
            { type = "CVN_71",            distance = 000, angle = 000, heading = 000, freq = 271000000, modulation = "AM" },
            { type = "PERRY",             distance = 600, angle = 235, heading = 000, freq = 271100000, modulation = "AM" },
            { type = "Ship_Tilde_Supply", distance = 600, angle = 125, heading = 000, freq = 271200000, modulation = "AM" },
        }
    },
}

-- AIRFIELDS

Templates.tankers = {}
Templates.tankers.red = {
    {
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
Templates.tankers.blue = {
    {
        statics = {
            {
                type = "KC-135",
                distance = 000,
                angle = 000,
                heading = 000,
                role = "tanker",
                freq = 253000000,
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
            { type = "M978 HEMTT Tanker", distance = 035, angle = 103, heading = 000 },
            { type = "Soldier M4",        distance = 020, angle = 341, heading = 000 },
            { type = "Soldier M4",        distance = 025, angle = 045, heading = 000 },
            { type = "Soldier M4",        distance = 034, angle = 087, heading = 000 },
        },
    },
    {
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
            { type = "M978 HEMTT Tanker", distance = 035, angle = 103, heading = 000 },
            { type = "Soldier M4",        distance = 020, angle = 341, heading = 000 },
            { type = "Soldier M4",        distance = 025, angle = 045, heading = 000 },
            { type = "Soldier M4",        distance = 034, angle = 087, heading = 000 },
        },
    },
}

Templates.bombers = {}
Templates.bombers.v2 = {}
Templates.bombers.v2.red = {
    {
        statics = {
            { type = "Tu-160",           distance = 000, angle = 000, heading = 352, role = "bomber" },
            { type = "ATZ-10",           distance = 033, angle = 259, heading = 348 },
            { type = "Ural-4320 APA-5D", distance = 023, angle = 334, heading = 007 },
            { type = "Ural-375",         distance = 018, angle = 282, heading = 339 },
            { type = "Infantry AK",      distance = 028, angle = 278, heading = 293 },
            { type = "Infantry AK",      distance = 026, angle = 010, heading = 314 },
        },
    },
}
Templates.bombers.v2.blue = {
    {
        statics = {
            { type = "B-1B",              distance = 000, angle = 000, heading = 000, role = "bomber" },
            { type = "Soldier M4",        distance = 026, angle = 282, heading = 000 },
            { type = "M 818",             distance = 028, angle = 264, heading = 000 },
            { type = "Soldier M4",        distance = 021, angle = 027, heading = 000 },
            { type = "M 818",             distance = 016, angle = 312, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 016, angle = 047, heading = 000 },
            { type = "Soldier M4",        distance = 019, angle = 337, heading = 000 },
        },
    },
}

Templates.garrison = {}
Templates.garrison.v2 = {}
Templates.garrison.v2.red = {
    { groups = { { type = "T-55", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-10M3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "BTR-80", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "T-55", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-10M3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "BTR-80", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "T-55", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-10M3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "BTR-80", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "T-72B", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-1 9P31", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Ural-375 ZU-23 Insurgent", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "MTLB", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "T-72B", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-1 9P31", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Ural-375 ZU-23 Insurgent", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "MTLB", distance = 000, angle = 000, heading = 000 }, } },
}
Templates.garrison.v2.blue = {
    { groups = { { type = "Leopard1A3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Vulcan", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M48 Chaparral", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M-60", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Leopard1A3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Gepard", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Gepard", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Gepard", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M-109", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M48 Chaparral", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M48 Chaparral", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1097 Avenger", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1097 Avenger", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1097 Avenger", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M6 Linebacker", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M6 Linebacker", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Vulcan", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Vulcan", distance = 000, angle = 000, heading = 000 }, } },
}
Templates.sams = {}
Templates.sams.v2 = {}
Templates.sams.v2.red = {
    {
        taskName = "SAM",
        units = {
            { type = "SNR_75V",          distance = 000, angle = 000, heading = 000 },
            { type = "p-19 s-125 sr",    distance = 045, angle = 180, heading = 000 },
            { type = "S_75M_Volhov",     distance = 200, angle = 000, heading = 000 },
            { type = "S_75M_Volhov",     distance = 200, angle = 045, heading = 045 },
            { type = "S_75M_Volhov",     distance = 200, angle = 090, heading = 090 },
            { type = "S_75M_Volhov",     distance = 200, angle = 135, heading = 135 },
            { type = "S_75M_Volhov",     distance = 200, angle = 180, heading = 180 },
            { type = "S_75M_Volhov",     distance = 200, angle = 225, heading = 225 },
            { type = "S_75M_Volhov",     distance = 200, angle = 270, heading = 270 },
            { type = "S_75M_Volhov",     distance = 200, angle = 315, heading = 315 },
            { type = "ZIL-131 KUNG",     distance = 090, angle = 000, heading = 090 },
            { type = "ZIL-131 KUNG",     distance = 080, angle = 000, heading = 090 },
            { type = "Ural-4320 APA-5D", distance = 100, angle = 000, heading = 090 },
            { type = "ATMZ-5",           distance = 110, angle = 180, heading = 090 },
            { type = "ATMZ-5",           distance = 120, angle = 000, heading = 090 },
            { type = "Ural-4320T",       distance = 045, angle = 305, heading = 090 },
            { type = "Ural-4320T",       distance = 045, angle = 120, heading = 090 },
        },
    },
    {
        taskName = "SAM",
        units = {
            { type = "snr s-125 tr",   distance = 000, angle = 000, heading = 000 },
            { type = "p-19 s-125 sr",  distance = 080, angle = 295, heading = 000 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 000, heading = 000 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 045, heading = 045 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 090, heading = 090 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 135, heading = 135 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 180, heading = 180 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 225, heading = 225 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 270, heading = 270 },
            { type = "5p73 s-125 ln",  distance = 200, angle = 315, heading = 315 },
            { type = "ZIL-131 KUNG",   distance = 020, angle = 095, heading = 090 },
            { type = "ZiL-131 APA-80", distance = 015, angle = 065, heading = 180 },
            { type = "ZiL-131 APA-80", distance = 075, angle = 300, heading = 090 },
            { type = "GAZ-66",         distance = 065, angle = 020, heading = 090 },
            { type = "GAZ-66",         distance = 085, angle = 130, heading = 090 },
            { type = "GAZ-66",         distance = 085, angle = 235, heading = 090 },
        }
    }
}
Templates.sams.v2.blue = {
    {
        taskName = "SAM",
        units = {
            { type = "Hawk pcp",   distance = 000, angle = 000, heading = 000 },
            { type = "Hawk sr",    distance = 045, angle = 000, heading = 000 },
            { type = "Hawk cwar",  distance = 045, angle = 180, heading = 000 },
            { type = "Hawk tr",    distance = 060, angle = 090, heading = 220 },
            { type = "Hawk tr",    distance = 060, angle = 270, heading = 040 },
            { type = "Hawk ln",    distance = 200, angle = 045, heading = 045 },
            { type = "Hawk ln",    distance = 200, angle = 090, heading = 090 },
            { type = "Hawk ln",    distance = 200, angle = 135, heading = 135 },
            { type = "Hawk ln",    distance = 200, angle = 180, heading = 180 },
            { type = "Hawk ln",    distance = 200, angle = 000, heading = 000 },
            { type = "Hawk ln",    distance = 200, angle = 225, heading = 225 },
            { type = "Hawk ln",    distance = 200, angle = 270, heading = 270 },
            { type = "Hawk ln",    distance = 200, angle = 315, heading = 315 },
            { type = "M 818",      distance = 055, angle = 305, heading = 090 },
            { type = "M 818",      distance = 050, angle = 115, heading = 090 },
            { type = "HEMTT TFFT", distance = 090, angle = 230, heading = 270 },
            { type = "HEMTT TFFT", distance = 080, angle = 030, heading = 270 },
        },
    },
}
Templates.buildings = {}
Templates.buildings.v2 = {}
Templates.buildings.v2.red = {
    -- ammunition depot
    {
        statics = {
            { type = ".Ammunition depot", distance = 000, angle = 000, heading = 000 },
            { type = "Tank",              distance = 058, angle = 138, heading = 090 },
            { type = "Tank",              distance = 046, angle = 158, heading = 090 },
            { type = "Tank",              distance = 043, angle = 189, heading = 090 },
            { type = "Tank",              distance = 053, angle = 215, heading = 090 },
            { type = "Tank",              distance = 081, angle = 150, heading = 270 },
            { type = "Tank",              distance = 072, angle = 167, heading = 270 },
            { type = "Tank",              distance = 071, angle = 185, heading = 270 },
            { type = "Tank",              distance = 077, angle = 204, heading = 270 },
            { type = "Ural-375",          distance = 040, angle = 320, heading = 270 },
            { type = "Ural-375",          distance = 045, angle = 325, heading = 270 },
            { type = "Ural-375",          distance = 054, angle = 012, heading = 000 },
            { type = "Ural-375",          distance = 055, angle = 019, heading = 000 },
            { type = "Ural-375",          distance = 057, angle = 025, heading = 000 },
            { type = "Ural-375",          distance = 061, angle = 031, heading = 000 },
        }
    },
    -- command center
    {
        statics = {
            { type = ".Command Center",    distance = 000, angle = 000, heading = 000 },
            { type = "Electric power box", distance = 036, angle = 193, heading = 000 },
            { type = "Bunker",             distance = 036, angle = 164, heading = 000 },
            { type = "SKP-11",             distance = 027, angle = 059, heading = 090 },
            { type = "UAZ-469",            distance = 022, angle = 099, heading = 090 },
            { type = "UAZ-469",            distance = 023, angle = 110, heading = 090 },
        },
    },
    -- hangars
    {
        statics = {
            { type = "Hangar B",         distance = 000, angle = 000, heading = 000 },
            { type = "Hangar B",         distance = 030, angle = 360, heading = 000 },
            { type = "Hangar B",         distance = 030, angle = 180, heading = 000 },
            { type = "Hangar B",         distance = 051, angle = 270, heading = 180 },
            { type = "Hangar B",         distance = 060, angle = 301, heading = 180 },
            { type = "Hangar B",         distance = 061, angle = 238, heading = 180 },
            { type = "ZIL-135",          distance = 042, angle = 038, heading = 090 },
            { type = "ZIL-135",          distance = 036, angle = 048, heading = 090 },
            { type = "Ural ATsP-6",      distance = 028, angle = 082, heading = 090 },
            { type = "Ural ATsP-6",      distance = 028, angle = 094, heading = 090 },
            { type = "Ural-4320 APA-5D", distance = 037, angle = 137, heading = 090 },
            { type = "ZiL-131 APA-80",   distance = 043, angle = 143, heading = 090 },
            { type = "ZIL-135",          distance = 082, angle = 273, heading = 270 },
            { type = "ZIL-135",          distance = 083, angle = 266, heading = 270 },
        },
    },
    -- warehouses
    {
        statics = {
            { type = "Warehouse",  distance = 000, angle = 000, heading = 000 },
            { type = "Warehouse",  distance = 058, angle = 090, heading = 000 },
            { type = "ZIL-135",    distance = 032, angle = 211, heading = 180 },
            { type = "ZIL-135",    distance = 030, angle = 198, heading = 180 },
            { type = "ZIL-135",    distance = 028, angle = 181, heading = 180 },
            { type = "ZIL-135",    distance = 029, angle = 164, heading = 180 },
            { type = "ZIL-135",    distance = 032, angle = 151, heading = 180 },
            { type = "Ural-4320T", distance = 049, angle = 125, heading = 180 },
            { type = "Ural-4320T", distance = 057, angle = 119, heading = 180 },
            { type = "Ural-4320T", distance = 072, angle = 113, heading = 180 },
            { type = "Ural-4320T", distance = 078, angle = 111, heading = 180 },
        },
    },
    -- research facility
    {
        statics = {
            { type = "Tech hangar A", distance = 000, angle = 000, heading = 000 },
            { type = "Mi-26",         distance = 032, angle = 360, heading = 090 },
            { type = "KrAZ6322",      distance = 027, angle = 155, heading = 090 },
            { type = "KrAZ6322",      distance = 034, angle = 159, heading = 090 },
        },
    },
}
Templates.buildings.v2.blue = {
    -- ammunition depot
    {
        statics = {
            { type = ".Ammunition depot", distance = 000, angle = 000, heading = 000 },
            { type = "Tank",              distance = 058, angle = 138, heading = 090 },
            { type = "Tank",              distance = 046, angle = 158, heading = 090 },
            { type = "Tank",              distance = 043, angle = 189, heading = 090 },
            { type = "Tank",              distance = 053, angle = 215, heading = 090 },
            { type = "Tank",              distance = 081, angle = 150, heading = 270 },
            { type = "Tank",              distance = 072, angle = 167, heading = 270 },
            { type = "Tank",              distance = 071, angle = 185, heading = 270 },
            { type = "Tank",              distance = 077, angle = 204, heading = 270 },
            { type = "M 818",             distance = 040, angle = 320, heading = 270 },
            { type = "M 818",             distance = 045, angle = 325, heading = 270 },
            { type = "M 818",             distance = 054, angle = 012, heading = 000 },
            { type = "M 818",             distance = 055, angle = 019, heading = 000 },
            { type = "M 818",             distance = 057, angle = 025, heading = 000 },
            { type = "M 818",             distance = 061, angle = 031, heading = 000 },
        }
    },
    -- command center
    {
        statics = {
            { type = ".Command Center",    distance = 000, angle = 000, heading = 000 },
            { type = "Electric power box", distance = 036, angle = 193, heading = 000 },
            { type = "Bunker",             distance = 036, angle = 164, heading = 000 },
            { type = "Predator GCS",       distance = 027, angle = 059, heading = 090 },
            { type = "Hummer",             distance = 022, angle = 099, heading = 090 },
            { type = "Hummer",             distance = 023, angle = 110, heading = 090 },
        },
    },
    -- hangars
    {
        statics = {
            { type = "Hangar B",          distance = 000, angle = 000, heading = 000 },
            { type = "Hangar B",          distance = 030, angle = 360, heading = 000 },
            { type = "Hangar B",          distance = 030, angle = 180, heading = 000 },
            { type = "Hangar B",          distance = 051, angle = 270, heading = 180 },
            { type = "Hangar B",          distance = 060, angle = 301, heading = 180 },
            { type = "Hangar B",          distance = 061, angle = 238, heading = 180 },
            { type = "M978 HEMTT Tanker", distance = 042, angle = 038, heading = 090 },
            { type = "M978 HEMTT Tanker", distance = 036, angle = 048, heading = 090 },
            { type = "HEMTT TFFT",        distance = 028, angle = 082, heading = 090 },
            { type = "HEMTT TFFT",        distance = 028, angle = 094, heading = 090 },
            { type = "M 818",             distance = 037, angle = 137, heading = 090 },
            { type = "M 818",             distance = 043, angle = 143, heading = 090 },
            { type = "M978 HEMTT Tanker", distance = 082, angle = 273, heading = 270 },
            { type = "M978 HEMTT Tanker", distance = 083, angle = 266, heading = 270 },
        },
    },
    -- warehouses
    {
        statics = {
            { type = "Warehouse",         distance = 000, angle = 000, heading = 000 },
            { type = "Warehouse",         distance = 058, angle = 090, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 032, angle = 211, heading = 180 },
            { type = "M978 HEMTT Tanker", distance = 030, angle = 198, heading = 180 },
            { type = "M978 HEMTT Tanker", distance = 028, angle = 181, heading = 180 },
            { type = "M978 HEMTT Tanker", distance = 029, angle = 164, heading = 180 },
            { type = "M978 HEMTT Tanker", distance = 032, angle = 151, heading = 180 },
            { type = "M 818",             distance = 049, angle = 125, heading = 180 },
            { type = "M 818",             distance = 057, angle = 119, heading = 180 },
            { type = "M 818",             distance = 072, angle = 113, heading = 180 },
            { type = "M 818",             distance = 078, angle = 111, heading = 180 },
        },
    },
    -- research facility
    {
        statics = {
            { type = "Tech hangar A",     distance = 000, angle = 000, heading = 000 },
            { type = "CH-47D",            distance = 032, angle = 360, heading = 090 },
            { type = "M 818",             distance = 027, angle = 155, heading = 090 },
            { type = "M978 HEMTT Tanker", distance = 034, angle = 159, heading = 090 },
        },
    },
}
Templates.repairs = {}
Templates.repairs.v2 = {}
Templates.repairs.v2.red = {
    {
        statics =
        {
            { type = "Hangar A",         distance = 000, angle = 000, heading = 000 },
            { type = "Hangar A",         distance = 020, angle = 000, heading = 000 },
            { type = "Hangar A",         distance = 020, angle = 180, heading = 000 },
            { type = "KrAZ6322",         distance = 022, angle = 096, heading = 090 },
            { type = "KrAZ6322",         distance = 032, angle = 048, heading = 090 },
            { type = "KrAZ6322",         distance = 029, angle = 054, heading = 090 },
            { type = "KrAZ6322",         distance = 023, angle = 085, heading = 090 },
            { type = "Ural-4320 APA-5D", distance = 028, angle = 126, heading = 090 },
            { type = "Ural-4320 APA-5D", distance = 031, angle = 135, heading = 090 },
            { type = "Tower Crane",      distance = 034, angle = 163, heading = 000 },
        },
    },
}
Templates.repairs.v2.blue = {
    {
        statics = {
            { type = "Hangar A",          distance = 000, angle = 000, heading = 000 },
            { type = "Hangar A",          distance = 020, angle = 000, heading = 000 },
            { type = "Hangar A",          distance = 020, angle = 180, heading = 000 },
            { type = "M 818",             distance = 032, angle = 048, heading = 090 },
            { type = "M 818",             distance = 029, angle = 054, heading = 090 },
            { type = "M 818",             distance = 023, angle = 085, heading = 090 },
            { type = "M 818",             distance = 022, angle = 096, heading = 090 },
            { type = "M978 HEMTT Tanker", distance = 028, angle = 126, heading = 090 },
            { type = "M978 HEMTT Tanker", distance = 031, angle = 135, heading = 090 },
            { type = "Tower Crane",       distance = 034, angle = 163, heading = 000 },
        },
    },
}
Templates.vehicles = {}
Templates.vehicles.v2 = {}
Templates.vehicles.v2.red = {
    {
        statics = {
            { type = "Ural-375", distance = 000, angle = 000, heading = 000 },
            { type = "ZIL-135",  distance = 013, angle = 224, heading = 001 },
            { type = "Ural-375", distance = 009, angle = 270, heading = 001 },
            { type = "Ural-375", distance = 009, angle = 091, heading = 001 },
            { type = "Ural-375", distance = 005, angle = 090, heading = 001 },
            { type = "Ural-375", distance = 005, angle = 270, heading = 001 },
            { type = "ZIL-135",  distance = 011, angle = 205, heading = 001 },
            { type = "ZIL-135",  distance = 010, angle = 180, heading = 001 },
            { type = "ZIL-135",  distance = 011, angle = 156, heading = 001 },
            { type = "ZIL-135",  distance = 013, angle = 139, heading = 001 },
            { type = "ATZ-10",   distance = 010, angle = 346, heading = 001 },
            { type = "ATZ-10",   distance = 010, angle = 012, heading = 001 },
        },
    },
    {
        statics = {
            { type = "Ural ATsP-6", distance = 000, angle = 000, heading = 000 },
            { type = "Ural ATsP-6", distance = 006, angle = 270, heading = 001 },
            { type = "AA8",         distance = 013, angle = 206, heading = 001 },
            { type = "Ural ATsP-6", distance = 006, angle = 091, heading = 001 },
            { type = "AA8",         distance = 011, angle = 180, heading = 001 },
            { type = "AA8",         distance = 013, angle = 154, heading = 001 },
        },
    },
    {
        statics = {
            { type = "Ural-4320T",       distance = 000, angle = 000, heading = 000 },
            { type = "Ural-4320 APA-5D", distance = 005, angle = 092, heading = 001 },
            { type = "UAZ-469",          distance = 007, angle = 303, heading = 270 },
            { type = "UAZ-469",          distance = 006, angle = 276, heading = 270 },
        },
    },
}
Templates.vehicles.v2.blue = {
    {
        statics = {
            { type = "M 818",             distance = 000, angle = 000, heading = 000 },
            { type = "M 818",             distance = 005, angle = 270, heading = 001 },
            { type = "M 818",             distance = 010, angle = 270, heading = 001 },
            { type = "M978 HEMTT Tanker", distance = 013, angle = 157, heading = 001 },
            { type = "M978 HEMTT Tanker", distance = 012, angle = 181, heading = 001 },
            { type = "M978 HEMTT Tanker", distance = 013, angle = 204, heading = 001 },
            { type = "M978 HEMTT Tanker", distance = 015, angle = 221, heading = 001 },
            { type = "M 818",             distance = 005, angle = 091, heading = 001 },
            { type = "M 818",             distance = 010, angle = 090, heading = 001 },
            { type = "M978 HEMTT Tanker", distance = 016, angle = 139, heading = 001 },
            { type = "Hummer",            distance = 009, angle = 343, heading = 001 },
            { type = "Hummer",            distance = 009, angle = 017, heading = 001 },
        },
    },
    {
        statics = {
            { type = "Patriot cp", distance = 000, angle = 000, heading = 000 },
            { type = "Hummer",     distance = 008, angle = 235, heading = 270 },
            { type = "Hummer",     distance = 006, angle = 262, heading = 270 },
        },
    },
    {
        statics = {
            { type = "HEMTT TFFT", distance = 000, angle = 000, heading = 000 },
            { type = "HEMTT TFFT", distance = 006, angle = 268, heading = 001 },
            { type = "HEMTT TFFT", distance = 006, angle = 090, heading = 001 },
            { type = "HEMTT TFFT", distance = 014, angle = 205, heading = 001 },
            { type = "HEMTT TFFT", distance = 013, angle = 180, heading = 001 },
            { type = "HEMTT TFFT", distance = 014, angle = 158, heading = 001 },
        },
    },
}
Templates.logistics = {}
Templates.logistics.v2 = {}
Templates.logistics.v2.red = {
    {
        statics = {
            { type = "Hangar A",   distance = 000, angle = 000, heading = 000 },
            { type = "Hangar A",   distance = 020, angle = 180, heading = 000 },
            { type = "Ural-4320T", distance = 015, angle = 350, heading = 000 },
            { type = "Ural-4320T", distance = 015, angle = 015, heading = 000 },
            { type = "Mi-8MT",     distance = 030, angle = 085, heading = 000 },
        },
    },
}
Templates.logistics.v2.blue = {
    {
        statics = {
            { type = "Hangar A", distance = 000, angle = 000, heading = 000 },
            { type = "Hangar A", distance = 020, angle = 180, heading = 000 },
            { type = "M 818",    distance = 015, angle = 015, heading = 000 },
            { type = "M 818",    distance = 015, angle = 350, heading = 000 },
            { type = "UH-1H",    distance = 030, angle = 085, heading = 000 },
        },
    },
}

-- REGULAR FARPS
Templates.farps = {}
Templates.farps.garrison = {}
Templates.farps.garrison.v2 = {}
Templates.farps.garrison.v2.red = {
    { groups = { { type = "T-55", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-10M3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "BTR-80", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "T-55", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-10M3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "BTR-80", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "T-55", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-10M3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "BTR-80", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "T-55", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Strela-10M3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "BTR-80", distance = 000, angle = 000, heading = 000 }, } },
}
Templates.farps.garrison.v2.blue = {
    { groups = { { type = "Leopard1A3", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M48 Chaparral", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M-60", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Gepard", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Gepard", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M-109", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M48 Chaparral", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M48 Chaparral", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1097 Avenger", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1097 Avenger", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M1097 Avenger", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "M6 Linebacker", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Vulcan", distance = 000, angle = 000, heading = 000 }, } },
    { groups = { { type = "Vulcan", distance = 000, angle = 000, heading = 000 }, } },
}
Templates.farps.buildings = {}
Templates.farps.buildings.v2 = {}
Templates.farps.buildings.v2.red = {
    -- command post
    {
        statics = {
            { type = "FARP CP Blindage", distance = 000, angle = 000, heading = 270 },
            { type = "FARP Tent",        distance = 021, angle = 201, heading = 090 },
            { type = "FARP Tent",        distance = 024, angle = 148, heading = 000 },
            { type = "UAZ-469",          distance = 035, angle = 138, heading = 270 },
            { type = "SKP-11",           distance = 013, angle = 269, heading = 181 },
            { type = "house2arm",        distance = 038, angle = 067, heading = 000 },
        }
    },
    -- outpost
    {
        statics = {
            { type = "FARP Tent",      distance = 000, angle = 000, heading = 000 },
            { type = "FARP Tent",      distance = 014, angle = 181, heading = 090 },
            { type = "outpost",        distance = 036, angle = 327, heading = 000 },
            { type = "S_75_ZIL",       distance = 025, angle = 044, heading = 181 },
            { type = "generator_5i57", distance = 033, angle = 031, heading = 000 },
            { type = "ZIL-131 KUNG",   distance = 046, angle = 356, heading = 270 },
        }
    },
    -- fuel dumps
    {
        statics = {
            { type = "Sandbox",   distance = 000, angle = 000, heading = 000 },
            { type = "Fuel tank", distance = 028, angle = 143, heading = 000 },
            { type = "Fuel tank", distance = 028, angle = 219, heading = 000 },
            { type = "ATMZ-5",    distance = 040, angle = 207, heading = 181 },
            { type = "ATMZ-5",    distance = 041, angle = 156, heading = 181 },
        }
    },
    -- ammo dumps
    {
        statics = {
            { type = "FARP Ammo Dump Coating", distance = 000, angle = 000, heading = 000 },
            { type = "FARP Fuel Depot",        distance = 018, angle = 275, heading = 270 },
            { type = "Sandbox",                distance = 022, angle = 200, heading = 181 },
            { type = "KAMAZ Truck",            distance = 018, angle = 137, heading = 320 },
        }
    }
}
Templates.farps.buildings.v2.blue = {
    -- command post
    {
        statics = {
            { type = "FARP CP Blindage", distance = 000, angle = 000, heading = 270 },
            { type = "FARP Tent",        distance = 021, angle = 201, heading = 090 },
            { type = "FARP Tent",        distance = 024, angle = 148, heading = 000 },
            { type = "Hummer",           distance = 035, angle = 138, heading = 270 },
            { type = "Predator GCS",     distance = 013, angle = 269, heading = 181 },
            { type = "house2arm",        distance = 038, angle = 067, heading = 000 },
        }
    },
    -- outpost
    {
        statics = {
            { type = "FARP Tent",         distance = 000, angle = 000, heading = 000 },
            { type = "FARP Tent",         distance = 014, angle = 181, heading = 090 },
            { type = "outpost",           distance = 036, angle = 327, heading = 000 },
            { type = "HEMTT TFFT",        distance = 025, angle = 044, heading = 181 },
            { type = "M 818",             distance = 033, angle = 031, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 046, angle = 356, heading = 270 },
        }
    },
    -- fuel dumps
    {
        statics = {
            { type = "Sandbox",           distance = 000, angle = 000, heading = 000 },
            { type = "Fuel tank",         distance = 028, angle = 143, heading = 000 },
            { type = "Fuel tank",         distance = 028, angle = 219, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 040, angle = 207, heading = 181 },
            { type = "M978 HEMTT Tanker", distance = 041, angle = 156, heading = 181 },
        }
    },
    -- ammo dumps
    {
        statics = {
            { type = "FARP Ammo Dump Coating", distance = 000, angle = 000, heading = 000 },
            { type = "FARP Fuel Depot",        distance = 018, angle = 275, heading = 270 },
            { type = "Sandbox",                distance = 022, angle = 200, heading = 181 },
            { type = "M 818",                  distance = 018, angle = 137, heading = 320 },
        }
    }
}
Templates.farps.vehicles = {}
Templates.farps.vehicles.v2 = {}
Templates.farps.vehicles.v2.red = {
    {
        statics = {
            { type = "UAZ-469",     distance = 000, angle = 000, heading = 000 },
            { type = "ATMZ-5",      distance = 010, angle = 198, heading = 000 },
            { type = "ATMZ-5",      distance = 010, angle = 163, heading = 000 },
            { type = "KAMAZ Truck", distance = 020, angle = 189, heading = 360 },
            { type = "KAMAZ Truck", distance = 020, angle = 173, heading = 000 },
        },
    },
    {
        statics = {
            { type = "UAZ-469", distance = 000, angle = 000, heading = 000 },
            { type = "UAZ-469", distance = 005, angle = 268, heading = 335 },
        },
    },
    {
        statics = {
            { type = "ATMZ-5", distance = 000, angle = 000, heading = 000 },
            { type = "ATMZ-5", distance = 006, angle = 090, heading = 001 },
        },
    },
}
Templates.farps.vehicles.v2.blue = {
    {
        statics = {
            { type = "Hummer",            distance = 000, angle = 000, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 198, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 163, heading = 000 },
            { type = "M 818",             distance = 020, angle = 189, heading = 360 },
            { type = "M 818",             distance = 020, angle = 173, heading = 000 },
        },
    },
    {
        statics = {
            { type = "Hummer", distance = 000, angle = 000, heading = 000 },
            { type = "Hummer", distance = 005, angle = 268, heading = 335 },
        },
    },
    {
        statics = {
            { type = "HEMTT TFFT", distance = 000, angle = 000, heading = 000 },
            { type = "HEMTT TFFT", distance = 006, angle = 090, heading = 001 },
        },
    },
}
Templates.farps.repairs = {}
Templates.farps.repairs.v2 = {}
Templates.farps.repairs.v2.red = {
    {
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 0 },
            { type = "KrAZ6322", distance = 25, angle = 85, heading = 90 },
            { type = "KrAZ6322", distance = 25, angle = 95, heading = 90 },
        },
    },
}
Templates.farps.repairs.v2.blue = {
    {
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 0 },
            { type = "M 818",    distance = 25, angle = 85, heading = 90 },
            { type = "M 818",    distance = 25, angle = 95, heading = 90 },
        },
    },
}
Templates.farps.service = {}
Templates.farps.service.v2 = {}
Templates.farps.service.v2.red = {
    {
        groups = {
            { type = "outpost",          distance = 000, angle = 000, heading = 000 },
            { type = "Ural-4320 APA-5D", distance = 008, angle = 020, heading = 271 },
            { type = "ATZ-10",           distance = 010, angle = 165, heading = 271 },
            { type = "Ural-375",         distance = 015, angle = 170, heading = 271 },
        }
    }
}
Templates.farps.service.v2.blue = {
    {
        groups = {
            { type = "outpost",           distance = 000, angle = 000, heading = 000 },
            { type = "HEMTT TFFT",        distance = 008, angle = 020, heading = 271 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 165, heading = 271 },
            { type = "M 818",             distance = 015, angle = 170, heading = 271 },
        }
    }
}
Templates.farps.logistics = {}
Templates.farps.logistics.v2 = {}
Templates.farps.logistics.v2.red = {
    {
        statics = {
            { type = "Hangar A",   distance = 000, angle = 000, heading = 000 },
            { type = "Hangar A",   distance = 020, angle = 180, heading = 000 },
            { type = "Ural-4320T", distance = 015, angle = 350, heading = 000 },
            { type = "Ural-4320T", distance = 015, angle = 015, heading = 000 },
            { type = "Mi-8MT",     distance = 030, angle = 085, heading = 000 },
        },
    },
}
Templates.farps.logistics.v2.blue = {
    {
        statics = {
            { type = "Hangar A", distance = 000, angle = 000, heading = 000 },
            { type = "Hangar A", distance = 020, angle = 180, heading = 000 },
            { type = "M 818",    distance = 015, angle = 015, heading = 000 },
            { type = "M 818",    distance = 015, angle = 350, heading = 000 },
            { type = "UH-1H",    distance = 030, angle = 085, heading = 000 },
        },
    },
}

-- EWR STATION FARPS
Templates.ewrs = {}
Templates.ewrs.garrison = {}
Templates.ewrs.garrison.v2 = {}
Templates.ewrs.garrison.v2.red = {
    {
        taskName = "EWR",
        groups = {
            { type = "1L13 EWR", distance = 000, angle = 000, heading = 000 },
        }
    },
    {
        units = {
            { type = "SA-18 Igla manpad", distance = 000, angle = 000, heading = 000 },
            { type = "SA-18 Igla comm",   distance = 008, angle = 090, heading = 000 },
        },
    },
    {
        units = {
            { type = "SA-18 Igla manpad", distance = 000, angle = 000, heading = 000 },
            { type = "SA-18 Igla comm",   distance = 008, angle = 090, heading = 000 },
        },
    },
    {
        units = {
            { type = "SA-18 Igla manpad", distance = 000, angle = 000, heading = 000 },
            { type = "SA-18 Igla comm",   distance = 008, angle = 090, heading = 000 },
        },
    },
}
Templates.ewrs.garrison.v2.blue = {
    { taskName = "EWR", groups = { { type = "FPS-117", distance = 000, angle = 000, heading = 000 }, } },
}
Templates.ewrs.buildings = {}
Templates.ewrs.buildings.v2 = {}
Templates.ewrs.buildings.v2.red = {
    -- outpost
    {
        statics = {
            { type = "FARP Tent",      distance = 000, angle = 000, heading = 000 },
            { type = "FARP Tent",      distance = 014, angle = 181, heading = 090 },
            { type = "outpost",        distance = 036, angle = 327, heading = 000 },
            { type = "S_75_ZIL",       distance = 025, angle = 044, heading = 181 },
            { type = "generator_5i57", distance = 033, angle = 031, heading = 000 },
            { type = "ZIL-131 KUNG",   distance = 046, angle = 356, heading = 270 },
        }
    },
}
Templates.ewrs.buildings.v2.blue = {
    -- outpost
    {
        statics = {
            { type = "FARP Tent",         distance = 000, angle = 000, heading = 000 },
            { type = "FARP Tent",         distance = 014, angle = 181, heading = 090 },
            { type = "outpost",           distance = 036, angle = 327, heading = 000 },
            { type = "HEMTT TFFT",        distance = 025, angle = 044, heading = 181 },
            { type = "M 818",             distance = 033, angle = 031, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 046, angle = 356, heading = 270 },
        }
    },
}
Templates.ewrs.vehicles = {}
Templates.ewrs.vehicles.v2 = {}
Templates.ewrs.vehicles.v2.red = {
    {
        statics = {
            { type = "Ural-375", distance = 000, angle = 000, heading = 000 },
        },
    },
}
Templates.ewrs.vehicles.v2.blue = {
    {
        statics = {
            { type = "M 818", distance = 000, angle = 000, heading = 000 },
        },
    },
}
Templates.ewrs.repairs = {}
Templates.ewrs.repairs.v2 = {}
Templates.ewrs.repairs.v2.red = {
    {
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 0 },
            { type = "KrAZ6322", distance = 25, angle = 95, heading = 90 },
        },
    },
}
Templates.ewrs.repairs.v2.blue = {
    {
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 0 },
            { type = "M 818",    distance = 25, angle = 95, heading = 90 },
        },
    },
}
Templates.ewrs.service = {}
Templates.ewrs.service.v2 = {}
Templates.ewrs.service.v2.red = {
    {
        groups = {
            { type = "outpost",  distance = 000, angle = 000, heading = 000 },
            { type = "ATZ-10",   distance = 010, angle = 165, heading = 271 },
            { type = "Ural-375", distance = 015, angle = 170, heading = 271 },
        }
    }
}
Templates.ewrs.service.v2.blue = {
    {
        groups = {
            { type = "outpost",           distance = 000, angle = 000, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 165, heading = 271 },
            { type = "M 818",             distance = 015, angle = 170, heading = 271 },
        }
    }
}
Templates.ewrs.logistics = {}
Templates.ewrs.logistics.v2 = {}
Templates.ewrs.logistics.v2.red = {
    {
        statics = {
            { type = "Hangar A",   distance = 000, angle = 000, heading = 000 },
            { type = "Ural-4320T", distance = 015, angle = 350, heading = 000 },
        },
    },
}
Templates.ewrs.logistics.v2.blue = {
    {
        statics = {
            { type = "Hangar A", distance = 000, angle = 000, heading = 000 },
            { type = "M 818",    distance = 015, angle = 015, heading = 000 },
        },
    },
}