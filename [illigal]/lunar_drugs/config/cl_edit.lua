local fontId = nil

--Change this only if u want to use a custom font.
AddEventHandler('onClientResourceStart', function()
    RegisterFontFile('roboto')
    fontId = RegisterFontId('Roboto')
end)

function Draw3DText(pos, text, lineCount)
	SetTextScale(0.4, 0.25)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
    SetDrawOrigin(pos.x, pos.y, pos.z, false)
    if lineCount > 1 then
	    local factor = (string.len(text)) / 150 / lineCount
        DrawRect(0.0, 0.0105 * lineCount, 0.003 + factor, 0.03 * lineCount, 0, 0, 0, 150)
    else
        local factor = (string.len(text)) / 250
        DrawRect(0.0, 0.0105 * lineCount, 0.003 + factor, 0.03 * lineCount, 0, 0, 0, 150)
    end
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end