xSound = exports.xsound

CodeStudio = {}

-- 'QB' = For QBCore Framework
-- 'ESX' = For ESX Framework
-- false = To Not Use Framework [Standalone]

CodeStudio.ServerType = 'QB'

CodeStudio.Main = {
    UseWithCommand = {
        Enable = true,  --Enable this if you want players to use the car radio with command
        Options = {
            Command = 'carplay',    --Command Name
            OpenWithKeybind = true, --Enable to allow players to use a keybind [*Requires Command]
            Keybind = 'J'   --Deafault Key 
        },
    },
    UseWithItem = {  --This option is only for framework specific servers
        Enable = false,  --Enable this if you want players to use the car radio with an item
        Item = 'carplay'   --Item Name
    },
    Restrict_Radio = {  --These  Jobs/Gangs/Identifers/Ace Perms Can Access Car Play, Dont put anything if you want everyone
        -- 'police',
        -- 'discord:968848387132772434',
    },
    RadioInstall = {
        Enable = false,      --Enable this if you want mechanics to manually install radios on owned vehicles
        Options = {
            RadioItem = 'carplay',   --Alternatively put false and you can also use the event directly from other scripts
            RadioInstallerItem = 'radioinstallar',  --This is the radio installer item which is required to install a radio in vehicles [*RadioItem Rquired]
            OnlyOwned = false,   --Enable to allow radios to be installed only in owned vehicles, not on NPC vehicles
            Vehicles_Table = 'player_vehicles' --Database name of the Vehicles table. Refer to sv_function.lua for more information
        }
    }
}

CodeStudio.Apps = {     --Enable/Disable Car Play Features and Apps
    Music_Playlist = true,
    AI_Assistant = true,
    Music_Overlay = true,
    Video_Player = true,
    Car_Control = true,
    Car_Info = true,
    Car_Automation = true,
    Game = true,
    Music_Neon_RGB = true
}

CodeStudio.AutoSQL = true                   --This will automatically install required sql
CodeStudio.Default_Music_Volume = 20        --Default Music Volume [0-100] 
CodeStudio.MarkedLocation_Unit = 'Km'       --Option = [Km/Mi]
CodeStudio.OnlyDriver = false               --Only Driver Can Access Car Play System 
CodeStudio.Music_Outside_Veh = true         --Enable/Disable Music To Play Outside Vehicle
CodeStudio.Outside_Music_Distance = 30.0    --The distance of music
CodeStudio.Disable_GTA_Radio = true         --Enable/Disable GTA Default Radio


CodeStudio.AutoPilot = {
    MaxSpeed = 200.0,
    DriveStyle = 1074528293     --You Can Make Your Own Custom Driving Style Here: https://vespura.com/fivem/drivingstyle/
}

-- Front|Reverse Parking Sensor --
CodeStudio.ParkingSensor = {
    Enable = true,
    SensorDistance = 3.0
}

-- Add Discord Webhook to log music playing --
CodeStudio.DiscordLog = {
    Enable = true,
    Play_Webhook = 'https://discord.com/api/webhooks/1124762753744252949/v-UDce0uXxO-5Cl2yPZJjlwyccek7Q60PsmHv4UmgvCUb8RdEjKGtmfTHGgU-gZgz4Ff'
}


-- You can add your own default playlist --
CodeStudio.Default_Playlist = {
    -- [1] = 'https://www.youtube.com/watch?v=FdPgd0w_pb4&list=RDMMFdPgd0w_pb4',
    -- [2] = 'https://www.youtube.com/watch?v=jjsVzMtXzxg&list=RDMMFdPgd0w_pb4'
}


-- Vehicle Car Play Restriction --

-- BL = Blacklist Method | WL = Whitelist Method

CodeStudio.RestrictionMethod = 'BL'

-- Add Vehicles Below based on WL/BL -- 
CodeStudio.AddVehicle = {
    `hydra`,
    `jet`,
}

