
RegisterNetEvent('kq_priv_islands:server:toggleDoors')
AddEventHandler('kq_priv_islands:server:toggleDoors', function(islandKey)
    ToggleMansionDoors(source, islandKey)
end)

function ToggleMansionDoors(player, islandKey)
    if not IsIslandOwnedByPlayer(player, islandKey) then
        Debug('^1' .. player .. ' tried opening doors on island they dont own. ' .. islandKey)
        return
    end
    
    local island = FindOwnedIslandByName(islandKey)
    
    if not island['mansion'] then
        island['mansion'] = {}
    end
    island['mansion']['doors_open'] = not island['mansion']['doors_open']
    
    local newProperties = json.decode(island.properties)
    
    if not newProperties then
        newProperties = {}
    end
    
    if not newProperties['mansion'] then
        newProperties['mansion'] = {}
    end
    newProperties['mansion']['doors_open'] = not newProperties['mansion']['doors_open']
    
    SetIslandProperties(player, islandKey, newProperties)
end
