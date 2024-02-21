function ShowNotification(message, notifyType)
    lib.notify({
        description = message,
        type = notifyType,
        position = 'top-right'
    })
end

function ShowUI(text, icon)
    if icon == 0 then
        lib.showTextUI(text)
    else
        lib.showTextUI(text, {
            icon = icon
        })
    end
end

function HideUI()
    lib.hideTextUI()
end

function ShowProgressBar(text, duration, canCancel, anim, prop)
    return lib.progressBar({
        duration = duration,
        label = text,
        useWhileDead = false,
        canCancel = canCancel,
        disable = {
            car = true,
            move = true,
            combat = true
        },
        anim = anim,
        prop = prop
    })
end

function IsProgressActive()
    return lib.progressActive()
end

function CancelProgress()
    lib.cancelProgress()
end