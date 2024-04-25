-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local seconds = 1000
Config = {}

Config.checkForUpdates = false -- Check for updates?

Config.DiscordInfo = {
    botToken = 'MTIyMTI3NTk5NDgwODEyNzUzOQ.GupAef.QQOgafuP17ab4aTbPcxr1u5DFms0s-YIlSaGw8', -- Your Discord bot token here
    guildID = '1182986308554063912', -- Your Discord's server ID here(Aka Guild ID)
}

Config.DiscordWhitelist = { -- Restrict if someone can fly in if they lack specific Discord role(s)
    enabled = true, -- Enable?
    deniedMessage = 'https://discord.gg/odmatlantav3 : Join our Discord server and verify to play!', -- Message for those who lack whitelisted role(s)
    whitelistedRoles = {
      --'ROLE_ID_HERE',
        '1194750900439371868', -- Maybe like a civilian role or whitelisted role(can add multiple to table)
    }
}

Config.DiscordQueue = {
    enabled = true, -- Enable? Requires
    refreshTime = 12.5 * seconds, -- How long between queue refreshes(Default: 2.5 * seconds)
    maxConnections = GetConvar('sv_maxclients', 128), -- How many slots do you have avaliable in total for server
    title = 'https://discord.gg/odmatlantav3', -- Maybe server name here?

    image = { -- Image shown on adaptive card
        link = 'https://i.imgur.com/wuhK94d.gif', -- Link to image, maybe like a server logo?
        width = '600px', -- Width of image(would not go much higher than this)
        height = '338px' -- Height
    },

    currentQueueText = 'Current queue', -- Title above queue but below image

    currentSpotText = 'Current queue: %s | Online Total: %s/%s', -- Current queue place text

    footerText = 'Visit our discord to reserve a priority queue!', -- The text right above the buttons on the adaptive card

    overflowQueueText = 'and %s more players!\n',

    buttons = { -- The little buttons at the bottom of the screen
        button1 = { -- Webstore button config
            title = 'WebStore',
            iconUrl = 'https://i.imgur.com/8msLEGN.png', -- Little button icon image link
            url = 'https://discord.gg/odmatlantav3' -- Link button goes to
        },
        button2 = {
            title = 'Discord',
            iconUrl = 'https://i.imgur.com/4a1Rdgf.png',
            url = 'https://discord.gg/odmatlantav3'
        }
    },
    roles = {

        { -- This ones provided by default are purely for example
            name = 'Member', -- Name you want displayed as role on queue card
            roleId = '1051327364027646015', -- Role ID of role
            points = 0 -- Points to add to queue(Higher the number, higher the queue)
        },

        {
            name = 'VIP pass',
            roleId = '1158388040130117692',
            points = 10
        },
        {
            name = 'Developer',
            roleId = '1207843355476885514',
            points = 20000
        },

        {
            name = 'Staff',
            roleId = '1221406995106762833',
            points = 20000
        },
    }
}

strings = {
    verifyConnection = '[OMDRP] Verifying connection...',
    verifyLauncher = '[OMDRP] Verifying Launcher...',
    verifyDiscord = '[OMDRP] Verifying Discord...',
    verifyQueue = '[OMDRP] Adding to queue...',
    notInDiscord = '[OMDRP] You must join the discord: https://discord.gg/odmatlantav3 to fly in!',
    noDiscord = '[OMDRP] You must have Discord downloaded, installed, and running to connect!',
    error = '[OMDRP] An error has occured, please try again!',
    noSteam = '[OMDRP] You must have Steam downloaded, installed and running to connect!',
}
