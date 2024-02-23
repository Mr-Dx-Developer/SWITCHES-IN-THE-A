local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['qbjobs'] = 'https://discordapp.com/api/webhooks/1210701945220632617/_4PHL2ZJggRtnXF6xKGjpsdT2gLcnayjlT-gDfgYsmjG6X52LilY8Xa6X0e0EaMUss1w',
    ['humanelabs'] = 'https://discordapp.com/api/webhooks/1210702122241364058/ghmUP6gz1ePne-6nUzE9QmlHsq89rIkRHgrTNCtMgPwsPnxRt5Ega_rz2lbZ2KtmVmso',
    ['default'] = 'https://discordapp.com/api/webhooks/1210723732352536697/E89cnjdmwDZkZv0esyj897x63YtFL1AfVNvLgnzkxQZLrLatieTXfPUyEHrRYvy7U77U',
    ['testwebhook'] = 'https://discordapp.com/api/webhooks/1210723832768503868/TNuKekVLtTKp0xcc_O0nhgloH7i1bJWFLi0s-dvX7aIIFOn5EWX-lP4tPA-QM0VaBex7',
    ['playermoney'] = 'https://discordapp.com/api/webhooks/1210724001270210690/mAb7FSCWJlnIt6qJnz-rnFsXG6YX6kqeeYdUFVk_o28bs04aqe9A37Big-zDfkdDJ7_j',
    ['playerinventory'] = 'https://discordapp.com/api/webhooks/1210724087236788264/uVXabobzecZvoR7yAcvhGFQRTFX2tkPV4ugMSzLs091s2kVsipUqiudPyWW6mPEuiG2o',
    ['robbing'] = 'https://discordapp.com/api/webhooks/1210723611275559003/DmHAoUxc279GdfOUydTOrKx5yHJfgyt02yl8o6JUE-F4E8Sx6-BN10YRqwef5pwoC2vg',
    ['cuffing'] = 'https://discordapp.com/api/webhooks/1210724342137098250/i8G1d5YIQc1SJVSjW7nrpArL2bmFRgPOEWlzNAxYLTqyRMJQX43n7mqr_ISi0f0dWaK-',
    ['drop'] = 'https://discordapp.com/api/webhooks/1210724442490011678/TYtKGJWSoS-1lssc2UYThoTRZipXBeWfJv0LYaBIkUgU2dKn3K0IB9LBaRqeoSNq7Tpo',
    ['trunk'] = 'https://discordapp.com/api/webhooks/1210724545171038228/HrfrD2SS4_X7zAUdax9IQkwbc-iHIubsCk49vciLohuAeJb0F_ZWMigkLhQwEy2dwOlL',
    ['stash'] = 'https://discordapp.com/api/webhooks/1210724609373249566/FXZjde7OaxVjgRzBLz0tvvNKvZuW1iciDNXae9WpqQtxEDuFfWff9J51RNZmt3ix-hBT',
    ['glovebox'] = 'https://discordapp.com/api/webhooks/1210724701844930651/IMMsMQqXGSZeMCh52aJ-hmcwSq6Jl-A9-E8LelN0_FlwU26bLEdA6_PWsPBh0rMDPG7K',
    ['banking'] = 'https://discordapp.com/api/webhooks/1210724857235374080/Rw8XZiRYd_p7YmJHtUE4_SUuDFispZZfiHR_wAEo7_xnNTdD1akEINvHoCwhqRYuf1iQ',
    ['vehicleshop'] = 'https://discordapp.com/api/webhooks/1210725126690181150/dEKdrvU6P9UjVAHuC2mkSqOwY8RGikrFM2ekB9QomSO0Pqe3_LNWY_cXGr4EopLGG9C3',
    ['vehicleupgrades'] = 'https://discordapp.com/api/webhooks/1210725202736980008/0mrAZVYyZgeq00w08uYwWHqJYsOxWQC03yu4pQbYzNM9ugvMDrVB3kAQKJHDP7Rh0jqQ',
    ['shops'] = 'https://discordapp.com/api/webhooks/1210725294709678110/NuiUgOEBUgV3tpJ5BKoFS_ge39WpnteLHqXBTkApzIfkX_rrupVk4OJhLEGkskgE58hT',
    ['dealers'] = 'https://discordapp.com/api/webhooks/1210725370853335060/4HwGjmMNXzpkOj9EKM-yvEhUT417MFEuAmav7mTCEZVXHDLJMXn9U1DEPqgUjNMteJ4K',
    ['storerobbery'] = 'https://discordapp.com/api/webhooks/1210725436603105311/XQRSQ_hsOAmdRcR-bTazW89pymbyP-G3RyVNiO0mwNvoQshJkMIPLzeRwU3eliQOcEux',
    ['bankrobbery'] = 'https://discordapp.com/api/webhooks/1210725502793293834/M1mvcikH3pJMk2POhaDNlNndMx0CB_i_gLHgzd2wckPFNWm_Xy1MjSUf5uO-dtQpMTmK',
    ['powerplants'] = 'https://discordapp.com/api/webhooks/1210725588717928548/v-5ByII_b6HMMSxNu6lrjJr_WyOMBA-7-JzOXcroVubEkQ_AAI6Mwridk2s4kAkhPsd-',
    ['death'] = 'https://discordapp.com/api/webhooks/1210725657626153021/gd22D3XzOlEpggp7iyTENelIdAJhZxdx28s5Sv-9ytMSurBDU7QJOL1CTnaGGU878PJw',
    ['joinleave'] = 'https://discordapp.com/api/webhooks/1210725727457255504/7_pxRrl1teUJ8PSQ4laW5Tmf2kxEzpxoVkE0uEWUMCflg2OI8gjOq-whqUyE2ff-QZaJ',
    ['ooc'] = 'https://discordapp.com/api/webhooks/1210725806288937031/2-6orWw9N5TrNnReUk_sCDCS6MT-4ub1N9fOREFb5QgoZ1V27Xk_80tmK1_0Uue7M4z8',
    ['report'] = 'https://discordapp.com/api/webhooks/1210725887188799559/s0VHbisdQQRrMFfmf1b3V4ddBfDKrVLelJ6icZIVw62AQSr_kAgluODbi6OCyva4p4xj',
    ['me'] = 'https://discordapp.com/api/webhooks/1210725959683014666/Rpzme59b7DkehvaJokzMomUfH4K4PDKombmkd02eLkfK4jFXIkqwIz6g7G10quDkBQqI',
    ['pmelding'] = 'https://discordapp.com/api/webhooks/1210726035784728616/TtFvmmGDRXka7FN37yJ5-XwLm4X0l6kPYaLBxelOVDMrjjYSo9E8JV_6UaxicI2l7bUQ',
    ['112'] = 'https://discordapp.com/api/webhooks/1210726110963179600/-DWaRsHIrb1n_28WUg3s1T0AmjMr-h4Roxkrcyv40SXYB42zP-9OOV8tSw0KZpoC2qdy',
    ['bans'] = 'https://discordapp.com/api/webhooks/1210726178659500063/Rha9SjBRXAAv5HteFnQt8r82e6FjmgdhmJma2sEgFEH7nv4TtR6USUIGiMmCfvu3hjNS',
    ['anticheat'] = 'https://discordapp.com/api/webhooks/1210726246821138523/T-UjIsdhZWBRO5Yt4qSS1LizWNi1We774Bwqex2Ot7A_Hd8Mf0bnMIYJgO1jsAo3WJuF',
    ['weather'] = 'https://discordapp.com/api/webhooks/1210726328253284442/ngF4LY4-QV9H9nLtQHb8-FtDVJO8kls1MQjhjMAHGSNsGhD_IbKgvHe5_kkR41--WpW1',
    ['moneysafes'] = 'https://discordapp.com/api/webhooks/1210726395798364200/6gA1BzWvTacGa_MQMJrz35a0_UlBsGZehDJN2NAji3PsxJtghIZyLfierZSqcaDwy9eh',
    ['bennys'] = 'https://discordapp.com/api/webhooks/1210726472587808849/lYNL9UOKVs6tyhgQth8IuC6_sQTqxE_Xy7WuSqMXD-L9EGdgmnzplCzo_iMze5ntJlke',
    ['bossmenu'] = 'https://discordapp.com/api/webhooks/1210726572424695818/bWo-MhKDCeEDZ8bLbshGyVD2dQFPp7ByOI58mExGPGbvUKRlkN6moP1hYfc3s39ALThJ',
    ['robbery'] = 'https://discordapp.com/api/webhooks/1210726631061200916/iU9qdO_3qKXkzGsncv4Iqw7R5OaXjqHptXES6_0Cx1GZ8-yVRBbdEJ4GEp3ZQyTMumGJ',
    ['casino'] = 'https://discordapp.com/api/webhooks/1210726703178063903/SppYUKueI4xyzmDsDoqQ8Xh0PkpMJV5iSnRdOs2JB1oxBiFpS4JFfXp_AKWtISXiazxJ',
    ['traphouse'] = 'https://discordapp.com/api/webhooks/1210726773327667210/c3S88DFrk-DdZMObPlHEUKrjwAIKlDEH1OZqCMyVUCslLQh3rhbE6X_eCqUTenp8Gy-3',
    ['911'] = 'https://discordapp.com/api/webhooks/1210726836728893460/sz99dWCCbC9LS2tDk-8GM3T-vwRau1D14LKF9aWlIVE4O-4Qp4exo1e1wcQMc3MCo3nm',
    ['palert'] = 'https://discordapp.com/api/webhooks/1210726893742202920/s6FPjKPkrD6mTq4uOUKxsJ4FZ3B_j2jm_a5Ce9lK5-_rI_Cg4pWRg3UyRXjwUifIHz9g',
    ['house'] = 'https://discordapp.com/api/webhooks/1210726956203642992/TpK4gwABJUAapnMTocKuVSr-FVYfp_6jQ4GqeBULxErR7x7BlgS7H9tPNMKvH9N_Sj3l',
    ['granny'] = 'https://discordapp.com/api/webhooks/1210727074667429958/I92wA9c_U4UU4OCPfJPDmCpviupT7nxBhqycYxEbka0iUKBc_qcm2erpbPOv49suJbhy',
    ['truckrobbery'] = 'https://discordapp.com/api/webhooks/1210727144481882162/RsI7OcvpTUiBMLEffqb-cTIcph1FRlhI8TIprjpY7ldiVZy_KsoAoZnKnhKkAM02R2FM',
    ['varheist'] = 'https://discordapp.com/api/webhooks/1210727208059015188/U4hVf61xamNY_PUos478_TzMzNwWhTjdWMm8iXZsY1G2ZznADEs5cytOOn5LR6aPfcPw',
    ['hunting'] = 'https://discordapp.com/api/webhooks/1210727280276545677/4a-Ik-IrbZh1Ql8cIjpoOPk3omCzwMhx1RMgbwTrXhIfW-xdmiuztz87pL00a6cnWzkZ',
    ['gamble'] = 'https://discordapp.com/api/webhooks/1210727351487569971/EZPoShuER2I89NVPnGmoRJWih2DgxuCCwryi_T1DI9cCVecLYuWHU3MiWtESPBr330eZ',
    ['scenes'] = 'https://discordapp.com/api/webhooks/1210727420420948018/UA9kIVhrc36asbKDMRWCmvu5WzH0p2BjJT_wd3gPdPCNa9F06s9czvcLMLBD9TTDN3zm',
    ['gundrop'] = 'https://discordapp.com/api/webhooks/1210727484874686544/1rN3csCBWGIGVFUaEvoAmg0n1-s7W5sDE0mZWIlcKi8g3MM1jRZP7yNxyY22nMDaEhCa',
    ['gangmenu'] = 'https://discordapp.com/api/webhooks/1210727545201238098/putxVof3rAWlp9atL9U6ZhmLQos00qGrGBjH5QRukrEUN3sLfvVz7A2GrCfbDouf7Vgp',
    ['warehouse'] = 'https://discordapp.com/api/webhooks/1210727610376781824/LA0uPBj7dhv5CibjVUS7zWxYsvMNcXz3gwu0XtgBASftfEmW7ccZkVCKVM09um1E9oty',
    ['pdarmory'] = 'https://discordapp.com/api/webhooks/1210727676319371284/U2DyishyUD5DhF-tZuFTqkcTliSgN-Vb9NZyD_HtiiK_Z-kmopGSEDJ9KK0L4kEhybKe',
    ['evidence'] = 'https://discordapp.com/api/webhooks/1210727735610310676/aTNdnExB9ur7jjNDmaHwn8o3Nlj4Mgln5-345rmlsHuCA5IN-SIWZhLHrs67vbuL6HcZ',
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