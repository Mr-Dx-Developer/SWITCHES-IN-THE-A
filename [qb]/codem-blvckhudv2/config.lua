
-------------------------------------------- General --------------------------------------------
Config = {}
Config.Framework = "newqb" -- newqb, oldqb, esx
Config.Mysql = "oxmysql" -- mysql-async, ghmattimysql, oxmysql
Config.DefaultHud = "radial" -- Default hud when player first login avaliable huds [radial, classic, text]
Config.DefaultSpeedUnit = "mph" -- Default speed unit when player first login avaliable speed units [kmh, mph]
Config.HudSettingsCommand = 'hud' -- Command for open hud settings
Config.DisplayMapOnWalk = true -- true - Show map when walking | false - Hide map when walking
Config.DisplayRealTime = false -- if you set this to true will show the real time according to player local time | if false it will show the game time
Config.EnableSpamNotification = true -- Spam preventation for seatbelt, cruise etc.
Config.EnableDateDisplay = false -- Determines if display date or nor
Config.DefaultMap = "rectangle" -- rectangle, radial
Config.DefaultSpeedometerSize = 0.5 -- 0.5 - 1.3
Config.DefaultHudSize = 1.0 -- 0.5 - 1.3
Config.EnableAmmoHud = true -- Determines if display ammo hud or nor
Config.DefaultRefreshRate = 200 -- Refresh rate for vehicle hud
Config.EnableHealth = true
Config.EnableHunger = true
Config.EnableThirst = true
Config.EnableHud = true
Config.EnableArmor = true
Config.EnableStamina = true
Config.EnableSpeedometer = true



Config.DefaultHudColors = {
    ["radial"] = {
        ["health"] = "#FF4848ac",
        ["armor"] = "#FFFFFFac",
        ["hunger"] = "#FFA048ac",
        ["thirst"] = "#4886FFac", 
        ["stress"] = "#48A7FFac",
        ["stamina"] = "#C4FF48ac",
        ["oxy"] = "#48A7FFac",
        ["parachute"] = "#48FFBDac", 
        ["nitro"] = "#AFFF48ac", 
        ["altitude"] = "#00FFF0ac", 
    },
    ["text"] = {
        ["health"] = "#FF4848ac",
        ["armor"] = "#FFFFFFac",
        ["hunger"] = "#FFA048ac",
        ["thirst"] = "#4886FFac", 
        ["stress"] = "#48A7FFac",
        ["stamina"] = "#C4FF48ac",
        ["parachute"] = "#48FFBDac", 
        ["oxy"] = "#48A7FFac",
        ["nitro"] = "#AFFF48ac", 
        ["altitude"] = "#00FFF0ac", 
    },    
    ["classic"] = {
        ["health"] = "#9F2929",
        ["armor"] = "#2E3893",
        ["hunger"] = "#B3743A",
        ["thirst"] = "#2F549C", 
        ["stress"] = "#AA35A6",
        ["oxy"] = "#48A7FFac",
        ["stamina"] = "#c4ff48",
        ["parachute"] = "#48ffde", 
        ["nitro"] = "#8eff48", 
        ["altitude"] = "#48deff", 
    },      
}


-------------------------------------------- Watermark hud --------------------------------------------
Config.DisableWaterMarkTextAndLogo = true -- true - Disable watermark text and logo 
Config.UseWaterMarkText = false -- if true text will be shown | if  false logo will be shown
Config.WaterMarkText1 = "" -- Top right server text
Config.WaterMarkText2 = "ODM ATL V3"  -- Top right server text
Config.WaterMarkLogo = "https://media.discordapp.net/attachments/1179152362900832316/1208672022842970143/Watermark.png?ex=65e4228a&is=65d1ad8a&hm=e60d3d1076fa307b70de2fb043e97c25e4815ed8535cf765fe69cf44b32e322c&=&format=webp&quality=lossless&width=1193&height=671" -- Logo url
Config.LogoWidth = "230px"
Config.LogoHeight = "150px"
Config.EnableId = true -- Determines if display server id or nor
Config.EnableWatermarkCash = true -- Determines if display cash or nor
Config.EnableWatermarkBankMoney = true -- Determines if display bank money or nor
Config.EnableWatermarkJob = true -- Determines if display job or nor
Config.EnableWatermarkWeaponImage = true -- Determines if display weapon image or nor
Config.EnableWaterMarkHud = true -- Determines if right-top hud is enabled or not

Config.Text1Style = {
    ["color"] = '#e960c7',
    ["text-shadow"] = "0px 0.38rem 2.566rem rgba(116, 5, 147, 0.55)",
}

Config.Text2Style = {
    ["color"] = "#ffffff",
}

-------------------------------------------- Keys --------------------------------------------
Config.DefaultCruiseControlKey = "K" -- Default control key for cruise. Players can change the key according to their desire 
Config.DefaultSeatbeltControlKey = "B" -- Default control key for seatbelt. Players can change the key according to their desire 
Config.VehicleEngineToggleKey = "M" -- Default control key for toggle engine. Players can change the key according to their desire 
Config.NitroKey = "SHIFT" -- Default control key for use nitro. Players can change the key according to their desire 

-------------------------------------------- Nitro --------------------------------------------
Config.RemoveNitroOnpress = 2 -- Determines of how much you want to remove nitro when player press nitro key
Config.NitroItem = "nitro" -- item to install nitro to a vehicle
Config.EnableNitro = true -- Determines if nitro system is enabled or not
Config.NitroForce = 50.0 -- Nitro force when player using nitro

-------------------------------------------- Money commands --------------------------------------------
Config.EnableCashAndBankCommands = true -- Determines if money commands are enabled or not
Config.CashCommand = "cash"  -- command to see cash
Config.BankCommand = "bank" -- command to see bank money

-------------------------------------------- Engine Toggle --------------------------------------------
Config.EnableEngineToggle = true -- Determines if engine toggle is enabled or not

-------------------------------------------- Vehicle Functionality --------------------------------------------
Config.EnableCruise = true -- Determines if cruise mode is active
Config.EnableSeatbelt = true -- Determines if seatbelt is active

-------------------------------------------- Settings text --------------------------------------------
Config.SettingsLocale = { -- Settings texts
    ["text_hud_1"] = "testo",
    ["text_hud_2"] = "hud",
    ["classic_hud_1"] = "classico",
    ["classic_hud_2"] = "hud",
    ["radial_hud_1"] = "radial",
    ["radial_hud_2"] = "hud",
    ["hide_hud"] = "Nascondi Hud",
    ["health"] = "Vita",
    ["armor"] = "Armatura",
    ["thirst"] = "Sete",
    ["stress"] = "Stress",
    ["oxy"] = "Ossigeno",
    ["hunger"] = "Fame",
    ["show_hud"] = "Mostra Hud",
    ["stamina"] = "Stamina",
    ["nitro"] = "Nitro",
    ["Altitude"] = "Altitudine",
    ["Parachute"] = "Paracadute",
    ["enable_cinematicmode"] = "Attiva Cinematic",
    ["disable_cinematicmode"] = "Disattiva Cinematic",
    ["exit_settings_1"] = "ESCI",
    ["exit_settings_2"] = "IMPOSTAZIONI",
    ["speedometer"] = "SPEEDOMETER",
    ["map"] = "MAPPA",
    ["show_compass"] = "Mostra Orario/Data",
    ["hide_compass"] = "Nascondi Orario/Data",
    ["rectangle"] = "Quadrata",
    ["radial"] = "Rotonda",
    ["dynamic"] = "DYNAMiC",
    ["status"] = "STATUS",
    ["enable"] = "Attiva",
    ["hud_size"] = "Grandezza Hud",
    ["disable"] = "Disabilita",
    ["hide_at"] = "Nascondi a",
    ["and_above"] = "e al di sopra",
    ["enable_edit_mode"] = "Sposta HUD (Singola Icona)",
    ["enable_edit_mode_2"] = "Sposta HUD (In blocco)",
    ["change_status_size"] = "Modifica la dimensione Hud",
    ["change_color"] = "Cambia colore Hud",
    ["disable_edit_mode"] = "Disattiva Edit Mode",
    ["reset_hud_positions"] = "Resetta Posizione Hud",
    ["info_text"] = "Tieni presente che l'aumento della frequenza di aggiornamento può ridurre le prestazioni di gioco!",
    ["speedometer_size"] = "Speedometer Size",
    ["refresh_rate"] = "Refresh Rate",
    ["esc_to_exit"] = "PREMI ESC PER USCIRE DALL'EDIT MODE"
}

-------------------------------------------- Fuel --------------------------------------------
Config.UseLegacyFuel = true --Enable this if you use legacy fuel

Config.GetVehicleFuel = function(vehicle) -- you can change LegacyFuel export if you use another fuel system 
    if Config.UseLegacyFuel then
        return exports["cdn-fuel"]:GetFuel(vehicle)
    else
        return GetVehicleFuelLevel(vehicle)
    end
end

-------------------------------------------- Stress --------------------------------------------

Config.UseStress = true -- if you set this to false the stress hud will be removed
Config.StressWhitelistJobs = { -- Add here jobs you want to disable stress 
    'police', 'ambulance'
}

Config.WhitelistedWeaponStress = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}

Config.AddStress = {
    ["on_shoot"] = {
        min = 1,
        max = 3,
        enable = true,
    },
    ["on_fastdrive"] = {
        min = 1,
        max = 3,
        enable = true,
    },
}

Config.RemoveStress = { -- You can set here amounts by your desire
    ["on_eat"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_drink"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_swimming"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_running"] = {
        min = 5,
        max = 10,
        enable = true,
    },

}



-------------------------------------------- Notifications --------------------------------------------

Config.Notifications = { -- Notifications
    ["stress_gained"] = {
        message = 'Getting Stressed',
        type = "error",
        time = 5000
    },
    ["stress_relive"] = {
        message =  'You Are Relaxing',
        type = "success",
        time = 5000
    },
    ["took_off_seatbelt"] = {
        type = "error",
        message = "Hai rimosso la cintura.",
        time = 5000
    },
    ["took_seatbelt"] = {
        type = "success",
        message = "Hai inserito la cintura.",
        time = 5000
    },
    ["cruise_actived"] = {
        type = "success",
        message = "Cruise attivato.",
        time = 5000
    },
    ["cruise_disabled"] = {
        type = "error",
        message = "Cruise disattivato.",
        time = 5000
    },
    ["spam"] = {
        type = "error",
        message = "Aspetta qualche secondo.",
        time = 5000
    },
    ["engine_on"] = {
        type = "success",
        message = "Motore Acceso.",
        time = 5000
    }, 
    ["engine_off"] = {
        type = "success",
        message = "Motore Spento.",
        time = 5000
    }, 
    ["cant_install_nitro"] = {
        type = "error",
        message = "Non puoi usare il Nitro da dentro il veicolo.",
        time = 5000
    }, 
    ["no_veh_nearby"] = {
        type = "error",
        message = "Non c'è nessun veicolo vicino.",
        time = 5000
    }, 
    ["cash_display"] = {
        type = "success",
        message = "You have $%s in your pocket.",
        time = 5000
    }, 
    ["bank_display"] = {
        type = "success",
        message = "You have $%s in your bank.",
        time = 5000
    }, 
}

Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent('okokNotify:Alert', src, "HUD", message, 3000, type)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            exports["okokNotify"]:Alert("HUD", message, 3000, type)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end 