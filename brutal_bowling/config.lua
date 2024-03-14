----------------------------------------------------------------------------------------------
-------------------------------------| BRUTAL BOWLING :) |------------------------------------
----------------------------------------------------------------------------------------------

--[[
Hi, thank you for buying our script, We are very grateful!

For help join our Discord server:     https://discord.gg/85u2u5c8q9
More informations about the script:   https://docs.brutalscripts.com
--]]

Config = {
    Core = 'QBCORE',  -- 'ESX' / 'QBCORE' | Other core setting on the 'core' folder.
    TextUI = 'ox_lib', -- 'ox_lib' / 'okokTextUI' / 'ESXTextUI' / 'QBDrawText' // Custom can be add in the cl_utils.lua!!!
    BrutalNotify = true, -- Buy here: (4€+VAT) https://store.brutalscripts.com | Or set up your own notify >> cl_utils.lua
    SteamName = true, -- true = Steam name | false = character name

    Marker = {use = true, marker = 20, bobUpAndDown = false, rotate = false, size = {0.3, 0.2, 0.2}, rgb = {15, 100, 210}},
    DisableControls = {22}, -- These controls will blocked during the boxing match. (Except: Key Bindings)
    EnableSounds = false, --Enable additional sounds while players play bowling

    Blips = {
        {label = 'Glory Bowls', coords = vector3(-1668.3221, -1064.3582, 13.1500), color = 26, sprite = 103, size = 0.8},
        {label = 'BAGZ Bowls', coords = vector3(-144.3393, -251.9991, 44.0516), color = 26, sprite = 103, size = 0.8},
        -- more can be added
    },

    BowlingPlaces = {                                                           
       -- █▀▄▀█ ▄▀█ █▀█ █ █ ▄▀█ █   █   ▄▄ █▀█ ▄▀█ █ █▀▄
        --█ ▀ █ █▀█ █▀▀ ▀▀█ █▀█ █▄▄ █▄▄    █▀▀ █▀█ █ █▄▀
        -- PAID MLO, buy from there: https://fivem.map4all-shop.com/package/5294850
                                                                   
        {
            Menu = vector3(-1662.1301, -1066.4021, 13.0575),
            Throw = vector4(-1661.4106, -1067.0078, 13.0575, 230.00),
            BowlingPins = vector4(-1649.944, -1076.613, 13.07, 250.0),
        },

        {
            Menu = vector3(-1663.8274, -1068.3940, 13.0575),
            Throw = vector4(-1663.0830, -1068.9514, 13.0575, 230.00),
            BowlingPins = vector4(-1651.612, -1078.571, 13.07, 250.0),
        },

        {
            Menu = vector3(-1665.2092, -1070.0406, 13.0574),
            Throw = vector4(-1664.4270, -1070.5774, 13.0574, 230.00),
            BowlingPins = vector4(-1652.978, -1080.2278, 13.07, 250.0),
        },

        {
            Menu = vector3(-1666.8661, -1072.0658, 13.0574),
            Throw = vector4(-1666.2365, -1072.5785, 13.0575, 230.00),
            BowlingPins = vector4(-1654.646, -1082.20, 13.07, 250.0),
        },
             
                                  
        --█▀▀ ▄▀█ █▄▄ ▀█ ▄▄ █▀▀ █▀█ █▀▀ █▀▀
        --█▄█ █▀█ █▄█ █▄    █▀  █▀▄ ██▄ ██▄
        -- FREE MLO, download from there: https://forum.cfx.re//uploads/short-url/yFoBzICYQRZsNHaVlFYTDKdiKf3.rar

        {
            Menu = vector3(-145.9858, -260.1666, 44.1441),
            Throw = vector4(-146.5048, -261.6450, 44.1441, 160.00),
            BowlingPins = vector4(-152.588, -278.86, 44.164, 180.0),
        },

        {
            Menu = vector3(-149.0443, -259.1628, 44.1441),
            Throw = vector4(-149.4865, -260.5309, 44.1441, 160.00),
            BowlingPins = vector4(-155.567, -277.789, 44.164, 180.0),
        },

        {
            Menu = vector3(-151.5322, -258.2912, 44.1441),
            Throw = vector4(-152.1418, -259.6562, 44.1441, 160.00),
            BowlingPins = vector4(-158.152, -276.909, 44.164, 180.0),
        },

        {
            Menu = vector3(-154.6945, -257.1477, 44.1441),
            Throw = vector4(-155.1330, -258.5301, 44.1441, 160.00),
            BowlingPins = vector4(-161.179, -275.844, 44.164, 180.0),
        },

        {
            Menu = vector3(-158.3694, -255.9084, 44.1441),
            Throw = vector4(-158.9667, -257.2711, 44.1441, 160.00),
            BowlingPins = vector4(-164.988, -274.506, 44.164, 180.0),
        },

        {
            Menu = vector3(-161.5182, -254.8898, 44.1441),
            Throw = vector4(-161.9705, -256.2455, 44.1441, 160.00),
            BowlingPins = vector4(-167.93, -273.431, 44.164, 180.0),
        },

        {
            Menu = vector3(-164.0538, -253.9752, 44.1441),
            Throw = vector4(-164.6469, -255.2912, 44.1441, 160.00),
            BowlingPins = vector4(-170.578, -272.434, 44.164, 180.0),
        },

        {
            Menu = vector3(-167.1449, -252.9530, 44.1441),
            Throw = vector4(-167.5867, -254.1502, 44.1441, 160.00),
            BowlingPins = vector4(-173.614, -271.477, 44.164, 180.0),
        },
    },
   
    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    MoneyForm = '$', -- Money form

    MenuOpen = {'[E] - Bowling Menu', 38}, -- Label, control
    
    -- Notify function EDITABLE >> cl_utils.lua
    Notify = { 
        [1] = {"Bowling", "The Party is full!", 5000, "error"},
        [2] = {"Bowling", "You have been kicked! (Not enough money)", 5000, "error"},
        [3] = {"Bowling", "You are already in an another game.", 5000, "error"},
        [4] = {"Bowling", "You got:", 5000, "info"},
        [5] = {"Bowling", "You paid:", 5000, "info"},
        [6] = {"Bowling", "You have been kicked out from the game!", 5000, "error"},
    }
}