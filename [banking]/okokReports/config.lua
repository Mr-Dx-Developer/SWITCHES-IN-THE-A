Config = {}

-------------------------- COMMANDS & FUNCTIONALITY

Config.FeedbackClientCommand = 'report' -- The command that the players use to report something

Config.FeedbackAdminCommand = 'helplist' -- The command that the admins use to check the pendent feedbacks list

Config.FeedbackCooldown = 10 -- Time in minutes

-------------------------- ADMIN PERMISSIONS

-- If you use ESX you don't need to add any identifier to Config.AdminList because it checks if you have permission by your player group (superadmin, admin, mod)

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.AdminList = {
	'license:8601d9b7e1fab1f7008d9ca44176ceddd04353bc', -- Example, change this


	'license:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5',

   



    'discord:1144911208303034440',
    'discord:981738978015313930',
    'discord:1164653509443059732',
    'discord:662207311665954826',
    'discord:1012094569321615401',
    'discord:1051260760992522320',
    'discord:1110069724143951923',
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 13

Config.BotName = 'Dx' -- Write the desired bot name

Config.ServerName = 'Dx Server' -- Write your server's name

Config.IconURL = 'https://discordapp.com/api/webhooks/1210728143602847824/A8S9EjqQqptcXx3QFJO6jNYP-8gkIMAuOuDEI0WFm9cRxurC-1rQMstDBUbzSKRtH6Qn' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.NewFeedbackWebhookColor = '65352'

Config.AssistFeedbackWebhookColor = '16127'

Config.ConcludeFeedbackWebhookColor = '16711680'

-- ok? okok