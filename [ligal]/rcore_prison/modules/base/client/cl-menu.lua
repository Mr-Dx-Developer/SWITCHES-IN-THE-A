Missions = function(renderData)
    local array = {
        {
            header = l('JOBS_LABEL_INTERACT'),
            isMenuHeader = true,
        },
    }

    for jobIndex, missionData in pairs(shared.data.jobs) do
        array[#array + 1] = {
            header =  missionData.name,
            params = {
                isServer = true,
                event = 'rcore_prison:registerForJob',
                args = jobIndex
            },
        }
    end

    Frontend:CreateMenu('jobs', l('MENU_JOBS_LABEL'), array, true)
end

AddEventHandler('rcore_prison:handleCanteen', function(data)
    RenderCanteen(Prison.Canteen)
end)

RenderTransactions = function()
    local array = {
        {
            header = l('ACCOUNT_TITLE'),
            isMenuHeader = true,
        },
    }

	local transactions = callback.await('rcore_prison:fetchAccountTransactions')

    if Utils.tablesize(transactions) <= 0 then
        array[#array + 1] = {
            header = l('ACCOUNT_TRANSACTIONS_NOT_RECEIVED_ANY'),
            params = {},
        }
    else
        for k, v in pairs(transactions) do
            array[#array + 1] = {
                header = l('ACCOUNT_TRANSACTIONS') .. ' [' .. k .. ']',
                txt = v.message,
                params = {},
            }
        end
    end

    Frontend:CreateMenu('transactions', l('MENU_TRANSACTIONS_LABEL'), array, true)
end

RenderLobby = function()
    local array = {
        {
            header = l('LOBBY_LABEL_INTERACT'),
            isMenuHeader = true,
        },
    }

    array[#array + 1] = {
        header = l('LOBBY_MENU_GIFT'),
        txt = l('LOBBY_MENU_GIFT'),
        params = {
            event = 'rcore_prison:menu:execute',
            args = {
                taskType = 'lobbySentCredits',
                type = 'input',
            }
        },
    }

    if not Prison.Release.ReturnItemsOnRelease then
        array[#array + 1] = {
            header = l('LOBBY_MENU_RETURN_ITEMS'),
            txt = l('LOBBY_MENU_RETURN_ITEMS'),
            params = {
                isServer = true,
                event = 'rcore_prison:returnStashedItems',
                args = {
                    taskType = 'lobbySentCredits',
                    type = 'input',
                }
            },
        }
    end

    Frontend:CreateMenu('lobby', l('MENU_LOBBY_LABEL'), array, true)
end


RenderAccountMenu = function(data)
    local array = {
        {
            header = l('ACCOUNT_TITLE'),
            isMenuHeader = true,
        },
    }

    if PrisonAccounts and type(PrisonAccounts) == 'table' and Utils.tablesize(PrisonAccounts) > 0 then
        array[#array + 1] = {
            header =  l('ACCOUNT_TRANSACTIONS'),
            txt = l('ACCOUNT_TRANSACTIONS'),
            params = {
                event = 'rcore_prison:menu:execute',
                args = {
                    taskType = 'viewTransactions',
                    type = 'input',
                }
            },
        }
     
        array[#array + 1] = {
            header = l('ACCOUNT_INSERT_CREDITS'),
            txt = l('ACCOUNT_INSERT_CREDITS'),
            params = {
                event = 'rcore_prison:menu:execute',
                args = {
                    taskType = 'insertAccountCredit',
                    type = 'input',
                }
            },
        }

        array[#array + 1] = {
            header =  ('%s [%s]'):format(l('ACCOUNT_ID'), PrisonAccounts.account_id),
            params = {},
        }

        array[#array + 1] = {
            header =  ('%s [%s]'):format(l('ACCOUNT_CREDIT'), PrisonAccounts.balance),
            params = {},
        }

        array[#array + 1] = {
            header =  ('%s [%s]'):format(l('ACCOUNT_GIFTSTATE'), GetBooleanToText(PrisonAccounts.giftState)),
            params = {},
        }
    else
        array[#array + 1] = {
            header = l('ACCOUNT_REGISTER'),
            txt = l('ACCOUNT_REGISTER'),
            params = {
                event = 'rcore_prison:menu:execute',
                args = {
                    taskType = 'createAccount',
                    type = 'input',
                }
            },
        }
    end

    Frontend:CreateMenu('account', l('MENU_ACCOUNT_LABEL'), array, true)
end

RenderCanteen = function(renderData)
    local array = {
        {
            header = l('CANTEEN_TITLE'),
            isMenuHeader = true,
        },
    }

    if Prison.Canteen.FreeFood then
        array[#array + 1] = {
            header =  l('CANTEEN_REQUEST_FOOD_LABEL'),
            params = {
                isServer = true,
                event = 'rcore_prison:requestFood',
                args = CLOSEST_PLACE
            },
        }
    end

    for index, data in pairs(renderData) do
        if not array[#array + 1] then
            array[#array + 1] = {
                header = data.label,
                txt = ('%s %s'):format(l('CANTEEN_PRICE'), data.cost),
                params = {
                    event = 'rcore_prison:menu:execute',
                    args = {
                        label = data.label,
                        type = 'input',
                        itemId = index
                    }
                },
            }
        end
    end

    Frontend:CreateMenu('canteen', l('MENU_CANTEEN_LABEL'), array, true)
end


function KeyboardInput(Title, Text, MaxStringLenght)
    local result = nil

    AddTextEntry('RCORE_INPUT_ENTRY', Title)

    DisplayOnscreenKeyboard(1, "RCORE_INPUT_ENTRY", Title, Text, "", "", "", MaxStringLenght)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        result = GetOnscreenKeyboardResult()
    else
        Wait(0)
    end

    return result
end

function GetBooleanToText(state)
    local retval = nil

    if state == 1 then
        retval = l('YES')
    else
        retval = l('NO')
    end

    return retval
end

