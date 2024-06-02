U.SendBill = function(data)
    if Config.Framework == 'esx' then
        TriggerServerEvent(Config.ListEvent[Config.Framework]['bill'], data.player, data.type, Lang['NAILS'], data.amount)
    elseif Config.Framework == 'qb' then
        -- ADD YOUR CODE FOR QB
    end
end

U.Notify = function(msg, type)
    --Here you can edit your notification
    if Config.Framework == 'qb' then
        Framework.Functions.Notify(msg, type)
	elseif Config.Framework == 'esx' then
		Framework.ShowNotification(msg)
	end

    --exports['mythic_notify']:DoHudText(type, msg) --Notification mythic
end

-- NOTE If you use cd_drawtext or other and you use esx you must change Config.PassiveHelpNotify to true in config.lua
U.ShowHelpNotification = function(text)
    --Here you can edit your show HelpNotification
	if Config.Framework == 'qb' then
		exports[Config.NameListResource['qb']]:DrawText(text, 'left')
	elseif Config.Framework == 'esx' then
		Framework.ShowHelpNotification(text)
	end

    --TriggerEvent('cd_drawtextui:ShowUI', 'show', text) -- show cd_drawtextui
end

U.HideHelpNotification = function()
    --Here you can edit your hide HelpNotification
	if Config.Framework == 'qb' then
		exports[Config.NameListResource['qb']]:HideText()
	elseif Config.Framework == 'esx' then

	end

    --TriggerEvent('cd_drawtextui:HideUI') -- hide cd_drawtextui
end

U.RefreshTattoes = function()
    -- Here you can change the trigger to refresh the tattoos
    TriggerEvent('Refresh:Tattooes')
end