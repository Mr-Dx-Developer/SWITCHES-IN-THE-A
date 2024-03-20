Config = {}

Config.Debug = false -- If you want to see the debug messages in the console, you can make it true.

-----------------------------------------------------------------------------------------------------------------
 -- UM - Multi Character | UM Settings
-----------------------------------------------------------------------------------------------------------------

--[[
     This mode disables effects and synchronizes the time and weather with your server and does not allow you a custom weather and time
     and removes the realistic look with blur in the background
--]]

Config.PerformanceMode = false --  true (optional)

--[[
    If you have a zombie server, or if your server has a high NPC density, setting this to true will clear the leftover NPCs
    This is not recommended for performance, unless you have a zombie server do not make this true
--]]

Config.CleanZone = false --  true (optional)

--[[
    If your hud does not hide the map when you first login, set this to true
--]]
Config.HideRadar = false --  true (optional)

--[[
    If you are using qb-logs, set this to true
]]
Config.QBLogs = false --  true (optional)

-----------------------------------------------------------------------------------------------------------------
 -- UM - Multi Character | Main Settings
-----------------------------------------------------------------------------------------------------------------

Config.Lang = 'en' -- [locales/.lua]

Config.ConvertQBoxLicense = false -- If you are using QBox set true,

Config.Clothing = 'illenium-appearance' -- illenium-appearance, fivem-appearance (old illenium for qb), qb-clothing, custom

Config.SkinTable = 'playerskins' -- If you are using skins inside players just set 'skin' | playerskins or skin

Config.AnimationMenu = 'other' -- rpemotes, scully, other [list/animationlist.lua]

Config.ClothingExports = function(cacheped,skinData) -- If you don't have a custom event or export, leave this part
    if Config.Clothing == 'illenium-appearance' then
        exports['illenium-appearance']:setPedAppearance(cacheped, skinData)
    elseif Config.Clothing == 'fivem-appearance' then
        exports['fivem-appearance']:setPedAppearance(cacheped, skinData)
    elseif Config.Clothing == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:loadPlayerClothing', skinData, cacheped)
    elseif Config.Clothing == 'custom' then
        Debug('You can add your own clothing exports here.')
    end
end

--[[
   If your hud appears in multicharacters,
   this is nonsense, remember that hud is not shown without playerLoaded or LocalPlayer loaded,
   but that's ok, that's what this function was made for
--]]
Config.CustomHud = function(bool)
    if bool then
        -- Example: exports['myhud']:SetDisplay(false)
        Debug('Hud is hidden', 'debug')
    else
        -- Example: exports['myhud']:SetDisplay(true)
        Debug('Hud is show', 'debug')
    end
end

Config.StarterItems = {
    --[[ ['phone'] = {
        amount = 1,
        item = 'phone'
    }, ]]
    ['id_card'] = {
        amount = 1,
        item = 'id_card',
    },
    ['driver_license'] = {
        amount = 1,
        item = 'driver_license',
    },
}

--[[
    If you are using um-idcard, set this to true
]]
Config.UMIDCard = {
    Status = false,
    StarterCards = {'id_card', 'driver_license'}
}


Config.QBEvents = {
--[[
      this event sends the character's data to qb-apartments and opens the spawn menu by running the qb-spawn event
      If you are using custom spawn, type your spawn event here, or if you continue to use qb-apartments,
      replace your custom spawn event with the one in qb-apartments
      --------------------------------------------------------------
      for um-spawn: 'um-spawn:client:startSpawnUI'
      for ps-housing: 'ps-housing:client:setupSpawnUI'
      for qb-apartments: 'apartments:client:setupSpawnUI'
]]    spawnEventUI = 'um-spawn:client:startSpawnUI',

--[[
     if you are not using a custom event don't change it illenium-appearance
     and old illenium fivem-appearance and qb-clothing support it
]]   createFirstCharacter = 'qb-clothes:client:CreateFirstCharacter'
}


-----------------------------------------------------------------------------------------------------------------
 -- UM - Multi Character | New Character | UM Spawn Last Location
-----------------------------------------------------------------------------------------------------------------

Config.ApartmentStart = true -- If you make it true, the [new character] will spawn at Apartment.

Config.DefaultSpawn = { -- If ApartmentStart is false, it spawns the [new character here]
    Random = false, -- If you want to spawn randomly, you can make it true. [list/defaulspawncoords.lua]
    Single = vector4(-1037.11, -2736.96, 20.17, 323.76)
}

--[[
    This simply means that when the character starts the game, it spawns in the last location and does not need any menu.
    qb-spawn only works if ApartmentStart is true
--]]
Config.UMSpawnLastLocation = false

-----------------------------------------------------------------------------------------------------------------
 -- UM - Multi Character | Slots | Delete Button | PrivSlots
-----------------------------------------------------------------------------------------------------------------

Config.DeleteButton = true -- true or false everyone the ability to delete their own characters

Config.DefaultSlots = 3 -- How many total character slots everyone will have by default

Config.PrivSlots = Slots.List -- Set a custom total slots for the user whose license you are adding [list/slotslist.lua]

-----------------------------------------------------------------------------------------------------------------
 -- UM - Multi Character | Customize Settings
-----------------------------------------------------------------------------------------------------------------

Config.CinematicMode = true -- If you want to use cinematic mode, you can make it true (um special?)

Config.BackgroundMusic = {
    Status = false, -- If you want to use background music, you can make it true.
    Name = 'bgmusic.mp3', -- [web/build/audio/]
    Volume = 0.2
}

Config.Pages = {
    Credits = {
        Status = true,
        List = Credits.List -- [list/creditslist.lua]
    },
    Store = {
        Status = false,
        URL = 'https://uyuyorumstore.com'
    }
}

Config.Coords = {
    Single = Coords.List[5], -- If random false [list/coordslist.lua]
    Random = true
}

Config.Effects = {
    Status = true, -- If you want to use effects, you can make it true.
    Single = Effect.List[6], -- If random false [list/effectlist.lua]
    Random = false
}

Config.Animation = {
    -- If you have a custom animation menu, customize the export in animationlist.lua or use scenario
    Status = true, -- If you want to use animations, you can make it true.
    Single = Animation.List[1], -- If random false [list/animationlist.lua]
    Random = true,
    Scenario = {
        Status = true, -- If you want to use scenario, you can make it true.
        Single = Animation.ScenarioList[2], -- If random false [list/animationlist.lua]
        Random = true
    }
}

Config.TimeSettings = {
    SyncStatus = true, -- Synchronize with the weather on the server if you don't want to set custom weather and time in multicharacter
    Time = 23, -- recommended 10-23 | not 00 or 00:00
    Weather = 'XMAS' -- CLEAR, EXTRASUNNY, CLOUDS, OVERCAST, RAIN, CLEARING , THUNDER, SMOG, FOGGY, XMAS , SNOWLIGHT, BLIZZARD
}

-----------------------------------------------------------------------------------------------------------------
 -- UM - Multi Character | UM Speech
-----------------------------------------------------------------------------------------------------------------

Config.Speech = {
    Status = false, -- or true
    Volume = 1, -- A float that represents the volume value, between 0 (lowest) and 1 (highest.)
    Rate = 2, -- This feature is used to adjust the loudness or tone of speech. | Default 1
    Pitch = 0, -- This feature is used to adjust the speed of speech. | Default 1

    -- I suggest using commas
    -- Think of [name] as a variable and don't change its name, you can only change where it is, for example
    -- exp: 오늘 기분이 너무 안 좋아, [name] 넌 어때?
    Texts = {
        "Hello [name], how are you today?",
        "I love you [name], maybe you've never heard that before"
    }
}
