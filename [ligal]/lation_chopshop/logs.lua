Logs = {}

-- General webhook configurations
Logs.Name = 'Chop Logs' -- Name for the webhook
Logs.Image = 'https://i.imgur.com/ILTkWBh.png' -- Image for the webhook
Logs.Footer = 'https://i.imgur.com/ILTkWBh.png' -- Footer image for the webhook

-- Specific log type configurations
Logs.Types = {
    requestAJobStarted = {
        enabled = false,
        webhook = ''
    },
    vehicleLockpicked = {
        enabled = false,
        webhook = ''
    },
    partChopped = {
        enabled = false,
        webhook = ''
    },
    frameScrapped = {
        enabled = false,
        webhook = ''
    },
    brokeTool = {
        enabled = false,
        webhook = ''
    },
    boughtTool = {
        enabled = false,
        webhook = ''
    },
    swappedParts = {
        enabled = false,
        webhook = ''
    },
    contractStarted = {
        enabled = false,
        webhook = ''
    },
    soldVehicle = {
        enabled = false,
        webhook = ''
    }
}