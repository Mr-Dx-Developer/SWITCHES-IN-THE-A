-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = nil

CreateThread(function()
	local config = lib.callback.await('wasabi_discord:getConfig', 200)
	Config = config
	while Config == nil do
		Wait(5)
	end
	if Config.DiscordQueue.enabled then
		players, connectInfo = {}, {}
		local firstSpawn = true
		AddEventHandler("playerSpawned", function()
			if firstSpawn then
				TriggerServerEvent('wasabi_discord:removeFromQueue')
				firstSpawn = false
			end
		end)
	end
end)