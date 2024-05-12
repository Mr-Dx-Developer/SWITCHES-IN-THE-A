Config.Slots = 3

Config.EnableStarterItems = true
Config.StarterItems = {
    {name = 'phone', count = 1},
    {name = 'giftbox', count = 1},
    {name = 'gibmxftbox', count = 1},
    {name = 'id_card', count = 1},
}

Config.EnableStarterMoney = false
Config.StarterMoney = {
    {account = 'cash', amount = 500},
    {account = 'bank', amount = 25000},
}

openSpawnSelector = function(src, cData)
    if Config.UseCustomSpawnSelector then
        TriggerClientEvent('vms_spawnselector:open', src)
    else
        TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
    end
end