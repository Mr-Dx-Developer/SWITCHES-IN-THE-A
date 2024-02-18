function Alert(color,message,time)
    guiEnabled = true
    SendNUIMessage({runProgress = true, colorsent = color, textsent = message, fadesent = time})
end

function closeGui()
    guiEnabled = false
    SendNUIMessage({closeProgress = true})
end
