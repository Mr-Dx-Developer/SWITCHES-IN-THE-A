local TRAVERSE_MAP_POSITION = {
    ['right'] = 'right-center',
    ['left'] = 'left-center',
    ['top'] = 'top-center'
}

LibText = nil

local Libraries = {
    [1] = "qb-core",
    [2] = "esx_textui",
    [3] = "ox_lib",
    [4] = "rcore_prison",
}

CreateThread(function()
    for shortName, resourceName in ipairs(Libraries) do
        if IsResourceOnServer(resourceName) then
            LibText = resourceName
            break
        end
    end

    if not LibText then
        LibText = Prison.UI.RenderSentenceResource
    end

    if not Prison.UI.RenderSentenceTextPosition then
        Prison.UI.RenderSentenceTextPosition = 'right'
    end

    if Prison.UI.RenderSentenceResource ~= LibText then
        if Prison.UI.RenderSentenceResource == TextLibraries.AUTO and LibText then
            return dbg.debugAPI('[JAIL_TIME_RENDER] Using resource for loading text: %s', LibText)
        end

        LibText = Prison.UI.RenderSentenceResource
        
        HideTextUI()
        dbg.debugAPI('[JAIL_TIME_RENDER] Enforcing usage of resource since it was enforced by %s', LibText)
    else
        HideTextUI()
        dbg.debugAPI('[JAIL_TIME_RENDER] Using resource for loading text: %s', LibText)
    end
end)

function DisplayTime(jailTime)
    if LibText == TextLibraries.QBCORE then
        exports['qb-core']:DrawText(jailTime, Prison.UI.RenderSentenceTextPosition:lower())
    elseif LibText == TextLibraries.OX then
        lib.showTextUI(jailTime, {
            position = TRAVERSE_MAP_POSITION[Prison.UI.RenderSentenceTextPosition:lower()],
        })
    elseif LibText == TextLibraries.QBCORE then
        BeginTextCommandBusyspinnerOn("STRING")
        AddTextComponentSubstringPlayerName(jailTime)
        EndTextCommandBusyspinnerOn(1)
    elseif LibText == TextLibraries.ESX then
        exports['esx_textui']:TextUI(jailTime, 'info')
    else
        BeginTextCommandBusyspinnerOn("STRING")
        AddTextComponentSubstringPlayerName(jailTime)
        EndTextCommandBusyspinnerOn(1)
    end
end

function HideTextUI()
    SetTimeout(3000, function ()
        if LibText == TextLibraries.QBCORE then
            exports['qb-core']: HideText()
        elseif LibText == TextLibraries.OX then
            lib.hideTextUI()
        elseif LibText == TextLibraries.ESX then
            exports['esx_textui']:HideUI()
        else
            ClearAllHelpMessages()
            BusyspinnerOff()
        end
	end)
end

AddEventHandler('rcore_prison:hudState', function(actionType, state)
    if actionType == 'released' then
        HideTextUI()
    end
end)
