--                _
--               | |
--   _____      _| | _____  ___ _ __
--  / __\ \ /\ / / |/ / _ \/ _ \ '_ \
--  \__ \\ V  V /|   <  __/  __/ |_) |
--  |___/ \_/\_/ |_|\_\___|\___| .__/
--                             | |
--                             |_|
-- https://github.com/swkeep

-- Configuration settings for the Discord bot
Config.Bot = {
    enabled = false,              -- Set this to true to activate the bot
    reconnection_interval = 60,   -- The interval (in seconds) for the bot to attempt reconnecting
    token = '',                   -- The Discord bot token (replace with your own token)
    guild_id = 988158464276693012 -- The ID of the Discord guild the bot will operate on
}

-- Configuration settings for the webhook
Config.webhook = {
    username = 'Harmony',                         -- The username to display for the webhook
    icon_url = 'https://swkeep.com/img/logo.png', -- The URL of the icon to use for the webhook
    tag = {
        -- List of user IDs to mention in the webhook message
        users = {
            '414402575778185227' -- Replace with your own Discord user ID
        },
        -- List of role IDs to mention in the webhook message
        roles = {
            '1015678478416355389'
        }
    },
    hooks = {
        -- List of webhook URLs to send the message to
        ['default'] = ''
    }
}

--
Config.Behavior = {
    Metadata_AssignId = {
        length = 25,
    }
}

-- Customize the commands used in the script to your preferences
Config.Commands = {
    skills = {
        active = false,
        command = 'skills',
        help = 'Display player skills'
    }
}

Config.Skills = {
    {
        name = "driving",
        label = 'Driving',
        description = "Master the art of vehicular control and maneuvering",
        icon = 'fas fa-car',
        color = 'green'
    },
    {
        name = "shooting",
        label = 'Marksmanship',
        description = "Hone your shooting skills and become a true sharpshooter",
        icon = 'fas fa-bullseye',
        color = 'red'
    },
    {
        name = "crime",
        label = 'Criminal Mastermind',
        description = "Embrace the life of crime and excel in various illegal activities",
        icon = 'fas fa-mask',
        color = 'black'
    },
    {
        name = "fishing",
        label = 'Fishing',
        description = "Explore the waters and catch a variety of aquatic treasures",
        icon = 'fas fa-fish',
        color = 'teal'
    },
    {
        name = "piloting",
        label = 'Piloting',
        description = "Take to the skies and become an expert pilot",
        icon = 'fas fa-plane',
        color = 'indigo'
    },
    {
        name = "fitness",
        label = 'Physical Fitness',
        description = "Train your body and achieve peak physical condition",
        icon = 'fas fa-dumbbell',
        color = 'orange'
    },
    {
        name = "hacking",
        label = 'Hacking',
        description = "Unlock the world of cyber espionage and hacking",
        icon = 'fas fa-laptop-code',
        color = 'purple'
    },
    {
        name = "medic",
        label = 'Medical Expertise',
        description = "Save lives and provide medical assistance to the injured",
        icon = 'fas fa-medkit',
        color = 'pink'
    },
    {
        name = "cooking",
        label = 'Cooking',
        description = "Master the art of cooking delicious meals",
        icon = 'fas fa-utensils',
        color = 'orange'
    }
}
