function DefineOxTarget(places)
    IsResourceLoaded('ox_target', function(state, target)
        if state then
            if not IsScriptLoaded('ox_lib') then return end
            
            shared.interaction = 'target'

            for idx, data in pairs(places) do
                local boxSize = data.helpers and data.helpers.size or nil
                local maxZ = data.helpers and data.helpers.maxZ or 2.0
                local dist = data.helpers and data.helpers.dist or Prison.Target.CheckDist

                local idxString = data.exercise or data.name or data.type
                local label = nil

                if TASK_LABEL_MAP[idxString:lower()] then
                    label = TASK_LABEL_MAP[idxString:lower()]
                else
                    label = idxString
                end

                target:addBoxZone({
                    size = vec3(boxSize and boxSize.x or 0.5, boxSize and boxSize.y or 1.0, maxZ),
                    coords = data.coords,
                    rotation = data.heading or 0,
                    radius = dist or Prison.Target.CheckDist,
                    debug = false,
                    options = {
                        {
                            name  = idx,
                            label = label or 'UNK',
                            event = "rcore_prison:performTask",
                            icon = "",
                            taskData = {
                                task = data,
                                idx = idx,
                            }
                        }
                    },
                })

                Wait(0)
            end
        else
            InvokeDistanceInteract()
        end
    end) 
end
