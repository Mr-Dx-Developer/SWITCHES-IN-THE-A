-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.openJobMenu = {
    enabled = true, -- If true then enabled job menu. Otherwise disabled
    command = 'jobs', -- Command for opening job menu (/jobs default)
    key = 'F5' -- Configure to whichever desired key. Set to false if undesired
}

Config.maxJobs = 4 -- Maximum jobs a player can have in their menu(Set to false to disable limit

Config.offDutyJob = {-- Job it switches you to while off duty.
    name = 'unemployed',
    grade = 0
}

Config.blacklist = { -- Jobs you don't want awarded to menu when given to player(I.e prisoner)
--  ['JOB_HERE'] = true,
    ['prisoner'] = true,
}

Config.bossMenus = { -- Configurable boss menus(REQUIRES ESX_SOCIETY - Good for adding boss menus for any job that has a 'boss' grade)
    enabled = false, -- Easily disable completely by switching to false
    label = '[E] - Access Boss Menu',
    depositAccount = 'bank', -- Account used for deposits to boss menu
    withdrawalAccount = 'bank', -- Account used for withdrawals from boss menu
    key = 38, -- Default: 38 (E)
    distance = 2.0, -- Distance before showing text ui/being able to open boss menu
    locations = { -- Add/edit boss menu locations for defined jobs(Jobs must have a 'boss' grade to access menu)
    --  { coords = vec3(XX.XX, XX.XX, XX.XX), job = 'JOB_NAME_HERE' }, -- EXAMPLE
        {coords = vec3(-576.11, -936.61, 28.7), job = "police", label = "POLICE"},
        {coords = vec3(334.95, -594.01, 43.28), job = "ambulance", label = "EMS"},
    }
}

--[[Config.toggleDutyZones = { -- Configurable spots to clock in / off of jobs
    enabled = true, -- Disable whole features by setting as false
    labels = {
        clockoff = '[E] - Clock Off(%s)', -- String to show when clocked in(To clock off)
        clockon = '[E] - Clock On(%s)' -- String to show when clocked out(To clock on)
    },
    key = 38,
    distance = 2.0,
    locations = {
    --  { coords = vec3(XX.XX, XX.XX, XX.XX), job = 'JOB_NAME_HERE' }, -- EXAMPLE
        {coords = vec3(-576.11, -936.61, 28.7), job = "police", label = "POLICE"},
    }
}]]-- Coming next update

