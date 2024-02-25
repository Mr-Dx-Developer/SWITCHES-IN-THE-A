local blackMarketPed = nil
local slipsPed = nil
local electronicPed = nil
local bankerPed = nil

CreateThread(function()
    while true do
        Wait(0)
        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local elecDist = #(vector3(KonfigCL.ElectronicsBuyLocation.x, KonfigCL.ElectronicsBuyLocation.y, KonfigCL.ElectronicsBuyLocation.z) - playerCoords)
        local blackMDist = #(vector3(KonfigCL.BlackMarketBuyLocation.x, KonfigCL.BlackMarketBuyLocation.y, KonfigCL.BlackMarketBuyLocation.z) - playerCoords)
        local slipDist = #(vector3(KonfigCL.WhiteSlipBuyLocation.x, KonfigCL.WhiteSlipBuyLocation.y, KonfigCL.WhiteSlipBuyLocation.z) - playerCoords)
        local bankDist = #(vector3(KonfigCL.BankerLocation.x, KonfigCL.BankerLocation.y, KonfigCL.BankerLocation.z) - playerCoords)
        if blackMDist <= 5.0 then
            if KonfigCL.DrawMakers then
                if KonfigCL.NPCEnable then
                    DrawMarker(2, KonfigCL.BlackMarketBuyLocation.x, KonfigCL.BlackMarketBuyLocation.y, KonfigCL.BlackMarketBuyLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                else
                    DrawMarker(2, KonfigCL.BlackMarketBuyLocation.x, KonfigCL.BlackMarketBuyLocation.y, KonfigCL.BlackMarketBuyLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                end
            end
            if not KonfigCL.EyeTarget then
                if blackMDist <= 1.2 then 
                    Draw3DText( KonfigCL.BlackMarketBuyLocation.x, KonfigCL.BlackMarketBuyLocation.y, KonfigCL.BlackMarketBuyLocation.z+0.3, '[E] to open this shop')
                    if IsControlJustPressed(0, 38) then
                        PlayPedAmbientSpeechNative(blackMarketPed, "GENERIC_HI", "SPEECH_PARAMS_SHOUTED")
                        TriggerEvent('k_fraudshops:openBlackmarket')
                    end
                end
            end
        elseif slipDist <= 5.0 then
            if KonfigCL.DrawMakers then
                if KonfigCL.NPCEnable then
                    DrawMarker(2, KonfigCL.WhiteSlipBuyLocation.x, KonfigCL.WhiteSlipBuyLocation.y, KonfigCL.WhiteSlipBuyLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                else
                    DrawMarker(2, KonfigCL.WhiteSlipBuyLocation.x, KonfigCL.WhiteSlipBuyLocation.y, KonfigCL.WhiteSlipBuyLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                end
            end
            if not KonfigCL.EyeTarget then
                if slipDist <= 1.2 then 
                    Draw3DText( KonfigCL.WhiteSlipBuyLocation.x, KonfigCL.WhiteSlipBuyLocation.y, KonfigCL.WhiteSlipBuyLocation.z+0.3, '[E] to open this shop')
                    if IsControlJustPressed(0, 38) then
                    PlayPedAmbientSpeechNative(slipsPed, "GENERIC_HI", "SPEECH_PARAMS_SHOUTED")
                    TriggerEvent('k_fraudshops:openSlips')
                    end
                end
            end
        elseif elecDist <= 5.0 then
            if KonfigCL.DrawMakers then
                if KonfigCL.NPCEnable then
                    DrawMarker(2, KonfigCL.ElectronicsBuyLocation.x, KonfigCL.ElectronicsBuyLocation.y, KonfigCL.ElectronicsBuyLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                else
                    DrawMarker(2, KonfigCL.ElectronicsBuyLocation.x, KonfigCL.ElectronicsBuyLocation.y, KonfigCL.ElectronicsBuyLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                end
            end
            if not KonfigCL.EyeTarget then
                if elecDist <= 1.2 then
                    Draw3DText(KonfigCL.ElectronicsBuyLocation.x, KonfigCL.ElectronicsBuyLocation.y, KonfigCL.ElectronicsBuyLocation.z+0.3, '[E] to open this shop')
                    if IsControlJustPressed(0, 38) then
                        PlayPedAmbientSpeechNative(electronicPed, "GENERIC_HI", "SPEECH_PARAMS_SHOUTED")
                    TriggerEvent('k_fraudshops:openDigitalDen')
                    end
                end
            end
        elseif bankDist <= 5.0 then
            if KonfigCL.Banker then
                if KonfigCL.DrawMakers then
                    if KonfigCL.NPCEnable then
                        DrawMarker(2, KonfigCL.BankerLocation.x, KonfigCL.BankerLocation.y, KonfigCL.BankerLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                    else
                        DrawMarker(2,KonfigCL.BankerLocation.x, KonfigCL.BankerLocation.y, KonfigCL.BankerLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                    end
                end
                if not KonfigCL.EyeTarget then
                    if bankDist < 2.2 then
                        local coords = GetEntityCoords(PlayerPedId())
                        Draw3DText(KonfigCL.BankerLocation.x, KonfigCL.BankerLocation.y, KonfigCL.BankerLocation.z+0.3, '[E] Sell check to banker')
                        if IsControlJustPressed(0, 38) then
                            PlayPedAmbientSpeechNative(bankerPed, "GENERIC_HI", "SPEECH_PARAMS_SHOUTED")
                            TriggerServerEvent('k_fraudshops:sellCheck', coords)
                        end
                    end
                end
            end
        else
            Wait(2000)
        end
    end
end)
        

Citizen.CreateThread(function()
    if KonfigCL.NPCEnable then
        RequestModel(KonfigCL.BlackMarketNPC)
        while not HasModelLoaded(KonfigCL.BlackMarketNPC) do
            Wait(1)
        end
        RequestModel(KonfigCL.WhiteSlipNPC)
        while not HasModelLoaded(KonfigCL.WhiteSlipNPC) do
            Wait(1)
        end
        RequestModel(KonfigCL.ElectronicNPC)
        while not HasModelLoaded(KonfigCL.ElectronicNPC) do
            Wait(1)
        end

        RequestModel(KonfigCL.BankerNPC)
        while not HasModelLoaded(KonfigCL.BankerNPC) do
            Wait(1)
        end

        blackMarketPed = CreatePed(1, KonfigCL.BlackMarketNPC, KonfigCL.BlackMarketBuyLocation.x, KonfigCL.BlackMarketBuyLocation.y, KonfigCL.BlackMarketBuyLocation.z+-1.0, KonfigCL.BlackMarketBuyLocation.w, false, true)
        SetBlockingOfNonTemporaryEvents(blackMarketPed, true)
        SetPedDiesWhenInjured(blackMarketPed, false)
        SetPedCanPlayAmbientAnims(blackMarketPed, true)
        SetPedCanRagdollFromPlayerImpact(blackMarketPed, false)
        SetEntityInvincible(blackMarketPed, true)
        FreezeEntityPosition(blackMarketPed, true)
        TaskStartScenarioInPlace(blackMarketPed, "WORLD_HUMAN_SMOKING", 0, true);
        SetModelAsNoLongerNeeded(blackMarketPed)

        slipsPed = CreatePed(1, KonfigCL.WhiteSlipNPC, KonfigCL.WhiteSlipBuyLocation.x, KonfigCL.WhiteSlipBuyLocation.y, KonfigCL.WhiteSlipBuyLocation.z+-1.0, KonfigCL.WhiteSlipBuyLocation.w, false, true)
        SetBlockingOfNonTemporaryEvents(slipsPed, true)
        SetPedDiesWhenInjured(slipsPed, false)
        SetPedCanPlayAmbientAnims(slipsPed, true)
        SetPedCanRagdollFromPlayerImpact(slipsPed, false)
        SetEntityInvincible(slipsPed, true)
        FreezeEntityPosition(slipsPed, true)
        TaskStartScenarioInPlace(slipsPed, "WORLD_HUMAN_CLIPBOARD", 0, true);
        SetModelAsNoLongerNeeded(slipsPed)

        electronicPed = CreatePed(1, KonfigCL.ElectronicNPC, KonfigCL.ElectronicsBuyLocation.x, KonfigCL.ElectronicsBuyLocation.y, KonfigCL.ElectronicsBuyLocation.z+-1.0, KonfigCL.ElectronicsBuyLocation.w, false, true)
        SetBlockingOfNonTemporaryEvents(electronicPed, true)
        SetPedDiesWhenInjured(electronicPed, false)
        SetPedCanPlayAmbientAnims(electronicPed, true)
        SetPedCanRagdollFromPlayerImpact(electronicPed, false)
        SetEntityInvincible(electronicPed, true)
        FreezeEntityPosition(electronicPed, true)
        TaskStartScenarioInPlace(electronicPed, "WORLD_HUMAN_CLIPBOARD", 0, true);
        SetModelAsNoLongerNeeded(electronicPed)

        bankerPed = CreatePed(1, KonfigCL.BankerNPC, KonfigCL.BankerLocation.x, KonfigCL.BankerLocation.y, KonfigCL.BankerLocation.z+-1.0,  KonfigCL.BankerLocation.w, false, true)
        SetBlockingOfNonTemporaryEvents(bankerPed, true)
        SetPedDiesWhenInjured(bankerPed, false)
        SetPedCanPlayAmbientAnims(bankerPed, true)
        SetPedCanRagdollFromPlayerImpact(bankerPed, false)
        SetEntityInvincible(bankerPed, true)
        FreezeEntityPosition(bankerPed, true)
        TaskStartScenarioInPlace(bankerPed, "WORLD_HUMAN_CLIPBOARD", 0, true);
        SetModelAsNoLongerNeeded(bankerPed)

        if KonfigCL.EyeTarget then
            exports['qtarget']:AddTargetEntity(bankerPed, {
                options = {
                {
                    type = "server",
                    event = "k_fraudshops:sellCheck",
                    args = coords,
                    icon = 'fas fa-clipboard',
                    label = 'Cash in check.',
                }
                },
                distance = 2.5,
            })
            exports['qtarget']:AddTargetEntity(electronicPed, {
                options = {
                {
                    type = "client",
                    event = "k_fraudshops:openDigitalDen",
                    icon = 'fas fa-clipboard',
                    label = 'Open Shop.',
                }
                },
                distance = 2.5,
            })
            exports['qtarget']:AddTargetEntity(slipsPed, {
                options = {
                {
                    type = "client",
                    event = "k_fraudshops:openSlips",
                    icon = 'fas fa-clipboard',
                    label = 'Open Shop.',
                }
                },
                distance = 2.5,
            })
            exports['qtarget']:AddTargetEntity(blackMarketPed, {
                options = {
                {
                    type = "client",
                    event = "k_fraudshops:openBlackmarket",
                    icon = 'fas fa-clipboard',
                    label = 'Open Shop.',
                }
                },
                distance = 2.5,
            })
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    if KonfigCL.NPCEnable then
        DeleteEntity(electronicPed)
        DeleteEntity(slipsPed)
        DeleteEntity(blackMarketPed)
        DeleteEntity(bankerPed)
    end
end)
  





function Draw3DText(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75) --comment this out to remove background on 3dtext
    ClearDrawOrigin()
end


local alert = false
local savedBlips = {}
RegisterNetEvent('k_fraud:setblip')
AddEventHandler('k_fraud:setblip', function(position, alerttype)
    if alerttype == 1 then 
        blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
        SetBlipSprite(blipRobbery , 42)
        SetBlipScale(blipRobbery , 0.8)
        SetBlipColour(blipRobbery, 0)
        PulseBlip(blipRobbery)
        table.insert(savedBlips, blipRobbery)
        PlaySoundFrontend(-1, "COLLECTED", "HUD_AWARDS", 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Forged Bank Check Alert')
        EndTextCommandSetBlipName(blipRobbery)
    else  -- cloned card ate alert
        blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
        SetBlipSprite(blipRobbery , 161)
        SetBlipScale(blipRobbery , 0.5)
        SetBlipColour(blipRobbery, 1)
        PulseBlip(blipRobbery)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Cloned Card Alert')
        EndTextCommandSetBlipName(blipRobbery)
        table.insert(savedBlips, blipRobbery)
        PlaySoundFrontend(-1, "COLLECTED", "HUD_AWARDS", 1)
    end
    if alert == false then
        alert = true
        CreateThread(function()
            while alert do
                Wait(0)
                DrawHudText2('Alert check map!', {0,200,255,255},0.5,0.95,0.4,0.4)
            end
        end)
        Wait(5000)
        alert = false
    end
    CreateThread(function()
        Wait(10000)
        for k,v in pairs(savedBlips) do  
            RemoveBlip(v)
        end
    end)
end)



function DrawHudText2(text,colour,coordsx,coordsy,scalex,scaley)
	SetTextFont(7)
	SetTextProportional(7)
	SetTextScale(scalex, scaley)
	local colourr,colourg,colourb,coloura = table.unpack(colour)
	SetTextColour(colourr,colourg,colourb, coloura)
	SetTextDropshadow(0, 0, 0, 0, coloura)
	SetTextEdge(1, 0, 0, 0, coloura)
	SetTextDropShadow()
	SetTextJustification(0)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	EndTextCommandDisplayText(coordsx,coordsy)
end