function AddMoneyRTX(playersource, moneydata)
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			xPlayer.addMoney(moneydata)
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			xPlayer.Functions.AddMoney('cash', moneydata)
		end
	elseif Config.Framework == "standalone" then
		-- add here money add funciton	
	end
end	

function RemoveMoneyRTX(playersource, moneydata)
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			xPlayer.removeMoney(moneydata)
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			xPlayer.Functions.RemoveMoney('cash', moneydata)	
		end
	elseif Config.Framework == "standalone" then
		-- add here money remove funciton	
	end
end	

function GetMoneyRTX(playersource)
	local moneydata = 0
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			moneydata = xPlayer.getMoney()
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			moneydata = xPlayer.Functions.GetMoney('cash')
		end
	elseif Config.Framework == "standalone" then
		moneydata = 99999999999
		-- add here money get funciton	
	end
	return moneydata
end	

function GiveShootingRangeRewardToPlayer(playersource, prizeiddata)
	local prizegamehandler = Config.ShootingRangePrizes[prizeiddata]
	if prizegamehandler.prizetype == "money" then
		AddMoneyRTX(playersource, prizegamehandler.prizedata)
		TriggerClientEvent("rtx_themepark:Notify", playersource, LanguageFile("prizerewardmoney", prizegamehandler.prizedata))
	end
end

function GetPlayerIdentifierRTX(playersource)
	local playeridentifierdata = ""
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			playeridentifierdata = xPlayer.identifier
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			playeridentifierdata = xPlayer.PlayerData.citizenid
		end
	elseif Config.Framework == "standalone" then
		playeridentifierdata = GetPlayerIdentifiers(playersource)[1]	
	end
	return playeridentifierdata
end

function GetPlayerPermissionsManagment(playersource)
	local playerallowed = false
	if Config.ThemeParkOwnedSettings.acepermissionsforusemanagmentmenu.enable == true then
		if IsPlayerAceAllowed(playersource, Config.ThemeParkOwnedSettings.acepermissionsforusemanagmentmenu.permission) then 
			playerallowed = true
		end
	end
	if Config.ThemeParkOwnedSettings.jobpermissionsforusemanagmentmenu.enable == true then
		if Config.Framework == "esx" then
			local xPlayer = ESX.GetPlayerFromId(playersource)
			if xPlayer then
				if xPlayer.job.name == Config.ThemeParkOwnedSettings.jobpermissionsforusemanagmentmenu.jobname then
					playerallowed = true
				end
			end
		elseif Config.Framework == "qbcore" then
			local xPlayer = QBCore.Functions.GetPlayer(playersource)
			if xPlayer then	
				if xPlayer.PlayerData.job.name == Config.ThemeParkOwnedSettings.jobpermissionsforusemanagmentmenu.jobname then
					playerallowed = true
				end
			end
		elseif Config.Framework == "standalone" then
			-- add here your job check function
		end
	end	
	if Config.ThemeParkOwnedSettings.identifierspermissionsforusemanagmentmenu == true then
		local licensedata = "unknown"
		local steamdata = "unknown"
		local xboxdata = "unknown"
		local livedata = "unknown"
		local discorddata = "unknown"
		local ipdata = "unknown"
		for i, licensehandler in ipairs(GetPlayerIdentifiers(playersource)) do
			if string.sub(licensehandler, 1,string.len("steam:")) == "steam:" then
				steamdata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("license:")) == "license:" then
				licensedata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("live:")) == "live:" then
				livedata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("xbl:")) == "xbl:" then
				xboxdata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("discord:")) == "discord:" then
				discorddata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("ip:")) == "ip:" then
				ipdata = tostring(licensehandler)
			end
		end			
		for i, permissionhandler in ipairs(Config.ThemeParkOwnedSettings.permissionsviaidentifiers) do
			if permissionhandler.permissiontype == "license" then
				if permissionhandler.permisisondata == licensedata then
					playerallowed = true
					break
				end
			end
			if permissionhandler.permissiontype == "steam" then
				if permissionhandler.permisisondata == steamdata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "xbox" then
				if permissionhandler.permisisondata == xboxdata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "live" then
				if permissionhandler.permisisondata == livedata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "discord" then
				if permissionhandler.permisisondata == discorddata then
					playerallowed = true
					break
				end
			end		
			if permissionhandler.permissiontype == "ip" then
				if permissionhandler.permisisondata == ipdata then
					playerallowed = true
					break
				end
			end							
		end
	end		
	return playerallowed
end

function GetPlayerPermissionsControlAttraction(playersource)
	local playerallowed = false
	if Config.ThemeParkControlMachineSettings.acepermissionsforusecontrolmenu.enable == true then
		if IsPlayerAceAllowed(playersource, Config.ThemeParkControlMachineSettings.acepermissionsforusecontrolmenu.permission) then 
			playerallowed = true
		end
	end
	if Config.ThemeParkControlMachineSettings.jobpermissionsforusecontrolmenu.enable == true then
		if Config.Framework == "esx" then
			local xPlayer = ESX.GetPlayerFromId(playersource)
			if xPlayer then
				if xPlayer.job.name == Config.ThemeParkControlMachineSettings.jobpermissionsforusecontrolmenu.jobname then
					playerallowed = true
				end
			end
		elseif Config.Framework == "qbcore" then
			local xPlayer = QBCore.Functions.GetPlayer(playersource)
			if xPlayer then	
				if xPlayer.PlayerData.job.name == Config.ThemeParkControlMachineSettings.jobpermissionsforusecontrolmenu.jobname then
					playerallowed = true
				end
			end
		elseif Config.Framework == "standalone" then
			-- add here your job check function
		end
	end	
	if Config.ThemeParkControlMachineSettings.identifierspermissionsforcontrolmenu == true then
		local licensedata = "unknown"
		local steamdata = "unknown"
		local xboxdata = "unknown"
		local livedata = "unknown"
		local discorddata = "unknown"
		local ipdata = "unknown"
		for i, licensehandler in ipairs(GetPlayerIdentifiers(playersource)) do
			if string.sub(licensehandler, 1,string.len("steam:")) == "steam:" then
				steamdata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("license:")) == "license:" then
				licensedata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("live:")) == "live:" then
				livedata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("xbl:")) == "xbl:" then
				xboxdata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("discord:")) == "discord:" then
				discorddata = tostring(licensehandler)
			elseif string.sub(licensehandler, 1,string.len("ip:")) == "ip:" then
				ipdata = tostring(licensehandler)
			end
		end			
		for i, permissionhandler in ipairs(Config.ThemeParkControlMachineSettings.permissionsviaidentifiers) do
			if permissionhandler.permissiontype == "license" then
				if permissionhandler.permisisondata == licensedata then
					playerallowed = true
					break
				end
			end
			if permissionhandler.permissiontype == "steam" then
				if permissionhandler.permisisondata == steamdata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "xbox" then
				if permissionhandler.permisisondata == xboxdata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "live" then
				if permissionhandler.permisisondata == livedata then
					playerallowed = true
					break
				end
			end	
			if permissionhandler.permissiontype == "discord" then
				if permissionhandler.permisisondata == discorddata then
					playerallowed = true
					break
				end
			end		
			if permissionhandler.permissiontype == "ip" then
				if permissionhandler.permisisondata == ipdata then
					playerallowed = true
					break
				end
			end							
		end
	end		
	return playerallowed
end

if Config.ThemeParkPass then
	if Config.Framework == "esx" then
		ESX.RegisterUsableItem("themeparkpass", function(source)
			local playersource = source
			local xPlayer = ESX.GetPlayerFromId(playersource)
			if xPlayer then
				xPlayer.removeInventoryItem("themeparkpass", 1)
				TriggerClientEvent("rtx_themepark:Notify", playersource, LanguageFile("themeparkpassactivated", Config.ThemeParkPassTime))
				TriggerClientEvent("rtx_themepark:Global:ThemeParkPassActivate", playersource)					
			end
		end)		
	elseif Config.Framework == "qbcore" then
		QBCore.Functions.CreateUseableItem("themeparkpass", function(source, item)
			local playersource = source
			local Player = QBCore.Functions.GetPlayer(playersource)
			if Player then
				Player.Functions.RemoveItem("themeparkpass", 1)
				TriggerClientEvent("rtx_themepark:Notify", playersource, LanguageFile("themeparkpassactivated", Config.ThemeParkPassTime))
				TriggerClientEvent("rtx_themepark:Global:ThemeParkPassActivate", playersource)
			end
		end)		
	elseif Config.Framework == "standalone" then
		-- add here your usable item funciton
	end
end

if Config.Framework == "esx" then
	RegisterCommand("enablethemepark", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if themeparkdisabled == true then
				themeparkdisabled = false
				print(Language[Config.Language]["themeparkallowed"])
			else
				themeparkdisabled = true
				print(Language[Config.Language]["themeparkblocked"])
			end
		else
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				if themeparkdisabled == true then
					themeparkdisabled = false
					TriggerClientEvent("rtx_themepark:Notify", playersource, Language[Config.Language]["themeparkallowed"])
				else
					themeparkdisabled = true
					TriggerClientEvent("rtx_themepark:Notify", playersource, Language[Config.Language]["themeparkblocked"])
				end
			end
		end
	end)
elseif Config.Framework == "qbcore" then
	RegisterCommand("enablethemepark", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if themeparkdisabled == true then
				themeparkdisabled = false
				print(Language[Config.Language]["themeparkallowed"])
			else
				themeparkdisabled = true
				print(Language[Config.Language]["themeparkblocked"])
			end
		else
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				if themeparkdisabled == true then
					themeparkdisabled = false
					TriggerClientEvent("rtx_themepark:Notify", playersource, Language[Config.Language]["themeparkallowed"])
				else
					themeparkdisabled = true
					TriggerClientEvent("rtx_themepark:Notify", playersource, Language[Config.Language]["themeparkblocked"])
				end
			end
		end
	end)
elseif Config.Framework == "standalone" then
	RegisterCommand("enablethemepark", function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if themeparkdisabled == true then
				themeparkdisabled = false
				print(Language[Config.Language]["themeparkallowed"])
			else
				themeparkdisabled = true
				print(Language[Config.Language]["themeparkblocked"])
			end
		else
		end
	end)
end