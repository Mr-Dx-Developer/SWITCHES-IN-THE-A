DefineQbTarget = function(places)
    if not places then return end

    if IsScriptLoaded('ox_target') then return end
    if IsScriptLoaded('qtarget') then return end
    
    IsResourceLoaded('qb-target', function(state, target)
        if state then
            local targetConfig = Utils.LoadScriptData('init', 'qb-target', 'Config')

            if targetConfig and targetConfig.DrawSprite then
                return LevelDebug(3, 'error', '%s', 'Detected qb-target using Config.DrawSprite = true \n There is issue while using qb-target and this option, needs to be set to false, if you like to use target system for Prison !!!\n Check out qb-target/init.lua - config.')
            end

            shared.interaction = 'target'

            for idx, data in pairs(places) do

                local boxSize = data.helpers and data.helpers.size or nil
                local minZ = data.helpers and data.helpers.minZ or 0.5
                local maxZ = data.helpers and data.helpers.maxZ or 2.0
                local dist = Prison.Target.CheckDist or data.helpers and data.helpers.dist

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