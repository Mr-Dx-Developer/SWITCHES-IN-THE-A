

function HandleRegistration(pedCoords, hoopId, hoopData)
	local groundPedCoords = pedCoords - vector3(0.0, 0.0, 1.0)

    if #(groundPedCoords - hoopData.groundPos) < 5.0 then
        local cpText = Config.Text[hoopData.State.Mode]
        
        if hoopData.State.Mode == GAME_ATW then
            cpText = '~y~' .. cpText .. '~s~~n~' .. (#hoopData.State.ThrowPoints) .. ' ' .. Config.Text.ATW_CP_THROW_POINTS
        end

        Draw3DText(hoopData.groundPos + vector3(0.0, 0.0, 1.0), cpText)
    end

    local isOwner = hoopData.State.OwnerServerId == MyServerId

    if Config.TargetResourceName then
        SetTargetingStatusJoin(hoopData)
    else
        if #(hoopData.groundPos - groundPedCoords) < Config.Marker.Scale/2 then
            if not Config.HideJoinMarkers then
                DrawSimpleMarker(hoopData.groundPos, Config.Marker.Scale, 255, 0, 0, 150)
            end

            if isOwner then
                DisplayHelpTextThisFrame('RC_BASK_BEG')
            else
                DisplayHelpTextThisFrame('RC_BASK_JOIN')
            end

            if IsControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) or IsDisabledControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) then
                OpenNUI(hoopId)
            end

            for _, pos in pairs(hoopData.State.ThrowPoints) do
                DrawSimpleMarker(pos, Config.Marker.Scale, 255, 255, 255, 150)
            end
        elseif not Config.HideJoinMarkers then
            DrawSimpleMarker(hoopData.groundPos, Config.Marker.Scale, 200, 0, 0, 150)
        end
    end
end