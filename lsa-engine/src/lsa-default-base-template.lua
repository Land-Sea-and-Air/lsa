DefaultBaseTemplate = {
    name = "Default",
    statics = {},
    groups = {}
}

DefaultBaseTemplate.statics.red = {
    -- ammunition depot
    {
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
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
    -- {
    --     type = "Buildings",
    --     statics = {
    --         { type = "Tech hangar A", distance = 000, angle = 000, heading = 000 },
    --         { type = "Mi-26",         distance = 032, angle = 360, heading = 090 },
    --         { type = "KrAZ6322",      distance = 027, angle = 155, heading = 090 },
    --         { type = "KrAZ6322",      distance = 034, angle = 159, heading = 090 },
    --     },
    -- },
    -- vehicles
    {
        type = "Vehicles",
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
        type = "Vehicles",
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
        type = "Vehicles",
        statics = {
            { type = "Ural-4320T",       distance = 000, angle = 000, heading = 000 },
            { type = "Ural-4320 APA-5D", distance = 005, angle = 092, heading = 001 },
            { type = "UAZ-469",          distance = 007, angle = 303, heading = 270 },
            { type = "UAZ-469",          distance = 006, angle = 276, heading = 270 },
        },
    },
    -- repairs
    {
        type = "Repairs",
        statics =
        {
            { type = "Hangar A",         distance = 000, angle = 000, heading = 000, role = "repairs" },
            { type = "Hangar A",         distance = 020, angle = 000, heading = 000, role = "repairs" },
            { type = "Hangar A",         distance = 020, angle = 180, heading = 000, role = "repairs" },
            { type = "KrAZ6322",         distance = 022, angle = 096, heading = 090 },
            { type = "KrAZ6322",         distance = 032, angle = 048, heading = 090 },
            { type = "KrAZ6322",         distance = 029, angle = 054, heading = 090 },
            { type = "KrAZ6322",         distance = 023, angle = 085, heading = 090 },
            { type = "Ural-4320 APA-5D", distance = 028, angle = 126, heading = 090 },
            { type = "Ural-4320 APA-5D", distance = 031, angle = 135, heading = 090 },
            { type = "Tower Crane",      distance = 034, angle = 163, heading = 000 },
        },
    },
    -- logistics
    {
        type = "Logistics",
        statics = {
            { type = "Hangar A",   distance = 000, angle = 000, heading = 000, role = "logistics" },
            { type = "Hangar A",   distance = 020, angle = 180, heading = 000, role = "logistics" },
            { type = "Ural-4320T", distance = 015, angle = 350, heading = 000 },
            { type = "Ural-4320T", distance = 015, angle = 015, heading = 000 },
            { type = "Mi-8MT",     distance = 030, angle = 085, heading = 000 },
        },
    },
}
DefaultBaseTemplate.statics.blue = {
    -- ammunition depot
    {
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
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
    -- {
    --     type = "Buildings",
    --     statics = {
    --         { type = "Tech hangar A",     distance = 000, angle = 000, heading = 000 },
    --         { type = "CH-47D",            distance = 032, angle = 360, heading = 090 },
    --         { type = "M 818",             distance = 027, angle = 155, heading = 090 },
    --         { type = "M978 HEMTT Tanker", distance = 034, angle = 159, heading = 090 },
    --     },
    -- },
    -- vehicles
    {
        type = "Vehicles",
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
        type = "Vehicles",
        statics = {
            { type = "Patriot cp", distance = 000, angle = 000, heading = 000 },
            { type = "Hummer",     distance = 008, angle = 235, heading = 270 },
            { type = "Hummer",     distance = 006, angle = 262, heading = 270 },
        },
    },
    {
        type = "Vehicles",
        statics = {
            { type = "HEMTT TFFT", distance = 000, angle = 000, heading = 000 },
            { type = "HEMTT TFFT", distance = 006, angle = 268, heading = 001 },
            { type = "HEMTT TFFT", distance = 006, angle = 090, heading = 001 },
            { type = "HEMTT TFFT", distance = 014, angle = 205, heading = 001 },
            { type = "HEMTT TFFT", distance = 013, angle = 180, heading = 001 },
            { type = "HEMTT TFFT", distance = 014, angle = 158, heading = 001 },
        },
    },
    -- repairs
    {
        type = "Repairs",
        statics = {
            { type = "Hangar A",          distance = 000, angle = 000, heading = 000, role = "repairs" },
            { type = "Hangar A",          distance = 020, angle = 000, heading = 000, role = "repairs" },
            { type = "Hangar A",          distance = 020, angle = 180, heading = 000, role = "repairs" },
            { type = "M 818",             distance = 032, angle = 048, heading = 090 },
            { type = "M 818",             distance = 029, angle = 054, heading = 090 },
            { type = "M 818",             distance = 023, angle = 085, heading = 090 },
            { type = "M 818",             distance = 022, angle = 096, heading = 090 },
            { type = "M978 HEMTT Tanker", distance = 028, angle = 126, heading = 090 },
            { type = "M978 HEMTT Tanker", distance = 031, angle = 135, heading = 090 },
            { type = "Tower Crane",       distance = 034, angle = 163, heading = 000 },
        },
    },
    -- logistics
    {
        type = "Logistics",
        statics = {
            { type = "Hangar A", distance = 000, angle = 000, heading = 000, role = "logistics" },
            { type = "Hangar A", distance = 020, angle = 180, heading = 000, role = "logistics" },
            { type = "M 818",    distance = 015, angle = 015, heading = 000 },
            { type = "M 818",    distance = 015, angle = 350, heading = 000 },
            { type = "UH-1H",    distance = 030, angle = 085, heading = 000 },
        },
    },
}

DefaultBaseTemplate.groups.red = {
    {
        type = "Units",
        groups = {
            { type = "T-55",            distance = 000, angle = 000, heading = 000 },
            { type = "Strela-10M3",     distance = 000, angle = 000, heading = 000 },
            { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 },
            { type = "BTR-80",          distance = 000, angle = 000, heading = 000 },
            { type = "T-55",            distance = 000, angle = 000, heading = 000 },
            { type = "Strela-10M3",     distance = 000, angle = 000, heading = 000 },
            { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 },
            { type = "BTR-80",          distance = 000, angle = 000, heading = 000 },
            -- { type = "T-55",                     distance = 000, angle = 000, heading = 000 },
            -- { type = "Strela-10M3",              distance = 000, angle = 000, heading = 000 },
            -- { type = "ZSU-23-4 Shilka",          distance = 000, angle = 000, heading = 000 },
            -- { type = "BTR-80",                   distance = 000, angle = 000, heading = 000 },
            -- { type = "T-72B",                    distance = 000, angle = 000, heading = 000 },
            -- { type = "Strela-1 9P31",            distance = 000, angle = 000, heading = 000 },
            -- { type = "Ural-375 ZU-23 Insurgent", distance = 000, angle = 000, heading = 000 },
            -- { type = "MTLB",                     distance = 000, angle = 000, heading = 000 },
            -- { type = "T-72B",                    distance = 000, angle = 000, heading = 000 },
            -- { type = "Strela-1 9P31",            distance = 000, angle = 000, heading = 000 },
            -- { type = "Ural-375 ZU-23 Insurgent", distance = 000, angle = 000, heading = 000 },
            -- { type = "MTLB",                     distance = 000, angle = 000, heading = 000 }
        }
    },
    -- sams
    {
        type = "Sams",
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
        type = "Sams",
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
DefaultBaseTemplate.groups.blue = {
    {
        type = "Units",
        groups = {
            { type = "Leopard1A3",      distance = 000, angle = 000, heading = 000 },
            { type = "Vulcan",          distance = 000, angle = 000, heading = 000 },
            { type = "M48 Chaparral",   distance = 000, angle = 000, heading = 000 },
            { type = "M-60",            distance = 000, angle = 000, heading = 000 },
            { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 },
            { type = "Leopard1A3",      distance = 000, angle = 000, heading = 000 },
            { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 },
            { type = "Gepard",          distance = 000, angle = 000, heading = 000 },
            -- { type = "Gepard",          distance = 000, angle = 000, heading = 000 },
            -- { type = "Gepard",          distance = 000, angle = 000, heading = 000 },
            -- { type = "M-109",           distance = 000, angle = 000, heading = 000 },
            -- { type = "M48 Chaparral",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M48 Chaparral",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M1097 Avenger",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M1097 Avenger",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M1097 Avenger",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M6 Linebacker",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M6 Linebacker",   distance = 000, angle = 000, heading = 000 },
            -- { type = "Vulcan",          distance = 000, angle = 000, heading = 000 },
            -- { type = "Vulcan",          distance = 000, angle = 000, heading = 000 },
        }
    },
    -- sams
    {
        type = "Sams",
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
        }
    },
}