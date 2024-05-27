Logs = {}

-- General webhook configurations
Logs.Name = 'Scuba Logs' -- Name for the webhook
Logs.Image = 'https://i.imgur.com/ILTkWBh.png' -- Image for the webhook
Logs.Footer = 'https://i.imgur.com/ILTkWBh.png' -- Footer image for the webhook

-- Specific log type configurations
Logs.Types = {
    crateFound = {
        enabled = false,
        webhook = ''
    },
    boatRental = {
        enabled = false,
        webhook = ''
    },
    gearPurchase = {
        enabled = false,
        webhook = ''
    },
    crateOpened = {
        enabled = false,
        webhook = ''
    },
    groupCreated = {
        enabled = false,
        webhook = ''
    },
    memberAdded = {
        enabled = false,
        webhook = ''
    },
    memberRemoved = {
        enabled = false,
        webhook = ''
    },
    memberLeft = {
        enabled = false,
        webhook = ''
    },
    groupDisbanded = {
        enabled = false,
        webhook = ''
    }
}