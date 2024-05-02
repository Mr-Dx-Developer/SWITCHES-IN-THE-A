if Configuration.UseKeys then
    function keys(Plate)
        TriggerEvent("vehiclekeys:client:SetOwner", Plate) 
    end
end

if Configuration.UseFuel then
    function fuel(fuelvehicle)
        exports["LegacyFuel"]:SetFuel(fuelvehicle, 100)
    end
end

if Configuration.UseDeleteVehicle then
    function delete(deletevehicles)
        exports["AdvancedParking"]:DeleteVehicle(deletevehicles)
    end
end

canUseINV = function(bool)
    TriggerEvent('canUseInventoryAndHotbar:toggle', bool)
end

function GiveItem(xPlayer,itemname,cantidad)
    if Configuration.framework == 'esx' then       
     
        xPlayer.addInventoryItem(itemname,cantidad)  
   
    elseif Configuration.framework == 'qbcore' then
   
        xPlayer.Functions.AddItem(itemname,cantidad)  
   
    end
end

function progress()
    if Configuration.framework == 'esx' then
        exports['BCall_progress']:muestra(4020, 'Preparing...')
    else
        exports['BCall_progress']:muestra(4020, 'Changing clothes…')
    end
end



function marker()
    DrawMarker(25, clothes.x, clothes.y, clothes.z-0.85, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 135, 135, false, true, 2, false, false, false, false)
end

function Blips(NPC)
    for i, v in ipairs(NPC) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 280)
        SetBlipColour(v.blip, 27)
        SetBlipScale(v.blip, 0.7)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Infinite Jobs")
        EndTextCommandSetBlipName(v.blip)
    end
end

function setblip(blip, nameblip)
    for i, v in ipairs(blip) do 
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 50)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(nameblip)
        EndTextCommandSetBlipName(v.blip)
        SetBlipRoute(v.blip, true)
        SetBlipRouteColour(v.blip,29)
    end
end

function setblip2(blip2, nameblip2)
    for i, v in ipairs(blip2) do 
        v.blip2 = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip2, 366)
        SetBlipColour(v.blip2, 50)
        SetBlipScale(v.blip2, 0.8)
        SetBlipAsShortRange(v.blip2, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(nameblip2)
        EndTextCommandSetBlipName(v.blip2)
        SetBlipRoute(v.blip2, true)
        SetBlipRouteColour(v.blip2,29)
    end
end

function setblip3(blip3, nameblip3)
    for i, v in ipairs(blip3) do 
        v.blip3 = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip3, 545)
        SetBlipColour(v.blip3, 50)
        SetBlipScale(v.blip3, 0.6)
        SetBlipAsShortRange(v.blip3, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(nameblip3)
        EndTextCommandSetBlipName(v.blip3)
        SetBlipRoute(v.blip3, true)
        SetBlipRouteColour(v.blip3,29)
    end
end

function setblip4(blip4, nameblip4)
    for i, v in ipairs(blip4) do 
        v.blip4 = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip4, 500)
        SetBlipColour(v.blip4, 50)
        SetBlipScale(v.blip4, 0.6)
        SetBlipAsShortRange(v.blip4, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(nameblip4)
        EndTextCommandSetBlipName(v.blip4)
        SetBlipRoute(v.blip4, true)
        SetBlipRouteColour(v.blip4,29)
    end
end

function hintToDisplay(text,coords)
	local dist = Vdist(coords.x,coords.y,coords.z,GetEntityCoords(PlayerPedId(-1)))
    if dist < 1.5 then
        DrawText3Ds(coords.x,coords.y,coords.z + 1.05,text, 0, 0.1, 0.1,255)
    else
        DrawText3Ds(coords.x,coords.y,coords.z + 1.05,text, 0, 0.1, 0.1,100)
    end
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Client notifications
function SendClientNotification(type, text, time)
    -- time = 10000
    -- if type == 'success' then
    --     exports["Venice-Notification"]:Notify(text, time, "check", options)
    -- elseif type == 'error' then
    --     exports["Venice-Notification"]:Notify(text, time, "error", options)
    -- elseif type == 'info' then
    --     exports["Venice-Notification"]:Notify(text, time, "info", options)
    -- end
    if Configuration.framework == 'esx' then 

     ESX.ShowNotification(text)

    elseif Configuration.framework == 'qbcore' then

     QBCore.Functions.Notify(text)

    end
end

-- Server side notifications
function SendServerNotification(source, type, text, time)
    -- time = 10000
    -- if type == 'success' then
    --     TriggerClientEvent('codem-notification', source, text, time, 'check', options)
    -- elseif type == 'error' then
    --     TriggerClientEvent('codem-notification', source, text, time, 'error', options)
    -- elseif type == 'info' then
    --     TriggerClientEvent('codem-notification', source, text, time, 'info', options)
    -- end

    if Configuration.framework == 'esx' then

        TriggerClientEvent('esx:showNotification', source, text)

    elseif Configuration.framework == 'qbcore' then

        TriggerClientEvent('QBCore:Notify', source, text)

    end
end