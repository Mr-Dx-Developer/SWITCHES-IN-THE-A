-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://canary.discord.com/api/webhooks/"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://canary.discord.com/api/webhooks/"

-- Discord webhook for server logs
LOGS = {
    Calls = "https://canary.discord.com/api/webhooks/", -- set to false to disable
    Messages = "https://canary.discord.com/api/webhooks/",
    InstaPic = "https://canary.discord.com/api/webhooks/",
    Birdy = "https://canary.discord.com/api/webhooks/",
    YellowPages = "https://canary.discord.com/api/webhooks/",
    Marketplace = "https://canary.discord.com/api/webhooks/",
    Mail = "https://canary.discord.com/api/webhooks/",
    Wallet = "https://canary.discord.com/api/webhooks/",
    DarkChat = "https://canary.discord.com/api/webhooks/",
    Services = "https://canary.discord.com/api/webhooks/",
    Crypto = "https://canary.discord.com/api/webhooks/",
    Trendy = "https://canary.discord.com/api/webhooks/"
}

-- Set your API keys for uploading media here. 
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
-- You can get your API keys from https://fivemanage.com/
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "YOUR_TOKEN",
    Image = "YOUR_TOKEN",
    Audio = "YOUR_TOKEN",
}
