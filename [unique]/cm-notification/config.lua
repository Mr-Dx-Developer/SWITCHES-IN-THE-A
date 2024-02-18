Config = {}
Config.MySQL = 'oxmysql' -- oxmysql, mysql-async, ghmattimysql
Config.Volume = 0.17 -- Notification sound volume
Config.DefaultTime = 5000 -- Default notification time if not defined in the event
Config.SettingsPage = {
    command = {
        enable = true,
        name = "notify"
    },
    key = {
        enable = false,
        keyNum = 20, -- Z By default https://docs.fivem.net/docs/game-references/controls/
    },
}
Config.DefaultNotificationPosition = "top-center" -- top-left, top-center, top-right, bottom-left, bottom-center, bottom-right
Config.EnableSoundByDefault = true

Config.Translation = {
    ["SETTINGS_TEXT"] = 'Please select a position to adjust notification position.',
    ["HIDE_NOTIFY"] = 'Hide Notify',
    ["SHOW_NOTIFY"] = 'Show Notify',
    ["ENABLE_SOUND"] = 'Enable Sound',
    ["DISABLE_SOUND"] = 'Disable Sound',
}

Config.Themes = { -- Edit only if you know what are you doing! More information can be find in documentation
    ["server"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #111316 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FFFFFF',
            textShadow = 'rgba(255, 255, 255, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FFFFFF',
            shadow = 'rgba(255, 255, 255, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#ffffff29',
            color = '#FFFFFF',
            shadow = '0px 0px 27px #FFFFFF',
        },
        defaultHeader = 'SERVER', -- if you don't pass custom header with the event this header will be used
        icon = 'server', -- can be find in html/assets/icons
    },
    ["announcement"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #1A0D00 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#E38B29',
            textShadow = 'rgba(227, 139, 41, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#E38B29',
            shadow = 'rgba(227, 139, 41, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#e38b2929',
            color = '#E38B29',
            shadow = '0px 0px 27px #E38B29',
        },
        defaultHeader = 'ANNOUNCEMENT', -- if you don't pass custom header with the event this header will be used
        icon = 'announcement', -- can be find in html/assets/icons
    },
    ["info"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #0D0C00 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#F6F001',
            textShadow = 'rgba(246, 240, 1, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#F6F001',
            shadow = 'rgba(246, 240, 1, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#F6F00129',
            color = '#F6F001',
            shadow = '0px 0px 27px #F6F001',
        },
        defaultHeader = 'INFO', -- if you don't pass custom header with the event this header will be used
        icon = 'info', -- can be find in html/assets/icons
    },
    ["twitter"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #000F1A 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#5DB4F2',
            textShadow = 'rgba(93, 180, 242, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#5DB4F2',
            shadow = 'rgba(93, 180, 242, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#5db4f229',
            color = '#5DB4F2',
            shadow = '0px 0px 27px #5DB4F2',
        },
        defaultHeader = 'TWITTER', -- if you don't pass custom header with the event this header will be used
        icon = 'twitter', -- can be find in html/assets/icons
    },

    ["phone"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #051000 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#53FE00',
            textShadow = 'rgba(83, 254, 0, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#53FE00',
            shadow = 'rgba(83, 254, 0, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#53FE0029',
            color = '#53FE00',
            shadow = '0px 0px 27px #53FE00',
        },
        defaultHeader = 'PHONE', -- if you don't pass custom header with the event this header will be used
        icon = 'phone', -- can be find in html/assets/icons
    },
    ["saved"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #111316 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FFFFFF',
            textShadow = 'rgba(255, 255, 255, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FFFFFF',
            shadow = 'rgba(255, 255, 255, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#ffffff29',
            color = '#ffffff',
            shadow = '0px 0px 27px #ffffff',
        },
        defaultHeader = 'SAVED', -- if you don't pass custom header with the event this header will be used
        icon = 'saved', -- can be find in html/assets/icons
    },
    ["error"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #180606 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FF0000',
            textShadow = 'rgba(255, 0, 0, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FF0000',
            shadow = 'rgba(255, 0, 0, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#FF000029',
            color = '#FF0000',
            shadow = '0px 0px 27px #FF0000',
        },
        defaultHeader = 'ERROR', -- if you don't pass custom header with the event this header will be used
        icon = 'error', -- can be find in html/assets/icons
    },
    ["sms"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #171406 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FFD500',
            textShadow = 'rgba(255, 213, 0, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FFD500',
            shadow = 'rgba(255, 213, 0, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#FFD50029',
            color = '#FFD500',
            shadow = '0px 0px 27px #FFD500',
        },
        defaultHeader = 'NEW SMS', -- if you don't pass custom header with the event this header will be used
        icon = 'sms', -- can be find in html/assets/icons
    },
    ["bank"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #002433 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#00B2FF',
            textShadow = 'rgba(0, 178, 255, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#00B2FF',
            shadow = 'rgba(0, 178, 255, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#00B2FF29',
            color = '#00B2FF',
            shadow = '0px 0px 27px #00B2FF',
        },
        defaultHeader = 'BANK', -- if you don't pass custom header with the event this header will be used
        icon = 'bank', -- can be find in html/assets/icons
    },
    ["success"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #002F13 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#00FF66',
            textShadow = 'rgba(0, 255, 102, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#00FF66',
            shadow = 'rgba(0, 255, 102, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#00FF6629',
            color = '#00FF66',
            shadow = '0px 0px 27px #00FF66',
        },
        defaultHeader = 'SUCCESS', -- if you don't pass custom header with the event this header will be used
        icon = 'success', -- can be find in html/assets/icons
    },
    ["lspd"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #00010B 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#001AFF',
            textShadow = 'rgba(0, 26, 255, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#001AFF',
            shadow = 'rgba(0, 26, 255, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#001AFF29',
            color = '#001AFF',
            shadow = '0px 0px 27px #001AFF',
        },
        defaultHeader = 'LSPD', -- if you don't pass custom header with the event this header will be used
        icon = 'lspd', -- can be find in html/assets/icons
    },
    ["ems"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #2C000A 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FF003D',
            textShadow = 'rgba(255, 0, 122, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FF003D',
            shadow = 'rgba(255, 0, 122, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#FF003D29',
            color = '#FF003D',
            shadow = '0px 0px 27px #FF003D',
        },
        defaultHeader = 'EMS', -- if you don't pass custom header with the event this header will be used
        icon = 'ems', -- can be find in html/assets/icons
    },
    ["lscustom"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #140021 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#8F00FF',
            textShadow = 'rgba(143, 0, 255, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#8F00FF',
            shadow = 'rgba(143, 0, 255, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#8F00FF29',
            color = '#8F00FF',
            shadow = '0px 0px 27px #8F00FF',
        },
        defaultHeader = 'LS CUSTOMS', -- if you don't pass custom header with the event this header will be used
        icon = 'lscustom', -- can be find in html/assets/icons
    },
    ["ballas"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #1C0023 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#7B0299',
            textShadow = 'rgba(123, 2, 153, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#7B0299',
            shadow = 'rgba(123, 2, 153, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#7B029929',
            color = '#7B0299',
            shadow = '0px 0px 27px #7B0299',
        },
        defaultHeader = 'BALLAS', -- if you don't pass custom header with the event this header will be used
        icon = 'ballas', -- can be find in html/assets/icons
    },
    ["families"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #001404 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#00FF37',
            textShadow = 'rgba(0, 255, 55, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#00FF37',
            shadow = 'rgba(0, 255, 55, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#00FF3729',
            color = '#00FF37',
            shadow = '0px 0px 27px #00FF37',
        },
        defaultHeader = 'THE FAMILIES', -- if you don't pass custom header with the event this header will be used
        icon = 'families', -- can be find in html/assets/icons
    },
    ["vagos"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #262600 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#EDED05',
            textShadow = 'rgba(237, 237, 5, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#EDED05',
            shadow = 'rgba(237, 237, 5, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#EDED0529',
            color = '#EDED05',
            shadow = '0px 0px 27px #EDED05',
        },
        defaultHeader = 'VAGOS', -- if you don't pass custom header with the event this header will be used
        icon = 'vagos', -- can be find in html/assets/icons
    },
    ["lostmc"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #202020 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FFFFFF',
            textShadow = 'rgba(255, 255, 255, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FFFFFF',
            shadow = 'rgba(255, 255, 255, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#FFFFFF29',
            color = '#FFFFFF',
            shadow = '0px 0px 27px #FFFFFF',
        },
        defaultHeader = 'THE LOST MC', -- if you don't pass custom header with the event this header will be used
        icon = 'lostmc', -- can be find in html/assets/icons
    },
    ["bennys"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #0E0001 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#8C2226',
            textShadow = 'rgba(140, 34, 38, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#8C2226',
            shadow = 'rgba(140, 34, 38, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#8C222629',
            color = '#8C2226',
            shadow = '0px 0px 27px #8C2226',
        },
        defaultHeader = "Benny's", -- if you don't pass custom header with the event this header will be used
        icon = 'bennys', -- can be find in html/assets/icons
    },
    ["taxi"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #000000 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#F0C700',
            textShadow = 'rgba(240, 199, 0, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#F0C700',
            shadow = 'rgba(240, 199, 0, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#F0C70029',
            color = '#F0C700',
            shadow = '0px 0px 27px #F0C700',
        },
        defaultHeader = "DOWNTOWN CAB.", -- if you don't pass custom header with the event this header will be used
        icon = 'taxi', -- can be find in html/assets/icons
    },
    ["lsfd"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #0F0400 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FF4D00',
            textShadow = 'rgba(255, 77, 0, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FF4D00',
            shadow = 'rgba(255, 77, 0, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#FF4D0029',
            color = '#FF4D00',
            shadow = '0px 0px 27px #FF4D00',
        },
        defaultHeader = "LSFD", -- if you don't pass custom header with the event this header will be used
        icon = 'lsfd', -- can be find in html/assets/icons
    },
    ["ranger"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #0B160D 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FFD407',
            textShadow = 'rgba(255, 212, 7, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FFD407',
            shadow = 'rgba(255, 212, 7, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#1F402529',
            color = '#1F4025',
            shadow = '0px 0px 27px #1F4025',
        },
        defaultHeader = "SASP RANGER", -- if you don't pass custom header with the event this header will be used
        icon = 'ranger', -- can be find in html/assets/icons
    },
    ["statepolice"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #05091A 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FFB300',
            textShadow = 'rgba(255, 179, 0, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#002AFF',
            shadow = 'rgba(255, 179, 0, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#0E174429',
            color = '#0E1744',
            shadow = '0px 0px 27px #0E1744',
        },
        defaultHeader = "SA STATE POLICE", -- if you don't pass custom header with the event this header will be used
        icon = 'statepolice', -- can be find in html/assets/icons
    },
    ["status"] = {
        background = { -- General container adjustments
            color = 'linear-gradient(180deg, #020309 0%, rgba(17, 19, 22, 0) 524.5%)',
        },
        title = { -- Title color adjustments
            color = '#FFFFFF',
            textShadow = 'rgba(255, 255, 255, 0.45)',
        },
        iconBox = { -- Container wraps up icon
            overlayColor = '#FFFFFF',
            shadow = 'rgba(255, 255, 255, 0.21)',
        },
        timerBar = { -- Timer bar adjustments
            trailColor = '#FFFFFF29',
            color = '#FFFFFF',
            shadow = '0px 0px 27px #FFFFFF',
        },
        defaultHeader = "STATUS", -- if you don't pass custom header with the event this header will be used
        icon = 'status', -- can be find in html/assets/icons
    },
}