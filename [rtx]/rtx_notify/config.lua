Config = {}

Config.NotifySoundsEnabled = true -- true sound enabled -- false sound disabled

Config.NotifyLocation = "right" -- left or right or middle

Config.NotifySettings = true -- enable notify settings for players

Config.NotifySettingsCommand = "notifysettings" -- you can also open notifysettings menu via TriggerEvent("rtx_notify:NotifySettings)

Config.NotifySettingsInterfaceColor = "#ff66ff" -- change interface color, color must be in hex

Config.DefaultNotifyStyle = {
	defaultcolor = "#ff66ff", -- color for notify
	defaulttime = 5000, -- time 1000 = 1 second
	defaultnotifysoundenabled = true, -- true sound enabled -- false sound disabled
	defaultnotifysound = "sounds/soundnotify.mp3", -- you can import sounds to html/sounds/ folder,
}

--[[
	
	Client Side Notify TriggerEvent("rtx_notify:Notify", "Title", "text", time, "type")	
	Client Side Notify Function exports["rtx_notify"]:Notify("Title", "text", time, "type")	
	
	Example Client Side Notify TriggerEvent("rtx_notify:Notify", "Info", "This is info notify", 2500, "info") -- time 1000 = 1 seconds
	Example Client Side Notify exports["rtx_notify"]:Notify("Info", "This is info notify", 2500, "info") -- time 1000 = 1 seconds
	
	-----
	
	Server Side Notify TriggerClientEvent("rtx_notify:Notify", source, "Title", "text", time, "type")	
	
	Example Server Side Notify TriggerClientEvent("rtx_notify:Notify", source, "Info", "This is info notify", 2500, "info") -- time 1000 = 1 seconds

]]--

Config.NotifyStyles = {
	["info"] = {
		notifycolor = "#1aa7ec", -- color for notify
		notifytime = 5000, -- time 1000 = 1 second (default time when time is not defined in trigger)
		notifysoundenabled = true, -- true sound enabled -- false sound disabled
		notifysound = "sounds/soundnotify.mp3", -- you can import sounds to html/sounds/ folder
	},
	["success"] = {
		notifycolor = "#07da63", -- color for notify
		notifytime = 5000, -- time 1000 = 1 second (default time when time is not defined in trigger)
		notifysoundenabled = true, -- true sound enabled -- false sound disabled
		notifysound = "sounds/soundnotify.mp3", -- you can import sounds to html/sounds/ folder
	},	
	["warning"] = {
		notifycolor = "#ffe338", -- color for notify
		notifytime = 5000, -- time 1000 = 1 second (default time when time is not defined in trigger)
		notifysoundenabled = true, -- true sound enabled -- false sound disabled
		notifysound = "sounds/soundnotify.mp3", -- you can import sounds to html/sounds/ folder
	},			
	["error"] = {
		notifycolor = "#ff0000", -- color for notify
		notifytime = 5000, -- time 1000 = 1 second (default time when time is not defined in trigger)
		notifysoundenabled = true, -- true sound enabled -- false sound disabled
		notifysound = "sounds/soundnotify.mp3", -- you can import sounds to html/sounds/ folder
	},	
	["custom"] = {
		notifycolor = "#ff66ff", -- color for notify
		notifytime = 5000, -- time 1000 = 1 second (default time when time is not defined in trigger)
		notifysoundenabled = true, -- true sound enabled -- false sound disabled
		notifysound = "sounds/soundnotify.mp3", -- you can import sounds to html/sounds/ folder
	},	
}
