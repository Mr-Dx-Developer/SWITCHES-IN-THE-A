local isNearCourt = false

local basketVolume = 0.5

function ProcessVolumeSelector()
    local kvpVolume = GetResourceKvpInt('basketVolume')

    if kvpVolume == 0 then
        basketVolume = 0.2
    elseif kvpVolume == -1 then
        basketVolume = 0
    else
        basketVolume = (kvpVolume or 10) / 100
    end
end

Citizen.CreateThread(function()
    ProcessVolumeSelector()

    while true do
        Wait(2000)

        local nowIsNear = false
        
		for _, hoopData in pairs(BasketballHoops) do
            if hoopData.IsSubscribed then
                nowIsNear = true
            end
        end

        isNearCourt = nowIsNear
    end
end)

RegisterCommand('basketvolume', function(_, args)
    local volume = math.max(0, math.min(100, tonumber(math.floor(args[1]))))
    if volume == 0 then
        SetResourceKvpInt('basketVolume', -1)
    else
        SetResourceKvpInt('basketVolume', volume)
    end
    ProcessVolumeSelector()
end)

Citizen.CreateThread(function()
    while true do
        if isNearCourt then
            Wait(200)
            local _, fwd, up, _ = GetCamMatrix(0)

            local cameraRotation = GetGameplayCamRot()
            local cameraCoord = GetGameplayCamCoord()
            local direction = RotationToDirection(cameraRotation)

            SendNUIMessage({
                type = 'setOrientation',
                fwd = direction,
                up = vector3(0.0, 0.0, 1.0),
                coord = cameraCoord,
            })
        else
            Wait(2000)
        end
    end
end)

function PlayHoopNetSound(pos)
    if isNearCourt then
        SendNUIMessage({
            type = 'playSound',
            position = pos,
            volume = 1.0 * basketVolume,
            sounds = {'hoop_net_1','hoop_net_2','hoop_net_3','hoop_net_4','hoop_net_5'},
        })
    end
end

function PlayBackboardSound(pos)
    if isNearCourt then
        SendNUIMessage({
            type = 'playSound',
            position = pos,
            volume = 0.6 * basketVolume,
            sounds = {'backboard'},
        })
    end
end

function PlayBounceSound(pos)
    if isNearCourt then
        SendNUIMessage({
            type = 'playSound',
            position = pos,
            volume = 1.0 * basketVolume,
            sounds = {'bounce_1','bounce_2','bounce_3','bounce_4','bounce_5'},
        })
    end
end

-- Citizen.CreateThread(function()
--     while true do
--         Wait(0)

--         local pos = vector3(-1273.03, -1530.9, 4.31)
--         -- DrawBasketballAimPoint(pos, vector3(0.001, 0.999, 0.0))


-- -- DrawPoly(
-- --     p1, p2, p3,
-- --     255, 255, 255, 255
-- -- )


        
--         -- DrawSprite('basketball', 'basketball', 0.5, 0.5, 0.1, 0.1, 0.0, 255, 255, 255, 255)
--     end
-- end)

