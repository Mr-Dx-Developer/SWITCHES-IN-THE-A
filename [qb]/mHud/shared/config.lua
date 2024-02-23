Config = {}
--[[
    ░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
    ██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
    ██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
    ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
    ╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
    ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝
]]--

Config.Framework = 'autodetect' -- esx, oldesx, qb, oldqb or autodetect
Config.Voice = "pma" -- mumble, saltychat, pma
Config.MaxVoiceRanges = 3
Config.SQL = "oxmysql" -- oxmysql, ghmattimysql, mysql-async
Config.ShowMapWhileWalking = false -- true : display the map when walking || false : display the map only in vehicle
Config.HudSettingsCommand = "hudsettings" 
Config.HudSettingsEvent = "mHud:OpenHudSettings"
Config.DefaultSpeedType = "kmh" -- kmh or mph NOTE : Players can change speed type from hud settings this option only effect new players
Config.EnableFuel = true -- Do NOT Touch if you have any fuel system
Config.FuelSystem = 'cdn-fuel' -- LegacyFuel / ox-fuel / nd-fuel / frfuel / cdn-fuel / x-fuel
Config.EnterTrunkCommand = 'bgir' --The command you will use for entering baggage 
Config.TrunkOpenandCloseKey = 47 -- The key you will use to open and close the trunk  47 == G
Config.TrunkExit = 23 -- trunk exit button  47 == G
Config.MilitaryTime = true -- true : display military time on the hud || false : display civilian time on the hud
Config.newManagementSystem = true -- true : use new management system || false : use old management system
Config.AddonWeapons = { -- add weapon image in html\assets\weapons
    ["melee"] = {},
    ["handguns"] = {},
    ["smg"] = {},
    ["shotguns"] = {},
    ["assault_rifles"] = {
        -- file name ||   weapon hash 
        ["weapon_AK47"] = `WEAPON_AK47`,
    },
    ["machine_guns"] = {},
    ["heavy_weapons"] = {},
    ["sniper_rifles"] = {},
    ["throwables"] = {},
    ["misc"] = {},

}
Config.EnableEngineToggle = true -- true : Toggle engine status with a key || false : disable this feature 
Config.ForceEngineOff = false -- true : If player turn off the engine he have to press engine key to turn engine on again || false : If player turn off the engine he can turn on engine again by accelerating the vehicle
Config.EnableIndicators = true -- true : Toggle indicators with a key || false : disable this feature 
Config.EnableSeatbelt = true -- true : Use seatbelt system || false : disable this feature 
Config.SeatbeltSound = true -- true : If player doesn't buckle up play sound || false : disable this feature 
Config.SeatbeltEjectSpeed = 150 -- adjust this value in kmh 
Config.EnableVehiclesDefaultRadio = true
Config.EnableSafezoneNotify = false -- true : when someone enters a safezone show notify || false : disable this feature 
Config.SafezoneNotifyCoords = {
    {
        coords = vector3(-33.7, -1102, 33.65031),
        radius = 50,
    },
}

Config.Menu = { -- Toggle vehicle menu
    media = true,
    quick = true,
    vehicle = true,
}

Config.Speedometers = { -- Toggle speedometers
    enableDefault = true,
    enableSuper = true,
    enableOldSchool = true,
    enableSport = true,
    enableDrift = true,
    enableBicycle = true,
    enableBoat = true,
    enableHeli = true,
}
--[[
    ██╗░░██╗███████╗██╗░░░██╗░██████╗
    ██║░██╔╝██╔════╝╚██╗░██╔╝██╔════╝
    █████═╝░█████╗░░░╚████╔╝░╚█████╗░
    ██╔═██╗░██╔══╝░░░░╚██╔╝░░░╚═══██╗
    ██║░╚██╗███████╗░░░██║░░░██████╔╝
    ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═════╝░
]]--

Config.EnableRegisterKeyMapping = true 

--[[
    if set to true adjust the keys down below by referencing this url
    -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

    if set to false adjust the keys down below by referencing this url
    -- https://docs.fivem.net/docs/game-references/controls/

]]--

Config.SeatbeltKey = "B"
Config.CruiseControlKey = "C" 
Config.rightindicator = "RIGHT" 
Config.leftindicator = "LEFT" 
Config.hazardlights = "DOWN"  
Config.VehicleEngineToggleKey = "G"
Config.NitroKey = 36 -- Whatever you set Config.EnableRegisterKeyMapping if you want to change key for nitro only reference here https://docs.fivem.net/docs/game-references/controls/
Config.MouseCursorKey = 39 -- Whatever you set Config.EnableRegisterKeyMapping if you want to change key for cursor only reference here https://docs.fivem.net/docs/game-references/controls/
Config.MouseCursorKeyLabel = "["

--[[
    ░██╗░░░░░░░██╗░█████╗░████████╗███████╗██████╗░███╗░░░███╗░█████╗░██████╗░██╗░░██╗
    ░██║░░██╗░░██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗████╗░████║██╔══██╗██╔══██╗██║░██╔╝
    ░╚██╗████╗██╔╝███████║░░░██║░░░█████╗░░██████╔╝██╔████╔██║███████║██████╔╝█████═╝░
    ░░████╔═████║░██╔══██║░░░██║░░░██╔══╝░░██╔══██╗██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗░
    ░░╚██╔╝░╚██╔╝░██║░░██║░░░██║░░░███████╗██║░░██║██║░╚═╝░██║██║░░██║██║░░██║██║░╚██╗
    ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝
]]--


Config.WaterMarkInformations = { -- informations displayed in the upper right watermark
    logo = "https://media.discordapp.net/attachments/1179152362900832316/1208672022842970143/Watermark.png?ex=65e4228a&is=65d1ad8a&hm=e60d3d1076fa307b70de2fb043e97c25e4815ed8535cf765fe69cf44b32e322c&=&format=webp&quality=lossless&width=1193&height=671",
    servername = "ODM ATL V3",
    discordlink = "discord.gg/odmatlantav3"
}


Config.CountryCode = "en-US" -- this is used to format the date you can check country codes here -- https://www.w3schools.com/jsref/jsref_tolocalestring_number.asp

Config.PlayerServerId = function()
    return GetPlayerServerId(PlayerId())
end

Config.SecondJob = {
    enable = false, -- we don't advise to enable this if you don't know how to coding
    func = function()
  
    -- example
    -- NOTE : this is just for an example don't uncomment this!
    --[[
        WaitCore()
        WaitPlayer()

        function CheckSecondJob(job_label, grade_label)
            nuiMessage("SET_SECOND_JOB", {
                job_label =job_label ,
                job_grade_label = grade_label
            })  
        end
        local mySecondJobLabel = yourExportToGetSecondJobLabel()
        local mySecondJobGradeLabel = yourExportToGetSecondJobGradeLabel()
        CheckSecondJob(mySecondJobLabel, mySecondJobGradeLabel)

        RegisterNetEvent("yourevent:OnSecondJobChange")
        AddEventHandler("yourevent:OnSecondJobChange", function(job)
            CheckSecondJob(job.label, job.grade_label)
        end)
    ]]--        
    end,
}

Config.MoneyHud = {
    bank = {
        show = true,
    },
    cash = {
        show = true,
    },
    black_money = {
        show = false,
        getMoney = function(this)
            if this.show then
                if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
                    WaitCore()
                    WaitPlayer()
                    local PlayerData = Core.GetPlayerData()
                    for _,v in pairs(PlayerData.accounts) do
                        if v.name == 'black_money' then
                            LoadPlayerMoney("black_money", v.money)
                        end
                    end
                    RegisterNetEvent('esx:setAccountMoney')
                    AddEventHandler('esx:setAccountMoney', function(account)
                        if account.name == 'black_money' then                            
                            LoadPlayerMoney("black_money", account.money)
                        end
                    end)
                else     
                    WaitCore()
                    WaitPlayer()  
                    local PlayerData = Core.Functions.GetPlayerData()
                    for _,v in pairs(PlayerData.items) do
                        if v and v.name == 'markedbills' then
                            LoadPlayerMoney("black_money", v.amount)                                
                        end
                    end

                    RegisterNetEvent("QBCore:Player:SetPlayerData")
                    AddEventHandler("QBCore:Player:SetPlayerData", function(data)
                        if data.items then
                            for _,v in pairs(data.items) do
                                if v and v.name == 'markedbills' then
                                    LoadPlayerMoney("black_money", v.amount)                                
                                end
                            end
                        end                        
                    end)
                end
            end
        end
    },
    boss_money = { -- boss money function doesn't work on qb-core but if you have a management script you need to integrate events yourself 
        show = false,
        jobs = {
            ["police"] = 'Chief',
            ["mechanic"] = 'Manager',
            ["ambulance"] = 'boss',
        },
        getMoney = function(this)
            if this.show then
                if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
                    WaitCore()
                    WaitPlayer()

                    function CheckJob(jobName, gradeName)
                        if this.jobs[jobName] == gradeName then
                            local money = TriggerCallback("esx_society:getSocietyMoney", jobName)
                            ForceAccountVisibility("boss_money", true)
                            LoadPlayerMoney("boss_money", money)                
                        else
                            ForceAccountVisibility("boss_money", false)
                        end 
                    end
                  
                    local jobName = Core.GetPlayerData().job.name
                    local gradeName = Core.GetPlayerData().job.grade_name
                    CheckJob(jobName, gradeName)

                    RegisterNetEvent('esx_addonaccount:setMoney')
                    AddEventHandler('esx_addonaccount:setMoney', function(society, money)    
                        local jobName = Core.GetPlayerData().job.name
                        local gradeName = Core.GetPlayerData().job.grade_name
                        if this.jobs[jobName] == gradeName and 'society_'..jobName == society then
                            LoadPlayerMoney("boss_money", money)                       
                        end
                    end)

                    RegisterNetEvent("esx:setJob")
                    AddEventHandler("esx:setJob", function(job)
                        CheckJob(job.name, job.grade_name)
                    end)
                else
                    WaitCore()
                    WaitPlayer() 
                   
                    function CheckJob(jobName, gradeName)
                        if this.jobs[jobName] == gradeName then
                            local money = TriggerCallback("mHud:getSocityMoney", jobName)
                            ForceAccountVisibility("boss_money", true)
                            LoadPlayerMoney("boss_money", money)        
          
                        else
                            ForceAccountVisibility("boss_money", false)
                        end 
                    end

                    local jobName = Core.Functions.GetPlayerData().job.name
                    local jobGrade =  Core.Functions.GetPlayerData().job.grade.name
                    CheckJob(jobName, jobGrade)

                    RegisterNetEvent("QBCore:Player:SetPlayerData")
                    AddEventHandler("QBCore:Player:SetPlayerData", function(data)
                        local jobName = data.job.name
                        local jobGrade = data.job.grade.name
                        CheckJob(jobName, jobGrade)
                    end)

                end        
            end
        end,
    },
    vip_money = {
        show = false,
        getMoney = function(this)


            
            WaitCore()
            WaitPlayer()
            local coin = TriggerCallback("mvip-getcoin")
            LoadPlayerMoney("vip_money", coin)   
            
            RegisterNetEvent("mvip-client-update")
            AddEventHandler("mvip-client-update", function(PlayerData)
                coin = PlayerData.coin
                LoadPlayerMoney("vip_money", coin)   
            end)

            -- your function to get vip_money
            -- example
            --[[
                WaitCore() -- wait till player load
                WaitPlayer() -- wait till player load
                local myVipMoney = TriggerCallback("yourevent:getPlayerVipMoney")
                LoadPlayerMoney("vip_money", money)                       
                
                RegisterNetEvent("yourevent:VipMoneyAmountChanged")
                AddEventHandler("yourevent:VipMoneyAmountChanged", function(amount)
                    LoadPlayerMoney("vip_money", amount)   
                end)
            ]]--
        end
    } 
}

--[[
    ░██████╗██████╗░███████╗███████╗██████╗░░█████╗░███╗░░░███╗███████╗████████╗███████╗██████╗░
    ██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝╚══██╔══╝██╔════╝██╔══██╗
    ╚█████╗░██████╔╝█████╗░░█████╗░░██║░░██║██║░░██║██╔████╔██║█████╗░░░░░██║░░░█████╗░░██████╔╝
    ░╚═══██╗██╔═══╝░██╔══╝░░██╔══╝░░██║░░██║██║░░██║██║╚██╔╝██║██╔══╝░░░░░██║░░░██╔══╝░░██╔══██╗
    ██████╔╝██║░░░░░███████╗███████╗██████╔╝╚█████╔╝██║░╚═╝░██║███████╗░░░██║░░░███████╗██║░░██║
    ╚═════╝░╚═╝░░░░░╚══════╝╚══════╝╚═════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝
]]--

Config.SpeedometerRefreshRateTimes = {
    low = 800,
    medium = 500,
    high = 300,
    realtime = 150,
}


Config.Fuel = function(vehicle)
    if Config.EnableFuel then
        if DoesEntityExist(vehicle) then
            if Config.FuelSystem == 'LegacyFuel' then
                return exports["LegacyFuel"]:GetFuel(vehicle)
            elseif Config.FuelSystem == 'ox-fuel' then
                return GetVehicleFuelLevel(vehicle)
            elseif Config.FuelSystem == 'nd-fuel' then
                return exports["nd-fuel"]:GetFuel(vehicle)
            elseif Config.FuelSystem == 'frfuel' then
                return exports.frfuel:getCurrentFuelLevel(vehicle)
            elseif Config.FuelSystem == 'cdn-fuel' then
                return exports['cdn-fuel']:GetFuel(vehicle)
            elseif Config.FuelSystem == 'x-fuel' then
                return exports['x-fuel']:GetFuel(vehicle)
            else
                -- You can added export if you want it
            end
        end
    else
        return GetVehicleFuelLevel(vehicle)
    end
    return 0
end


Config.PoliceVehicles = { -- if the siren of the vehicle you wrote here is active speedometer gives effect
    `police`,
    `police3`,
    `policet`,
    `policeb`,
    `riot`,
    `fbi2`,
    `fbi`,
}
Config.AmbulanceVehicles = { -- if the siren of the vehicle you wrote here is active speedometer gives effect
    `ambulance`,
}

-- Vehicle classes
--[[
0: Compacts  
1: Sedans  
2: SUVs  
3: Coupes  
4: Muscle  
5: Sports Classics  
6: Sports  
7: Super  
8: Motorcycles  
9: Off-road  
10: Industrial  
11: Utility  
12: Vans  
13: Cycles  
14: Boats  
15: Helicopters  
16: Planes  
17: Service  
18: Emergency  
19: Military  
20: Commercial  
21: Trains  
22: Open Wheel
]]--

Config.EnableVehicleModes = true
Config.VehicleModes = {
    ["sport"] = { 
        changeHandling = true, -- true : When sport mode is activated also change vehicle handling || false : When sport mode is activated change only speedometer       
        boostPower = 15.0,  
        itemCheck = {
            enable = false,
            name = "water",
            reqAmount = 1,
            label = "Water",
        },
        allowedVehicles = {
            classes = {5, 6, 7},
            hash = {
                `adder`,
                `t20`
            },
        },
    },
    ["drift"] = {
        changeHandling = true, -- true : When drift mode is activated also change vehicle handling || false : When drift mode is activated change only speedometer  
        itemCheck = {
            enable = false,
            name = "water",
            label = "Water",
            reqAmount = 1,
        },
        allowedVehicles = {
            classes = {0, 1, 2, 3, 4, 5, 6, 7, 9, 12, 18, 19},
            hash = {
                `adder`,
                `t20`
            },
        },
    },
}



--[[
    please note that enabling this feature may affect the resmon value
    resmon while is off (when walking) : https://prnt.sc/bQuSUSqmP9WX 
    resmon while is on (when walking) : https://prnt.sc/oNBIOkFwdKym
]]--
Config.GtaDefaultUIs = { 
    enable = false,
    hide = {
        vehicle_name = true, 
        area_name = true, 
        vehicle_class = true,
        street_name = true,
        cash = true,
        mp_cash = true,
        hud_components = true, 
        hud_weapons = true, 
        ammo = true,
    },
}

--[[
    ░█████╗░████████╗██╗░░██╗███████╗██████╗░
    ██╔══██╗╚══██╔══╝██║░░██║██╔════╝██╔══██╗
    ██║░░██║░░░██║░░░███████║█████╗░░██████╔╝
    ██║░░██║░░░██║░░░██╔══██║██╔══╝░░██╔══██╗
    ╚█████╔╝░░░██║░░░██║░░██║███████╗██║░░██║
    ░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝
]]--

Config.EnableUIKeys = false
Config.UIKeys = {
    {
        key = "M",
        desc = "PHONE",
    },
    {
        key = "F2",
        desc = "INV",
    },
    {
        key = "F3",
        desc = "MENU",
    },
    {
        key = "N",
        desc = "MIC",
    },
}


Config.Gift = {
    enable = false,
    text = "<p>Play</p> <span>{0} H</span> <p>and get a gift</p> ",
    time = 30, -- x mn play time to give gift
    rewards = {
        {
            type = "item",
            name = "water",
            amount = 1,
        },
        {
            type = "bank_money",
            amount = 10000,
        },
        {
            type = "vcoin", -- if you use vcoin you need to add a function to get vcoin -- Config.CoinFunction
            amount = 1,
        },
    }
}

Config.CoinFunction = function(src, amount)
    exports['m-vipsystem']:addPlayerCoin(src, amount)
end

Config.QuickLocations = {
    bank = {
        vector3(150.266, -1040.203, 29.374),
        vector3(-1212.980, -330.841, 37.787),
        vector3(-2962.582, 482.627, 15.703),
        vector3(-112.202, 6469.295, 31.626),
        vector3(314.187, -278.621, 54.170),
        vector3(-351.534, -49.529, 49.042),
        vector3(241.727, 220.706, 106.286),
        vector3(1175.064, 2706.643, 38.094),
    },
    gas_stations = {
        vector3(49.4187, 2778.793, 58.043),
        vector3(263.894, 2606.463, 44.983),
        vector3(1039.958, 2671.134, 39.550),
        vector3(1207.260, 2660.175, 37.899),
        vector3(2539.685, 2594.192, 37.944),
        vector3(2679.858, 3263.946, 55.240),
        vector3(2005.055, 3773.887, 32.403),
        vector3(1687.156, 4929.392, 42.078),
        vector3(1701.314, 6416.028, 32.763),
        vector3(179.857, 6602.839, 31.868),
        vector3(-94.4619, 6419.594, 31.489),
        vector3(-2554.996, 2334.40, 33.078),
        vector3(-1800.375, 803.661, 138.651),
        vector3(-1437.622, -276.747, 46.207),
        vector3(-2096.243, -320.286, 13.168),
        vector3(-724.619, -935.1631, 19.213),
        vector3(-526.019, -1211.003, 18.184),
        vector3(-70.2148, -1761.792, 29.534),
        vector3(265.648, -1261.309, 29.292),
        vector3(819.653, -1028.846, 26.403),
        vector3(1208.951, -1402.567,35.224),
        vector3(1181.381, -330.847, 69.316),
        vector3(620.843, 269.100, 103.089),
        vector3(2581.321, 362.039, 108.468),
        vector3(176.631, -1562.025, 29.263),
        vector3(176.631, -1562.025, 29.263),
        vector3(-319.292, -1471.715, 30.549),
        vector3(1784.324, 3330.55, 41.253)
    },
    shops = {
        vector3(373.875, 325.896,  102.566),
        vector3(2557.458,382.282, 107.622),
        vector3(-3038.939, 585.954, 6.908),
        vector3(-1487.553, -379.107, 39.163),
        vector3(1392.562, 3604.684, 33.980),
        vector3(-2968.243,390.910,  14.043),
        vector3(2678.916, 3280.671, 54.24),
        vector3( -48.519,  -1757.514, 28.421),
        vector3(1163.373, -323.801,  68.205),
        vector3( -707.501, -914.260, 18.215),
        vector3(-1820.523,792.518,  137.118),
        vector3(1698.388, 4924.404, 41.063),
        vector3(1961.464, 3740.672, 31.343),
        vector3(1135.808, -982.281,  45.415),
        vector3( 25.88,   -1347.1,  28.5),
        vector3(547.431,   2671.710, 41.156),
        vector3( -3241.927, 1001.462,  11.830), 
        vector3(1166.024, 2708.930,   37.157),
        vector3(1729.216, 6414.131,  34.037),
    },
    clothing_shops = {
        vector3(72.3, -1399.1, 28.4),
	    vector3(-703.8, -152.3, 36.4),
	    vector3(-167.9, -299.0, 38.7),
	    vector3(428.7, -800.1, 28.5),
	    vector3(-829.4, -1073.7, 10.3),
	    vector3(-1447.8, -242.5, 48.8),
	    vector3(11.6, 6514.2, 30.9),
	    vector3(123.6, -219.4, 53.6),
	    vector3(1696.3, 4829.3, 41.1),
	    vector3(618.1, 2759.6, 41.1),
	    vector3(1190.6, 2713.4, 37.2),
	    vector3(-1193.4, -772.3, 16.3),
	    vector3(-3172.5, 1048.1, 19.9),
	    vector3(-1108.4, 2708.9, 18.1)
    },
    barber_shops = {
        vector3(-814.3, -183.8, 36.6),
        vector3(136.8, -1708.4, 28.3),
        vector3(-1282.6, -1116.8, 6.0),
        vector3(1931.5, 3729.7, 31.8),
        vector3(1212.8, -472.9, 65.2),
        vector3(-32.9, -152.3, 56.1),
        vector3(-278.1, 6228.5, 30.7)
    },
    tattoo_shops = {
        vector3(1322.6, -1651.9, 51.2),
	    vector3(-1153.6, -1425.6, 4.9),
	    vector3(322.1, 180.4, 103.5),
	    vector3(-3170.0, 1075.0, 20.8),
	    vector3(1864.6, 3747.7, 33.0),
	    vector3(-293.7, 6200.0, 31.4)
    },
}

Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end