-- used to debug 3point line distance
Citizen.CreateThread(function()
    while false do
        Wait(0)

        for _, hoop in pairs(BasketballHoops) do
            if hoop.IsSubscribed then
                local circlePositions = {}
                local r = hoop.threePointRadius or 1.0

                local rootPos = hoop.threePointCircleRoot
            
                if rootPos then
                    rootPos = hoop.threePointCircleRoot + vector3(0.0, 0.0, 0.02)
                    for i = 1, 360, 2 do
                        local angle = i * math.pi / 180 
                        
                        table.insert(circlePositions, vector2(r * math.cos( angle ), r * math.sin( angle )))
                    end

                    for i = 1, #circlePositions do
                        local absPos1 = rootPos + vector3(circlePositions[i].x, circlePositions[i].y, 0.0)

                        local nexI = i+1
                        if nexI > #circlePositions then
                            nexI = 1
                        end
                        local absPos2 = rootPos + vector3(circlePositions[nexI].x, circlePositions[nexI].y, 0.0)

                        DrawPoly(
                            absPos1, 
                            absPos2, 
                            rootPos, 
                            255, 0, 0, 150
                        )
                    end
                end
            end
        end
    end
end)
