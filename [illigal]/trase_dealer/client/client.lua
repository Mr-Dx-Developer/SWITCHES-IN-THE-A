local CreatedPed

local function face_entity(e1, e2)
    local p1 = GetEntityCoords(e1, true)
    local p2 = GetEntityCoords(e2, true)

    local dx = p2.x - p1.x
    local dy = p2.y - p1.y

    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading( e1, heading )
end

local function play_anim(ped, dict, anim, speed, time, flag)
    lib?.requestAnimDict(dict)
    TaskPlayAnim(ped, dict, anim, speed, speed, time, flag, 1, false, false, false)
end

local function draw3dText(args)
    local dist = #(GetFinalRenderedCamCoord() - args.coords)
    local scale = (1 / dist) * 25
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    local aScale = args.scale or 1.0
    SetTextScale(aScale * scale, aScale * scale)
    SetTextFont(args.font or 4)
    SetTextCentre(true)
    if args.color then SetTextColour(args.color[1] or 255, args.color[2] or 255, args.color[3] or 255, args.color[4] or 255) end
    if args.outline then SetTextOutline() end

    BeginTextCommandDisplayText("STRING") --drawing the text
    AddTextComponentSubstringPlayerName(args.text)
    SetDrawOrigin(args.coords.x, args.coords.y, args.coords.z, 0) --2d to 3d
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end



RegisterNetEvent('trase_dealer:client:selldrug', function(data, SellTime)
    if (CreatedPed and DoesEntityExist(CreatedPed)) then SetPedAsNoLongerNeeded(CreatedPed) end

    local ped = cache.ped

    if not lib.progressBar({
        duration = SellTime,
        label = 'Selling ' .. data.Label,
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true },
        anim = { scenario = 'WORLD_HUMAN_STAND_MOBILE' }
    }) then return end

    local model = Config.PedModels[math.random(#Config.PedModels)]
    lib?.requestModel(model)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, Config.SpawnDistance, 5.0)
    local found_ground, z = GetGroundZFor_3dCoord(coords?.x, coords?.y, coords?.z, 0)

    if found_ground == false then
        sellingDrugs = false
        return SendNotification(Config.Strings['NoClientFound'])
    end

    CreatedPed = CreatePed(5, model, coords?.x, coords?.y, z, 0.0, Config.SyncPeds, true)
    PlaceObjectOnGroundProperly(CreatedPed)
    SetEntityAsMissionEntity(CreatedPed)

    if IsEntityDead(CreatedPed) or GetEntityCoords(CreatedPed) == vec3(0.0, 0.0, 0.0) then
        sellingDrugs = false
        return SendNotification(Config.Strings['NoClientFound'])
    end

    SendNotification(Config.Strings['ClientFound'])
    TaskGoToEntity(CreatedPed, ped, 60000, 4.0, 2.0, 0, 0)

    CreateThread(function()
        selling = true
        sellingDrugs = true
        while (CreatedPed and DoesEntityExist(CreatedPed) and not IsEntityDead(CreatedPed) and sellingDrugs) do
            Wait(0)

            local crds = GetEntityCoords(CreatedPed)
            draw3dText({ coords = crds, scale = 0.03, outline = true, text = ('~w~Sell ~g~%s~w~'):format(data?.Label)})
            local my_coords = GetEntityCoords(cache?.ped)
            local dist = #(my_coords?.xyz - crds?.xyz)

            if (IsPedFleeing(CreatedPed)) then
                selling = false
                sellingDrugs = false
                return SendNotification(Config.Strings['ClientScared'])
            end

            if (dist <= 2.0) then

                ShowHelpNotification('Press ~INPUT_CONTEXT~ to conclude the deal.')

                if (IsControlJustPressed(0, 38) and selling) then
                    selling = false
                    
                    local luck = math.random(1, 100)
                    if (luck <= data?.DenyChance) then
                        cooldown = false
                        sellingDrugs = false
                        local entity = CreatedPed
                        CreatedPed = nil
                        return DenySale(entity)
                    end

                    if (cache?.vehicle) then
                        sellingDrugs = false
                        return SendNotification(Config.Strings['NoInVeh'])
                    end

                    local p_ped = cache?.ped
                    face_entity(p_ped, CreatedPed)
					face_entity(CreatedPed, p_ped)

                    SetPedTalk(CreatedPed)
					PlayAmbientSpeech1(CreatedPed, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')
                    local object_1, object_2

                    if Config.Props.Enabled then
                        lib.requestModel(Config.Props.Prop1.Model)
                        object_1 = CreateObject(Config.Props.Prop1.Model, 0, 0, 0, true)
                        AttachEntityToEntity(object_1, cache.ped, GetPedBoneIndex(cache.ped, Config.Props.Prop1.Bone), Config.Props.Prop1.Coords.X, Config.Props.Prop1.Coords.Y, Config.Props.Prop1.Coords.Z, Config.Props.Prop1.Rotation.x, Config.Props.Prop1.Rotation.y, Config.Props.Prop1.Rotation.z, false, false, false, false, 2, true)

                        lib.requestModel(Config.Props.Prop2.Model)
                        object_2 = CreateObject(Config.Props.Prop2.Model, 0, 0, 0, true)
                        AttachEntityToEntity(object_2, CreatedPed, GetPedBoneIndex(CreatedPed, Config.Props.Prop2.Bone), Config.Props.Prop2.Coords.X, Config.Props.Prop2.Coords.Y, Config.Props.Prop2.Coords.Z, Config.Props.Prop2.Rotation.x, Config.Props.Prop2.Rotation.y, Config.Props.Prop2.Rotation.z, false, false, false, false, 2, true)
                    end

                    play_anim(p_ped, 'mp_common', 'givetake1_a', 8.0, -1, 0)
                    play_anim(CreatedPed, 'mp_common', 'givetake1_a', 8.0, -1, 0)

                    Wait(1000)

                    if Config.Props.Enabled then
                        -- Swap props
                        AttachEntityToEntity(object_1, CreatedPed, GetPedBoneIndex(CreatedPed, Config.Props.Prop1.Bone), Config.Props.Prop1.Coords.X, Config.Props.Prop1.Coords.Y, Config.Props.Prop1.Coords.Z, Config.Props.Prop1.Rotation.x, Config.Props.Prop1.Rotation.y, Config.Props.Prop1.Rotation.z, false, false, false, false, 2, true)
                        AttachEntityToEntity(object_2, cache.ped, GetPedBoneIndex(cache.ped, Config.Props.Prop2.Bone), Config.Props.Prop2.Coords.X, Config.Props.Prop2.Coords.Y, Config.Props.Prop2.Coords.Z, Config.Props.Prop2.Rotation.x, Config.Props.Prop2.Rotation.y, Config.Props.Prop2.Rotation.z, false, false, false, false, 2, true)
                    end

                    PlayAmbientSpeech1(CreatedPed, 'GENERIC_THANKS', 'SPEECH_PARAMS_STANDARD')
					SetPedAsNoLongerNeeded(CreatedPed)

                    TriggerServerEvent('trase_dealer:server:selldrug', data, GetEntityCoords(CreatedPed))
                    sellingDrugs = false
                    CreatedPed = nil

                    if Config.Props.Enabled then
                        SetTimeout(Config.Props.Duration * 1000, function()
                            DeleteEntity(object_1)
                            DeleteEntity(object_2)
                        end)
                    end
                end
            end
        end
    end)
end)

lib.callback.register('trase_dealer:client:getselection', function(data)
    local selected = false
    local options = {}

    for k, v in pairs(data) do
        options[#options +1] = {
            title = v.Label,
            arrow = true,
            onSelect = function()
                selected = v
            end
        }
    end

    lib.registerContext({
        id = 'trase:dealeroptions',
        title = Config.Strings['MenuTitle'],
        options = options
    })

    lib.showContext('trase:dealeroptions')

    while (not selected) do Wait(100) end

    return selected
end)

lib.callback.register('trase_dealer:client:isNight', isNight)