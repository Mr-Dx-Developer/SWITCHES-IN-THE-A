local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['qbjobs'] = 'https://discordapp.com/api/webhooks/1210701945220632617/_4PHL2ZJggRtnXF6xKGjpsdT2gLcnayjlT-gDfgYsmjG6X52LilY8Xa6X0e0EaMUss1w',
    ['humanelabs'] = 'https://discordapp.com/api/webhooks/1210702122241364058/ghmUP6gz1ePne-6nUzE9QmlHsq89rIkRHgrTNCtMgPwsPnxRt5Ega_rz2lbZ2KtmVmso',
    ['default'] = 'https://discord.com/api/webhooks/1202099202902216724/s0S-UK54r5nIpg8XvSg-',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1202099349908099102/gfFE5ML6ld--wAp2uI-gmAV7BAMF28cdrGkWaOH',
    ['playermoney'] = 'https://discord.com/api/webhooks/1202099456695074816/irxkMu--lSYGFLKAE4dawx-weFYUm-WjwZjzGPLbqI7v',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1202099580590628884/-ufdoolj4bzrzSsL8UWHTB0oGSGP',
    ['robbing'] = 'https://discord.com/api/webhooks/1202099688119992422/',
    ['cuffing'] = 'https://discord.com/api/webhooks/1202099792159973387/-anHsavtQMIggw33pXr3fIXvfl1ZA',
    ['drop'] = 'https://discord.com/api/webhooks/1202099901501022218/-3UCsqOjNCnUwGaAN6A',
    ['trunk'] = 'https://discord.com/api/webhooks/1202100000029671494/',
    ['stash'] = 'https://discord.com/api/webhooks/1202100094187610192/TnUtEZUdqSPAyXDyCL3Rf3cLKZ--',
    ['glovebox'] = 'https://discord.com/api/webhooks/1202100189306040390/F7wdaupbM9uOE--3Hds',
    ['banking'] = 'https://discord.com/api/webhooks/1202100276090380288/QuZLELHY17SQpyES-yPZ6wxfnC-',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1202100369296203847/BxjvdvLcMsDS-WSjc4vxpNVJpDWzN0-',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1202100524103508018/',
    ['shops'] = 'https://discord.com/api/webhooks/1202100622325993603/9DYusYHgVnOiMxJgoopgBzrpQspXKm-',
    ['dealers'] = 'https://discord.com/api/webhooks/1202100720229433374/-',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1202100803448619038/ctKZti9zMepJ0fngUUZsXkqOTZsJuhx2L87-',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1202100894657683517/-f-Ik1eYSbSMi7WcRJnTSP2_f8kiXMm',
    ['powerplants'] = 'https://discord.com/api/webhooks/1202101011913900093/HlgBE_voJ5dTlyjqEcHb1EkM-',
    ['death'] = 'https://discord.com/api/webhooks/1202101117237084191/',
    ['joinleave'] = 'https://discord.com/api/webhooks/1202101223021355028/Q4ps-',
    ['ooc'] = 'https://discord.com/api/webhooks/1202101314520367126/7qSCPYWFN71-uKDUh90oZuGRqy-',
    ['report'] = 'https://discord.com/api/webhooks/1202101410075000874/',
    ['me'] = 'https://discord.com/api/webhooks/1202101531688849428/',
    ['pmelding'] = 'https://discord.com/api/webhooks/1202101632544800851/-',
    ['112'] = 'https://discord.com/api/webhooks/1202101722567430256/Ou-LeDxgI9CPXr8bSZeaTOm-',
    ['bans'] = 'https://discord.com/api/webhooks/1202101802296946728/-ChxIFYb6jq6ojQaAO8xZ',
    ['anticheat'] = 'https://discord.com/api/webhooks/1202101919590653962/',
    ['weather'] = 'https://discord.com/api/webhooks/1202102083470503957/ZaD0F-',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1202102182212808724/',
    ['bennys'] = 'https://discord.com/api/webhooks/1202102276022620222/BVBUk6T5eJNo8TL29fACbY4oyq4qZ8TWuo-',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1202102379885887529/4RoxIcz0r8rCaK8WHSo3sTVAhlYQYJoMVW-',
    ['robbery'] = 'https://discord.com/api/webhooks/1202102512883077120/',
    ['casino'] = 'https://discord.com/api/webhooks/1202102619724861470/zkyh4csvo4wiCEcp-Oa5kQH4T4wJCJEs_n-',
    ['traphouse'] = 'https://discord.com/api/webhooks/1202102726230806598/',
    ['911'] = 'https://discord.com/api/webhooks/1202102818249379910/',
    ['palert'] = 'https://discord.com/api/webhooks/1202102919042969630/--Od',
    ['house'] = 'https://discord.com/api/webhooks/1202103001616224357/',
    ['granny'] = 'https://discord.com/api/webhooks/1202103084105338880/-CAt',
    ['truckrobbery'] = 'https://discord.com/api/webhooks/1202103200145223711/7GQ0otS--0bT4mzhHygIqRZbnLBwxLl',
    ['varheist'] = 'https://discord.com/api/webhooks/1202103297066926100/',
    ['hunting'] = 'https://discord.com/api/webhooks/1202103409457774693/',
    ['gamble'] = 'https://discord.com/api/webhooks/1202103409457774693/',
    ['scenes'] = 'https://discord.com/api/webhooks/1202103566890696764/',
    ['gundrop'] = 'https://discord.com/api/webhooks/1202103656518782987/LFmn--TaNu46PziNPipE27vpQSBK_W9O',
    ['gangmenu'] = 'https://discord.com/api/webhooks/1202103741990588466/eHkEIQVkrfFMdNoRRU7f9t9-',
    ['warehouse'] = 'https://discord.com/api/webhooks/1202103825440444436/',
    ['pdarmory'] = 'https://discord.com/api/webhooks/1202103919052857374/',
    ['evidence'] = 'https://discord.com/api/webhooks/1202104010832613396/-NF11nHR_1tKl8b',
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local postData = {}
    local tag = tagEveryone or false
    if not Webhooks[name] then print('Tried to call a log that isn\'t configured with the name of ' ..name) return end
    local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = colors[color] or colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
            },
        }
    }

    if not logQueue[name] then logQueue[name] = {} end
    logQueue[name][#logQueue[name] + 1] = {webhook = webHook, data = embedData}

    if #logQueue[name] >= 10 then
        if tag then
            postData = {username = 'QB Logs', content = '@everyone', embeds = {}}
        else
            postData = {username = 'QB Logs', embeds = {}}
        end
        for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
        PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
        logQueue[name] = {}
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = {username = 'QB Logs', embeds = {}}
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), {['Content-Type'] = 'application/json'})
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')