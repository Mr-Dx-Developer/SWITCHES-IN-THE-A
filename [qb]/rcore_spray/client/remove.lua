local IsCurrentlyRemoving = false

RegisterNetEvent('rcore_spray:removeClosestSpray')
AddEventHandler('rcore_spray:removeClosestSpray', function()
    if IsCurrentlyRemoving then return end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local closestSprayLoc = nil
    local closestSprayDist = nil

    local dist = 'timetable@maid@cleaning_window@idle_a'
    local name = 'idle_a'

    for _, spray in pairs(SPRAYS) do
        local sprayPos = spray.location
        local dist = #(sprayPos - coords)

        if dist < 3.0 and (not closestSprayDist or closestSprayDist > dist) then
            closestSprayLoc = sprayPos
            closestSprayDist = dist
        end
    end

    if closestSprayLoc then
        local ragProp = CreateSprayRemoveProp(ped)

        IsCurrentlyRemoving = true
        CancellableProgress(
            Config.SPRAY_REMOVE_DURATION, 
            dist, 
            name, 
            1,
            function()
                IsCurrentlyRemoving = false
                RemoveSprayRemoveProp(ragProp)
                TriggerServerEvent('rcore_spray:remove', closestSprayLoc)
            end, 
            function()
                IsCurrentlyRemoving = false
                RemoveSprayRemoveProp(ragProp)
            end
        )
    else
        TriggerEvent('chat:addMessage', {
            template = '<div style="background: rgb(180, 136, 29); color: rgb(255, 255, 255); padding: 5px;">{0}</div>',
            args = {Config.Text.NO_SPRAY_NEARBY}
        })
    end
end)

function CreateSprayRemoveProp(ped)
    local ragProp = CreateObject(
        `p_loose_rag_01_s`, --`prop_ecola_can`,
        0.0, 0.0, 0.0,
        true, false, false
    )

    AttachEntityToEntity(ragProp, ped, GetPedBoneIndex(ped, 28422), x, y, z, ax, ay, az, true, true, false, true, 1, true)

    return ragProp
end

function RemoveSprayRemoveProp(ent)
    if NetworkGetEntityOwner(ent) ~= PlayerId() then
        NetworkRequestControlOfEntity(ent)
        Wait(500)
    end

    DeleteEntity(ent)
end