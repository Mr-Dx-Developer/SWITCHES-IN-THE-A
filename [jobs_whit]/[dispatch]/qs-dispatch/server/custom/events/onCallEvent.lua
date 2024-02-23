local PoliceWebhookURL = 'https://discordapp.com/api/webhooks/1210729191683788920/ATLeQ8-EwjHNbGnp4nZ3z5cEm0pMZfi_6ySTd3LXa4QetNICe7aKdcuy-w4b-QggSu-L' -- webhook URL HERE
local AmbulanceWebhookURL = 'https://discordapp.com/api/webhooks/1210729248185126965/Giihyyo54pqnEtol8A0ivvcKP04LAEwKPYO3lgc1ukYtnW-PSoxTf6CTLjhBOsTICdHS' -- webhook URL HERE

function OnCallEvent(job, callLocation, callCode, message, flashes, image, ThisCount)

    if Contains(job, "police") then

        if PoliceWebhookURL == '' then return WarningPrint('You dont have a configured webhook (police), please go to "server/custom/envents/onCallEvent.lua" an set it.') end
        exports['qs-dispatch']:SendWebhook(PoliceWebhookURL, 'Police Call', '#3246a8', message, image)

    elseif Contains(job, "ambulance") then

        if AmbulanceWebhookURL == '' then return WarningPrint('You dont have a configured webhook (ambulance), please go to "server/custom/envents/onCallEvent.lua" an set it.') end
        exports['qs-dispatch']:SendWebhook(AmbulanceWebhookURL, 'Ambulance Call', '#ff0040', message, image)

    end
end


function JailEvent(job, message, image)

    -- you can implement your things here

end