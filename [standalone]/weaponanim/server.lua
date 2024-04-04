------------------------------------------------------------------------
------------------------------------------------------------------------
--			DO NOT EDIT IF YOU DON'T KNOW WHAT YOU'RE DOING			  --
--     							 									  --
--	   For support join my discord: https://discord.gg/Z9Mxu72zZ6	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

-- open menu.
RegisterCommand(config.openCommand, function(source, args, rawCommand)
    TriggerClientEvent('Andyyy:OpenWAM', source)
end, false)

-- Check resource name to ensure callbacks will work.
if GetCurrentResourceName() ~= "weaponanim" then
    print("Error: Change the resource name to \"weaponanim\" or it won't work!")
end