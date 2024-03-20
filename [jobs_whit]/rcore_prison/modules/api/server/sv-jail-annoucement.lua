AddEventHandler('rcore_prison:prisonerState', function(data)
    local data = data
    local state = data and data.state or nil
    local prisoner = data?.prisoner

    if state == 'jailed' then
        if Prison.InformAboutNewPrisoner then
            TriggerClientEvent('chat:addMessage', -1, {
                color = { 255, 0, 0},
                multiline = true,
                args = {l('PRISON'), l('CITIZEN_JAILED_ANNOUCEMENT', prisoner?.name, prisoner?.jailTime)}
            }) 
        end
    end
end)

