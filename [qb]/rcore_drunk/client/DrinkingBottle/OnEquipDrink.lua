RegisterNetEvent(TriggerName("EquipPlayerDrink"), function(data)
    BottleData = data
    local attachmentInfo = data.attachmentInfo
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    BottleObject = CreateNetworkObject(attachmentInfo.objectHash, pos + vector3(0, 0, 0.2))

    AttachEntityToEntity(BottleObject, ped, GetPedBoneIndex(ped, attachmentInfo.boneId),
            attachmentInfo.positionHoldOffset.x, attachmentInfo.positionHoldOffset.y, attachmentInfo.positionHoldOffset.z,
            attachmentInfo.rotationHoldOffset.x, attachmentInfo.rotationHoldOffset.y, attachmentInfo.rotationHoldOffset.z,
            true, true, false, true, 1, true)

    SetModelAsNoLongerNeeded(attachmentInfo.objectHash)

    Animation.Play("hold_bottle")

    ShowHelpNotification(_U("drink_help_text", data.numbersOfSips), false, false, 99999999)
end)

--RegisterCommand("bottle", function(source, args, neco)
--    local data = Config.DrunkList[1]
--
--    DeleteEntity(BottleObject)
--    Animation.ResetAll()
--
--    local attachmentInfo = data.attachmentInfo
--    local ped = PlayerPedId()
--    local pos = GetEntityCoords(ped)
--
--    BottleObject = CreateNetworkObject(attachmentInfo.objectHash, pos + vector3(0, 0, 0.2))
--
--    AttachEntityToEntity(BottleObject, ped, GetPedBoneIndex(ped, attachmentInfo.boneId),
--            attachmentInfo.positionOffset.x, attachmentInfo.positionOffset.y, attachmentInfo.positionOffset.z,
--            tonumber(args[1]), tonumber(args[2]), tonumber(args[3]),
--            true, true, false, true, 1, true)
--
--    SetModelAsNoLongerNeeded(attachmentInfo.objectHash)
--
--    Animation.Play("hold_bottle")
--    --Animation.Play("drink")
--end)