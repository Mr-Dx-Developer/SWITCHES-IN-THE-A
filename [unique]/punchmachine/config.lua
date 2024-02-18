UMPunchMachine = {}

UMPunchMachine.Framework = "qb-core" -- qb-core | esx

UMPunchMachine.SQL = "oxmysql" -- oxmysql | mysql-async 

UMPunchMachine.Target = {
    ["open"] = true, -- or false
    ["target"] = 'qb-target'-- or qtarget
}

UMPunchMachine.MiniGame = 'Easy' -- | Easy | Normal | Hard

UMPunchMachine.Blips = false -- or false

UMPunchMachine.Coords = {
    ["vespucci-beach-1"] = {
        ["coords"] = vector4(-1651.46, -1082.39, 13.16, 52.88),
        ["prop"] = 'box_machine',
        ["offset"] = {x = 0.30, y = 0.25}
    },
    ["vespucci-beach-2"] = {
        ["coords"] = vector4(-1640.83, -1069.34, 13.15, 49.73),
        ["prop"] = 'box_machine2',
        ["offset"] = {x = 0.30, y = 0.25}
    },
    ["vespucci-beach-3"] = {
        ["coords"] = vector4(-1674.7, -1062.92, 13.15, 232.34),
        ["prop"] = 'box_machine2',
        ["offset"] = {x = -0.30, y = -0.25}
    },
    ["vespucci-beach-4"] = {
        ["coords"] = vector4(-1663.85, -1049.97, 13.15, 230.78),
        ["prop"] = 'box_machine',
        ["offset"] = {x = -0.30, y = -0.25}
    },
    ["vespucci-gym"] = {
        ["coords"] = vector4(-1198.35, -1584.51, 4.35, 305.17),
        ["prop"] = 'box_machine2',
        ["offset"] = {x = -0.20, y = 0.16}
    },
    ["vanilla-unicorn"] = {
        ["coords"] = vector4(125.97, -1325.03, 29.31, 216.32),
        ["prop"] = 'box_machine2',
        ["offset"] = {x = -0.25, y = -0.30}
    },
    ["alta-street-plaza"] = {
        ["coords"] =  vector4(-251.73, -970.13, 31.22, 73.4),
        ["prop"] = 'box_machine',
        ["offset"] = {x = 0.24, y = 0.09}
    },
    ["jail"] = {
        ["coords"] = vector4(1652.75, 2543.15, 45.56, 49.26),
        ["prop"] = 'box_machine',
        ["offset"] = {x = 0.24, y = 0.20}
    },
}

UMPunchMachine.GetCore = function()
    --[[ qb-core ]]
    QBCore = exports['qb-core']:GetCoreObject()
    --[[ esx-legacy ]]
    -- ESX = exports["es_extended"]:getSharedObject()
     --[[ esx-old ]]
    --ESX = nil
    --TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

UMPunchMachine.Notify = function(text,type)
     -- [[ qb-core ]] --
    QBCore.Functions.Notify(text, type)
    -- [[ esx ]] --
    --ESX.ShowNotification(text, type)
end

UMPunchMachine.Lang ={
    ["error-1"] = "Cette machine est occupée",
    ["target-1"] = "Frapper",
    ["target-2"] = "Liste des scores",
    ["target-false"] = "[E] Frapper / [G] Liste des scores",
    ["blipname"] = "Punch Machine"
}