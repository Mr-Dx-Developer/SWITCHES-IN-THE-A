---------------------------------------------------------------------------------------------
-------------------PLEASE CHECK OUR VIDEO TO KNOW HOW OUR SCRIPT WORKS-----------------------
---         Here's the Whitelisted event called if you enable the whitelist system         --
---            https://patamods.gitbook.io/patamods-documentation/scripts/baby-script      --
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


RegisterServerEvent('PataBaby:IsWhitelisted')
AddEventHandler('PataBaby:IsWhitelisted', function()
	local player = source
	local authorized = false


	for k,v in pairs(WhitelistId) do
		for k1,v1 in ipairs(GetPlayerIdentifiers(player)) do
			-- print(tostring(v1))
			if v == v1 then
				authorized = true
				break;
			end
		end
		if authorized == true then
			break;
		end
	end
	
	print(tostring(player).." is authorized : "..tostring(authorized))
	TriggerClientEvent('PataBaby:CLIIsWhitelisted',player,authorized)

end)