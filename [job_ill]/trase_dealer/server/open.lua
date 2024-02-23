-- Can edit this file to change the behaviour of the script.

-- This function is used to alert the police after a denied drug sale.
function AlertPolice(coords)
    if GetResourceState("qs-dispatch") == "started" then
        TriggerEvent("qs-dispatch:server:CreateDispatchCall", {
            job = Config.Police.Jobs,
            callLocation = coords,
            callCode = {
                code = Config.Strings['Dispatch_Title'],
                snippet = Config.Strings['Dispatch_Code']
            },
            message = Config.Strings['Dispatch_Description'],
            flashes = true,
            image = nil,
            blip = {
                sprite = 108,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = Config.Strings['Dispatch_Title'],
                time = 5 * 60 * 1000,
            }
        })
    elseif GetResourceState("ps-dispatch") == "started" then
        TriggerEvent("ps-dispatch:server:notify", {
            message = Config.Strings['Dispatch_Description'],
            codeName = Config.Strings['Dispatch_Title'],
            code = Config.Strings['Dispatch_Code'],
            icon = "fas fa-vault",
            priority = 2,
            coords = coords,
            jobs = Config.Police.Jobs,
        })
    elseif GetResourceState("cd_dispatch") == "started" then
        TriggerClientEvent("cd_dispatch:AddNotification", -1, {
            job_table = Config.Police.Jobs,
            coords = coords,
            title = Config.Strings['Dispatch_Title'],
            message = Config.Strings['Dispatch_Description'],
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 108,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = Config.Strings['Dispatch_Title'],
                time = 5,
                radius = 0,
            }
        })
    else
        local Police = GetActivePolice()
        for k, v in pairs(Police) do
            TriggerClientEvent('trase_dealer:client:alertPD', v, coords)
        end
    end
end

-- Can add an option to return a multiplier to add, must return a valid integer so for e.g. 25 = 25% increase.
function ShouldAddMultiplier(target)
    return false
end

-- Should return a bool, if returns true it will decline the sell.
function ShouldDeny(target)
    local targetped = GetPlayerPed(target)
    local targetcoords = GetEntityCoords(targetped)
    for k, v in pairs(Config.BlacklistedLocations) do
        local dist = #(targetcoords.xyz - v.xyz)
        if (dist <= v.w) then
            return true
        end
    end
    return false
end