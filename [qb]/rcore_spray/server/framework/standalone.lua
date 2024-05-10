if Framework == FW_OTHER then
    ShowNotification = function(source, text)
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="background: rgb(180, 136, 29); color: rgb(255, 255, 255); padding: 5px;">{0}</div>',
            args = { text }
        })
    end
end