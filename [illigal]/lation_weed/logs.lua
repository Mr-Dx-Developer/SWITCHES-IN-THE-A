Logs = {}

-- General webhook configurations
Logs.Name = 'Weed Logs' -- Name for the webhook
Logs.Image = 'https://i.imgur.com/ILTkWBh.png' -- Image for the webhook
Logs.Footer = 'https://i.imgur.com/ILTkWBh.png' -- Footer image for the webhook

-- Specific log type configurations
Logs.Types = {
    searching = {
        enabled = false,
        webhook = '',
    },
    planting = {
        enabled = false,
        webhook = '',
    },
    fertilizing = {
        enabled = false,
        webhook = '',
    },
    watering = {
        enabled = false,
        webhook = '',
    },
    harvesting = {
        enabled = false,
        webhook = '',
    },
    deleting = {
        enabled = false,
        webhook = ''
    },
    shopping = {
        enabled = false,
        webhook = ''
    },
    rolling = {
        enabled = false,
        webhook = '',
    }
}