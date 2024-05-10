DefineQTarget = function(places)
    if not places then return end

    if IsScriptLoaded('ox_target') then return end
    if IsScriptLoaded('qb-target') then return end

    IsResourceLoaded('qtarget', function(state, target)
        if state then
            shared.interaction = 'target'

            for idx, data in pairs(places) do
                local boxSize = data.helpers and data.helpers.size or nil
                local minZ = data.helpers and data.helpers.minZ or 0.5
                local maxZ = data.helpers and data.helpers.maxZ or 2.0
                local dist = data.helpers and data.helpers.dist or Prison.Target.CheckDist
                
                local idxString = data.exercise or data.name or data.type
                local label = nil

                if TASK_LABEL_MAP[idxString:lower()] then
                    label = TASK_LABEL_MAP[idxString:lower()]
                else
                    label = idxString
                end

                target:AddBoxZone(idx, data.coords, boxSize and boxSize.x or 0.5, boxSize and boxSize.y or 1.0,
                    {
                        name = idx,
                        heading = data.heading,
                        debugPoly = false,
                        minZ = data.coords.z - minZ,
                        maxZ = data.coords.z + maxZ,
                    },{
                        options = {
                            {
                                label = label or 'UNK',
                                event = "rcore_prison:performTask",
                                icon = "",
                                taskData = {
                                    task = data,
                                    idx = idx,
                                }
                            },
                        },
                        distance = dist
                    }
                )

                Wait(0)
            end
        else
            InvokeDistanceInteract()
        end
    end)
end