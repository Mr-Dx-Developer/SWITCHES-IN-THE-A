function meDoEmote(cm)
    print("Penis: " .. cm .. "cm")
end

local function scriptIsStarted(name)
    return GetResourceState(name) ~= "missing"
end

function resetClothing()
    if scriptIsStarted("tgiann-clothing") then
        TriggerEvent("tgiann-clothing:refreshSkin")
    elseif scriptIsStarted("fivem-appearance") then
        TriggerEvent("fivem-appearance:client:reloadSkin")
    elseif scriptIsStarted("illenium-appearance") then
        TriggerEvent("illenium-appearance:client:reloadSkin")
    else
        if config.framework == "qb" then
            TriggerServerEvent("qb-clothes:loadPlayerSkin")  -- LOADING PLAYER'S CLOTHES
            TriggerServerEvent("qb-clothing:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES - Event 2
            TriggerEvent("qb-radialmenu:ResetClothing")
        else
            tgiCore.cbFunction('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        end
    end
end

function canUse() --it works when you use the unclothe command(client)
    return true
end
