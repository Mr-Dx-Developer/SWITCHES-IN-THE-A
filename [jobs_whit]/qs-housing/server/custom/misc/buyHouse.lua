RegisterServerEvent('housing:server:buyHouse')
AddEventHandler('housing:server:buyHouse', function(house, isCredit)
    local house = house
    local src = source
    local pData = GetPlayerFromId(src)
    local houses = #getHousesByIdentifier(pData.identifier) or 0
    local totalFees

    if Config.LimitOfHouses == 0 or houses < Config.LimitOfHouses then
        if not Config.Houses[house] or not house then return end
        local price = tonumber(Config.Houses[house].price)
        local brokerfee = (price * Config.Taxes.AgencyFee) / 100
        local bankfee = (price * Config.Taxes.BankFee) / 100
        local taxes = (price * Config.Taxes.TaxesFee) / 100
        if Config.Decimals then
            totalFees = tonumber(price + brokerfee + bankfee + taxes)
        else
            totalFees = math.floor(tonumber(price + brokerfee + bankfee + taxes))
        end
        local HousePrice = totalFees
        local eq = math.floor(HousePrice / Config.NumberOfPayments)
        local Balance = GetBankMoney(src)
        local timer = Config.NumberOfPayments * Config.CreditTime
        local seller
        local result = MySQL.Sync.fetchAll('SELECT * FROM houselocations WHERE name = @name', {
            ['@name'] = house,
        })

        if result[1].houseID then
            house_ID = result[1].houseID
        else
            updateidhouse(result[1].house)
        end

        if result and result[1] and result[1].creator then
            seller = GetPlayerIdentifier(result[1].creator)
        end
        if (Balance >= HousePrice) or (isCredit and Balance >= eq) then -- here
            local prices = isCredit and HousePrice - eq or 0
            MySQL.Async.execute("INSERT INTO `player_houses` (`house`, `"..identifierTypes.."`, `insideId`, `keyholders`, `decorations`, `stash`, `houseID`, `outfit`, `logout`, `decorateStash`, `charge`, `credit`, `creditPrice`, `timer`) VALUES ('" .. house .. "','" .. pData.identifier .. "', NULL, NULL, '{}', NULL, '" .. house_ID .. "', NULL, NULL, NULL, NULL, '" ..prices.. "', '" .. eq .. "', '" .. Config.CreditTime .. "')",{})
            local hous = MySQL.Sync.fetchAll('SELECT * FROM houselocations WHERE name = @name', { ['@name'] = house })
            if hous and hous[1] then
                local moneyToRealState = (HousePrice / 100) * Config.PercentageForSell
                MySQL.Async.execute("UPDATE `houselocations` SET `owned` = 1, `creator` = '" .. '' .. "' WHERE `name` = '" .. house .. "'", {}, function()
                    DebugPrint('A house was bought for ' .. json.encode(HousePrice) .. ' and ' .. moneyToRealState .. ' was sent to the real estate')
                    RemoveBankMoney(src, isCredit and eq or HousePrice) -- 21% Extra house costs

                    if result and result[1] and result[1].creator and result[1].creator ~= '' and result[1].creator ~= nil then
                        if seller then
                            AddBankMoney(seller.source, moneyToRealState)
                            if Config.Smartphone then
                                TriggerClientEvent('housing:client:sellerMail', seller.source, Lang('HOUSING_SMARTPHONE_MESSAGE_TITLE'), Lang('HOUSING_SMARTPHONE_MESSAGE_SUBJECT'), Lang('HOUSING_SMARTPHONE_MESSAGE_COMPLETE') .. math.floor(moneyToRealState / 2))
                            end
                        else
                            AddOfflineBank(result[1].creator, moneyToRealState)
                        end
                    end

                    if seller and Config.Society then
                        local societyName = GetJobName(seller.source)
                        local societyPaid = math.floor(tonumber((HousePrice / 100) * Config.SocietyPorcentage))
                        buyHouseSocietyMoney(src, societyName, societyPaid)
                        DebugPrint('Added ' .. societyPaid .. ' to the ' .. societyName .. ' society with ' .. Config.Society)
                    else
                        DebugPrint('The seller and creator of this house no longer has a character on your server, therefore he did not receive any salary in society...')
                        ::continue::
                    end

                    Config.Houses[house].owned = true
                    Config.Houses[house].identifier = pData.identifier
                    Config.Houses[house].keys = {}

                    UpdateHouseServer(house, Config.Houses[house])
                    TriggerClientEvent('housing:client:changeClosestHouse', -1, house)

                    if Config.Webhooks.buyhouse ~= '' or not Config.Webhooks.buyhouse then
                        sendToDiscordBuyHouse(Config.WebhookTranslates['buyhouse']['title'],
                            Config.WebhookTranslates['buyhouse']['player'] .. ' ' .. GetPlayerName(src) ..
                            Config.WebhookTranslates['buyhouse']['license'] .. ' ' .. pData.identifier ..
                            Config.WebhookTranslates['buyhouse']['coords'] .. ' ' .. json.encode(Config.Houses[house].coords.enter.x) .. ', ' .. json.encode(Config.Houses[house].coords.enter.y) .. ', ' .. json.encode(Config.Houses[house].coords.enter.z) ..
                            Config.WebhookTranslates['buyhouse']['price'] .. ' $' .. HousePrice ..
                            Config.WebhookTranslates['buyhouse']['realestateMoney'] .. ' $' .. moneyToRealState,
                            7393279)
                    end
                end)
            else
                MySQL.Async.execute('INSERT INTO houselocations (name, label, coords, owned, price, tier, garage) VALUES (@name, @label, @coords, @owned, @price, @tier, @garage)', {
                    ['@name'] = house,
                    ['@label'] = house,
                    ['@coords'] = json.encode(Config.Houses[house].coords),
                    ['@owned'] = 1,
                    ['@price'] = HousePrice,
                    ['@tier'] = Config.Houses[house].tier,
                    ['@garage'] = json.encode(Config.Houses[house].garage)
                }, {}, function()
                    local moneyToRealState = (HousePrice / 100) * Config.PercentageForSell
                    RemoveBankMoney(src, isCredit and eq or HousePrice) -- 21% Extra house costs
                    DebugPrint('A house was bought for ' .. json.encode(HousePrice) .. ' and ' .. moneyToRealState .. ' was sent to the real estate')
                    if result and result[1] and result[1].creator and result[1].creator ~= '' and result[1].creator ~= nil then
                        if seller then
                            AddBankMoney(seller.source, moneyToRealState)
                            if Config.Smartphone then
                                TriggerClientEvent('housing:client:sellerMail', seller.source, Lang('HOUSING_SMARTPHONE_MESSAGE_TITLE'), Lang('HOUSING_SMARTPHONE_MESSAGE_SUBJECT'), Lang('HOUSING_SMARTPHONE_MESSAGE_COMPLETE') .. math.floor(moneyToRealState / 2))
                            end
                        else
                            AddOfflineBank(result[1].creator, moneyToRealState)
                        end
                    end

                    if seller and Config.Society then
                        local societyName = GetJobName(seller.source)
                        local societyPaid = math.floor(tonumber((HousePrice / 100) * Config.SocietyPorcentage))
                        buyHouseSocietyMoney(src, societyName, societyPaid)

                        DebugPrint('Added ' .. societyPaid .. ' to the ' .. societyName .. ' society with ' .. Config.Society)
                    else
                        DebugPrint('The seller and creator of this house no longer has a character on your server, therefore he did not receive any salary in society...')
                        ::continue::
                    end

                    Config.Houses[house] = {
                        coords = Config.Houses[house].coords,
                        owned = true,
                        price = HousePrice,
                        locked = true,
                        adress = house,
                        tier = Config.Houses[house].tier,
                        garage = Config.Houses[house].garage,
                        decorations = Config.Houses[house].decorations or {},
                        mlo = {},
                        identifier = pData.identifier,
                        keys = {},
                        houseID = houseID,
                    }

                    UpdateHouseServer(house, Config.Houses[house])
                    TriggerClientEvent('housing:client:changeClosestHouse', -1, house)

                    if Config.WebhookEnable.buyhouse then
                        sendToDiscordBuyHouse(Config.WebhookTranslates['buyhouse']['title'],
                            Config.WebhookTranslates['buyhouse']['player'] .. ' ' .. GetPlayerName(src) ..
                            Config.WebhookTranslates['buyhouse']['license'] .. ' ' .. pData.identifier ..
                            Config.WebhookTranslates['buyhouse']['coords'] .. ' ' .. json.encode(Config.Houses[house].coords.enter.x) .. ', ' .. json.encode(Config.Houses[house].coords.enter.y) .. ', ' .. json.encode(Config.Houses[house].coords.enter.z) ..
                            Config.WebhookTranslates['buyhouse']['price'] .. ' $' .. HousePrice ..
                            Config.WebhookTranslates['buyhouse']['realestateMoney'] .. ' $' .. moneyToRealState,
                            7393279)
                    end
                end)
            end
            DebugPrint('Home purchase for $' .. HousePrice .. '...')
        else
            TriggerClientEvent('housing:client:sendMessage', src, Lang('HOUSING_NOTIFICATION_NO_MONEY'), 'error')
        end
    else
        TriggerClientEvent('housing:client:sendMessage', src, Lang('HOUSING_NOTIFICATION_HOUSE_LIMIT'), 'error')
    end
end)
