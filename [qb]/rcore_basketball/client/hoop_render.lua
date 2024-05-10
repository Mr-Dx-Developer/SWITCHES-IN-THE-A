HOOP_NET_STEP = 40

local hoopCache = {}

function RenderHoopNet(hoopPos, hoopId, startGameTimer, endGameTimer, topVertices, midVertices, botVertices, hoopNetColor)
    local gameTime = GetGameTimer()
    
    local realMidOffset = 0
    local realBotOffset = 0

    if gameTime > startGameTimer and gameTime < endGameTimer then

        local prog = gameTime - startGameTimer

        local total = endGameTimer - startGameTimer

        local progPerc = prog/total

        realMidOffset = vector3(
            math.cos(prog / 100) * 0.05 * (1-progPerc),
            math.sin(prog / 100) * 0.05 * (1-progPerc),
            0.0
        )
        
        realBotOffset = vector3(
            math.cos(1.5 + prog / 100) * 0.05 * (1-progPerc),
            math.sin(1.5 + prog / 100) * 0.05 * (1-progPerc),
            0.0
        )
    end

    local camCoord = GetFinalRenderedCamCoord()
    local camToHoop = camCoord - hoopPos
    local heading = (GetHeadingFromVector_2d(camToHoop.x, camToHoop.y) + 90) % 360
    local closestIdx = tonumber(math.floor(heading/HOOP_NET_STEP))

    if not hoopCache[hoopId] or hoopCache[hoopId].cidx ~= closestIdx then
        local frontFaceIndices = {}
        local backFaceIndices = {}

        local totalStep = tonumber(math.floor(360/HOOP_NET_STEP))
        local quatStep = tonumber(math.ceil((360/HOOP_NET_STEP)/4))
        local halfStep = tonumber(math.ceil((360/HOOP_NET_STEP)/2))

        for bfx = closestIdx-quatStep+1, closestIdx+quatStep-1 do
            table.insert(frontFaceIndices, bfx%totalStep)
            table.insert(backFaceIndices, (bfx+halfStep)%totalStep)
        end

        hoopCache[hoopId] = {
            cidx = closestIdx,
            frontFaceIndices = frontFaceIndices,
            backFaceIndices = backFaceIndices,
        }
    end
    
    for n = 1, #hoopCache[hoopId].frontFaceIndices do
        local i = hoopCache[hoopId].frontFaceIndices[n]+1


        DrawPoly(
            realMidOffset + midVertices[i], 
            realMidOffset + (midVertices[i+1] or midVertices[1]), 
            topVertices[i], 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
        
        DrawPoly(
            realMidOffset + (midVertices[i+1] or midVertices[1]), 
            topVertices[i+1] or topVertices[1], 
            topVertices[i], 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
        
        DrawPoly(
            realBotOffset + botVertices[i], 
            realBotOffset + (botVertices[i+1] or botVertices[1]), 
            realMidOffset + midVertices[i], 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
        
        DrawPoly(
            realBotOffset + (botVertices[i+1] or botVertices[1]), 
            realMidOffset + (midVertices[i+1] or midVertices[1]), 
            realMidOffset + midVertices[i], 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
    end
    
    for n = 1, #hoopCache[hoopId].backFaceIndices do
        local i = hoopCache[hoopId].backFaceIndices[n]+1


        DrawPoly(
            topVertices[i], 
            realMidOffset + (midVertices[i+1] or midVertices[1]), 
            realMidOffset + midVertices[i], 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
        
        DrawPoly(
            topVertices[i], 
            topVertices[i+1] or topVertices[1], 
            realMidOffset + (midVertices[i+1] or midVertices[1]), 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
        
        DrawPoly(
            realMidOffset + midVertices[i], 
            realBotOffset + (botVertices[i+1] or botVertices[1]), 
            realBotOffset + botVertices[i], 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
        
        DrawPoly(
            realMidOffset + midVertices[i], 
            realMidOffset + (midVertices[i+1] or midVertices[1]), 
            realBotOffset + (botVertices[i+1] or botVertices[1]), 
            hoopNetColor[1], hoopNetColor[2], hoopNetColor[3], 100
        )
    end
end

function ComputeHoopVertices(hoopPos, hoopRadius, hoopOffset, angleOffset, zOffset)
    local vertices = {}

	local x, y, r = 0, 0, hoopRadius + hoopOffset
	for i = 0, 360-HOOP_NET_STEP, HOOP_NET_STEP do
		local angle = (i+angleOffset) * math.pi / 180 
		local ptx, pty = x + r * math.cos( angle ), y + r * math.sin( angle )
		local pointPos = hoopPos + vector3(ptx, pty, zOffset)
		table.insert(vertices, pointPos)
	end

    return vertices
end

function GetBasketHoopDimensions(model, hoopPos, hoopQuat)
	local pos = hoopPos
	local rot = hoopQuat

	local hoop = CreateObjectNoOffset(
		model, 
		pos, 
		false, false, false
	)
	SetEntityQuaternion(hoop, rot)

	local hoopPos = GetOffsetFromEntityInWorldCoords(hoop, HoopOffsets[model].hoopCenter.x, HoopOffsets[model].hoopCenter.y, HoopOffsets[model].hoopCenter.z)
	
	local hoopPlaneNormalPos = GetOffsetFromEntityInWorldCoords(hoop, HoopOffsets[model].hoopPlanePoint.x, HoopOffsets[model].hoopPlanePoint.y, HoopOffsets[model].hoopPlanePoint.z)
	local hoopPlaneNormalLeftPos = GetOffsetFromEntityInWorldCoords(hoop, HoopOffsets[model].hoopPlaneNormalLeft.x, HoopOffsets[model].hoopPlaneNormalLeft.y, HoopOffsets[model].hoopPlaneNormalLeft.z)
	local hoopPlaneNormalUpPos = GetOffsetFromEntityInWorldCoords(hoop, HoopOffsets[model].hoopPlaneNormalUp.x, HoopOffsets[model].hoopPlaneNormalUp.y, HoopOffsets[model].hoopPlaneNormalUp.z)
	local hoopPlanePoint  = GetOffsetFromEntityInWorldCoords(hoop, HoopOffsets[model].hoopPlaneNormal.x, HoopOffsets[model].hoopPlaneNormal.y, HoopOffsets[model].hoopPlaneNormal.z)
	local hoopPlaneNormal = hoopPlaneNormalPos - hoopPlanePoint
	hoopPlaneNormal = hoopPlaneNormal / #hoopPlaneNormal
    
    local hoopPlaneNormalLeft = hoopPlaneNormalLeftPos - hoopPlanePoint
	hoopPlaneNormalLeft = hoopPlaneNormalLeft / #hoopPlaneNormalLeft

    local hoopPlaneNormalUp = hoopPlaneNormalUpPos - hoopPlanePoint
	hoopPlaneNormalUp = hoopPlaneNormalUp / #hoopPlaneNormalUp

    local hoopHeading = GetEntityHeading(hoop)

	DeleteEntity(hoop)

	return hoopPos, 0.24, hoopPlanePoint, hoopPlaneNormal, hoopPlaneNormalLeft, hoopPlaneNormalUp, hoopHeading
end
