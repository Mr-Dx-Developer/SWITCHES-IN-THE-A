--[[ 
    Start tgiann-core script after es_extented/qb-core/mysql/oxmysql script and before tgiann-* scripts
    Adjust the tgiann-core config file according to the framework you are using

    - If you are having any problems, please check the channels on my discord. If your problem is not resolved, open a ticket.
    - Discord: http://discord.gg/9SEg2WNf7Y
    - Docs: https://tgiann.gitbook.io/tgiann
]]

config = {
    lang = "en", -- "en" - "cn" - "cz" - "de" - "es" - "fi" - "fr" - "gr" - "he" - "hu" - "it" - "nl" - "no" - "sk" - "sv" - "tr"
    coreVersion = 2.1,
    customDeadReviveEvent = { -- U can change event from client/main.lua
        active = false,
        deadEvent = "baseevents:onPlayerDied",
        reviveEvent = "playerSpawned",
    },
    customNotif = {
        active = false,
        notify = function(msg, type, time)
            -- Your custom notif event or export
        end
    },
    policeJobs = {
        "police",
    },
    discordLog = {
        name = "TGIANN",
        avatar = "",
    },
    tgiannDrawText3D = true,
    showPrints = true,
    test = false, -- Dont touch this
    tgiannServer = false, -- Dont touch this
}

frameworkConfig = {
    --Event Names
    esxGetSharedObjectEvent = "esx:getSharedObject", -- TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    qbGetObjectEvent = "QBCore:GetObject", -- TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)

    --Script Names
    esxScriptName = "es_extended", -- https://github.com/esx-framework/esx_core/tree/main/%5Bcore%5D/es_extended
    qbScriptName = "qb-core", -- https://github.com/qbcore-framework/qb-core
    oxlibScriptName = "ox_lib", -- https://github.com/overextended/ox_lib
    tgiannInventoryScriptName = "tgiann-inventory",
    oxInventoryScriptName = "ox_inventory", --https://github.com/overextended/ox_inventory
    qsInventoryScriptName = "qs_inventory",
    mysqlAsyncScriptName = "mysql-async", -- https://github.com/brouznouf/fivem-mysql-async
    oxMysqlScriptName = "oxmysql", -- https://github.com/overextended/oxmysql
}

langs = {}

exports("getConfig", function()
    return config
end)