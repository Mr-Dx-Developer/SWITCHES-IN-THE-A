-- Copyright (C) 2021 KUMApt & Shadowskrt

Config = {}

Config.UseLanguage = "en"                                                           -- Select the language you want to use in the script (the translation is at the end of the file)
Config.UseSoundEffect = true                                                        -- Only use this if you use InteractSound

Config.Elevators = {
    -- The following tags are not required! You can add them if you want
    -- Group = "jobname" or "gangname" -> Only player with this job or gang can can go to the restricted floors
    -- Sound = "soundname" -> Use custom sound when player reaches the new floor | You can add your custom sound with .ogg extension in interactSound folder /client/html/sounds
    -- Simple example with restricted floors and custom sound
    ["restricted"] = {
        Group = {"police", "ambulance", "lostmc"},                                -- Leave blank if you don't want to use Player Job - You can add jobs or gangs groups
        Sound = "liftSoundBellRing",                                                -- Leave blank if you don't want to use Custom Sound
        Name = "With Sound & Last Floor Restricted",
        Floors = {
            [1] = {
                Label = "Roof",
                FloorDesc = "Description for roof",
                Restricted = true,
                Coords = vector3(-1072.41, -246.45, 54.01),
                ExitHeading = "297.06"
            },
            [2] = {
                Label = "Floor 2",
                FloorDesc = "Description for floor 2",
                Restricted = false,                                                  -- Only players with defined job (Job = "") can change to this floor
                Coords = vector3(-1075.73, -252.76, 44.02),
                ExitHeading = "28.74"
            },
            [3] = {
                Label = "Floor 1",
                FloorDesc = "Description for floor 1",
                Restricted = false,
                Coords = vector3(-1075.73, -252.76, 37.76),
                ExitHeading = "28.74"
            },
        }
    },
    -- Simple example without custom sound and without restricted floors
    ["noRestricted"] = {
        Name = "Without Sound & Restricted Floor",
        Floors = {
            [1] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-857.24, -2145.61, 102.0),
                ExitHeading = "45"
            },
            [2] = {
                Label = "Ground",
                FloorDesc = "Ground",
                Coords = vector3(-877.24, -2177.65, 9.7),
                ExitHeading = "315"
            },
        }
    },
    ["lidt2"] = {
        Name = "Without Sound & Restricted Floor",
        Floors = {
            [1] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-855.7450561523438, -2143.9384765625, 106.7047119140625),
                ExitHeading = "124.72441101074219"
            },
            [2] = {
                Label = "Ground",
                FloorDesc = "Ground",
                Coords = vector3(-879.94287109375, -2175.402099609375, 9.801513671875),
                ExitHeading = "306.1417236328125"
            },
        }
    },
}

Config.Language = {
    ["en"] = {
        Call = "~g~E~w~ - Call Lift",
        Waiting = "Waiting for Lift...",
        Restricted = "Restricted floor!",
        CurrentFloor = "Current floor: "
    },
    ["pt"] = {
        Call = "~g~E~w~ - Chamar elevador",
        Waiting = "À espera do Elevador...",
        Restricted = "Piso restrito!",
        CurrentFloor = "Piso Atual: "
    }
}
