RegisterNetEvent('7n_reward:notify')
AddEventHandler('7n_reward:notify', function(message)
	if Config.framework == "esx" then
    	ESX.ShowNotification(getMessage(message))
	else
		QBCore.Functions.Notify(getMessage(message))
	end
end)

function notify(message, extra)
	if Config.framework == "esx" then
		if extra then
			ESX.ShowNotification(getMessage(message).." "..extra)
		else
			ESX.ShowNotification(getMessage(message))
		end
	else
		if extra then
			QBCore.Functions.Notify(getMessage(message).." "..extra)
		else
			QBCore.Functions.Notify(getMessage(message))
		end
	end
end

function getMessage(message)
    return Config.Locale[Config.language][message]
end

function announce(text, delay)
	if Config.framework == "esx" then
		ESX.ShowNotification("Announcement: "..text, "info", delay)
	else
		QBCore.Functions.Notify("Announcement: "..text, "info", delay)
	end
end

function leftNotify(msg, thisFrame, beep, duration)
    AddTextEntry('stg', msg)

	if thisFrame then
		DisplayHelpTextThisFrame('stg', false)
	else
		if beep == nil then beep = true end
		BeginTextCommandDisplayHelp('stg')
		EndTextCommandDisplayHelp(0, false, beep, duration or -1)
	end
end