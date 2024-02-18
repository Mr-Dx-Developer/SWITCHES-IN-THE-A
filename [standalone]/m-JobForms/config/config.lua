Config = {}

Config.Framework = "qb" -- "qb" or "esx"
Config.Menus = "qb" -- "qb" or "ox" | If you use esx use Config.Menus = "ox"
Config.Emotes = "rpemotes" -- "rpemotes" or "dpemotes"
Config.Animation = "notepad" -- Animation when you are writing the form
Config.SendEmail = true -- Send email to player?
Config.Phone = "qb-phone" -- qb-phone / qs-smartphone / gksphone / rodaphone / d-phone / renewed-phone / notify - if you dont use any phone
Config.Time = 5000 -- Time of progressbar when you are writing the form

Config.Locations = {
    [1] = {
        Location = vector3(619.9848, 3.6469, 82.7418),
        Form = "police",
    },
    [2] = {
        Location = vector3(303.8077, -597.9970, 43.2918),
        Form = "ambulance",
    },
    [3] = {
        Location = vector3(-591.2681, -930.9336, 23.8866),
        Form = "mechanic",
    },
}