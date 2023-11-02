FarpBaseTemplate = {
    name = "Farp",
    statics = {},
    groups = {}
}

FarpBaseTemplate.statics.red = {
    -- command post
    {
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
        statics = {
            { type = "FARP Ammo Dump Coating", distance = 000, angle = 000, heading = 000 },
            { type = "FARP Fuel Depot",        distance = 018, angle = 275, heading = 270 },
            { type = "Sandbox",                distance = 022, angle = 200, heading = 181 },
            { type = "KAMAZ Truck",            distance = 018, angle = 137, heading = 320 },
        }
    },
    -- vehicles
    {
        type = "Vehicles",
        statics = {
            { type = "UAZ-469",     distance = 000, angle = 000, heading = 000 },
            { type = "ATMZ-5",      distance = 010, angle = 198, heading = 000 },
            { type = "ATMZ-5",      distance = 010, angle = 163, heading = 000 },
            { type = "KAMAZ Truck", distance = 020, angle = 189, heading = 360 },
            { type = "KAMAZ Truck", distance = 020, angle = 173, heading = 000 },
        },
    },
    {
        type = "Vehicles",
        statics = {
            { type = "UAZ-469", distance = 000, angle = 000, heading = 000 },
            { type = "UAZ-469", distance = 005, angle = 268, heading = 335 },
        },
    },
    {
        type = "Vehicles",
        statics = {
            { type = "ATMZ-5", distance = 000, angle = 000, heading = 000 },
            { type = "ATMZ-5", distance = 006, angle = 090, heading = 001 },
        },
    },
    --repairs
    {
        type = "Repairs",
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 00, role = "repairs" },
            { type = "KrAZ6322", distance = 25, angle = 85, heading = 90 },
            { type = "KrAZ6322", distance = 25, angle = 95, heading = 90 },
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
FarpBaseTemplate.statics.blue = {
    -- command post
    {
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
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
        type = "Buildings",
        statics = {
            { type = "FARP Ammo Dump Coating", distance = 000, angle = 000, heading = 000 },
            { type = "FARP Fuel Depot",        distance = 018, angle = 275, heading = 270 },
            { type = "Sandbox",                distance = 022, angle = 200, heading = 181 },
            { type = "M 818",                  distance = 018, angle = 137, heading = 320 },
        }
    },
    -- vehicles
    {
        type = "Vehicles",
        statics = {
            { type = "Hummer",            distance = 000, angle = 000, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 198, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 163, heading = 000 },
            { type = "M 818",             distance = 020, angle = 189, heading = 360 },
            { type = "M 818",             distance = 020, angle = 173, heading = 000 },
        },
    },
    {
        type = "Vehicles",
        statics = {
            { type = "Hummer", distance = 000, angle = 000, heading = 000 },
            { type = "Hummer", distance = 005, angle = 268, heading = 335 },
        },
    },
    {
        type = "Vehicles",
        statics = {
            { type = "HEMTT TFFT", distance = 000, angle = 000, heading = 000 },
            { type = "HEMTT TFFT", distance = 006, angle = 090, heading = 001 },
        },
    },
    -- repairs
    {
        type = "Repairs",
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 0, role = "repairs" },
            { type = "M 818",    distance = 25, angle = 85, heading = 90 },
            { type = "M 818",    distance = 25, angle = 95, heading = 90 },
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
FarpBaseTemplate.groups.red = {
    {
        type = "Units",
        groups = {
            { type = "T-55",            distance = 000, angle = 000, heading = 000 },
            { type = "Strela-10M3",     distance = 000, angle = 000, heading = 000 },
            { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 },
            { type = "BTR-80",          distance = 000, angle = 000, heading = 000 },
            { type = "T-55",            distance = 000, angle = 000, heading = 000 },
            -- { type = "Strela-10M3",     distance = 000, angle = 000, heading = 000 },
            -- { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 },
            -- { type = "BTR-80",          distance = 000, angle = 000, heading = 000 },
            -- { type = "T-55",            distance = 000, angle = 000, heading = 000 },
            -- { type = "Strela-10M3",     distance = 000, angle = 000, heading = 000 },
            -- { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 },
            -- { type = "BTR-80",          distance = 000, angle = 000, heading = 000 },
            -- { type = "T-55",            distance = 000, angle = 000, heading = 000 },
            -- { type = "Strela-10M3",     distance = 000, angle = 000, heading = 000 },
            -- { type = "ZSU-23-4 Shilka", distance = 000, angle = 000, heading = 000 },
            -- { type = "BTR-80",          distance = 000, angle = 000, heading = 000 },
        }
    },
    -- service
    {
        type = "Service",
        units = {
            { type = "outpost",          distance = 000, angle = 000, heading = 000 },
            { type = "Ural-4320 APA-5D", distance = 008, angle = 020, heading = 271 },
            { type = "ATZ-10",           distance = 010, angle = 165, heading = 271 },
            { type = "Ural-375",         distance = 015, angle = 170, heading = 271 },
        }
    }
}
FarpBaseTemplate.groups.blue = {
    {
        type = "Units",
        groups = {
            { type = "Leopard1A3",      distance = 000, angle = 000, heading = 000 },
            { type = "M48 Chaparral",   distance = 000, angle = 000, heading = 000 },
            { type = "M-60",            distance = 000, angle = 000, heading = 000 },
            { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 },
            { type = "M1045 HMMWV TOW", distance = 000, angle = 000, heading = 000 },
            -- { type = "Gepard",          distance = 000, angle = 000, heading = 000 },
            -- { type = "Gepard",          distance = 000, angle = 000, heading = 000 },
            -- { type = "M-109",           distance = 000, angle = 000, heading = 000 },
            -- { type = "M48 Chaparral",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M48 Chaparral",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M1097 Avenger",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M1097 Avenger",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M1097 Avenger",   distance = 000, angle = 000, heading = 000 },
            -- { type = "M6 Linebacker",   distance = 000, angle = 000, heading = 000 },
            -- { type = "Vulcan",          distance = 000, angle = 000, heading = 000 },
            -- { type = "Vulcan",          distance = 000, angle = 000, heading = 000 },
        }
    },
    {
        type = "Service",
        units = {
            { type = "outpost",           distance = 000, angle = 000, heading = 000 },
            { type = "HEMTT TFFT",        distance = 008, angle = 020, heading = 271 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 165, heading = 271 },
            { type = "M 818",             distance = 015, angle = 170, heading = 271 },
        }
    }
}