


----------------------------------------------------------------------------------------------
-------------------------------------| BRUTAL RACING :) |-------------------------------------
----------------------------------------------------------------------------------------------

--[[
Hi, thank you for buying our script, We are very grateful!

For help join our Discord server:     https://discord.gg/85u2u5c8q9
More informations about the script:   https://docs.brutalscripts.com
--]]

Config = {
    Core = 'QBCORE',  -- STANDALONE / ESX / QBCORE | Other core setting on the 'core' folder and the client and server utils.lua
    Spectate = true,  -- Spectate menu | true / false
    StartAnimation = true, -- Vehicle Camera Animation before the race | true / false
    DisableControls = {75}, -- Disables controls when the Player in Race | More keys: https://docs.fivem.net/docs/game-references/controls/
    SpecDisableControls = {202}, -- Disables controls when the Player in Spectator Mode | More keys: https://docs.fivem.net/docs/game-references/controls/
    AfkKick = {Use = true, CheckTime = 5}, -- When player afk in the Race, get kick out of the race? | true / false
    PlateText = 'RACER', -- The Race Vehicle Plate | Example: 'RACER 12' | RACER + RACER ID

    Races = {
        ['Gokart Race'] = {
            MenuText = 'Press ~h~[E]~h~ to access to the ~r~Gokart Race', -- Menu Open Label
            OpenMenuMarker = {distance = 15, opendistance = 1.5, sprite = 1, rotation = false, upanddown = false, brightness = 100, sizes = {x = 1.5, y = 1.5, z = 1.2}}, -- Menu Marker
            
            MenuColor = {r = 255, g = 0, b = 0}, -- Menu Color (RGB) | Colors >> https://www.w3schools.com/colors/colors_rgb.asp
            Image = 'gokart.png', -- png name / none | put the png >> html/assets

            StartPlace = {x = -155.1325, y = -2138.7854, z = 16.7050}, -- The Race menu position
            Blip = {Use = true, sprite = 611, color = 1, size = 0.9}, -- Race blip
            
            Countdown = 3, -- Countdown before the Start
            MaximumLaps = 3, -- Maximum Laps amount
            Vehicles = {  -- Vehicles (The Party leader can chose vehicle of these)
                {Label = 'Veto', Model = 'veto'},
                {Label = 'Veto2', Model = 'veto2'},
                -- you can add more vehicles...
            },
            
            MinimumPlayerToStart = 1,  -- These amount how many people, you need to start the race
            StartPositions = {
                [1] = {x = -108.9535, y = -2111.8296, z = 16.7050, heading = 109.7840},
                [2] = {x = -107.4270, y = -2115.7952, z = 16.7050, heading = 112.0350},
                [3] = {x = -103.9880, y = -2114.7769, z = 16.7050, heading = 108.7055},
                -- You can add more
            },

            UseBlipRoute = false, -- true / false
            CheckPoints = {
                -- type is always 'CHECK' except for finish
                [1] = {type = 'CHECK', x = -137.5697, y = -2124.6213, z = 16.7050},
                [2] = {type = 'CHECK', x = -103.6637, y = -2125.5085, z = 16.7050},
                [3] = {type = 'CHECK', x = -22.0583, y = -2090.0203, z = 16.7050},
                [4] = {type = 'CHECK', x = -92.0535, y = -2023.2430, z = 18.0168},
                [5] = {type = 'CHECK', x = -74.7696, y = -1989.4807, z = 18.0168},
                [6] = {type = 'CHECK', x = -116.3052, y = -2019.2426, z = 18.0174},
                [7] = {type = 'FINISH', x = -118.7661, y = -2117.7083, z = 16.7050},
            },
            
            CheckPointsMarkers = {
                -- Chekpoint sprites: https://docs.fivem.net/docs/game-references/checkpoints/
                AcceptDistance = 5.0,
                CheckPoints = {sprite = 12, size = 2.5, height = 0.7, r = 236, g = 240, b = 41, r2 = 11, g2 = 79, b2 = 217},
                NewLap = {sprite = 15, size = 4.0, height = 1.3, r = 255, g = 167, b = 95, r2 = 11, g2 = 79, b2 = 217},
                Finish = {sprite = 16, size = 5.0, height = 1.7, r = 255, g = 0, b = 0, r2 = 255, g2 = 255, b2 = 255},
            },

            Blips = {
                Racer = {Use = true, label = 'Racer', sprite = 1, color = 0, size = 0.5},
                Checkpoint = {label = 'Checkpoint', sprite = 1, color = 46, size = 0.8},
                NewLap = {label = 'New Lap', sprite = 1, color = 44, size = 0.9},
                Finish = {label = 'Finish', sprite = 1, color = 1, size = 0.9},
            },
            
        }, 

        -- Separate --

        ['Motocross Race'] = {
            MenuText = 'Press ~h~[E]~h~ to access to the ~b~Motocross Race',
            OpenMenuMarker = {distance = 15, opendistance = 2.5, sprite = 1, rotation = false, upanddown = false, brightness = 100, sizes = {x = 1.5, y = 1.5, z = 1.2}},
            
            MenuColor = {r = 31, g = 76, b = 224},
            Image = 'motorcross.png',

            StartPlace = {x = 876.9960, y = 2353.6643, z = 51.1639},
            Blip = {Use = true, sprite = 379, color = 38, size = 0.9},
            
            Countdown = 3,
            MaximumLaps = 10,
            Vehicles = {
                {Label = 'Sanchez', Model = 'sanchez'},
                {Label = 'Sanchez 2', Model = 'sanchez2'},
                {Label = 'BF400', Model = 'bf400'},
            },
            
            MinimumPlayerToStart = 1,
            StartPositions = {
                [1] = {x = 891.4086, y = 2371.3882, z = 50.7886, heading = 186.1757}, 
                [2] = {x = 894.2198, y = 2371.9565, z = 51.0189, heading = 186.4175},
                [3] = {x = 890.9589, y = 2376.4568, z = 50.9534, heading = 186.5240},
                [4] = {x = 893.5837, y = 2376.1418, z = 50.8579, heading = 186.5240},
            },

            UseBlipRoute = false,
            CheckPoints = {
                [1] = {type = 'CHECK', x = 912.6369, y = 2266.5212, z = 44.6082},
                [2] = {type = 'CHECK', x = 1047.7155, y = 2193.2375, z = 44.4257},
                [3] = {type = 'CHECK', x = 1093.2423, y = 2160.5864, z = 52.8970},  
                [4] = {type = 'CHECK', x = 1164.6794, y = 2160.4233, z = 53.5996},
                [5] = {type = 'CHECK', x = 1104.5979, y = 2251.5044, z = 48.2457}, 
                [6] = {type = 'CHECK', x = 1000.3408, y = 2255.0613, z = 46.8931},
                [7] = {type = 'CHECK', x = 972.2839, y = 2393.9055, z = 51.0686},
                [8] = {type = 'CHECK', x = 1108.6628, y = 2410.5945, z = 50.1342},
                [9] = {type = 'CHECK', x = 1166.1816, y = 2263.1521, z = 49.7072},
                [10] = {type = 'CHECK', x = 1157.9310, y = 2472.8311, z = 53.4489},
                [11] = {type = 'CHECK', x = 982.0073, y = 2453.8176, z = 49.4780},  
                [12] = {type = 'CHECK', x = 912.4703, y = 2484.0940, z = 51.7866}, 
                [13] = {type = 'FINISH', x = 896.0545, y = 2345.9719, z = 51.8621},  
            },
            
            CheckPointsMarkers = {
                AcceptDistance = 7.0,
                CheckPoints = {sprite = 32, size = 7.0, height = -1.0, r = 236, g = 240, b = 41, r2 = 108, g2 = 183, b2 = 220},
                NewLap = {sprite = 3, size = 7.0, height = -1.0, r = 255, g = 167, b = 95, r2 = 11, g2 = 79, b2 = 217},
                Finish = {sprite = 4, size = 8.0, height = -1.0, r = 255, g = 0, b = 0, r2 = 255, g2 = 255, b2 = 255},
            },
            
            Blips = {
                Racer = {Use = true, label = 'Racer', sprite = 1, color = 0, size = 0.5},
                Checkpoint = {label = 'Checkpoint', sprite = 1, color = 46, size = 0.8},
                NewLap = {label = 'New Lap', sprite = 1, color = 44, size = 0.9},
                Finish = {label = 'Finish', sprite = 1, color = 1, size = 0.9},
            },
            
        },

        -- Separate --

        ['Street Race'] = {
            MenuText = 'Press ~h~[E]~h~ to access to the ~g~Street Race',
            OpenMenuMarker = {distance = 15, opendistance = 2.5, sprite = 1, rotation = false, upanddown = false, brightness = 100, sizes = {x = 1.5, y = 1.5, z = 1.2}},
            
            MenuColor = {r = 8, g = 158, b = 8},
            Image = 'street.png',

            StartPlace = {x = -961.9890, y = -189.7292, z = 37.6835},
            Blip = {Use = true, sprite = 315, color = 2, size = 0.9},
            
            Countdown = 3,
            MaximumLaps = 10,
            Vehicles = {
                {Label = 'Tyrant', Model = 'tyrant'},
                {Label = 'Zentorno', Model = 'zentorno'},
                {Label = 'T20', Model = 't20'},
                {Label = 'Tigon', Model = 'tigon'},
                {Label = 'Krieger', Model = 'krieger'},
            },
            
            MinimumPlayerToStart = 1,
            StartPositions = {
                [1] = {x = -962.0258, y = -240.8427, z = 38.0107, heading = 237.6622},
                [2] = {x = -961.9005, y = -233.7914, z = 37.8917, heading = 237.6622},
                [3] = {x = -971.9515, y = -235.2534, z = 37.9062, heading = 237.6622},
                [4] = {x = -971.0941, y = -228.3710, z = 37.8791, heading = 237.6622},
            },

            UseBlipRoute = true,
            CheckPoints = {
                [1] = {type = 'CHECK', x = -640.9636, y = -378.6581, z = 34.7035},
                [2] = {type = 'CHECK', x = -585.4349, y = -834.8732, z = 26.1865},
                [3] = {type = 'CHECK', x = -501.0806, y = -843.0291, z = 30.4747},
                [4] = {type = 'CHECK', x = -536.8833, y = -1041.8157, z = 22.7209},
                [5] = {type = 'CHECK', x = -268.9235, y = -1120.8202, z = 23.1038}, 
                [6] = {type = 'CHECK', x = -191.3755, y = -891.9453, z = 29.3437}, 
                [7] = {type = 'CHECK', x = -281.8544, y = -841.9296, z = 31.7544}, 
                [8] = {type = 'CHECK', x = -249.4979, y = -636.7039, z = 33.5503},
                [9] = {type = 'CHECK', x = -207.0967, y = -427.7849, z = 32.7965},
                [10] = {type = 'CHECK', x = -412.7425, y = -229.0907, z = 36.2574},
                [11] = {type = 'CHECK', x = -571.3403, y = -65.1246, z = 42.0321}, 
                [12] = {type = 'FINISH', x = -906.9836, y = -178.2199, z = 37.6483},
            },
            
            CheckPointsMarkers = {
                AcceptDistance = 7.0,
                CheckPoints = {sprite = 32, size = 7.0, height = -1.0, r = 236, g = 240, b = 41, r2 = 108, g2 = 183, b2 = 220},
                NewLap = {sprite = 3, size = 7.0, height = -1.0, r = 255, g = 167, b = 95, r2 = 11, g2 = 79, b2 = 217},
                Finish = {sprite = 4, size = 8.0, height = -1.0, r = 255, g = 0, b = 0, r2 = 255, g2 = 255, b2 = 255},
            },
            
            Blips = {
                Racer = {Use = true, label = 'Racer', sprite = 1, color = 0, size = 0.5},
                Checkpoint = {label = 'Checkpoint', sprite = 1, color = 46, size = 0.8},
                NewLap = {label = 'New Lap', sprite = 1, color = 44, size = 0.9},
                Finish = {label = 'Finish', sprite = 1, color = 1, size = 0.9},
            },
        },

        -- You can add more Races...
    },

    -----------------------------------------------------------
    ---------------------| ADMIN COMMANDS |--------------------
    -----------------------------------------------------------

    AdminGroups = {'superadmin', 'admin', 'mod'},  -- Only if the Core = ESX / QBCORE
    IdentifierPermission = false,
    Admins = {
        

        'license:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5',  --- Dx
       'license:8601d9b7e1fab1f7008d9ca44176ceddd04353bc',  -- rico

       'discord:1144911208303034440',  -- Vroy
       'discord:981738978015313930', -- Dex
       'discord:1164653509443059732', -- Ishh
       'discord:662207311665954826',  -- Ace
       'discord:1012094569321615401', -- Jack
       'discord:1051260760992522320', -- Shawnii
       'discord:1110069724143951923', -- Stormii

       'discord:1144911208303034440', -- 
       'discord:606994374106152961', -- 

        --[[ TYPES ]]--
        -- 'steam:123456789',
        -- 'license:123456789',
        -- 'fivem:123456789',
        -- 'ip:123456789',
        -- 'discord:123456789',
    },

    AdminCommands = {
        ShowRaces = {Use = true, Command = 'showraces'},  -- /showraces
        CloseParty = {Use = true, Command = 'closeparty'}, -- /closeparty [Race Name] | Use the /showraces to get the partys names
        KickPlayer = {Use = true, Command = 'kickplayer'}, -- /kickplayer [Player ID]
    },
    
    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    MoneyForm = '$',
    Notify = {
        [1] =  {'Brutal Racing', "The Party already started!", 5000, 'error'},
        [2] =  {'Brutal Racing', "The Party is full!", 5000, 'error'},
        [3] =  {'Brutal Racing', "You are already in the Party!", 5000, 'error'},
        [4] =  {'Brutal Racing', "There is no minimum player!", 5000, 'error'},
        [5] =  {'Brutal Racing', "The Party is already created!", 5000, 'error'},
        [6] =  {'Brutal Racing', "You do not have enough money!", 5000, 'error'},
        [7] =  {'Brutal Racing', "You have successfully joined to the party!", 5000, 'success'},
        [8] =  {'Brutal Racing', "Your request must be accepted!", 5000, 'info'},
        [9] =  {'Brutal Racing', "Your request was accepted!", 5000, 'success'},
        [10] =  {'Brutal Racing', "Your request was rejected!", 5000, 'error'},
        [11] =  {'Brutal Racing', "You got kicked out of the Party!", 5000, 'error'},
        [12] =  {'Brutal Racing', "You are already in The Wait List!", 5000, 'error'},
        [13] =  {'Brutal Racing', "You can't open the menu in the vehicle!", 5000, 'error'},
        [14] =  {'Brutal Racing', "You can't leave the party!", 5000, 'error'},
        [15] =  {'Brutal Racing', "You have closed the stat panel!", 5000, 'info'},
        [16] =  {'Brutal Racing', "You have kicked from the Party! (AFK)", 5000, 'info'},
        [17] =  {'Brutal Racing', "You have gone to far away!<br>The party has been closed!", 5000, 'error'},
        [18] =  {'Brutal Racing', "Races Names:", 5000, 'info'},
        [19] =  {'Brutal Racing', "You don't have permission to use this command!", 5000, 'error'},
        [20] =  {'Brutal Racing', "Invalid Player ID!", 5000, 'error'},
        [21] =  {'Brutal Racing', "Invalid Party! [Use: /showraces]", 5000, 'error'},
        [22] =  {'Brutal Racing', "The party was successfully closed!", 5000, 'success'},
        [23] =  {'Brutal Racing', "You have received your prize:<b>", 5000, 'success'},
        [24] =  {'Brutal Racing', "The player is not in a party!", 5000, 'error'},
        [25] =  {'Brutal Racing', "You got kicked out of the Party by an Admin!", 5000, 'error'},
        [26] =  {'Brutal Racing', "The player has been kicked out!", 5000, 'success'},
    }
}