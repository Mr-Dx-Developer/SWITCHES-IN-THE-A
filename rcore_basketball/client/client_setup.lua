
function HandleSetupAroundTheWorld(pedCoords, hoopId, hoopData)
	local groundPedCoords = pedCoords - vector3(0.0, 0.0, 1.0)

	if hoopData.State.OwnerServerId ~= MyServerId then
		return
	end

	local ePress = IsControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) or IsDisabledControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key)
	local shiftPress = IsControlPressed(0, Config.Controls.CHECKPOINT_MODIFIER.key) or IsDisabledControlPressed(0, Config.Controls.CHECKPOINT_MODIFIER.key)

	local closestMarkerDist = nil
	local closestMarkerPos = nil

	local disableThrowMarkerInteraction = #(hoopData.groundPos - groundPedCoords) < 1.8

	if #hoopData.State.ThrowPoints > 0 then
		if Config.TargetResourceName then
			SetTargetingFinishSetup(hoopData)
		else
			if #(hoopData.groundPos - groundPedCoords) < Config.Marker.Scale/2 then
				if not Config.HideMarkers then
					DrawSimpleMarker(hoopData.groundPos, Config.Marker.Scale, 255, 0, 0, 150)
				end
				DisplayHelpTextThisFrame('RC_BASK_REG')

				if ePress then
					TriggerServerEvent('rcore_basketball:finishHoopSetup')
				end
			elseif not Config.HideMarkers then
				DrawSimpleMarker(hoopData.groundPos, Config.Marker.Scale, 200, 0, 0, 150)
			end
		end
	end

	for _, throwPos in pairs(hoopData.State.ThrowPoints) do
		local dist = #(groundPedCoords - throwPos)
		if not closestMarkerDist or closestMarkerDist > #(groundPedCoords - throwPos) then
			closestMarkerDist = dist
			closestMarkerPos = throwPos
		end
	end

	for _, throwPos in pairs(hoopData.State.ThrowPoints) do
		if not disableThrowMarkerInteraction and closestMarkerDist < Config.Marker.Scale/2 and closestMarkerPos == throwPos then
			DrawSimpleMarker(throwPos, Config.Marker.Scale, 0, 255, 0, 100)
		else
			DrawSimpleMarker(throwPos, Config.Marker.Scale, 255, 255, 255, 100)
		end
	end

	if not disableThrowMarkerInteraction and (not closestMarkerDist or closestMarkerDist >= 2.0) then
		DrawSimpleMarker(pedCoords - vector3(0.0, 0.0, 1.0), Config.Marker.Scale, 0, 255, 0, 100)
	end

	if not disableThrowMarkerInteraction then
		if closestMarkerDist and closestMarkerDist < Config.Marker.Scale/2 then
			DisplayHelpTextThisFrame('RC_BASK_RP')

			if shiftPress and ePress then
				for idx, pos in pairs(hoopData.State.ThrowPoints) do
					if closestMarkerPos == pos then
						table.remove( hoopData.State.ThrowPoints, idx)
						break
					end
				end

				TriggerServerEvent('rcore_basketball:removeThrowPoint', closestMarkerPos)
			end
		elseif not closestMarkerDist or closestMarkerDist >= 2.0 then
			DisplayHelpTextThisFrame('RC_BASK_PP')
			if not shiftPress and ePress then
				table.insert(hoopData.State.ThrowPoints, pedCoords - vector3(0.0, 0.0, 1.0))
				TriggerServerEvent('rcore_basketball:addThrowPoint', pedCoords - vector3(0.0, 0.0, 1.0))
			end
		else
			SubtitleText(Config.Text.TOO_CLOSE_OTHER)
		end
	end

	if disableThrowMarkerInteraction then
		SubtitleText(Config.Text.TOO_CLOSE)
	end
end
