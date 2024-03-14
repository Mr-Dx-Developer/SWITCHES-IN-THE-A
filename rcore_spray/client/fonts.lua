
Citizen.CreateThread(function()
    Wait(100)

    for _, fontData in pairs(FONTS) do
        RegisterFontFile(fontData.font)
        RegisterFontId(fontData.font)
    end
end)
