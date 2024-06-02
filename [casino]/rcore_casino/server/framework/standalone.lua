if Framework.Active == 3 then
    ESX = {}

    ESX.RegisterUsableItem = function(itemName, callBack)

    end

    ESX.GetPlayerFromId = function(source)
        local s = source
        local xPlayer = {}
        ---------
        xPlayer.identifier = GetPlayerIdentifierType(s, "fivem:")
        ---------
        xPlayer.license = GetPlayerIdentifierType(s, "license:")
        ---------
        local pCache = Cache:GetNow(xPlayer.identifier) or {}
        if not pCache.fakeInventory then
            pCache.fakeInventory = {
                [Config.ChipsInventoryItem] = Framework.STANDALONE_INITIAL_CHIPS
            }
        end
        if not pCache.fakeAccounts then
            pCache.fakeAccounts = {
                ["cash"] = 0
            }
        end

        xPlayer.job = {
            name = pCache.jobGrade and "casino" or "unemployed",
            label = pCache.jobGrade and "casino" or "unemployed",
            grade = {
                name = pCache.jobGrade,
                level = pCache.jobGrade
            }
        }
        ---------
        xPlayer.getGroup = function()
            for k, v in pairs(AdminGroup) do
                if IsPlayerAceAllowed(s, k) then
                    return "admin"
                end
            end
            return "player"
        end
        ---------
        xPlayer.getJob = function()
            return {
                grade = pCache.jobGrade,
                grade_name = pCache.jobGrade,
                name = pCache.jobGrade and "casino" or "unemployed"
            }
        end
        ---------
        xPlayer.getName = function()
            return GetPlayerName(s)
        end
        ---------
        xPlayer.getTotalAmount = function(item)
            return pCache.fakeInventory[item] or 0
        end
        ---------
        xPlayer.addInventoryItem = function(item, count)
            local newAmount = (pCache.fakeInventory[item] or 0) + count
            pCache.fakeInventory[item] = newAmount
        end
        ---------
        xPlayer.removeInventoryItem = function(item, count)
            local newAmount = (pCache.fakeInventory[item] or 0) - count
            if newAmount < 0 then
                newAmount = 0
            end
            pCache.fakeInventory[item] = newAmount
        end
        ---------
        xPlayer.getMoney = function()
            return pCache.fakeAccounts["cash"] or 0
        end
        ---------
        xPlayer.addMoney = function(money)
            local newAmount = (pCache.fakeAccounts["cash"] or 0) + money
            pCache.fakeAccounts["cash"] = newAmount
        end
        ---------
        xPlayer.addAccountMoney = function(type, money)
            if type == "money" then
                type = "cash"
            end
            local newAmount = (pCache.fakeAccounts[type] or 0) + money
            pCache.fakeAccounts[type] = newAmount
        end
        ---------
        xPlayer.getAccount = function(type)
            return {
                money = pCache.fakeAccounts[type] or 0
            }
        end
        ---------
        xPlayer.removeAccountMoney = function(type, money)
            local newAmount = (pCache.fakeAccounts[type] or 0) - money
            if newAmount < 0 then
                newAmount = 0
            end
            pCache.fakeAccounts[type] = newAmount
        end
        ---------
        xPlayer.removeMoney = function(money)
            local newAmount = (pCache.fakeAccounts["cash"] or 0) - money
            if newAmount < 0 then
                newAmount = 0
            end
            pCache.fakeAccounts["cash"] = newAmount
        end
        ---------
        xPlayer.getInventoryItem = function(itemName)
            local ItemInfo = {
                name = itemName,
                count = pCache.fakeInventory[itemName] or 0,
                label = pCache.fakeInventory[itemName],
                weight = 0,
                usable = false,
                rare = false,
                canRemove = false
            }
            return ItemInfo
        end
        ---------
        return xPlayer
    end

end
