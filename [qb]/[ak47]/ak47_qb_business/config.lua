Config = {}
Config.Locale = "en"									
Config.CheckCanCarryItem = false
Config.UseProgressBar = true						-- If true then set your progress bar in client/utils.lua

Config.SocietyInManagement = false --enable if your society is inside qb-management

Config.format = {
	currency = 'USD',								-- This is the format of the currency, so that your currency sign appears correctly
	location = 'en-US'								-- This is the location of your country, to format the decimal places according to your standard
}

Config.Default = {
	stock = 300,
	price = 500
}

Config.Shop = {} -- Don't touch. Add new shop inside ak47_qb_business/shops