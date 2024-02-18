function Open(message, color, position)
	SendNUIMessage({
		action = 'open',
		message = message,
		color = color,
		position = position,
	})
end

function Close()
	SendNUIMessage({
		action = 'close'
	})
end

RegisterNetEvent('okokTextUI:Open')
AddEventHandler('okokTextUI:Open', function(message, color, position)
	Open(message, color, position)
end)

RegisterNetEvent('okokTextUI:Close')
AddEventHandler('okokTextUI:Close', function()
	Close()
end)