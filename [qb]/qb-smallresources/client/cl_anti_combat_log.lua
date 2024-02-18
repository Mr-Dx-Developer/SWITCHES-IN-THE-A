local function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(Config.TextColor.r, Config.TextColor.g, Config.TextColor.b, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

local function DrawText3DSecond(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.30, 0.30)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(Config.AlertTextColor.r, Config.AlertTextColor.g, Config.AlertTextColor.b, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

local function Display(id, crds, identifier, reason)
    local displaying = true
    CreateThread(function()
        Wait(Config.DrawingTime)
        displaying = false
    end)
    CreateThread(function()
        while displaying do
            Wait(5)
            local pcoords = GetEntityCoords(PlayerPedId())
            local CRD = vector3(crds.x , crds.y , crds.z)
            local Dist = #(CRD - pcoords)
            if show3DText and #(crds - pcoords) < 15.0 then
                DrawText3DSecond(crds.x, crds.y, crds.z+0.15, "Player Left Game")
                DrawText3D(crds.x, crds.y, crds.z, "ID: "..id.." ("..identifier..")\nReason: "..reason)
            else
                Wait(2000)
            end
        end
    end)
end

RegisterNetEvent("pixel_anticl", function(id, crds, identifier, reason)
    Wait(2000)
    Display(id, crds, identifier, reason)
end)