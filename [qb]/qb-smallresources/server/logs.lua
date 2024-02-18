local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['qbjobs'] = 'https://discord.com/api/webhooks/1202098203743506533/XOLojtA0olwKeLRxxXR0qG_8XSKBviePfTcD8MkEC0_Sq_aR-OMV4UmX7vOiVT3c9dt0',
    ['humanelabs'] = 'https://discord.com/api/webhooks/1202098307183431730/zoeIEXFdrN_lhAZOSFzF9LDbawVzaW3168KSKOXUUAYG1NsRz0e7IIdaL0k61tKHLVGX',
    ['default'] = 'https://discord.com/api/webhooks/1202099202902216724/s0S-UK54r5nIpg8XvSg-zd4FCaMoNdIiNsjZGovhsE5kUeobF_BAT78TZRgYnDiiRFvW',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1202099349908099102/gfFE5ML6ld-8BluhEdwn0N4vZg5n8jxwXUixdJSL-wAp2uI-gmAV7BAMF28cdrGkWaOH',
    ['playermoney'] = 'https://discord.com/api/webhooks/1202099456695074816/irxkMu-1PC8XUZa_d3DgIYxba3ZUkn3-lSYGFLKAE4dawx-weFYUm-WjwZjzGPLbqI7v',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1202099580590628884/eUTVdg7ePigzaxzaD3eXAAmQRepXYYByGV5KhUnN-ufdoolj4bzrzSsL8UWHTB0oGSGP',
    ['robbing'] = 'https://discord.com/api/webhooks/1202099688119992422/4WppSpuXmxHnfHdFiEcOqW3P9tjO6r858U17k_7IBR2CzZU1XQgKxaS9LTFBvQcDPKH4',
    ['cuffing'] = 'https://discord.com/api/webhooks/1202099792159973387/te1Yv4vab_9tG07WLEC9TYI_3TaO8iZE_TCI6ac-anHsavtQMIggw33pXr3fIXvfl1ZA',
    ['drop'] = 'https://discord.com/api/webhooks/1202099901501022218/WodTpUrwOY0TGeBdCjuAwAhvfd41dnoB1RMM6ODj3SMjQyAKS-3UCsqOjNCnUwGaAN6A',
    ['trunk'] = 'https://discord.com/api/webhooks/1202100000029671494/RcfLS2JdwDiQ90JSWFrNAv3lBzyB3pa5lAIGXot08nj5MR1UuCDni4oDTZZIDvMOGZso',
    ['stash'] = 'https://discord.com/api/webhooks/1202100094187610192/TnUtEZUdqSPAyXDyCL3Rf3cLKZ-dlpqFWKCEH9-fBcAwodlJUG7TL5lEZUlavHbqG95D',
    ['glovebox'] = 'https://discord.com/api/webhooks/1202100189306040390/F7wdaupbM9uOE-SG4TgGpUyjemVEhOIWqbvSgiHReklzeuOD2EVzDqNuMpbznRE-3Hds',
    ['banking'] = 'https://discord.com/api/webhooks/1202100276090380288/QuZLELHY17SQpyES-yPZ6wxfnC-Qm6QhilBMuhiIWF4gMZx_Qdv68uOfocenNd8QfDjq',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1202100369296203847/BxjvdvLcMsDS-WSjc4vxpNVJpDWzN0-O0CvlDuotkE7Zbt2mvNzZamrcBsOFt5xlNW8f',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1202100524103508018/H0pYw1h1Z99Mxt7OwMTItBSNpxBwO1eSUBoQQLPdzvsTLYWR4PNU8bykUS3TaOvKXfUW',
    ['shops'] = 'https://discord.com/api/webhooks/1202100622325993603/9DYusYHgVnOiMxJgoopgBzrpQspXKm-tGqiTmaiYkDjffYtfm6V3tke7qEgwHNVY682t',
    ['dealers'] = 'https://discord.com/api/webhooks/1202100720229433374/-bxVthXMDrKju09ItOnV4VpMtso5EHMA7xh_5A3ngUuzDzhDwfVQyl74tdVJ3bwRIFX7',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1202100803448619038/ctKZti9zMepJ0fngUUZsXkqOTZsJuhx2L87-c6gHhMkajQzVZJa0PEr7UUJVc5vrqZbg',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1202100894657683517/MWiypWcjYp4m6_5NeAR3AuJ3rWypo3bsQXYhO-f-Ik1eYSbSMi7WcRJnTSP2_f8kiXMm',
    ['powerplants'] = 'https://discord.com/api/webhooks/1202101011913900093/HlgBE_voJ5dTlyjqEcHb1EkM-iFzz2gY9BJc7IXvnuPpdImJqPoDLvY3t8fDunOMefwT',
    ['death'] = 'https://discord.com/api/webhooks/1202101117237084191/gfp1fPOdRhDUsy1hLHGEyPBg2j0gG3x3Q_P1DgSBIU0R_9CUT64CZSOeMWkb2xpdHpjH',
    ['joinleave'] = 'https://discord.com/api/webhooks/1202101223021355028/Q4ps-987ck0arhbAfSiJF3TYNMEGt19OlsOvDkjpXArce_hx5MlhqlZQLF8XPzRYSKZm',
    ['ooc'] = 'https://discord.com/api/webhooks/1202101314520367126/7qSCPYWFN71-uKDUh90oZuGRqy-nTPznvL4EA1N1EgyB1AYOT1pHO9mLTpPI8Wnxh7za',
    ['report'] = 'https://discord.com/api/webhooks/1202101410075000874/FIDJRGClDJtACaodKAj1aizw9iX6YHiMpRAXrg49V5mrdQgTbIAzVqPF5Kwd4WrbVhFu',
    ['me'] = 'https://discord.com/api/webhooks/1202101531688849428/Rphw3_dpdvkvDC0o8rrgsrf70aGroL29mCz4RMmtUgSNR42gBYEQuA3DQyvfYZ3Y1S7s',
    ['pmelding'] = 'https://discord.com/api/webhooks/1202101632544800851/9AsD1pkNCnwbtrY8YkmgazE6ehRMKdK7gIE2TJ1UZ-eKhxyYWzBKl8cURRRKM2aKMi94',
    ['112'] = 'https://discord.com/api/webhooks/1202101722567430256/Ou-LeDxgI9CPXr8bSZeaTOm-zKyNsFkYOAgOeoYirs0ajJUIz8_KR06WZxnY_xThoZyP',
    ['bans'] = 'https://discord.com/api/webhooks/1202101802296946728/Sq4tcy13Z9Zi2vmQvKnjkQDpz_MrmnS06hQ_jGzuN1DM31x-ChxIFYb6jq6ojQaAO8xZ',
    ['anticheat'] = 'https://discord.com/api/webhooks/1202101919590653962/bS0b3TxnXOpqvk8nE5jQO1A4B2kTzlw_AcPHk7bdXCYbtk0ou3NfpyInT0O6QVL4fxTj',
    ['weather'] = 'https://discord.com/api/webhooks/1202102083470503957/ZaD0F-WIU158RY9wgFCwqXPvr5uRjYxvApr7Eux4Ws2RP8vDMVSCwgDk2H0HCDy6yb0R',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1202102182212808724/cZcyMIPn2JMl1fUhGbfk66ssoQmTWTwTACC1wwfUsewUNj8c60nsKSVpFc9onFmmfl6z',
    ['bennys'] = 'https://discord.com/api/webhooks/1202102276022620222/BVBUk6T5eJNo8TL29fACbY4oyq4qZ8TWuo-eJqSNP3YZzH9HOarlLlUbupx8Xtv3mh6o',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1202102379885887529/4RoxIcz0r8rCaK8WHSo3sTVAhlYQYJoMVW-2MyHd_JpjhxpCfBvpWKu2ZqVADf6ocT9v',
    ['robbery'] = 'https://discord.com/api/webhooks/1202102512883077120/sm5gG8GFmF7OoSDxVOziiRNkPbkca6GQl3mD3lGsSHYhh6CNbczl9aSrOo8FJURfxe28',
    ['casino'] = 'https://discord.com/api/webhooks/1202102619724861470/zkyh4csvo4wiCEcp-Oa5kQH4T4wJCJEs_n-mMw2A205X0LYpLpyUQzykHvXFx_qDGbAw',
    ['traphouse'] = 'https://discord.com/api/webhooks/1202102726230806598/3bj7Wt92vxsqs6u2poTdPYccG3OUn33iZ4wZvsCqWAl5QvpAO3DplTCyIL38KLttwgdm',
    ['911'] = 'https://discord.com/api/webhooks/1202102818249379910/0MTnEXu3mxWaCWdKuHXKNwxqXe6Krvg8TWPmtRd1fWcAlz_kOu4fAmHNx4IcFDHHCig8',
    ['palert'] = 'https://discord.com/api/webhooks/1202102919042969630/GfwjcFVdRsGWLlVzvlyksrAKRpOM7hpGm-xEHR7g65t4mukYM9faUHjAoGB4uXpDc-Od',
    ['house'] = 'https://discord.com/api/webhooks/1202103001616224357/AtbPo5XYOTWZCTPtRFvwUhf8R8DHjxaIrFh_zMuqNlgMX8BJUHPVvWcbOe7ttadcJPQr',
    ['granny'] = 'https://discord.com/api/webhooks/1202103084105338880/VrOrcq4hYNbvJohU7zk9sTfAY3kOJ4XeGwpgV9_iWoxIZmtmouSvEdSesGazew9V-CAt',
    ['truckrobbery'] = 'https://discord.com/api/webhooks/1202103200145223711/7GQ0otS-QzrvOL5VOpqXSq6eqUoD4C8CPgqKzfV71gf9X-0bT4mzhHygIqRZbnLBwxLl',
    ['varheist'] = 'https://discord.com/api/webhooks/1202103297066926100/AgYMwtZokjQKvFOhCRuTzU0NIJmBYpBbx2_uE7oPDlt0XaUQcLQrgMfnQ9WZJwmm7Tt9',
    ['hunting'] = 'https://discord.com/api/webhooks/1202103409457774693/uCFMZdCsuSgB9sw1y1ZDI5hzCQtGQBcdOXe_PS2nCYu15wqnO43SoJ6Y0NXDJDZqLubt',
    ['gamble'] = 'https://discord.com/api/webhooks/1202103409457774693/uCFMZdCsuSgB9sw1y1ZDI5hzCQtGQBcdOXe_PS2nCYu15wqnO43SoJ6Y0NXDJDZqLubt',
    ['scenes'] = 'https://discord.com/api/webhooks/1202103566890696764/VBIQVFO01oUY7Yg1FcKrBSQr94gizzKrzlLEirGsZOMrEm4lDzJFdH0FBID0NyfsIbx_',
    ['gundrop'] = 'https://discord.com/api/webhooks/1202103656518782987/LFmn-Z5cAEPuTbMN9OUssVWWcXPJO5wJpANWnYFjA-TaNu46PziNPipE27vpQSBK_W9O',
    ['gangmenu'] = 'https://discord.com/api/webhooks/1202103741990588466/eHkEIQVkrfFMdNoRRU7f9t9-TjEzrHpwI8hp0q1pXMww1b2ox77qA0UXZNRdMRXLCEWQ',
    ['warehouse'] = 'https://discord.com/api/webhooks/1202103825440444436/zFC8SpMWdUqoKe4MqikdCbEUKxQMe5oi_7aAODI7x6XD2ySLJm8ZhJIBHFWaxmyuT0u1',
    ['pdarmory'] = 'https://discord.com/api/webhooks/1202103919052857374/EyEPdBNLBNOTx5dx_T_1U0rHv2Mqq5sXJnHvdshrqPkJHumRNl7FrmMpZ4khNgyQrJYo',
    ['evidence'] = 'https://discord.com/api/webhooks/1202104010832613396/pQ4OD_WFUTUu7pjS4WMl7QS8OpCnFukuZaHj9EUueFTezBTmM6jxj-NF11nHR_1tKl8b',
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