Logs = {}

-- General webhook configurations
Logs.Name = 'Detecting Logs' -- Name for the webhook
Logs.Image = 'https://i.imgur.com/ILTkWBh.png' -- Image for the webhook
Logs.Footer = 'https://i.imgur.com/ILTkWBh.png' -- Footer image for the webhook

Logs.Types = {
    foundItem = {
        enabled = false,
        webhook = ''
    },
    levelUp = {
        enabled = false,
        webhook = ''
    },
    detectorBuy = {
        enabled = false,
        webhook = ''
    },
    itemSold = {
        enabled = false,
        webhook = ''
    }
}