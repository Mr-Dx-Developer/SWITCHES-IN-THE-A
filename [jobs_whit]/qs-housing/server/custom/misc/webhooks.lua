Config.Webhooks = { -- Place your Discord webhooks here.
    ['createhouse'] = '',
    ['deletehouse'] = '',
    ['buyhouse'] = '',
}

Config.WebhookMark = 'Quasar Housing Logs'

Config.WebhookTranslates = { --Configure here all the translations of your webhook.
    ['createhouse'] = {
        ['title'] = 'A new property has been created',
        ['creator'] = '**Creator name:**',
        ['license'] = '\n**Creator license:**',
        ['price'] = '\n**Property value:**',
        ['street'] = '\n**Property street:**',
        ['coords'] = '\n**Coordinates:**',
    },

    ['deletehouse'] = {
        ['title'] = 'A player deleted a property',
        ['player'] = '**Player:**',
        ['license'] = '\n**Property buyer license:**',
        ['coords'] = '\n**Coordinates:**',
        ['house'] = '**\nHouse removed:**',
    },

    ['buyhouse'] = {
        ['title'] = 'A property was purchased',
        ['player'] = '**Property buyer name:**',
        ['license'] = '\n**Property buyer license:**',
        ['coords'] = '\n**Coordinates:**',
        ['price'] = '\n**Property price:**',
        ['realestateMoney'] = '\n**Realestate Earnings:**',
    },
}
