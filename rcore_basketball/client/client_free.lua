TakeDebounceUntil = 0

function HandleHoopStatusFree(pedCoords, hoopId, hoopData)
	if not hoopData.groundPos then
	elseif IsTrackedPointVisible(hoopData.trackedPoint) == 1 then
		if Config.TargetResourceName then
			SetTargetingStatusFree(hoopData)

			if CanTakeHoop(hoopData) then
				SetTargetingTakeHoop(hoopData)
			end
		else
			if #((pedCoords - vector3(0.0, 0.0, 1.0)) - hoopData.groundPos) < (Config.Marker.Scale/2) then
				if not Config.HideMarkers then
					DrawSimpleMarker(hoopData.groundPos, Config.Marker.Scale, 255, 0, 0, 150)
				end

				local isE = IsControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) or IsDisabledControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key)
				local isShift = IsControlPressed(0, Config.Controls.CHECKPOINT_MODIFIER.key) or IsDisabledControlPressed(0, Config.Controls.CHECKPOINT_MODIFIER.key)

				if CanTakeHoop(hoopData) then
					DisplayHelpTextThisFrame('RC_BASK_ST_TAK')

					if isShift and isE then
						TakeDebounceUntil = GetGameTimer() + 5000
						TriggerServerEvent('rcore_basketball:takeHoop', hoopData.index)
					end
				else
					DisplayHelpTextThisFrame('RC_BASK_START')
				end

				if not isShift and isE then
					if Config.RequireBasketball then
						TriggerServerEvent('rcore_basketball:requestOpenSetup', hoopId)
					else
						OpenNUI(hoopId)
					end
				end
			elseif not Config.HideMarkers then
				DrawSimpleMarker(hoopData.groundPos, Config.Marker.Scale, 200, 0, 0, 150)
			end
		end
	end
end

function CanTakeHoop(hoopData)
	if TakeDebounceUntil > GetGameTimer() then
		return
	end

	if not hoopData.ownerServerId then
		return
	end

	if hoopData.ownerServerId == MyServerId then
		return true
	end

	local player = GetPlayerFromServerId(hoopData.ownerServerId)
                
	if not NetworkIsPlayerActive(player) then
		return true
	end

	local targetPed = GetPlayerPed(player)
	local targetCoords = GetEntityCoords(targetPed)
	
	local distToOwner = #(targetCoords - hoopData.groundPos)

	if distToOwner > 50.0 then
		return true
	end
end