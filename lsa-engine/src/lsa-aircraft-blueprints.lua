AircraftBlueprints =
{
    ["AH-64D_BLK_II"] =
    {
        ["frequency"] = 225,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 525,
                ["alt_type"] = "BARO",
                ["livery_id"] = "default",
                ["skill"] = "Client",
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["CpgNVG"] = true,
                    ["FlareSalvoInterval"] = 0,
                    ["OverrideIFF"] = 0,
                    ["PltNVG"] = true,
                    ["FlareProgramDelay"] = 0,
                    ["TrackAirTargets"] = true,
                    ["FCR_RFI_removed"] = true,
                    ["FlareBurstInterval"] = 0,
                    ["FlareBurstCount"] = 0,
                    ["NetCrewControlPriority"] = 0,
                    ["AIDisabled"] = false,
                    ["FlareSalvoCount"] = 0,
                    ["HumanOrchestra"] = false,
                },
                ["type"] = "AH-64D_BLK_II",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [7] = 141,
                            [1] = 127.5,
                            [2] = 135,
                            [4] = 127,
                            [8] = 128,
                            [9] = 126,
                            [5] = 125,
                            [10] = 137,
                            [3] = 136,
                            [6] = 121,
                        },
                        ["modulations"] =
                        {
                            [7] = 0,
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [9] = 0,
                            [5] = 0,
                            [10] = 0,
                            [3] = 0,
                            [6] = 0,
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [7] = 325,
                            [1] = 225,
                            [2] = 240,
                            [4] = 270,
                            [8] = 350,
                            [9] = 375,
                            [5] = 285,
                            [10] = 390,
                            [3] = 255,
                            [6] = 300,
                        },
                        ["modulations"] =
                        {
                            [7] = 0,
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [9] = 0,
                            [5] = 0,
                            [10] = 0,
                            [3] = 0,
                            [6] = 0,
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [4] =
                    {
                        ["channels"] =
                        {
                            [7] = 30.035,
                            [1] = 30,
                            [2] = 30.01,
                            [4] = 30.02,
                            [8] = 30.04,
                            [9] = 30.045,
                            [5] = 30.025,
                            [10] = 30.05,
                            [3] = 30.015,
                            [6] = 30.03,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [3] =
                    {
                        ["channels"] =
                        {
                            [7] = 30.035,
                            [1] = 30,
                            [2] = 30.01,
                            [4] = 30.02,
                            [8] = 30.04,
                            [9] = 30.045,
                            [5] = 30.025,
                            [10] = 30.05,
                            [3] = 30.015,
                            [6] = 30.03,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 912,
                    ["flare"] = 60,
                    ["ammo_type"] = 1,
                    ["chaff"] = 30,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{M299_1xAGM_114K_3xAGM_114L_PRT}",
                            [2] = "{M299_2xAGM_114L}",
                            [3] = "{M299_3xAGM_114K_1xAGM_114L_PRT}",
                            [1] = "{M299_4xAGM_114L}",
                            [4] = "{M299_2xAGM_114K_2xAGM_114L}",
                            [5] = "{M299_1xAGM_114L_OUTBOARD_PORT}",
                        },
                        [2] =
                        {
                            [6] = "{M299_1xAGM_114K_3xAGM_114L_PRT}",
                            [2] = "{M299_2xAGM_114L}",
                            [3] = "{M299_3xAGM_114K_1xAGM_114L_PRT}",
                            [1] = "{M299_4xAGM_114L}",
                            [4] = "{M299_2xAGM_114K_2xAGM_114L}",
                            [5] = "{M299_1xAGM_114L_OUTBOARD_PORT}",
                        },
                        [4] =
                        {
                            [6] = "{M299_1xAGM_114L_OUTBOARD_STARBOARD}",
                            [2] = "{M299_2xAGM_114L}",
                            [3] = "{M299_1xAGM_114K_3xAGM_114L_STRBRD}",
                            [1] = "{M299_4xAGM_114L}",
                            [4] = "{M299_2xAGM_114K_2xAGM_114L}",
                            [5] = "{M299_3xAGM_114K_1xAGM_114L_STRBRD}",
                            [7] = "{M299_3xAGM_114L_OUTBOARD_STARBOARD}",
                        },
                        [3] =
                        {
                            [6] = "{M299_1xAGM_114L_OUTBOARD_STARBOARD}",
                            [2] = "{M299_2xAGM_114L}",
                            [3] = "{M299_1xAGM_114K_3xAGM_114L_STRBRD}",
                            [1] = "{M299_4xAGM_114L}",
                            [4] = "{M299_2xAGM_114K_2xAGM_114L}",
                            [5] = "{M299_3xAGM_114K_1xAGM_114L_STRBRD}",
                            [7] = "{M299_3xAGM_114L_OUTBOARD_STARBOARD}",
                        },
                    },
                },
                ["onboard_num"] = "025",
                ["heading"] = -1.2873954367206,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["FA-18C_hornet"] =
    {
        ["frequency"] = 305,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "vfa-113",
                ["skill"] = "Client",
                ["speed"] = 180.55555555556,
                ["AddPropAircraft"] =
                {
                    ["OuterBoard"] = 0,
                    ["InnerBoard"] = 0,
                    ["HelmetMountedDevice"] = 2,
                },
                ["type"] = "FA-18C_hornet",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 305,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [15] = 263,
                            [19] = 253,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 305,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [15] = 263,
                            [19] = 253,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 3920,
                    ["flare"] = 60,
                    ["ammo_type"] = 1,
                    ["chaff"] = 60,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [7] =
                        {
                            [1] = "LAU-115_2*LAU-127_AIM-120C",
                            [2] = "{LAU-115 - AIM-120C_R}",
                            [4] = "LAU-115_2*LAU-127_AIM-120B",
                            [3] = "{LAU-115 - AIM-120B_R}",
                        },
                        [1] =
                        {
                            [1] = "CATM-9M",
                            [2] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                        [2] =
                        {
                            [7] = "LAU-115_2*LAU-127_AIM-120B",
                            [1] = "LAU-115_2*LAU-127_AIM-120C",
                            [2] = "LAU-115_LAU-127_AIM-9X",
                            [4] = "LAU-115_LAU-127_AIM-9L",
                            [8] = "{LAU-115 - AIM-120C}",
                            [9] = "LAU-115_LAU-127_AIM-9M",
                            [5] = "LAU-115_2*LAU-127_CATM-9M",
                            [10] = "{LAU-115 - AIM-120B}",
                            [3] = "LAU-115_2*LAU-127_AIM-9X",
                            [6] = "LAU-115_LAU-127_CATM-9M",
                        },
                        [4] =
                        {
                            [1] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [2] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                        },
                        [8] =
                        {
                            [7] = "{LAU-115 - AIM-120B_R}",
                            [1] = "LAU-115_LAU-127_AIM-9M_R",
                            [2] = "LAU-115_2*LAU-127_AIM-120C",
                            [4] = "LAU-115_2*LAU-127_AIM-9X",
                            [8] = "LAU-115_LAU-127_AIM-9L_R",
                            [9] = "LAU-115_2*LAU-127_AIM-120B",
                            [5] = "LAU-115_2*LAU-127_CATM-9M",
                            [10] = "LAU-115_LAU-127_CATM-9M_R",
                            [3] = "{LAU-115 - AIM-120C_R}",
                            [6] = "LAU-115_LAU-127_AIM-9X_R",
                        },
                        [9] =
                        {
                            [1] = "CATM-9M",
                            [2] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                        [10] =
                        {
                            [6] = "{INV-SMOKE-ORANGE}",
                            [2] = "{INV-SMOKE-WHITE}",
                            [3] = "{INV-SMOKE-RED}",
                            [1] = "{INV-SMOKE-GREEN}",
                            [4] = "{INV-SMOKE-YELLOW}",
                            [5] = "{INV-SMOKE-BLUE}",
                        },
                        [3] =
                        {
                            [1] = "LAU-115_2*LAU-127_AIM-120C",
                            [2] = "LAU-115_2*LAU-127_AIM-120B",
                            [4] = "{LAU-115 - AIM-120B}",
                            [3] = "{LAU-115 - AIM-120C}",
                        },
                        [6] =
                        {
                            [1] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [2] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                        },
                    },
                },
                ["onboard_num"] = "011",
                ["heading"] = 3.1939525311496,
                ["dataCartridge"] =
                {
                    ["GroupsPoints"] =
                    {
                        ["Initial Point"] =
                        {
                        },
                        ["Sequence 2 Red"] =
                        {
                        },
                        ["Sequence 3 Yellow"] =
                        {
                        },
                        ["Sequence 1 Blue"] =
                        {
                        },
                        ["Start Location"] =
                        {
                        },
                        ["A/A Waypoint"] =
                        {
                        },
                        ["PP"] =
                        {
                        },
                        ["PB"] =
                        {
                        },
                    },
                    ["Points"] =
                    {
                    },
                },
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["SA342Minigun"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 554.82553703204,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "nato_drab_uk",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["RemoveTablet"] = false,
                    ["NS430allow"] = true,
                },
                ["type"] = "SA342Minigun",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [6] = 41,
                            [2] = 31,
                            [8] = 50,
                            [3] = 32,
                            [1] = 30,
                            [4] = 33,
                            [5] = 40,
                            [7] = 42,
                        },
                        ["modulations"] =
                        {
                            [6] = 0,
                            [2] = 0,
                            [8] = 0,
                            [3] = 0,
                            [1] = 0,
                            [4] = 0,
                            [5] = 0,
                            [7] = 0,
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 416.33,
                    ["flare"] = 32,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [1] = "{TELSON8_SNEBT254_RED}",
                            [2] = "{TELSON8_SNEBT254_YELLOW}",
                            [3] = "{TELSON8_SNEBT254_GREEN}",
                        },
                        [2] =
                        {
                            [1] = "{TELSON8_SNEBT254_RED}",
                            [2] = "{TELSON8_SNEBT254_YELLOW}",
                            [3] = "{TELSON8_SNEBT254_GREEN}",
                        },
                        [7] =
                        {
                            [6] = "{INV-SMOKE-RED}",
                            [2] = "{INV-SMOKE-GREEN}",
                            [3] = "{INV-SMOKE-WHITE}",
                            [1] = "{INV-SMOKE-BLUE}",
                            [4] = "{INV-SMOKE-YELLOW}",
                            [5] = "{INV-SMOKE-ORANGE}",
                        },
                        [6] =
                        {
                            [6] = "{INV-SMOKE-RED}",
                            [2] = "{INV-SMOKE-GREEN}",
                            [3] = "{INV-SMOKE-WHITE}",
                            [1] = "{INV-SMOKE-BLUE}",
                            [4] = "{INV-SMOKE-YELLOW}",
                            [5] = "{INV-SMOKE-ORANGE}",
                        },
                    },
                },
                ["onboard_num"] = "029",
                ["heading"] = -1.2873954367206,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["SA342L"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 554.82553703204,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "nato_drab_us",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["SA342RemoveDoors"] = false,
                    ["RemoveTablet"] = false,
                    ["NS430allow"] = true,
                },
                ["type"] = "SA342L",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [6] = 41,
                            [2] = 31,
                            [8] = 50,
                            [3] = 32,
                            [1] = 30,
                            [4] = 33,
                            [5] = 40,
                            [7] = 42,
                        },
                        ["modulations"] =
                        {
                            [6] = 0,
                            [2] = 0,
                            [8] = 0,
                            [3] = 0,
                            [1] = 0,
                            [4] = 0,
                            [5] = 0,
                            [7] = 0,
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 333,
                    ["flare"] = 32,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [1] = "{TELSON8_SNEBT254_RED}",
                            [2] = "{TELSON8_SNEBT254_YELLOW}",
                            [3] = "{TELSON8_SNEBT254_GREEN}",
                        },
                        [2] =
                        {
                            [1] = "{TELSON8_SNEBT254_RED}",
                            [2] = "{TELSON8_SNEBT254_YELLOW}",
                            [3] = "{TELSON8_SNEBT254_GREEN}",
                        },
                        [7] =
                        {
                            [6] = "{INV-SMOKE-RED}",
                            [2] = "{INV-SMOKE-GREEN}",
                            [3] = "{INV-SMOKE-WHITE}",
                            [1] = "{INV-SMOKE-BLUE}",
                            [4] = "{INV-SMOKE-YELLOW}",
                            [5] = "{INV-SMOKE-ORANGE}",
                        },
                        [6] =
                        {
                            [6] = "{INV-SMOKE-RED}",
                            [2] = "{INV-SMOKE-GREEN}",
                            [3] = "{INV-SMOKE-WHITE}",
                            [1] = "{INV-SMOKE-BLUE}",
                            [4] = "{INV-SMOKE-YELLOW}",
                            [5] = "{INV-SMOKE-ORANGE}",
                        },
                    },
                },
                ["onboard_num"] = "027",
                ["heading"] = -1.2873954367206,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["A-10C"] =
    {
        ["frequency"] = 251,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "104th fs maryland ang, baltimore (md)",
                ["skill"] = "Client",
                ["speed"] = 125,
                ["AddPropAircraft"] =
                {
                },
                ["type"] = "A-10C",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [1] = 127.5,
                            [2] = 135,
                            [4] = 127,
                            [8] = 128,
                            [16] = 132,
                            [17] = 138,
                            [9] = 126,
                            [18] = 122,
                            [5] = 125,
                            [10] = 133,
                            [20] = 137,
                            [11] = 130,
                            [3] = 136,
                            [6] = 121,
                            [12] = 129,
                            [13] = 123,
                            [7] = 141,
                            [14] = 131,
                            [19] = 124,
                            [15] = 134,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [1] = 251,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [19] = 253,
                            [15] = 263,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [3] =
                    {
                        ["channels"] =
                        {
                            [1] = 31.5,
                            [2] = 45.7,
                            [4] = 38,
                            [8] = 50,
                            [16] = 51.5,
                            [17] = 50,
                            [9] = 55.5,
                            [18] = 79,
                            [5] = 30,
                            [10] = 39.9,
                            [20] = 34.9,
                            [11] = 41.5,
                            [3] = 57,
                            [6] = 32,
                            [12] = 75.7,
                            [13] = 33,
                            [7] = 40,
                            [14] = 38,
                            [19] = 51.5,
                            [15] = 42,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 4023,
                    ["flare"] = 120,
                    ["ammo_type"] = 1,
                    ["chaff"] = 240,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                        [11] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                    },
                },
                ["onboard_num"] = "017",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["F-15C"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "F-15C",
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "12th Fighter SQN (AK)",
                ["skill"] = "Client",
                ["onboard_num"] = "010",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 4882,
                    ["flare"] = 60,
                    ["chaff"] = 120,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [11] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [8] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [7] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                        [7] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [8] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [3] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [8] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [7] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                        [4] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [5] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [9] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                    },
                },
                ["speed"] = 219.44444444444,
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["F-15ESE"] =
    {
        ["frequency"] = 243,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "usaf 17th ws af90 high vis clean",
                ["skill"] = "Client",
                ["speed"] = 252.77777777778,
                ["AddPropAircraft"] =
                {
                    ["InitAirborneTime"] = 0,
                    ["InitAlertStatus"] = false,
                    ["Sta5LaserCode"] = 688,
                    ["Sta2LaserCode"] = 688,
                    ["needsGCAlign"] = false,
                    ["LCFTLaserCode"] = 688,
                    ["RCFTLaserCode"] = 688,
                    ["NetCrewControlPriority"] = 0,
                    ["Sta8LaserCode"] = 688,
                    ["HumanOrchestra"] = false,
                    ["SoloFlight"] = false,
                    ["MountNVG"] = true,
                },
                ["type"] = "F-15ESE",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 243,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [15] = 263,
                            [19] = 253,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [27] = 0,
                            [2] = 0,
                            [38] = 0,
                            [3] = 0,
                            [4] = 0,
                            [5] = 0,
                            [6] = 0,
                            [7] = 0,
                            [8] = 0,
                            [10] = 0,
                            [12] = 0,
                            [14] = 0,
                            [16] = 0,
                            [20] = 0,
                            [24] = 0,
                            [28] = 0,
                            [32] = 0,
                            [40] = 0,
                            [33] = 0,
                            [17] = 0,
                            [21] = 0,
                            [25] = 0,
                            [29] = 0,
                            [34] = 0,
                            [9] = 0,
                            [11] = 0,
                            [13] = 0,
                            [15] = 0,
                            [18] = 0,
                            [22] = 0,
                            [26] = 0,
                            [30] = 0,
                            [36] = 0,
                            [37] = 0,
                            [31] = 0,
                            [35] = 0,
                            [1] = 0,
                            [19] = 0,
                            [23] = 0,
                            [39] = 0,
                        },
                        ["channels"] =
                        {
                            [27] = 127,
                            [2] = 257.8,
                            [38] = 127,
                            [3] = 122.1,
                            [4] = 123.3,
                            [5] = 344,
                            [6] = 385,
                            [7] = 130,
                            [8] = 385.4,
                            [10] = 140,
                            [12] = 132,
                            [14] = 129,
                            [16] = 121,
                            [20] = 122,
                            [24] = 136,
                            [28] = 127,
                            [32] = 124,
                            [40] = 127,
                            [33] = 135,
                            [17] = 126,
                            [21] = 123,
                            [25] = 141,
                            [29] = 127,
                            [34] = 136,
                            [9] = 139,
                            [11] = 134,
                            [13] = 131,
                            [15] = 138,
                            [18] = 125,
                            [22] = 124,
                            [26] = 127,
                            [30] = 127,
                            [36] = 127,
                            [37] = 127,
                            [31] = 123,
                            [35] = 141,
                            [1] = 133,
                            [19] = 128,
                            [23] = 135,
                            [39] = 127,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 10245.529841878,
                    ["flare"] = 60,
                    ["ammo_type"] = 1,
                    ["chaff"] = 120,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [13] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [15] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [3] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [1] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [10] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [5] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                        [11] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                        },
                    },
                },
                ["onboard_num"] = "016",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "Ground Attack",
        ["uncontrolled"] = false,
    },
    ["AV8BNA"] =
    {
        ["frequency"] = 243,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "vma-211",
                ["skill"] = "Client",
                ["speed"] = 225,
                ["AddPropAircraft"] =
                {
                    ["ClockTime"] = 1,
                    ["EWDispenserBR"] = 2,
                    ["AAR_Zone3"] = 0,
                    ["AAR_Zone2"] = 0,
                    ["EWDispenserBL"] = 2,
                    ["AAR_Zone1"] = 0,
                    ["LaserCode100"] = 6,
                    ["RocketBurst"] = 1,
                    ["LoadWater"] = true,
                    ["MountNVG"] = false,
                    ["EWDispenserTBL"] = 2,
                    ["GBULaserCode1"] = 8,
                    ["GBULaserCode10"] = 8,
                    ["LaserCode1"] = 8,
                    ["EWDispenserTFL"] = 1,
                    ["EWDispenserTFR"] = 1,
                    ["GBULaserCode100"] = 6,
                    ["LaserCode10"] = 8,
                    ["EWDispenserTBR"] = 2,
                },
                ["type"] = "AV8BNA",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [21] = 0,
                            [11] = 0,
                            [22] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [24] = 0,
                            [25] = 0,
                            [13] = 0,
                            [26] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                            [23] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 243,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [21] = 133,
                            [11] = 259,
                            [22] = 257.8,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [24] = 123.3,
                            [25] = 344,
                            [13] = 269,
                            [26] = 385,
                            [7] = 270,
                            [14] = 260,
                            [15] = 263,
                            [19] = 253,
                            [23] = 122.1,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [21] = 0,
                            [11] = 0,
                            [22] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [24] = 0,
                            [25] = 0,
                            [13] = 0,
                            [26] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                            [23] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 133,
                            [2] = 257.8,
                            [4] = 123.3,
                            [8] = 385.4,
                            [16] = 121,
                            [17] = 126,
                            [9] = 139,
                            [18] = 125,
                            [5] = 344,
                            [10] = 140,
                            [20] = 122,
                            [21] = 123,
                            [11] = 134,
                            [22] = 124,
                            [3] = 122.1,
                            [6] = 385,
                            [12] = 132,
                            [24] = 136,
                            [25] = 141,
                            [13] = 131,
                            [26] = 127,
                            [7] = 130,
                            [14] = 129,
                            [15] = 138,
                            [19] = 128,
                            [23] = 135,
                        },
                    },
                    [3] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [15] = 0,
                            [21] = 0,
                            [11] = 0,
                            [22] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [24] = 0,
                            [19] = 0,
                            [25] = 0,
                            [13] = 0,
                            [26] = 0,
                            [23] = 0,
                            [7] = 0,
                            [14] = 0,
                            [28] = 0,
                            [27] = 0,
                            [29] = 0,
                            [30] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 177,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [15] = 263,
                            [21] = 133,
                            [11] = 259,
                            [22] = 257.8,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [24] = 123.3,
                            [19] = 253,
                            [25] = 344,
                            [13] = 269,
                            [26] = 385,
                            [23] = 122.1,
                            [7] = 270,
                            [14] = 260,
                            [28] = 257.8,
                            [27] = 133,
                            [29] = 122.1,
                            [30] = 123.3,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2816,
                    ["flare"] = 120,
                    ["chaff"] = 60,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                        },
                        [2] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                        },
                        [7] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                        },
                        [8] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                        },
                    },
                },
                ["onboard_num"] = "023",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["A-10A"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "A-10A",
                ["onboard_num"] = "020",
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "104th fs maryland ang, baltimore (md)",
                ["skill"] = "Client",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 4023,
                    ["flare"] = 120,
                    ["ammo_type"] = 1,
                    ["chaff"] = 240,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                        [11] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                    },
                },
                ["speed"] = 125,
                ["heading"] = 3.1939525311496,
                ["AddPropAircraft"] =
                {
                },
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["M-2000C"] =
    {
        ["frequency"] = 251,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "ada chasse 2-5",
                ["skill"] = "Client",
                ["speed"] = 250,
                ["AddPropAircraft"] =
                {
                    ["ReadyALCM"] = true,
                    ["ForceINSRules"] = false,
                    ["EnableTAF"] = true,
                    ["InitHotDrift"] = 0,
                    ["DisableVTBExport"] = false,
                    ["LaserCode100"] = 6,
                    ["LaserCode1"] = 8,
                    ["WpBullseye"] = 0,
                    ["LoadNVGCase"] = false,
                    ["RocketBurst"] = 6,
                    ["LaserCode10"] = 8,
                    ["GunBurst"] = 1,
                },
                ["type"] = "M-2000C",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 251,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 252,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [15] = 263,
                            [19] = 253,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 129,
                            [2] = 135,
                            [4] = 127,
                            [8] = 128,
                            [16] = 132,
                            [17] = 138,
                            [9] = 126,
                            [18] = 122,
                            [5] = 125,
                            [10] = 133,
                            [20] = 137,
                            [11] = 130,
                            [3] = 136,
                            [6] = 121,
                            [12] = 139,
                            [13] = 140,
                            [7] = 141,
                            [14] = 131,
                            [15] = 134,
                            [19] = 124,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2532,
                    ["flare"] = 64,
                    ["ammo_type"] = 1,
                    ["chaff"] = 234,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                        [9] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                        [5] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                    },
                },
                ["onboard_num"] = "010",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["A-10C_2"] =
    {
        ["frequency"] = 251,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "104th fs maryland ang, baltimore (md)",
                ["skill"] = "Client",
                ["speed"] = 125,
                ["AddPropAircraft"] =
                {
                },
                ["type"] = "A-10C_2",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [1] = 251,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [21] = 54,
                            [11] = 259,
                            [22] = 32.5,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [24] = 37.5,
                            [25] = 54,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [23] = 42,
                            [19] = 253,
                            [15] = 263,
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [21] = 1,
                            [11] = 0,
                            [22] = 1,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [24] = 1,
                            [25] = 1,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [23] = 1,
                            [19] = 0,
                            [15] = 0,
                        },
                        ["channelsNames"] =
                        {
                            [1] = "Channel  1",
                            [2] = "Channel  2",
                            [4] = "Channel  4",
                            [8] = "Channel  8",
                            [16] = "Channel 16",
                            [17] = "Channel 17",
                            [9] = "Channel  9",
                            [18] = "Channel 18",
                            [5] = "Channel  5",
                            [10] = "Channel 10",
                            [20] = "Channel 20",
                            [21] = "Channel 21",
                            [11] = "Channel 11",
                            [22] = "Channel 22",
                            [3] = "Channel  3",
                            [6] = "Channel  6",
                            [12] = "Channel 12",
                            [24] = "Channel 24",
                            [25] = "Channel 25",
                            [13] = "Channel 13",
                            [7] = "Channel  7",
                            [14] = "Channel 14",
                            [23] = "Channel 23",
                            [19] = "Channel 19",
                            [15] = "Channel 15",
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [1] = 305,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [19] = 253,
                            [15] = 263,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [3] =
                    {
                        ["channels"] =
                        {
                            [1] = 31.5,
                            [2] = 45.7,
                            [4] = 38,
                            [8] = 50,
                            [16] = 51.5,
                            [17] = 50,
                            [9] = 55.5,
                            [18] = 79,
                            [5] = 30,
                            [10] = 39.9,
                            [20] = 34.9,
                            [11] = 41.5,
                            [3] = 57,
                            [6] = 32,
                            [12] = 75.7,
                            [13] = 33,
                            [7] = 40,
                            [14] = 38,
                            [19] = 51.5,
                            [15] = 42,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 4023,
                    ["flare"] = 240,
                    ["ammo_type"] = 1,
                    ["chaff"] = 240,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                        [11] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                        },
                    },
                },
                ["onboard_num"] = "018",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["MiG-29G"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "MiG-29G",
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "luftwaffe gray-1",
                ["skill"] = "Client",
                ["onboard_num"] = "014",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2701,
                    ["flare"] = 30,
                    ["chaff"] = 30,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                        [2] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                        [3] =
                        {
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [9] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [6] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                        },
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                        [4] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [5] =
                        {
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [9] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [6] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                        },
                        [7] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                    },
                },
                ["speed"] = 222.22222222222,
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["F-14B"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "vf-101 grim reapers low vis",
                ["skill"] = "Client",
                ["speed"] = 222.22222222222,
                ["AddPropAircraft"] =
                {
                    ["LGB100"] = 6,
                    ["M61BURST"] = 0,
                    ["IlsChannel"] = 1,
                    ["LGB1"] = 8,
                    ["KY28Key"] = 1,
                    ["TacanBand"] = 0,
                    ["LGB1000"] = 1,
                    ["TacanChannel"] = 0,
                    ["LGB10"] = 8,
                    ["INSAlignmentStored"] = true,
                    ["UseLAU138"] = true,
                    ["ALE39Loadout"] = 0,
                },
                ["type"] = "F-14B",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                        },
                        ["channels"] =
                        {
                            [1] = 225,
                            [2] = 258,
                            [4] = 270,
                            [8] = 257,
                            [16] = 252,
                            [17] = 268,
                            [9] = 253,
                            [18] = 269,
                            [5] = 255,
                            [10] = 263,
                            [20] = 269,
                            [11] = 267,
                            [3] = 260,
                            [6] = 259,
                            [12] = 254,
                            [13] = 264,
                            [7] = 262,
                            [14] = 266,
                            [15] = 265,
                            [19] = 268,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [15] = 0,
                            [21] = 0,
                            [11] = 0,
                            [22] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [24] = 0,
                            [19] = 0,
                            [25] = 0,
                            [13] = 0,
                            [26] = 0,
                            [23] = 0,
                            [7] = 0,
                            [14] = 0,
                            [28] = 0,
                            [27] = 0,
                            [29] = 0,
                            [30] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 225,
                            [2] = 258,
                            [4] = 270,
                            [8] = 257,
                            [16] = 252,
                            [17] = 268,
                            [9] = 253,
                            [18] = 269,
                            [5] = 255,
                            [10] = 263,
                            [20] = 269,
                            [15] = 265,
                            [21] = 225,
                            [11] = 267,
                            [22] = 258,
                            [3] = 260,
                            [6] = 259,
                            [12] = 254,
                            [24] = 270,
                            [19] = 268,
                            [25] = 255,
                            [13] = 264,
                            [26] = 259,
                            [23] = 260,
                            [7] = 262,
                            [14] = 266,
                            [28] = 257,
                            [27] = 262,
                            [29] = 253,
                            [30] = 263,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 5878,
                    ["flare"] = 60,
                    ["ammo_type"] = 1,
                    ["chaff"] = 140,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                        [2] =
                        {
                            [1] = "{SHOULDER AIM_54C_Mk60 L}",
                            [2] = "{SHOULDER AIM_54C_Mk47 L}",
                            [4] = "{SHOULDER AIM_54A_Mk60 L}",
                            [3] = "{SHOULDER AIM_54A_Mk47 L}",
                        },
                        [7] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                        [10] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                        },
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                        },
                        [4] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                        [5] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                        [9] =
                        {
                            [1] = "{SHOULDER AIM_54C_Mk47 R}",
                            [2] = "{SHOULDER AIM_54A_Mk60 R}",
                            [4] = "{SHOULDER AIM_54C_Mk60 R}",
                            [3] = "{SHOULDER AIM_54A_Mk47 R}",
                        },
                    },
                },
                ["onboard_num"] = "021",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "Intercept",
        ["uncontrolled"] = false,
    },
    ["SA342M"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 554.82553703204,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "nato_drab_uk",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["RemoveTablet"] = false,
                    ["NS430allow"] = true,
                },
                ["type"] = "SA342M",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [6] = 41,
                            [2] = 31,
                            [8] = 50,
                            [3] = 32,
                            [1] = 30,
                            [4] = 33,
                            [5] = 40,
                            [7] = 42,
                        },
                        ["modulations"] =
                        {
                            [6] = 0,
                            [2] = 0,
                            [8] = 0,
                            [3] = 0,
                            [1] = 0,
                            [4] = 0,
                            [5] = 0,
                            [7] = 0,
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 416.33,
                    ["flare"] = 32,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [1] = "{TELSON8_SNEBT254_RED}",
                            [2] = "{TELSON8_SNEBT254_YELLOW}",
                            [3] = "{TELSON8_SNEBT254_GREEN}",
                        },
                        [2] =
                        {
                            [1] = "{TELSON8_SNEBT254_RED}",
                            [2] = "{TELSON8_SNEBT254_YELLOW}",
                            [3] = "{TELSON8_SNEBT254_GREEN}",
                        },
                        [7] =
                        {
                            [6] = "{INV-SMOKE-RED}",
                            [2] = "{INV-SMOKE-GREEN}",
                            [3] = "{INV-SMOKE-WHITE}",
                            [1] = "{INV-SMOKE-BLUE}",
                            [4] = "{INV-SMOKE-YELLOW}",
                            [5] = "{INV-SMOKE-ORANGE}",
                        },
                        [6] =
                        {
                            [6] = "{INV-SMOKE-RED}",
                            [2] = "{INV-SMOKE-GREEN}",
                            [3] = "{INV-SMOKE-WHITE}",
                            [1] = "{INV-SMOKE-BLUE}",
                            [4] = "{INV-SMOKE-YELLOW}",
                            [5] = "{INV-SMOKE-ORANGE}",
                        },
                    },
                },
                ["onboard_num"] = "028",
                ["heading"] = -1.2873954367206,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["F-16C_50"] =
    {
        ["frequency"] = 305,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "default",
                ["skill"] = "Client",
                ["speed"] = 219.44444444444,
                ["AddPropAircraft"] =
                {
                    ["LaserCode100"] = 6,
                    ["LaserCode1"] = 8,
                    ["LAU3ROF"] = 0,
                    ["LaserCode10"] = 8,
                    ["HelmetMountedDevice"] = 2,
                },
                ["type"] = "F-16C_50",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [1] = 305,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [19] = 253,
                            [15] = 263,
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [19] = 0,
                            [15] = 0,
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [1] = 127,
                            [2] = 135,
                            [4] = 127,
                            [8] = 128,
                            [16] = 132,
                            [17] = 138,
                            [9] = 126,
                            [18] = 122,
                            [5] = 125,
                            [10] = 133,
                            [20] = 137,
                            [11] = 130,
                            [3] = 136,
                            [6] = 121,
                            [12] = 139,
                            [13] = 140,
                            [7] = 141,
                            [14] = 131,
                            [19] = 124,
                            [15] = 134,
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [19] = 0,
                            [15] = 0,
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2599,
                    ["flare"] = 60,
                    ["ammo_type"] = 5,
                    ["chaff"] = 60,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [2] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [3] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                        [8] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [3] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                        [3] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [3] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                        [1] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [3] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                        [12] =
                        {
                            [6] = "{INV-SMOKE-RED}",
                            [2] = "{INV-SMOKE-WHITE}",
                            [3] = "{INV-SMOKE-YELLOW}",
                            [1] = "{INV-SMOKE-GREEN}",
                            [4] = "{INV-SMOKE-BLUE}",
                            [5] = "{INV-SMOKE-ORANGE}",
                        },
                        [9] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [3] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                        [7] =
                        {
                            [1] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                            [2] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                            [3] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                        },
                    },
                },
                ["onboard_num"] = "019",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["F-5E-3"] =
    {
        ["frequency"] = 305,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "usaf 'southeast asia'",
                ["skill"] = "Client",
                ["speed"] = 175,
                ["AddPropAircraft"] =
                {
                    ["LAU68ROF"] = 0,
                    ["ChaffSalvo"] = 0,
                    ["ChaffSalvoInt"] = 0,
                    ["LAU3ROF"] = 0,
                    ["ChaffBurstInt"] = 0,
                    ["LaserCode100"] = 6,
                    ["LaserCode1"] = 8,
                    ["FlareBurstInt"] = 0,
                    ["FlareBurst"] = 0,
                    ["LaserCode10"] = 8,
                    ["ChaffBurst"] = 0,
                },
                ["type"] = "F-5E-3",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                        },
                        ["channels"] =
                        {
                            [1] = 305,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [15] = 263,
                            [19] = 253,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 1637,
                    ["flare"] = 15,
                    ["ammo_type"] = 2,
                    ["chaff"] = 30,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [6] = "{FC85D2ED-501A-48ce-9863-49D468DDD5FC}",
                            [2] = "{65396399-9F5C-4ec3-A7D2-5A8F4C1D90C4}",
                            [3] = "LAU3_WP1B",
                            [1] = "LAU3_WP61",
                            [4] = "{0877B74B-5A00-4e61-BA8A-A56450BA9E27}",
                            [5] = "{1F7136CB-8120-4e77-B97B-945FF01FB67C}",
                        },
                        [2] =
                        {
                            [6] = "{FC85D2ED-501A-48ce-9863-49D468DDD5FC}",
                            [2] = "{65396399-9F5C-4ec3-A7D2-5A8F4C1D90C4}",
                            [3] = "LAU3_WP1B",
                            [1] = "LAU3_WP61",
                            [4] = "{0877B74B-5A00-4e61-BA8A-A56450BA9E27}",
                            [5] = "{1F7136CB-8120-4e77-B97B-945FF01FB67C}",
                        },
                        [3] =
                        {
                            [6] = "{FC85D2ED-501A-48ce-9863-49D468DDD5FC}",
                            [2] = "{65396399-9F5C-4ec3-A7D2-5A8F4C1D90C4}",
                            [3] = "LAU3_WP1B",
                            [1] = "LAU3_WP61",
                            [4] = "{0877B74B-5A00-4e61-BA8A-A56450BA9E27}",
                            [5] = "{1F7136CB-8120-4e77-B97B-945FF01FB67C}",
                        },
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [2] = "CATM-9M",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [7] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                        },
                        [5] =
                        {
                            [6] = "{FC85D2ED-501A-48ce-9863-49D468DDD5FC}",
                            [2] = "{65396399-9F5C-4ec3-A7D2-5A8F4C1D90C4}",
                            [3] = "LAU3_WP1B",
                            [1] = "LAU3_WP61",
                            [4] = "{0877B74B-5A00-4e61-BA8A-A56450BA9E27}",
                            [5] = "{1F7136CB-8120-4e77-B97B-945FF01FB67C}",
                        },
                        [7] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [2] = "CATM-9M",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [7] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                        },
                    },
                },
                ["onboard_num"] = "024",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["AJS37"] =
    {
        ["frequency"] = 305,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "37",
                ["skill"] = "Client",
                ["speed"] = 152.77777777778,
                ["AddPropAircraft"] =
                {
                    ["Rb04GroupTarget"] = 3,
                    ["WeapSafeHeight"] = 1,
                    ["Rb04VinkelHopp"] = 0,
                    ["MissionGeneratorSetting"] = 0,
                },
                ["type"] = "AJS37",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [27] = 0,
                            [2] = 0,
                            [38] = 0,
                            [3] = 0,
                            [4] = 0,
                            [5] = 0,
                            [6] = 0,
                            [7] = 0,
                            [8] = 0,
                            [10] = 0,
                            [12] = 0,
                            [14] = 0,
                            [16] = 0,
                            [20] = 0,
                            [24] = 0,
                            [28] = 0,
                            [32] = 0,
                            [40] = 0,
                            [33] = 0,
                            [41] = 0,
                            [17] = 0,
                            [21] = 0,
                            [25] = 0,
                            [29] = 0,
                            [34] = 0,
                            [42] = 0,
                            [9] = 0,
                            [11] = 0,
                            [13] = 0,
                            [15] = 0,
                            [18] = 0,
                            [22] = 0,
                            [26] = 0,
                            [30] = 0,
                            [36] = 0,
                            [44] = 0,
                            [31] = 0,
                            [46] = 0,
                            [39] = 0,
                            [43] = 0,
                            [37] = 0,
                            [45] = 0,
                            [35] = 0,
                            [1] = 0,
                            [19] = 0,
                            [23] = 0,
                            [47] = 0,
                        },
                        ["channels"] =
                        {
                            [27] = 270,
                            [2] = 264,
                            [38] = 251,
                            [3] = 265,
                            [4] = 256,
                            [5] = 254,
                            [6] = 250,
                            [7] = 270,
                            [8] = 257,
                            [10] = 262,
                            [12] = 268,
                            [14] = 260,
                            [16] = 261,
                            [20] = 266,
                            [24] = 256,
                            [28] = 257,
                            [32] = 268,
                            [40] = 266,
                            [33] = 269,
                            [41] = 305,
                            [17] = 267,
                            [21] = 305,
                            [25] = 254,
                            [29] = 255,
                            [34] = 260,
                            [42] = 264,
                            [9] = 255,
                            [11] = 259,
                            [13] = 269,
                            [15] = 263,
                            [18] = 251,
                            [22] = 264,
                            [26] = 250,
                            [30] = 262,
                            [36] = 261,
                            [44] = 125,
                            [31] = 259,
                            [46] = 141,
                            [39] = 253,
                            [43] = 265,
                            [37] = 267,
                            [45] = 121,
                            [35] = 263,
                            [1] = 305,
                            [19] = 253,
                            [23] = 265,
                            [47] = 121.5,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 3581,
                    ["flare"] = 72,
                    ["chaff"] = 210,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [10] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                    },
                },
                ["onboard_num"] = "012",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "Ground Attack",
        ["uncontrolled"] = false,
    },
    ["F-14A-135-GR"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "rogue nation(top gun - maverick)",
                ["skill"] = "Client",
                ["speed"] = 222.22222222222,
                ["AddPropAircraft"] =
                {
                    ["LGB100"] = 6,
                    ["M61BURST"] = 2,
                    ["IlsChannel"] = 1,
                    ["LGB1"] = 8,
                    ["KY28Key"] = 1,
                    ["TacanBand"] = 0,
                    ["LGB1000"] = 1,
                    ["TacanChannel"] = 0,
                    ["LGB10"] = 8,
                    ["INSAlignmentStored"] = true,
                    ["UseLAU138"] = true,
                    ["ALE39Loadout"] = 0,
                },
                ["type"] = "F-14A-135-GR",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                        },
                        ["channels"] =
                        {
                            [1] = 225,
                            [2] = 258,
                            [4] = 270,
                            [8] = 257,
                            [16] = 252,
                            [17] = 268,
                            [9] = 253,
                            [18] = 269,
                            [5] = 255,
                            [10] = 263,
                            [20] = 269,
                            [11] = 267,
                            [3] = 260,
                            [6] = 259,
                            [12] = 254,
                            [13] = 264,
                            [7] = 262,
                            [14] = 266,
                            [15] = 265,
                            [19] = 268,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [15] = 0,
                            [21] = 0,
                            [11] = 0,
                            [22] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [24] = 0,
                            [19] = 0,
                            [25] = 0,
                            [13] = 0,
                            [26] = 0,
                            [23] = 0,
                            [27] = 0,
                            [14] = 0,
                            [28] = 0,
                            [7] = 0,
                            [29] = 0,
                            [30] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 225,
                            [2] = 258,
                            [4] = 270,
                            [8] = 257,
                            [16] = 252,
                            [17] = 268,
                            [9] = 253,
                            [18] = 269,
                            [5] = 255,
                            [10] = 263,
                            [20] = 269,
                            [15] = 265,
                            [21] = 225,
                            [11] = 267,
                            [22] = 258,
                            [3] = 260,
                            [6] = 259,
                            [12] = 254,
                            [24] = 270,
                            [19] = 268,
                            [25] = 255,
                            [13] = 264,
                            [26] = 259,
                            [23] = 260,
                            [27] = 262,
                            [14] = 266,
                            [28] = 257,
                            [7] = 262,
                            [29] = 253,
                            [30] = 263,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 5878,
                    ["flare"] = 60,
                    ["ammo_type"] = 1,
                    ["chaff"] = 140,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                        [2] =
                        {
                            [1] = "{SHOULDER AIM_54C_Mk60 L}",
                            [2] = "{SHOULDER AIM_54C_Mk47 L}",
                            [4] = "{SHOULDER AIM_54A_Mk60 L}",
                            [3] = "{SHOULDER AIM_54A_Mk47 L}",
                        },
                        [7] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                        [10] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                        },
                        [1] =
                        {
                            [6] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}",
                            [2] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}",
                            [3] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}",
                            [1] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}",
                            [4] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}",
                            [5] = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}",
                        },
                        [4] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                        [9] =
                        {
                            [1] = "{SHOULDER AIM_54C_Mk47 R}",
                            [2] = "{SHOULDER AIM_54A_Mk60 R}",
                            [4] = "{SHOULDER AIM_54C_Mk60 R}",
                            [3] = "{SHOULDER AIM_54A_Mk47 R}",
                        },
                        [5] =
                        {
                            [1] = "{AIM_54C_Mk60}",
                            [2] = "{AIM_54A_Mk47}",
                            [4] = "{AIM_54A_Mk60}",
                            [3] = "{AIM_54C_Mk47}",
                        },
                    },
                },
                ["onboard_num"] = "016",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "Intercept",
        ["uncontrolled"] = false,
    },
    ["UH-1H"] =
    {
        ["frequency"] = 251,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 554.82553703204,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "US DOS",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["SoloFlight"] = false,
                    ["ExhaustScreen"] = true,
                    ["GunnersAISkill"] = 90,
                    ["NetCrewControlPriority"] = 0,
                    ["EngineResource"] = 90,
                },
                ["type"] = "UH-1H",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [1] = 251,
                            [2] = 264,
                            [4] = 256,
                            [8] = 257,
                            [16] = 261,
                            [17] = 267,
                            [9] = 255,
                            [18] = 251,
                            [5] = 254,
                            [10] = 262,
                            [20] = 266,
                            [11] = 259,
                            [3] = 265,
                            [6] = 250,
                            [12] = 268,
                            [13] = 269,
                            [7] = 270,
                            [14] = 260,
                            [19] = 253,
                            [15] = 263,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 505,
                    ["flare"] = 60,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [2] =
                        {
                            [1] = "XM158_MK1",
                            [2] = "XM158_M274",
                        },
                        [5] =
                        {
                            [1] = "XM158_MK1",
                            [2] = "XM158_M274",
                        },
                    },
                },
                ["onboard_num"] = "026",
                ["heading"] = -1.2873954367206,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "Transport",
        ["uncontrolled"] = false,
    },
    ["Mirage-F1CE"] =
    {
        ["frequency"] = 127.5,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "aerges camo",
                ["skill"] = "Client",
                ["speed"] = 300,
                ["AddPropAircraft"] =
                {
                    ["RocketSalvoF1"] = 1,
                    ["LaserCode1"] = 8,
                    ["ChaffMultiTime"] = 1,
                    ["FlareMultiNumber"] = 1,
                    ["RadarCoverSettings"] = 1,
                    ["LaserCode10"] = 8,
                    ["ChaffProgramNumber"] = 1,
                    ["LaserCode100"] = 6,
                    ["FlareMultiTime"] = 1,
                    ["ChaffProgramTime"] = 1,
                    ["RocketSalvoF4"] = 1,
                    ["MissSimplLock"] = 1,
                    ["GunBurstSettings"] = 1,
                    ["ChaffMultiNumber"] = 1,
                },
                ["type"] = "Mirage-F1CE",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                        },
                        ["channels"] =
                        {
                            [1] = 127.5,
                            [2] = 119.25,
                            [4] = 126.5,
                            [8] = 133,
                            [16] = 261,
                            [17] = 262,
                            [9] = 141,
                            [18] = 263,
                            [5] = 127,
                            [10] = 250.5,
                            [20] = 270,
                            [11] = 251,
                            [3] = 122,
                            [6] = 129,
                            [12] = 253,
                            [13] = 254,
                            [7] = 131,
                            [14] = 257,
                            [15] = 260,
                            [19] = 267,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                        },
                        ["channels"] =
                        {
                            [1] = 225,
                            [2] = 230,
                            [4] = 250.5,
                            [8] = 262,
                            [16] = 252,
                            [17] = 268,
                            [9] = 263,
                            [18] = 271,
                            [5] = 251,
                            [10] = 267,
                            [20] = 360,
                            [11] = 270,
                            [3] = 240,
                            [6] = 256,
                            [12] = 254,
                            [13] = 264,
                            [7] = 257,
                            [14] = 266,
                            [15] = 265,
                            [19] = 275,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2685,
                    ["flare"] = 15,
                    ["chaff"] = 30,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [3] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                        [2] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                        [5] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                        [6] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                    },
                },
                ["onboard_num"] = "014",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["Mirage-F1EE"] =
    {
        ["frequency"] = 127.5,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "aerges camo",
                ["skill"] = "Client",
                ["speed"] = 300,
                ["AddPropAircraft"] =
                {
                    ["GunBurstSettings"] = 1,
                    ["RocketSalvoF1"] = 1,
                    ["RWR_type"] = "ALR_300",
                    ["RadarCoverSettings"] = 1,
                    ["ChaffMultiTime"] = 1,
                    ["FlareMultiNumber"] = 1,
                    ["ChaffMultiNumber"] = 1,
                    ["LaserCode1"] = 8,
                    ["RocketSalvoF4"] = 1,
                    ["LaserCode100"] = 6,
                    ["FlareMultiTime"] = 1,
                    ["ChaffProgramTime"] = 1,
                    ["MissSimplLock"] = 1,
                    ["ChaffProgramNumber"] = 1,
                    ["LaserCode10"] = 8,
                    ["INSStartMode"] = 1,
                },
                ["type"] = "Mirage-F1EE",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                        },
                        ["channels"] =
                        {
                            [1] = 127.5,
                            [2] = 119.25,
                            [4] = 126.5,
                            [8] = 133,
                            [16] = 261,
                            [17] = 262,
                            [9] = 141,
                            [18] = 263,
                            [5] = 127,
                            [10] = 250.5,
                            [20] = 270,
                            [11] = 251,
                            [3] = 122,
                            [6] = 129,
                            [12] = 253,
                            [13] = 254,
                            [7] = 131,
                            [14] = 257,
                            [15] = 260,
                            [19] = 267,
                        },
                    },
                    [2] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                        },
                        ["channels"] =
                        {
                            [1] = 225,
                            [2] = 230,
                            [4] = 250.5,
                            [8] = 262,
                            [16] = 252,
                            [17] = 268,
                            [9] = 263,
                            [18] = 271,
                            [5] = 251,
                            [10] = 267,
                            [20] = 360,
                            [11] = 270,
                            [3] = 240,
                            [6] = 256,
                            [12] = 254,
                            [13] = 264,
                            [7] = 257,
                            [14] = 266,
                            [15] = 265,
                            [19] = 275,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 3246,
                    ["flare"] = 15,
                    ["chaff"] = 30,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [3] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                        [2] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                        [5] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                        [6] =
                        {
                            [6] = "{MATRA_F1_SNEBT254_RED}",
                            [2] = "{MATRA_F1_SNEBT254_GREEN}",
                            [3] = "{MATRA_F1_SNEBT254_YELLOW}",
                            [1] = "{MATRA_F4_SNEBT254_GREEN}",
                            [4] = "{MATRA_F4_SNEBT254_RED}",
                            [5] = "{MATRA_F4_SNEBT254_YELLOW}",
                        },
                    },
                },
                ["onboard_num"] = "015",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["Su-27"] =
    {
        ["frequency"] = 127.5,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "Su-27",
                ["alt_type"] = "BARO",
                ["psi"] = -6.14355896702,
                ["livery_id"] = "air force standard",
                ["skill"] = "Client",
                ["onboard_num"] = "015",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 7520,
                    ["flare"] = 96,
                    ["chaff"] = 96,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [7] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [2] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [4] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [8] =
                        {
                            [6] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [9] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [5] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [10] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [3] =
                        {
                            [6] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [6] =
                        {
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                        },
                    },
                },
                ["speed"] = 125,
                ["heading"] = 6.14355896702,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["J-11A"] =
    {
        ["frequency"] = 127.5,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "J-11A",
                ["alt_type"] = "BARO",
                ["psi"] = -6.14355896702,
                ["livery_id"] = "plaaf 14th ad",
                ["skill"] = "Client",
                ["onboard_num"] = "020",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 7520,
                    ["flare"] = 96,
                    ["chaff"] = 96,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [7] =
                        {
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [2] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                        },
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [2] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [4] =
                        {
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [2] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                        },
                        [8] =
                        {
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [2] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [4] = "{3DFB7320-AB0E-11d7-9897-000476191836}",
                            [3] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                        },
                        [9] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [5] =
                        {
                            [6] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [10] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                        [3] =
                        {
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [2] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [4] = "{3DFB7320-AB0E-11d7-9897-000476191836}",
                            [3] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                        },
                        [6] =
                        {
                            [6] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                        },
                    },
                },
                ["speed"] = 125,
                ["heading"] = 6.14355896702,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["Su-33"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "Su-33",
                ["alt_type"] = "BARO",
                ["psi"] = 1.4253883862271,
                ["livery_id"] = "279th kiap 1st squad navy",
                ["skill"] = "Client",
                ["onboard_num"] = "022",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 4750,
                    ["flare"] = 48,
                    ["chaff"] = 48,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [7] =
                        {
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                        },
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [2] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [4] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [8] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [9] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [5] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [10] =
                        {
                            [6] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [3] =
                        {
                            [6] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [6] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [12] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [11] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                    },
                },
                ["speed"] = 138.88888888889,
                ["heading"] = -1.4253883862271,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["Su-25T"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "Su-25T",
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "af standard 1",
                ["skill"] = "Client",
                ["onboard_num"] = "021",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 3032,
                    ["flare"] = 128,
                    ["chaff"] = 128,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [10] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                    },
                },
                ["speed"] = 180.55555555556,
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["Su-25"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "Su-25",
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "forest camo scheme #1 (native)",
                ["skill"] = "Client",
                ["onboard_num"] = "014",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2268,
                    ["flare"] = 128,
                    ["chaff"] = 128,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                        [10] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                        },
                    },
                },
                ["speed"] = 180.55555555556,
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["JF-17"] =
    {
        ["frequency"] = 243,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["alt_type"] = "BARO",
                ["livery_id"] = "plaaf 111th ab (fictional)",
                ["skill"] = "Client",
                ["speed"] = 219.44444444444,
                ["AddPropAircraft"] =
                {
                    ["LaserCode1"] = 8,
                    ["LaserCode100"] = 6,
                    ["AARProbe"] = false,
                    ["LaserCode10"] = 8,
                },
                ["type"] = "JF-17",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [4] = 0,
                            [8] = 0,
                            [16] = 0,
                            [17] = 0,
                            [9] = 0,
                            [18] = 0,
                            [5] = 0,
                            [10] = 0,
                            [20] = 0,
                            [11] = 0,
                            [3] = 0,
                            [6] = 0,
                            [12] = 0,
                            [13] = 0,
                            [7] = 0,
                            [14] = 0,
                            [15] = 0,
                            [19] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 108,
                            [2] = 108.5,
                            [4] = 109.5,
                            [8] = 111.5,
                            [16] = 115.5,
                            [17] = 116,
                            [9] = 112,
                            [18] = 116.5,
                            [5] = 110,
                            [10] = 112.5,
                            [20] = 117.5,
                            [11] = 113,
                            [3] = 109,
                            [6] = 110.5,
                            [12] = 113.5,
                            [13] = 114,
                            [7] = 111,
                            [14] = 114.5,
                            [15] = 115,
                            [19] = 117,
                        },
                    },
                },
                ["psi"] = -3.1939525311496,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 1860,
                    ["flare"] = 32,
                    ["chaff"] = 36,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [7] = "DIS_SMOKE_GENERATOR_Y",
                            [1] = "DIS_SMOKE_GENERATOR_G",
                            [2] = "DIS_SD-10",
                            [4] = "DIS_LD-10_DUAL_R",
                            [8] = "DIS_SMOKE_GENERATOR_W",
                            [9] = "DIS_SMOKE_GENERATOR_O",
                            [5] = "DIS_SMOKE_GENERATOR_R",
                            [10] = "DIS_SMOKE_GENERATOR_B",
                            [3] = "DIS_LD-10",
                            [6] = "DIS_SD-10_DUAL_R",
                        },
                        [2] =
                        {
                            [7] = "DIS_SMOKE_GENERATOR_W",
                            [1] = "DIS_SMOKE_GENERATOR_G",
                            [2] = "DIS_SD-10",
                            [4] = "DIS_LD-10",
                            [8] = "DIS_SD-10_DUAL_L",
                            [9] = "DIS_SMOKE_GENERATOR_O",
                            [5] = "DIS_SMOKE_GENERATOR_R",
                            [10] = "DIS_SMOKE_GENERATOR_B",
                            [3] = "DIS_LD-10_DUAL_L",
                            [6] = "DIS_SMOKE_GENERATOR_Y",
                        },
                        [1] =
                        {
                            [6] = "DIS_SMOKE_GENERATOR_B",
                            [2] = "DIS_SMOKE_GENERATOR_R",
                            [3] = "DIS_SMOKE_GENERATOR_Y",
                            [1] = "DIS_SMOKE_GENERATOR_G",
                            [4] = "DIS_SMOKE_GENERATOR_W",
                            [5] = "DIS_SMOKE_GENERATOR_O",
                        },
                        [4] =
                        {
                            [6] = "DIS_SMOKE_GENERATOR_B",
                            [2] = "DIS_SMOKE_GENERATOR_R",
                            [3] = "DIS_SMOKE_GENERATOR_Y",
                            [1] = "DIS_SMOKE_GENERATOR_G",
                            [4] = "DIS_SMOKE_GENERATOR_W",
                            [5] = "DIS_SMOKE_GENERATOR_O",
                        },
                        [7] =
                        {
                            [6] = "DIS_SMOKE_GENERATOR_B",
                            [2] = "DIS_SMOKE_GENERATOR_R",
                            [3] = "DIS_SMOKE_GENERATOR_Y",
                            [1] = "DIS_SMOKE_GENERATOR_G",
                            [4] = "DIS_SMOKE_GENERATOR_W",
                            [5] = "DIS_SMOKE_GENERATOR_O",
                        },
                    },
                },
                ["onboard_num"] = "013",
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["MiG-21Bis"] =
    {
        ["frequency"] = 121,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "MiG-21Bis",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channelsNames"] =
                        {
                        },
                        ["modulations"] =
                        {
                            [1] = 0,
                            [2] = 0,
                            [3] = 0,
                            [4] = 0,
                            [5] = 0,
                            [6] = 0,
                            [7] = 0,
                            [8] = 0,
                            [9] = 0,
                            [10] = 0,
                            [11] = 0,
                            [12] = 0,
                            [13] = 0,
                            [14] = 0,
                            [15] = 0,
                            [16] = 0,
                            [17] = 0,
                            [18] = 0,
                            [19] = 0,
                            [20] = 0,
                        },
                        ["channels"] =
                        {
                            [1] = 121,
                            [2] = 122,
                            [3] = 123,
                            [4] = 124,
                            [5] = 125,
                            [6] = 126,
                            [7] = 127,
                            [8] = 128,
                            [9] = 129,
                            [10] = 130,
                            [11] = 131,
                            [12] = 132,
                            [13] = 133,
                            [14] = 134,
                            [15] = 135,
                            [16] = 136,
                            [17] = 137,
                            [18] = 138,
                            [19] = 139,
                            [20] = 140,
                        },
                    },
                },
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "vvs - 185th gviap",
                ["skill"] = "Client",
                ["onboard_num"] = "016",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 1824,
                    ["flare"] = 40,
                    ["ammo_type"] = 1,
                    ["chaff"] = 18,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [3] =
                        {
                            [1] = "{RN-28}",
                            [2] = "{RN-24}",
                        },
                        [7] =
                        {
                            [1] = "{MIG21_SMOKE_WHITE}",
                        },
                    },
                },
                ["speed"] = 222.22222222222,
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["MiG-29S"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "MiG-29S",
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "773 IAP_Damgarten",
                ["skill"] = "Client",
                ["onboard_num"] = "013",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2794,
                    ["flare"] = 30,
                    ["chaff"] = 30,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                        [2] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                        [3] =
                        {
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [9] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [6] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                        },
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                        [4] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [5] =
                        {
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [1] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [9] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [5] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [6] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                        },
                        [7] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                        },
                    },
                },
                ["speed"] = 222.22222222222,
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["MiG-29A"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 2000,
                ["type"] = "MiG-29A",
                ["alt_type"] = "BARO",
                ["psi"] = -3.1939525311496,
                ["livery_id"] = "air force standard",
                ["skill"] = "Client",
                ["onboard_num"] = "010",
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 2701,
                    ["flare"] = 30,
                    ["chaff"] = 30,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [2] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [3] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [5] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [1] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [4] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [5] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [8] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [1] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [5] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                            [7] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                        [7] =
                        {
                            [6] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B2}",
                            [2] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B4}",
                            [3] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B6}",
                            [1] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B5}",
                            [4] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B3}",
                            [5] = "{D3F65166-1AB8-490f-AF2F-2FB6E22568B1}",
                        },
                    },
                },
                ["speed"] = 222.22222222222,
                ["heading"] = 3.1939525311496,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAP",
        ["uncontrolled"] = false,
    },
    ["Ka-50"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 554.82553703204,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "russia standard army",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["type"] = "Ka-50",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [7] = 40,
                            [1] = 21.5,
                            [2] = 25.7,
                            [4] = 28,
                            [8] = 50,
                            [9] = 55.5,
                            [5] = 30,
                            [10] = 59.9,
                            [3] = 27,
                            [6] = 32,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [4] = 0.591,
                            [13] = 0.583,
                            [7] = 0.443,
                            [1] = 0.625,
                            [2] = 0.303,
                            [15] = 0.995,
                            [8] = 0.215,
                            [16] = 1.21,
                            [9] = 0.525,
                            [5] = 0.408,
                            [10] = 1.065,
                            [3] = 0.289,
                            [11] = 0.718,
                            [6] = 0.803,
                            [12] = 0.35,
                            [14] = 0.283,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 1160,
                    ["flare"] = 128,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [3] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [2] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [4] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [5] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                    },
                },
                ["onboard_num"] = "019",
                ["heading"] = 0.83246482671542,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["Mi-24P"] =
    {
        ["frequency"] = 127.5,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 554.82547599683,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "russian air force",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["LeftEngineResource"] = 90,
                    ["RightEngineResource"] = 90,
                    ["PilotNVG"] = true,
                    ["NetCrewControlPriority"] = 0,
                    ["GunnersAISkill"] = 90,
                    ["R60equipment"] = true,
                    ["HumanOrchestra"] = false,
                    ["OperatorNVG"] = true,
                    ["SimplifiedAI"] = false,
                    ["ExhaustScreen"] = true,
                    ["HideAngleBoxes"] = false,
                    ["OverrideIFF"] = 0,
                    ["TrackAirTargets"] = true,
                    ["NS430allow"] = true,
                },
                ["type"] = "Mi-24P",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [1] = 127.5,
                            [2] = 135,
                            [4] = 127,
                            [8] = 128,
                            [16] = 132,
                            [17] = 138,
                            [9] = 126,
                            [18] = 122,
                            [5] = 125,
                            [10] = 133,
                            [20] = 137,
                            [11] = 130,
                            [3] = 136,
                            [6] = 121,
                            [12] = 129,
                            [13] = 123,
                            [7] = 141,
                            [14] = 131,
                            [19] = 124,
                            [15] = 134,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [7] = 40,
                            [1] = 21.5,
                            [2] = 25.7,
                            [4] = 28,
                            [8] = 50,
                            [9] = 55.5,
                            [5] = 30,
                            [10] = 59.9,
                            [3] = 27,
                            [6] = 32,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 1361,
                    ["flare"] = 192,
                    ["ammo_type"] = 1,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [3] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [2] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [4] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [5] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                    },
                },
                ["onboard_num"] = "017",
                ["heading"] = 0.83246482671542,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
    ["Mi-8MT"] =
    {
        ["frequency"] = 127.5,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 525,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "russia_vvs_standard",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["LeftEngineResource"] = 90,
                    ["RightEngineResource"] = 90,
                    ["CargoHalfdoor"] = true,
                    ["GunnersAISkill"] = 90,
                    ["ExhaustScreen"] = true,
                    ["HumanOrchestra"] = false,
                    ["NetCrewControlPriority"] = 0,
                    ["AdditionalArmor"] = true,
                    ["NS430allow"] = true,
                },
                ["type"] = "Mi-8MT",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [1] = 127.5,
                            [2] = 135,
                            [4] = 127,
                            [8] = 128,
                            [16] = 132,
                            [17] = 138,
                            [9] = 126,
                            [18] = 122,
                            [5] = 125,
                            [10] = 133,
                            [20] = 137,
                            [11] = 130,
                            [3] = 136,
                            [6] = 121,
                            [12] = 129,
                            [13] = 123,
                            [7] = 141,
                            [14] = 131,
                            [19] = 124,
                            [15] = 134,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [7] = 40,
                            [1] = 21.5,
                            [2] = 25.7,
                            [4] = 28,
                            [8] = 50,
                            [9] = 55.5,
                            [5] = 30,
                            [10] = 59.9,
                            [3] = 27,
                            [6] = 32,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 1543,
                    ["flare"] = 128,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [6] =
                        {
                            [6] = "B_8V20A_CM_VT",
                            [2] = "B_8V20A_CM_WH",
                            [3] = "B_8V20A_CM_YE",
                            [1] = "B_8V20A_CM_RD",
                            [4] = "B_8V20A_CM_BU",
                            [5] = "B_8V20A_CM_GN",
                            [7] = "B_8V20A_CM",
                        },
                        [2] =
                        {
                            [6] = "B_8V20A_CM_VT",
                            [2] = "B_8V20A_CM_WH",
                            [3] = "B_8V20A_CM_YE",
                            [1] = "B_8V20A_CM_RD",
                            [4] = "B_8V20A_CM_BU",
                            [5] = "B_8V20A_CM_GN",
                            [7] = "B_8V20A_CM",
                        },
                        [3] =
                        {
                            [6] = "B_8V20A_CM_VT",
                            [2] = "B_8V20A_CM_WH",
                            [3] = "B_8V20A_CM_YE",
                            [1] = "B_8V20A_CM_RD",
                            [4] = "B_8V20A_CM_BU",
                            [5] = "B_8V20A_CM_GN",
                            [7] = "B_8V20A_CM",
                        },
                        [1] =
                        {
                            [6] = "B_8V20A_CM_VT",
                            [2] = "B_8V20A_CM_WH",
                            [3] = "B_8V20A_CM_YE",
                            [1] = "B_8V20A_CM_RD",
                            [4] = "B_8V20A_CM_BU",
                            [5] = "B_8V20A_CM_GN",
                            [7] = "B_8V20A_CM",
                        },
                        [4] =
                        {
                            [6] = "B_8V20A_CM_VT",
                            [2] = "B_8V20A_CM_WH",
                            [3] = "B_8V20A_CM_YE",
                            [1] = "B_8V20A_CM_RD",
                            [4] = "B_8V20A_CM_BU",
                            [5] = "B_8V20A_CM_GN",
                            [7] = "B_8V20A_CM",
                        },
                        [5] =
                        {
                            [6] = "B_8V20A_CM_VT",
                            [2] = "B_8V20A_CM_WH",
                            [3] = "B_8V20A_CM_YE",
                            [1] = "B_8V20A_CM_RD",
                            [4] = "B_8V20A_CM_BU",
                            [5] = "B_8V20A_CM_GN",
                            [7] = "B_8V20A_CM",
                        },
                    },
                },
                ["onboard_num"] = "025",
                ["heading"] = 0.83246482671542,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "Transport",
        ["uncontrolled"] = false,
    },
    ["Ka-50_3"] =
    {
        ["frequency"] = 124,
        ["uncontrollable"] = false,
        ["modulation"] = 0,
        ["tasks"] =
        {
        },
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = 2000,
                    ["type"] = "TakeOffGround",
                    ["action"] = "From Ground Area",
                    ["alt_type"] = "BARO",
                    ["y"] = 0,
                    ["x"] = 0,
                    ["speed_locked"] = true,
                    ["formation_template"] = "",
                    ["speed"] = 125,
                    ["ETA_locked"] = true,
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                            },
                        },
                    },
                    ["ETA"] = 0,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["alt"] = 554.82553703204,
                ["hardpoint_racks"] = true,
                ["alt_type"] = "BARO",
                ["livery_id"] = "default",
                ["skill"] = "Client",
                ["ropeLength"] = 15,
                ["speed"] = 44.444444444444,
                ["AddPropAircraft"] =
                {
                    ["IMU alignment type"] = 3,
                    ["Helmet-mounted device"] = 0,
                    ["ExhaustScreen"] = true,
                    ["modification"] = "Ka-50_3",
                    ["Realistic INS"] = 1,
                },
                ["type"] = "Ka-50_3",
                ["Radio"] =
                {
                    [1] =
                    {
                        ["channels"] =
                        {
                            [7] = 40,
                            [1] = 21.5,
                            [2] = 25.7,
                            [4] = 28,
                            [8] = 50,
                            [9] = 55.5,
                            [5] = 30,
                            [10] = 59.9,
                            [3] = 27,
                            [6] = 32,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                    [2] =
                    {
                        ["channels"] =
                        {
                            [4] = 0.591,
                            [13] = 0.583,
                            [7] = 0.443,
                            [1] = 0.625,
                            [2] = 0.303,
                            [15] = 0.995,
                            [8] = 0.215,
                            [16] = 1.21,
                            [9] = 0.525,
                            [5] = 0.408,
                            [10] = 1.065,
                            [3] = 0.289,
                            [11] = 0.718,
                            [6] = 0.803,
                            [12] = 0.35,
                            [14] = 0.283,
                        },
                        ["modulations"] =
                        {
                        },
                        ["channelsNames"] =
                        {
                        },
                    },
                },
                ["psi"] = 0,
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "",
                ["payload"] =
                {
                    ["pylons"] =
                    {
                    },
                    ["fuel"] = 1160,
                    ["flare"] = 128,
                    ["chaff"] = 0,
                    ["gun"] = 100,
                    ["restricted"] =
                    {
                        [3] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [2] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [4] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                        [5] =
                        {
                            [1] = "B_8V20A_CM",
                        },
                    },
                },
                ["onboard_num"] = "018",
                ["heading"] = 0.83246482671542,
            },
        },
        ["y"] = 0,
        ["radioSet"] = false,
        ["name"] = "",
        ["communication"] = true,
        ["x"] = 0,
        ["start_time"] = 0,
        ["task"] = "CAS",
        ["uncontrolled"] = false,
    },
}