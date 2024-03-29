if Config.UseFuel == true then
    function fuel()
        exports["LegacyFuel"]:SetFuel(vehicle, 100)
    end
    function fuel2()
        exports["LegacyFuel"]:SetFuel(vehicle2, 100)
    end
end

if Config.BattlePass.Active then
    function battlepass()
        TriggerEvent("BattlePass-Server:AddXP",Config.BattlePass.xp ,"Trucker")
    end
end

if Config.UseKeys == true then
    function keys()
        TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
    end

    function keys2()
        TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle2))

    end
end

if Config.UseDeleteVehicle then
    function delete(vehicle)
        exports["AdvancedParking"]:DeleteVehicle(vehicle)
    end
    function delete2(vehicle2)
        exports["AdvancedParking"]:DeleteVehicle(vehicle2)
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
    if Config.framework == 'esx' then

     ESX.ShowNotification(text)

    elseif Config.framework == 'qbcore' then

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

    if Config.framework == 'esx' then

        TriggerClientEvent('esx:showNotification', source, text)

    elseif Config.framework == 'qbcore' then

        TriggerClientEvent('QBCore:Notify', source, text)

    end
end

--Blip Police
RegisterNetEvent("BCall:polblip")
AddEventHandler("BCall:polblip", function(ubi)

    blip = AddBlipForRadius(ubi.x, ubi.y, ubi.z , 50.0)
	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha (blip, 128)
    
    Citizen.Wait(25000)

    RemoveBlip(blip)

end)

function home()
    local coords = Config.NPCHOME
    for k in pairs(coords) do
        bliphome = AddBlipForCoord(coords[k].x, coords[k].y, coords[k].z)
        SetBlipSprite(bliphome, 479)
        SetBlipColour(bliphome, 24)
        SetBlipScale(bliphome, 0.8)
        SetBlipAsShortRange(bliphome, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('Trucker Job')
        EndTextCommandSetBlipName(bliphome)
    end
end

function blip1()
    SetNewWaypoint(Point2.x, Point2.y, Point2.z)
    blipdescargar = AddBlipForCoord(Point2.x, Point2.y, Point2.z)
    SetBlipSprite(blipdescargar, 479)
    SetBlipColour(blipdescargar, 24)
    SetBlipScale(blipdescargar, 0.4)
    SetBlipAsShortRange(blipdescargar, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName('transport')
    EndTextCommandSetBlipName(blipdescargar)
end


function blip2()
    SetNewWaypoint(Point2.x, Point2.y, Point2.z)
    blipdescargar = AddBlipForCoord(Point2.x, Point2.y, Point2.z)
    SetBlipSprite(blipdescargar, 479)
    SetBlipColour(blipdescargar, 24)
    SetBlipScale(blipdescargar, 0.4)
    SetBlipAsShortRange(blipdescargar, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName('transport')
    EndTextCommandSetBlipName(blipdescargar)
end

function blip3()
    SetNewWaypoint(Point.x, Point.y, Point.z)
    bliptrailer = AddBlipForCoord(Point.x, Point.y, Point.z)
    SetBlipSprite(bliptrailer, 479)
    SetBlipColour(bliptrailer, 50)
    SetBlipScale(bliptrailer, 1.4)
    SetBlipAsShortRange(bliptrailer, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName('trailer')
    EndTextCommandSetBlipName(bliptrailer)
end

function blip4()
    SetNewWaypoint(Point.x, Point.y, Point.z)
    bliptrailer = AddBlipForCoord(Point.x, Point.y, Point.z)
    SetBlipSprite(bliptrailer, 479)
    SetBlipColour(bliptrailer, 50)
    SetBlipScale(bliptrailer, 1.4)
    SetBlipAsShortRange(bliptrailer, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName('trailers')
    EndTextCommandSetBlipName(bliptrailer)
end

function creapackage()
    SetNewWaypoint(57.88, -2667.32, 6.0)
    for i, v in ipairs(Config.LegalPackagePoints) do
        v.package2 = CreateObject(GetHashKey('prop_cs_cardbox_01'), v.x, v.y, v.z)
        FreezeEntityPosition(v.package2, true)
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 24)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('package')
        EndTextCommandSetBlipName(v.blip)
    end
end

function creapackage2()
    SetNewWaypoint(1541.92, -2085.64, 77.08)
    for i, v in ipairs(Config.IlegalWeaponsPoints) do
        v.package2 = CreateObject(GetHashKey('ex_office_swag_guns03'), v.x, v.y, v.z)
        FreezeEntityPosition(v.package2, true)
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 24)
        SetBlipScale(v.blip, 0.4)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('weapon')
        EndTextCommandSetBlipName(v.blip)
    end
end