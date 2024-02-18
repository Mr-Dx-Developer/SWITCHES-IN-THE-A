AddEventHandler("Debux:open:admin")
RegisterNetEvent("Debux:open:admin", function ()
	SetNuiFocus(true, true)
    SendNUIMessage({
      action = "announceadmin"
    })
end)

AddEventHandler("Debux:open:client")
RegisterNetEvent("Debux:open:client", function ()
	SetNuiFocus(true, true)
    SendNUIMessage({
      action = "announceclient"
    })
end)


RegisterNUICallback("close", function ()
	SetNuiFocus(false,false)
end)

RegisterNUICallback("button-1", function (data)
	text = data.id 
	TriggerServerEvent("button:server-1", text)
end)

AddEventHandler("notify-1")
RegisterNetEvent("notify-1", function (text)
	SendNUIMessage({
		action = "notify-1",
		text = text,
		servername = Config.servvername
	})
	Citizen.Wait(Config.wait)
	SendNUIMessage({
		action = "notify-1-display",
	})
	Citizen.Wait(1000)
	SendNUIMessage({
		action = "notify-1-display-N",
	})
end)

RegisterNUICallback("button-2", function (data)
	text = data.id 
	TriggerServerEvent("button:server-2", text)
end)

AddEventHandler("notify-2")
RegisterNetEvent("notify-2", function (text)
	SendNUIMessage({
		action = "notify-2",
		text = text,
		servername = Config.servvername
	})
	Citizen.Wait(Config.wait)
	SendNUIMessage({
		action = "notify-2-display",
	})
	Citizen.Wait(1000)
	SendNUIMessage({
		action = "notify-2-display-N",
	})
end)

AddEventHandler("Debux:addpost")
RegisterNetEvent("Debux:addpost", function (tarih,text)
	SendNUIMessage({
		action = "addpost-1",
		servername =  Config.servvername,
		tarih = tarih,
		text = text
	})
end)

AddEventHandler("Debux:addpost-2")
RegisterNetEvent("Debux:addpost-2", function (tarih,text)
	SendNUIMessage({
		action = "addpost-2",
		servername =  Config.servvername,
		tarih = tarih,
		text = text
	})
end)

AddEventHandler("Debux:addpost-2-big")
RegisterNetEvent("Debux:addpost-2-big", function (tarih,text)
	SendNUIMessage({
		action = "addpost-2-big",
		servername =  Config.servvername,
		tarih = tarih,
		text = text
	})
end)

RegisterNUICallback("button-3", function (data)
	TriggerServerEvent("debux:databasesave", data.tarih,data.id)
end)

RegisterNUICallback("button-4", function (data)
	TriggerServerEvent("debux:databasesave", data.tarih,data.id)
end)

CreateThread(function()
		if Config.cooldownmessage.message then
		while true do
			Citizen.Wait(Config.cooldownmessage.wait * 60000)
			TriggerServerEvent("button:server-1", Config.cooldownmessage.text)
			Wait(7)
		end
	end
end) 