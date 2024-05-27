-- stolen from esx_status for backwards compatibility.
RegisterNetEvent("esx_status:add", function(type, number)
    if type == "drunk" then
        AddPlayerDrunkPercentage(3)
    end
end)

-- stolen from qb-smallresources for backwards compatibility.
local alcoholCount = 0

function CountEvidence(itemName, skipDrunk)
    if not skipDrunk then
        AddPlayerDrunkPercentage(3)
    end
    alcoholCount = alcoholCount + 1
    if alcoholCount > 1 and alcoholCount < 4 then
        TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
    elseif alcoholCount >= 4 then
        TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
    end
end

RegisterNetEvent("rcore_drunk:OnBottleFinish", function()
    CountEvidence(nil, true)
end)

RegisterNetEvent("consumables:client:DrinkAlcohol", CountEvidence)

CreateThread(function()
    while true do
        Wait(10)
        if alcoholCount > 0 then
            Wait(1000 * 60 * 15)
            alcoholCount = alcoholCount - 1
        else
            Wait(2000)
        end
    end
end)
