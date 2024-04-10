SpawnedEntities = {}

AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() == name then
        for _, i in pairs(SpawnedEntities) do
			DeleteEntity(i)
		end

		for _, hoopData in pairs(BasketballHoops) do
			if hoopData.hoopEntity then
				DeleteEntity(hoopData.hoopEntity)
			end

			if hoopData.trackedPoint then
				DestroyTrackedPoint(hoopData.trackedPoint)
				hoopData.trackedPoint = nil
			end
		end
    end
end)




RelevantHoops = {}
IsNearAnyHoop = false

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		local rh = {}
		local newIsNear = false
		for hoopIdx, hoopData in pairs(BasketballHoops) do
			if hoopData.IsSubscribed then
				newIsNear = true
				rh[hoopIdx] = hoopData
			end
		end
		RelevantHoops = rh
		IsNearAnyHoop = newIsNear
	end
end)



Citizen.CreateThread(function()
	AddTextEntry('RC_BASK_START', Config.Text.START_GAME)
	AddTextEntry('RC_BASK_ST_TAK', Config.Text.START_TAKE_GAME)
	
	AddTextEntry('RC_BASK_REG', Config.Text.START_REGISTRATION)
	AddTextEntry('RC_BASK_JOIN', Config.Text.JOIN_GAME)
	AddTextEntry('RC_BASK_BEG', Config.Text.BEGIN_GAME)
	AddTextEntry('RC_BASK_PIK', Config.Text.PICKUP)
	AddTextEntry('RC_BASK_PP', Config.Text.PLACE_POINT)
	AddTextEntry('RC_BASK_RP', Config.Text.REMOVE_POINT)
	AddTextEntry('RC_BASK_P1', Config.Text.PLACE_HOOP)
	
	while true do
        if not IsNearAnyHoop then
            Wait(1070)
        else
            Wait(0)
        end

		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		if MyCurrentHoopId then
			if BasketballHoops[MyCurrentHoopId] then
				HandleBasketballHoop(coords, MyCurrentHoopId, BasketballHoops[MyCurrentHoopId])
			end
		else
			for hoopId, hoopData in pairs(RelevantHoops) do
				if hoopData.State then
					HandleBasketballHoop(coords, hoopId, hoopData)
				end
			end
		end
	end
end)

HoopNetData = {}

function SetHoopNetScored(hoopId)
	if not HoopNetData[hoopId] then
		HoopNetData[hoopId] = {
			startAt = 0,
			endAt = 0,
		}
	end

	local time = 1950
	HoopNetData[hoopId].startAt = GetGameTimer()
	HoopNetData[hoopId].endAt = GetGameTimer() + time

	SetTimeout(time, function() HoopNetData[hoopId] = nil end)
end

local hoopNetColor = Config.HoopNetColor or {255, 255, 255}
local hoopNetFlashColor = Config.HoopNetScoreFlashColor or {0, 255, 0}
local gameSettingUp = Config.Text.GAME_SETTING_UP or 'Game is being configured'

function HandleBasketballHoop(pedCoords, hoopId, hoopData)
	ConfigureDefaultHoopValues(hoopId, hoopData)
	
	local color = hoopNetColor
	local startTime = 0
	local endTime = 0

	if HoopNetData[hoopId] then
		startTime = HoopNetData[hoopId].startAt
		endTime = HoopNetData[hoopId].endAt

		local isColor = ((GetGameTimer() - startTime) % 400) < 200

		if isColor then
			color = hoopNetFlashColor
		end
	end

	if not Config.DisableHoopNetRendering and IsTrackedPointVisible(hoopData.trackedPoint) == 1 then
		RenderHoopNet(
			hoopData.hoopPos,
			hoopId,
			startTime, 
			endTime, 
			hoopData.topVertices, hoopData.midVertices, hoopData.botVertices, color
		)
	end
	if hoopData.groundPos then
		if hoopData.State.Status == STATUS_FREE then
			HandleHoopStatusFree(pedCoords, hoopId, hoopData)
		elseif hoopData.State.IsPlayerPartOfHoop and hoopData.State.Mode == GAME_ATW and hoopData.State.Status == STATUS_CONFIGURING then
			HandleSetupAroundTheWorld(pedCoords, hoopId, hoopData)
		elseif not hoopData.State.IsPlayerPartOfHoop and hoopData.State.Mode == GAME_ATW and hoopData.State.Status == STATUS_CONFIGURING then
			if #(pedCoords - hoopData.groundPos) < 20.0 then
				Draw3DText(hoopData.groundPos + vector3(0.0, 0.0, 1.0), gameSettingUp)
			end
		elseif hoopData.State.Status == STATUS_REGISTRATION then
			HandleRegistration(pedCoords, hoopId, hoopData)
		elseif hoopData.State.IsPlayerPartOfHoop and hoopData.State.Status == STATUS_PLAYING then
			HandlePlay(pedCoords, hoopId, hoopData)
		end
	end
end

function ConfigureDefaultHoopValues(hoopId, hoopData)
	if not hoopData.hoopPos then
		hoopData.index = hoopId

		if hoopData.rot.z == 1 and hoopData.rot.w == 0 then
			hoopData.rot = vector4(hoopData.rot.x, hoopData.rot.y, hoopData.rot.z, 0.0001)
		elseif hoopData.rot.z == 0 and hoopData.rot.w == 1 then
			hoopData.rot = vector4(hoopData.rot.x, hoopData.rot.y, 0.0001, hoopData.rot.w)
		end

		local hoopPos, hoopRadius, hoopPlanePoint, hoopPlaneNormal, hoopPlaneNormalLeft, hoopPlaneNormalUp, hoopHeading = GetBasketHoopDimensions(
			hoopData.Model,
			hoopData.pos, 
			hoopData.rot
		)
		hoopData.hoopPos = hoopPos
		hoopData.hoopRadius = hoopRadius
		hoopData.hoopPlanePoint = hoopPlanePoint
		hoopData.hoopPlaneNormal = hoopPlaneNormal
		hoopData.hoopPlaneNormalLeft = hoopPlaneNormalLeft
		hoopData.hoopPlaneNormalUp = hoopPlaneNormalUp
		hoopData.hoopHeading = hoopHeading
		hoopData.topVertices = ComputeHoopVertices(hoopPos, hoopRadius, 0.02, 0, 0.0)
		hoopData.midVertices = ComputeHoopVertices(hoopPos, hoopRadius, -0.08 + 0.02, 10, -0.225)
		hoopData.botVertices = ComputeHoopVertices(hoopPos, hoopRadius, -0.11 + 0.02, 20, -0.45)
	end

	if not hoopData.groundPos then
		local retval, groundZ = GetGroundZFor_3dCoord(hoopData.hoopPos.x, hoopData.hoopPos.y, hoopData.hoopPos.z, false)
		if retval then
			if hoopData.customGroundPos then
				hoopData.groundPos = hoopData.customGroundPos
			else
				hoopData.groundPos = vector3(
					hoopData.hoopPos.x, 
					hoopData.hoopPos.y,
					groundZ
				)
			end

			local fwdVector = hoopData.hoopPos.xy - hoopData.hoopPlanePoint.xy
			fwdVector = fwdVector / #fwdVector

			if not hoopData.threePointFwdDist then
				hoopData.threePointFwdDist = 0.0
			end
			if not hoopData.threePointSideDist then
				hoopData.threePointSideDist = 0.0
			end

			local hoopCourtHeading = GetHeadingFromVector_2d(fwdVector.x, fwdVector.y)
			local threePointSideMove = vector3(
				math.cos(math.rad(hoopCourtHeading)),
				math.sin(math.rad(hoopCourtHeading)),
				0.0
			)

			hoopData.threePointCircleRoot = hoopData.groundPos + vector3(fwdVector.x, fwdVector.y, 0.0)*hoopData.threePointFwdDist + threePointSideMove * hoopData.threePointSideDist
		end
	end

	CreateBallObject(hoopData)
end


function DrawSimpleMarker(pos, scale, r, g, b, a)
	DrawMarker(
		Config.Marker.Flat and 25 or 1, 
		pos.x, pos.y, pos.z + (Config.Marker.Flat and 0.01 or -0.05), 
		0.0, 0.0, 0.0, 
		0.0, 0.0, 0.0, 
		scale, scale, scale/2, 
		r, g, b, a, 
		false, false, false, false, nil, nil, false
	)
end
