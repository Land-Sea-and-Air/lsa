EwrsBaseTemplate = {
    name = "EWRS",
    statics = {},
    groups = {}
}

EwrsBaseTemplate.statics.red = {
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
    {
        type = "Vehicles",
        statics = {
            { type = "Ural-375", distance = 000, angle = 000, heading = 000 },
        },
    },
    {
        type = "Repairs",
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 0, role = "repairs" },
            { type = "KrAZ6322", distance = 25, angle = 95, heading = 90 },
        },
    },
    {
        type = "Logistics",
        statics = {
            { type = "Hangar A",   distance = 000, angle = 000, heading = 000, role = "logistics" },
            { type = "Ural-4320T", distance = 015, angle = 350, heading = 000 },
        },
    },
}
EwrsBaseTemplate.statics.blue = {
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
    {
        type = "Vehicles",
        statics = {
            { type = "M 818", distance = 000, angle = 000, heading = 000 },
        },
    },
    {
        type = "Repairs",
        statics = {
            { type = "Hangar B", distance = 0,  angle = 0,  heading = 0, role = "repairs" },
            { type = "M 818",    distance = 25, angle = 95, heading = 90 },
        },
    },
    {
        type = "Logistics",
        statics = {
            { type = "Hangar A", distance = 000, angle = 000, heading = 000, role = "logistics" },
            { type = "M 818",    distance = 015, angle = 015, heading = 000 },
        },
    },
}
EwrsBaseTemplate.groups.red = {
    {
        type = "Units",
        taskName = "EWR",
        groups = {
            { type = "1L13 EWR", distance = 000, angle = 000, heading = 000 },
        }
    },
    {
        type = "Units",
        units = {
            { type = "SA-18 Igla manpad", distance = 000, angle = 000, heading = 000 },
            { type = "SA-18 Igla comm",   distance = 008, angle = 090, heading = 000 },
        },
    },
    {
        type = "Service",
        units = {
            { type = "outpost",  distance = 000, angle = 000, heading = 000 },
            { type = "ATZ-10",   distance = 010, angle = 165, heading = 271 },
            { type = "Ural-375", distance = 015, angle = 170, heading = 271 },
        }
    }
}
EwrsBaseTemplate.groups.blue = {
    {
        type = "Units",
        taskName = "EWR",
        groups = {
            { type = "FPS-117", distance = 000, angle = 000, heading = 000 },
        }
    },
    {
        type = "Units",
        units = {
            { type = "Soldier stinger", distance = 000, angle = 000, heading = 000 },
            { type = "Stinger comm",    distance = 008, angle = 090, heading = 000 },
        },
    },
    {
        type = "Service",
        units = {
            { type = "outpost",           distance = 000, angle = 000, heading = 000 },
            { type = "M978 HEMTT Tanker", distance = 010, angle = 165, heading = 271 },
            { type = "M 818",             distance = 015, angle = 170, heading = 271 },
        }
    }
}