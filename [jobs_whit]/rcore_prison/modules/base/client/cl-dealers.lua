RenderDealerMenu = function()
    local array = {
        {
            header = l('NPC_DEALER_PRISON_LABEL_OFFER'),
            isMenuHeader = true,
        },
    }

    local data = shared.data.interaction[CLOSEST_PLACE]
    
    if not data then
        return
    end

    if data.trade then
        for i = 1, #data.trade do
            local item = data.trade[i]

            array[#array + 1] = {
                header =   ('%s %s [%s] %sx'):format(item.label, l('NPC_DEALER_PRISON_LABEL_EXCHANGE'), item.transaction.takeItem, item.transaction.takeCount),
                params = {
                    event = 'rcore_prison:menu:execute',
                    args = {
                        itemId = i,
                        zoneIdx = CLOSEST_PLACE,
                        taskType = 'dealerItems',
                        type = 'input',
                    }
                },
            }
        end
    end 

    Frontend:CreateMenu('dealer', l('MENU_DEALER_LABEL'), array, true)
end