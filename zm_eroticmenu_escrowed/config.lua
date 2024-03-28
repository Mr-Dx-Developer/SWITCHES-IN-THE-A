config = {

    checkforupdates = true, --İf you want check updates 
    locale = "en",  -- Change here locale 
    -----------------------------------------------------
    keyeroticActive = true,
    openeroticmenu_key = 'F7',
    commandname = "zm_eroticmenu",
    keySuggestion = 'Open the love panel by key',
    -----------------------------------------------------

    Framework = "newqb", -- newqb, oldqb, esx
    Mysql = "mysql-async", -- mysql-async, ghmattimysql, oxmysql
    executeemotecommand = 'x',

    ----------------------  For custom -----------------------------------

    object_export = 'qb-core', -- es_extended , qb-core or something

    ---------------------- FOR QBCORE AND OLDQB-------------------------------
    AllowedLicense = false,
    Licenses = {
        "license:16961c4eb5cd20f108e1f729b5e4b9a5b3b8f7b6",
    },
    ---------------------- FOR ESX-------------------------------
    AllowedHexId = false,
    HexIds = {
        "char1:16961c4eb5cd20f108e1f729b5e4b9a5b3b8f7b6 or steam:123456789f"
    },
    -- Set this to false if you have something else on X, and then just use /e c to cancel emotes.
    EnableXtoCancel = true,
    CancelEmoteKey_eroticmenu = 'x', -- Get the button string here https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    -- Set this to true if you want to disarm the player when they play an emote.
    DisarmPlayer = false,


    ----- NEW ----
    SendReqDistance = 5.0,  -- Here you can set how many meters away players can send requests to players.

    RequestTime = 10000     -- From here, you can specify how many seconds the request will appear on the screen of the requested player. (ms -> 10000 = 10 second)
}

Webhooks_Eroico = {
    ['default'] = 'https://discord.com/api/webhooks/1085208804381184010/c3EaL2rh3KxzN6UwYUIdrHAlgUeUCVCnNON6tMWtKP7sqUz0NZyT0EPEW6G6kirZqDgp',
    ['open_lovemenu'] = 'https://discord.com/api/webhooks/1085208804381184010/c3EaL2rh3KxzN6UwYUIdrHAlgUeUCVCnNON6tMWtKP7sqUz0NZyT0EPEW6G6kirZqDgp',
    ['sent_invite'] = 'https://discord.com/api/webhooks/1085208804381184010/c3EaL2rh3KxzN6UwYUIdrHAlgUeUCVCnNON6tMWtKP7sqUz0NZyT0EPEW6G6kirZqDgp',
    ['invite_accept'] = 'https://discord.com/api/webhooks/1085208804381184010/c3EaL2rh3KxzN6UwYUIdrHAlgUeUCVCnNON6tMWtKP7sqUz0NZyT0EPEW6G6kirZqDgp',
    ['invite_decline'] = 'https://discord.com/api/webhooks/1085208804381184010/c3EaL2rh3KxzN6UwYUIdrHAlgUeUCVCnNON6tMWtKP7sqUz0NZyT0EPEW6G6kirZqDgp',
    ['change_state'] = 'https://discord.com/api/webhooks/1085208804381184010/c3EaL2rh3KxzN6UwYUIdrHAlgUeUCVCnNON6tMWtKP7sqUz0NZyT0EPEW6G6kirZqDgp',
}