DeployableTemplates = {}

DeployableTemplates.Categories = {
    RADAR = "Radar",
    MANPADS = "Manpads",
    SAM = "Surface To Air Missile",
    ARMOR = "Armor",
    FAC = "Forward Air Controller"
}

DeployableTemplates.red = {
    {
        category = DeployableTemplates.Categories.RADAR,
        items = {
            {
                name = "EWR 1L13",
                taskName = "EWR",
                cost = 1,
                units = {
                    { type = "1L13 EWR", distance = 000, angle = 000, heading = 000 }
                },
            }
        }
    },
    {
        category = DeployableTemplates.Categories.MANPADS,
        items = {
            {
                name = "SA-18 Igla",
                cost = 1,
                units = {
                    { type = "SA-18 Igla manpad", distance = 000, angle = 000, heading = 000 },
                    { type = "SA-18 Igla comm",   distance = 008, angle = 090, heading = 000 },
                },
            },
            {
                name = "SA-18 Igla-S",
                cost = 1,
                units = {
                    { type = "SA-18 Igla-S manpad", distance = 000, angle = 000, heading = 000 },
                    { type = "SA-18 Igla-S comm",   distance = 008, angle = 090, heading = 000 },
                },
            },
        }
    },
    {
        category = DeployableTemplates.Categories.SAM,
        items = {
            {
                name = "SA-6 Gainful",
                taskName = "SAM",
                space = 200, -- requirement of unobstructed space for the deployment
                cost = 5,
                units = {
                    { type = "Kub 1S91 str", distance = 000, angle = 000, heading = 000 },
                    { type = "Kub 2P25 ln",  distance = 080, angle = 270, heading = 090 },
                    { type = "Kub 2P25 ln",  distance = 080, angle = 360, heading = 180 },
                    { type = "Kub 2P25 ln",  distance = 080, angle = 090, heading = 270 },
                    { type = "Kub 2P25 ln",  distance = 080, angle = 180, heading = 360 },
                },
            },
        }
    },
    {
        category = DeployableTemplates.Categories.ARMOR,
        items = {
            {
                name = "IFV BMP-1",
                cost = 2,
                units = {
                    { type = "BMP-1", distance = 000, angle = 000, heading = 000 }
                }
            },
            {
                name = "MBT T-55",
                cost = 5,
                units = {
                    { type = "T-55", distance = 000, angle = 000, heading = 000 }
                }
            },
        }
    },
    {
        category = DeployableTemplates.Categories.FAC,
        items = {
            {
                name = "Tigr",
                taskName = "FAC",
                cost = 2,
                units = {
                    { type = "Tigr_233036", distance = 000, angle = 000, heading = 000 }
                }
            },
        }
    },
}

DeployableTemplates.blue = {
    {
        category = DeployableTemplates.Categories.RADAR,
        items = {
            {
                name = "EWR FPS-117",
                taskName = "EWR",
                cost = 1,
                units = {
                    { type = "FPS-117", distance = 000, angle = 000, heading = 000 }
                },
            }
        }
    },
    {
        category = DeployableTemplates.Categories.MANPADS,
        items = {
            {
                name = "Stinger",
                cost = 1,
                units = {
                    { type = "Soldier stinger", distance = 000, angle = 000, heading = 000 },
                    { type = "Stinger comm",    distance = 008, angle = 090, heading = 000 },
                },
            },
        }
    },
    {
        category = DeployableTemplates.Categories.SAM,
        items = {
            {
                name = "MIM-23 Hawk",
                taskName = "SAM",
                space = 200, -- requirement of unobstructed space for the deployment
                cost = 5,
                units = {
                    { type = "Hawk pcp",  distance = 000, angle = 000, heading = 000 },
                    { type = "Hawk sr",   distance = 045, angle = 000, heading = 000 },
                    { type = "Hawk cwar", distance = 045, angle = 180, heading = 000 },
                    { type = "Hawk tr",   distance = 060, angle = 090, heading = 220 },
                    { type = "Hawk tr",   distance = 060, angle = 270, heading = 040 },
                    { type = "Hawk ln",   distance = 200, angle = 045, heading = 045 },
                    { type = "Hawk ln",   distance = 200, angle = 090, heading = 090 },
                    { type = "Hawk ln",   distance = 200, angle = 135, heading = 135 },
                    { type = "Hawk ln",   distance = 200, angle = 180, heading = 180 },
                    { type = "Hawk ln",   distance = 200, angle = 000, heading = 000 },
                    { type = "Hawk ln",   distance = 200, angle = 225, heading = 225 },
                    { type = "Hawk ln",   distance = 200, angle = 270, heading = 270 },
                    { type = "Hawk ln",   distance = 200, angle = 315, heading = 315 },
                },
            },
        }
    },
    {
        category = DeployableTemplates.Categories.ARMOR,
        items = {
            {
                name = "IFV LAV-25",
                cost = 2,
                units = {
                    { type = "LAV-25", distance = 000, angle = 000, heading = 000 }
                }
            },
            {
                name = "MBT Leopard 1A3",
                cost = 5,
                units = {
                    { type = "Leopard1A3", distance = 000, angle = 000, heading = 000 }
                }
            },
        }
    },
    {
        category = DeployableTemplates.Categories.FAC,
        items = {
            {
                name = "Hummer",
                taskName = "FAC",
                cost = 2,
                units = {
                    { type = "Hummer", distance = 000, angle = 000, heading = 000, freq = 244000000, modulation = "AM" }
                }
            },
        }
    },
}