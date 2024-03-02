CreateThread(function()
    local resourceName = 'unk'

    if Prison.FrameworkTriggers.resourceName ~= '' then
        resourceName = IsScriptLoaded(Prison.FrameworkTriggers.resourceName) and Prison.FrameworkTriggers.resourceName == 'es_extended' or 'unk'
    elseif IsScriptLoaded('es_extended') then
        resourceName = IsScriptLoaded('es_extended') and 'es_extended' or 'unk'
    end

    IsResourceLoaded(resourceName, function(state, func)
        if state then
            ESX = func:getSharedObject()
    
            if not Prison.Notify.DefaultNotify then
                Bridge.Notify = function(data)
                    ESX.ShowNotification(data.description, data.type, 3000)
                end
            end
    
            -- Bridge.SetEntryOutfit = function()
            -- end
        end
    end)
end)
