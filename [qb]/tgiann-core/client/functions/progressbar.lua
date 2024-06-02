local bussy = false
local lang = langs[config.lang]

tgiCore.Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if not bussy then
        bussy = true
        if config.framework == "qb" then
            if GetResourceState('progressbar') ~= 'started' then 
                error('progressbar needs to be started in order for tgiCore.Progressbar to work')
                onCancel()
                return
            end
            exports['progressbar']:Progress({
                name = name:lower(),
                duration = duration,
                label = label,
                useWhileDead = useWhileDead,
                canCancel = canCancel,
                controlDisables = disableControls,
                animation = animation and animation or {},
                prop = prop and prop or {}, 
                propTwo = propTwo and propTwo or {},
            }, function(cancelled)
                if not cancelled then
                    if onFinish then
                        onFinish()
                    end
                else
                    if onCancel then
                        onCancel()
                    end
                end
                bussy = false
            end)
        elseif config.framework == "esx" then
            if config.oxlib then
                if lib.progressBar({
                    duration = duration,
                    label = label,
                    useWhileDead = useWhileDead,
                    canCancel = canCancel,
                    disable = {
                        car = disableControls.disableCarMovement,
                        move = disableControls.disableMovement,
                        combat = disableControls.disableCombat,
                        mouse = disableControls.disableMouse,
                    },
                    anim = {
                        dict = animation.animDict,
                        clip = animation.anim,
                        flag = animation.flags
                    },
                    prop = {
                        model = prop.model,
                        pos = prop.coords,
                        rot = prop.rotation,
                        bone = prop.bone
                    },
                }) then 
                    if onFinish then onFinish() end
                    bussy = false
                else 
                    if onCancel then onCancel() end
                    bussy = false
                end
            else
                if GetResourceState('tgiann-progressbar') ~= 'started' then 
                    error('tgiann-progressbar needs to be started in order for tgiCore.Progressbar to work')
                    onCancel()
                    return
                end
                exports['tgiann-progressbar']:Progress({
                    name = name:lower(),
                    duration = duration,
                    label = label,
                    useWhileDead = useWhileDead,
                    canCancel = canCancel,
                    controlDisables = disableControls,
                    animation = animation and animation or {},
                    prop = prop and prop or {}, 
                    propTwo = propTwo and propTwo or {},
                }, function(cancelled)
                    if not cancelled then
                        if onFinish then
                            onFinish()
                        end
                    else
                        if onCancel then
                            onCancel()
                        end
                    end
                    bussy = false
                end)
            end
            
        end
    else
        tgiCore.notif(lang.alreadyError, "error")
        onCancel()
    end
end
