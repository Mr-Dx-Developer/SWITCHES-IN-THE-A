RegisterServerEvent('drugboatheist:server:policeAlert')
AddEventHandler('drugboatheist:server:policeAlert', function(coords)
    if Config['DrugBoatHeist']['framework']['name'] == 'ESX' then
        local players = ESX.GetPlayers()
        for i = 1, #players do
            local player = ESX.GetPlayerFromId(players[i])
            if player['job']['name'] == Config['DrugBoatHeist']['setjobForPolice'] then
                TriggerClientEvent('drugboatheist:client:policeAlert', players[i], coords)
            end
        end
    elseif Config['DrugBoatHeist']['framework']['name'] == 'QB' then
        local players = QBCore.Functions.GetPlayers()
        for i = 1, #players do
            local player = QBCore.Functions.GetPlayer(players[i])
            if player.PlayerData.job.name == Config['DrugBoatHeist']['setjobForPolice'] then
                TriggerClientEvent('drugboatheist:client:policeAlert', players[i], coords)
            end
        end
    end
end)

discord = {
    ['webhook'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['name'] = 'rm_drugboatheist',
    ['image'] = 'https://media.discordapp.net/attachments/1092459678614700195/1198335566765375518/logo-187456c5.png?width=602&height=602'
}

function discordLog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = data, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end