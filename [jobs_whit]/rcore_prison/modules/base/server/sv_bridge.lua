Bridge.CreateLog = function(title, message)
    if not Logs.Hook then return LevelDebug(3, 'Failed to create log, undefined hook!') end

    local title = title and title or 'Action'
    local message = message and message or 'unk message'


    local embeds = {
        {
            ["color"] = 16007897,
            ["title"] = "**" .. title .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "rcore_prison",
            },
        }
    }

    PerformHttpRequest(
        Logs.Hook,
        function(err, text, headers) end,
        'POST',
        json.encode({ username = 'Logs', embeds = embeds }),
        { ['Content-Type'] = 'application/json' }
    )
end

Bridge.HandleAutoJailTimeout = function(serverId)
    local player = Bridge.GetPlayer(serverId)

    if not player then
        return
    end

    local charId = player.charid

    if charId and not IsUserOnCWPeroll(charId) then
        return
    end

    local idx = getUserCW(serverId)

    if CWUsers and CWUsers[idx] and CWUsers[idx].currentDone > 0 then
        return
    end

    local jailTime = Prison.CS.TimeoutToJail * 60

    local firstThreshold = jailTime / 1.2
    local secondThreshold = jailTime / 1.5
    local thirdTreshold = jailTime / 2

    local base = (jailTime * 1000) + GetGameTimer()

    local STATE = 0
    local isFinished = false

    local threadId = ('community_service_timeout_%s'):format(serverId)

    dbg.debug('Loading auto jail timeout [cs] for user [%s] | SID [%s]', GetPlayerName(serverId), serverId)

    SetServerInterval(threadId, 1000, function()
        local time = GetGameTimer()
        local timeLeft = tonumber(math.floor((base - time) / 1000)) + 2
        local idx = getUserCW(serverId)

        if CWUsers[idx] and CWUsers[idx].currentDone > 0 then
            ClearServerInterval(threadId)
        end

        if timeLeft <= (firstThreshold) and STATE == 0 then
            STATE = 1
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('COMMUNITY_SERVICE_FIRST_THRESHOLD'), SecondsToClock(timeLeft)),
                position = 'top',
                lenght = 7000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        elseif timeLeft <= (secondThreshold) and STATE == 1 then
            STATE = 2
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('COMMUNITY_SERVICE_FIRST_SECHOLD'), SecondsToClock(timeLeft)),
                position = 'top',
                lenght = 7000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        elseif timeLeft <= (thirdTreshold) and STATE == 2 then
            STATE = 3
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('COMMUNITY_SERVICE_FIRST_THIRDHOLD'), SecondsToClock(timeLeft)),
                position = 'top',
                lenght = 7000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        elseif timeLeft <= 0 and STATE == 3 then
            ClearServerInterval(threadId)

            if timeLeft <= 0 then
                timeLeft = 0
            end

            if isFinished then
                return
            end

            isFinished = true

            if charId and IsUserOnCWPeroll(charId) then
                exports['rcore_prison']:Unjail(serverId, {
                    skipTeleport = true
                })

                if CWUsers[idx] then
                    CWUsers[idx] = nil
                end

                Bridge.CreateLog('Community Service',
                    'Enforced jail on citizen, not doing any perolls!\n' .. GetPlayerName(serverId))

                SetTimeout(5000, function()
                    isFinished = false
                    exports['rcore_prison']:Jail(serverId, Prison.CS.TimeoutToJailSentence, 'Not doing community service!')
                end)
            end
        end
    end)
end

CreateThread(function()
    if not Prison.CheckDist then
        return
    end

    local cycleTime = Prison.CheckDistTime

    while true do
        Wait(cycleTime)

        if next(Prisoners) then
            for _, data in pairs(Prisoners) do
                if data.serverId and data.state == 'jailed' and not (data.isOutfitSelection or data.isReleased) then
                    if type(data.serverId) == 'number' then
                        local plyPed = GetPlayerPed(data.serverId)
                        local playerPos = GetEntityCoords(plyPed)
                        local prisonLoc = vector3(shared.data.prisonYard.x, shared.data.prisonYard.y,
                            shared.data.prisonYard.z)

                        local dist = glm.distance(prisonLoc, playerPos)

                        if dist >= Prison.CheckEscapeDist then
                            SetEntityCoords(plyPed, prisonLoc)

                            Bridge.Notify(data.serverId, {
                                title = l('WARDEN_TITLE'),
                                subtitle = l('PRISON_TITLE'),
                                description = ('%s'):format(l('JAIL_ESCAPE_PRISON')),
                                position = 'top',
                                lenght = 4000,
                                style = {
                                    backgroundColor = '#141517',
                                    color = '#909296'
                                },
                            })
                        else
                            goto CheckDist
                        end
                    else
                        goto CheckDist
                    end
                end
            end
        else
            goto CheckDist
        end

        ::CheckDist::

        Wait(cycleTime)
    end
end)

Bridge.InsertAccountCredits = function(Source, amount)
    local player = Bridge.GetPlayer(Source)

    HasUserPrisonAccount(player.charid, function(state)
        if state then
            dbg.debug('Insert credits for [%s] - amount [%s]', player.name, amount)

            local prisonAccount = GetPrisonerAccount(player.charid)
            local hasAmount = Bridge.GetItem(Source, Prison.Accounts.CreditsItem)

            dbg.debugInventory('Inserting credit check if user has enough %s for inserting amount: %s -> has amount: %s | User: %s', Prison.Accounts.CreditsItem, amount, hasAmount, player.name)

            amount = tonumber(amount)

            if hasAmount >= amount then
                InventoryTransaction(Source,
                {
                    take = {
                        {
                            itemName = Prison.Accounts.CreditsItem,
                            count = amount,
                        }
                    },
                },
                function()
                    prisonAccount.balance = prisonAccount.balance + amount

                    local accountId = prisonAccount.account_id

                    Bridge.RemoveItem(Source, Prison.Accounts.CreditsItem, amount)
                    
                    db.UpdatePrisonAccountBalance(prisonAccount.balance, player.charid)

                    local label = l('ACCOUNT_DEPOSIT_CREDITS_TRANSACTIONS')

                    db.InsertNewTransaction({
                        accountId = accountId,
                        transanction = {
                            name = player.name,
                            text = '%s %s [%s]'
                        }
                    }, label, amount, player.name)

                    Bridge.Notify(Source, {
                        title = l('WARDEN_TITLE'),
                        subtitle = l('PRISON_TITLE'),
                        description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_SENT'), amount),
                        position = 'top',
                        lenght = 4000,
                        style = {
                            backgroundColor = '#141517',
                            color = '#909296'
                        },
                    })

                    SyncAccountData(Source, prisonAccount)
                end,
                function(_, statusCode)
                    Bridge.Notify(Source, {
                        title = l('WARDEN_TITLE'),
                        subtitle = l('PRISON_TITLE'),
                        description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_FAILED_SENT'), amount),
                        position = 'top',
                        lenght = 4000,
                        style = {
                            backgroundColor = '#141517',
                            color = '#909296'
                        },
                    })
                end)
            else
                Bridge.Notify(Source, {
                    title = l('WARDEN_TITLE'),
                    subtitle = l('PRISON_TITLE'),
                    description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_FAILED_SENT'), amount),
                    position = 'top',
                    lenght = 4000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                })
            end
        end
    end)
end


Bridge.BuyItemFromCanteen = function(Source, data)
    local packageId = data and data.itemId or nil
    local player = Bridge.GetPlayer(Source)

    if not packageId then
        return dbg.debug('[%s] cannot buy item from canteen | packageId.', GetPlayerName(Source))
    end

    local prisonerData = GetPrisonerData(player.charid)

    if not prisonerData then
        Bridge.Notify(Source, {
            title = l('CANTEEN_TITLE'),
            description = ('%s [%s]'):format(l('PRISONER_REQUIRED'), l('CANTEEN_TITLE')),
            position = 'top',
            subtitle = l('WARDEN_TITLE'),
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return dbg.debug('[%s] Cannot buy item from canteen | prisonerState', GetPlayerName(Source))
    end

    local prisonAccount = GetPrisonerAccount(player.charid)

    if not prisonAccount then
        Bridge.Notify(Source, {
            title = l('CANTEEN_TITLE'),
            description = ('%s [%s]'):format(l('ACCOUNT_REQUIREMENT'), l('CANTEEN_TITLE')),
            position = 'top',
            subtitle = l('WARDEN_TITLE'),
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return
    end

    local shopData = shared.data.Canteen[packageId]
    local itemAmount = tonumber(data.amount)

    if shopData then
        local price = itemAmount * shopData.cost

        if prisonAccount.balance and prisonAccount.balance >= price then
            InventoryTransaction(Source,
                {
                    give = {
                        {
                            itemName = shopData.itemName,
                            count = itemAmount,
                        }
                    },
                },
                function()
                    prisonAccount.balance = prisonAccount.balance - price

                    Bridge.Notify(Source, {
                        title = l('CANTEEN_TITLE'),
                        description = ('%s %s %s %s %s [%s]'):format(l('YOU_HAVE_BOUGHT_ITEM'), shopData.itemName,
                            l('FOR_PRICE'), price, l('CREDITS_LABEL'), itemAmount),
                        position = 'top',
                        subtitle = l('TRANSACTION'),
                        lenght = 4000,
                        style = {
                            backgroundColor = '#141517',
                            color = '#909296'
                        },
                    })

                    local accountId = prisonAccount.account_id


                    db.InsertNewTransaction({
                        accountId = accountId,
                        transanction = {
                            name = l('CANTEEN_TITLE'),
                            text = ('%s %s %s %s %s [%s]'):format(l('YOU_HAVE_BOUGHT_ITEM'), shopData.itemName,
                                l('FOR_PRICE'), price, l('CREDITS_LABEL'), itemAmount)
                        }
                    }, l('CANTEEN_TITLE'), shopData.itemName, price, itemAmount)

                    db.UpdatePrisonAccountBalance(prisonAccount.balance, player.charid)

                    SyncAccountData(Source, prisonAccount)
                end,
                function(_, statusCode)
                end)
        else
            Bridge.Notify(Source, {
                title = l('CANTEEN_TITLE'),
                description = ('%s [%s] | [%s].'):format(l('NOT_ENOUGH_CREDITS'), shopData.itemName, price),
                position = 'top',
                subtitle = l('TRANSACTION'),
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        end
    end
end

Bridge.BuyItemFromDealer = function(Source, interactIdx, tradeIdx)
    if not interactIdx then
        return
    end

    local interact = shared.data.interaction[interactIdx]

    if not interact then
        return
    end

    local trade = interact.trade[tradeIdx]

    if not trade then
        return
    end

    local player = Bridge.GetPlayer(Source)
    local isPrisoner = GetPrisonerData(player.charid)

    if not isPrisoner then
        Bridge.Notify(Source, {
            title = l('WARDEN_TITLE'),
            subtitle = l('PRISON_TITLE'),
            description = l('PRISONER_REQUIRED'),
            position = 'top',
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return
    end

    InventoryTransaction(Source,
        {
            give = {
                {
                    itemName = trade.transaction.giveItem,
                    count = trade.transaction.giveCount,
                }
            },
            take = {
                {
                    itemName = trade.transaction.takeItem,
                    count = trade.transaction.takeCount
                }
            }
        },
        function()
            Bridge.Notify(Source, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('NPC_DEALER_RECEIVED_ITEM'), trade.transaction.giveItem),
                position = 'top',
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        end,
        function(_, statusCode)
            Bridge.Notify(Source, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s] %sx'):format(l('NPC_DEALER_NOT_ENOUGH'), trade.transaction.takeItem,
                    trade.transaction.takeCount),
                position = 'top',
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        end)
end

Bridge.HandleGiveCredits = function(serverId, input)
    local targetCreditsAmount = tonumber(input[1])
    local targetAccountId = tonumber(input[2])

    local targetAccountData = SearchAccountBySpecificId(targetAccountId)
    local unkAccountLabel = l('ACCOUNT_DOESNT_EXIST')

    if targetAccountData == nil then
        Bridge.Notify(serverId, {
            title = l('PRISON_TITLE'),
            subtitle = l('WARDEN_TITLE'),
            description = ('%s [%s]'):format(unkAccountLabel, targetAccountId),
            position = 'top',
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return
    end

    local targetCharId = targetAccountData.owner
    local prisonAccount = GetPrisonerAccount(targetCharId)
    local performGifts = prisonAccount.giftState and prisonAccount.giftState >= 1 and true or false

    if prisonAccount then
        local label = l('ACCOUNT_CANNOT_ACCEPT_GIFTS')

        if not performGifts then
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(label, targetAccountId),
                position = 'top',
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })

            return
        end

        local lang = l('ACCOUNT_RECEIVED_TRANSACTION')
        local targetSID = prisonAccount.serverId or nil

        InventoryTransaction(serverId,
            {
                take = {
                    {
                        itemName = Prison.Accounts.CreditsItem,
                        count = targetCreditsAmount,
                    }
                },
            },
            function()
                prisonAccount.balance = prisonAccount.balance + targetCreditsAmount

                local accountId = prisonAccount.account_id

                db.UpdatePrisonAccountBalance(prisonAccount.balance, targetCharId)

                local label = l('ACCOUNT_RECEIVED_TRANSACTION')
                local targetUser = Bridge.GetPlayer(serverId)

                db.InsertNewTransaction({
                    accountId = accountId,
                    transanction = {
                        name = targetUser.name,
                        text = '%s %s [%s]'
                    }
                }, label, targetCreditsAmount, targetUser.name)


                Bridge.Notify(serverId, {
                    title = l('WARDEN_TITLE'),
                    subtitle = l('PRISON_TITLE'),
                    description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_SENT'), targetAccountId),
                    position = 'top',
                    lenght = 4000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                })

                NotifyPrisoner(targetCharId, '%s %s [%s]', lang, targetCreditsAmount, targetUser.name)

                if targetSID then
                    SyncAccountData(targetSID, PrisonAccounts[targetCharId])
                end
            end,
            function(_, statusCode)
                Bridge.Notify(serverId, {
                    title = l('WARDEN_TITLE'),
                    subtitle = l('PRISON_TITLE'),
                    description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_FAILED_SENT'), targetCreditsAmount),
                    position = 'top',
                    lenght = 4000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                })
            end)
    end
end
