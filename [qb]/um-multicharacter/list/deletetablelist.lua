DeleteTableList = {}

--[[

    List of SQL tables that you want to delete the character's records when the character is deleted by admin or user
    If you don't have some tables here, don't worry, you don't need to delete them, it won't give an error, you can add your own
    to see tables that are not there, you can see them in the server console if you set Config.Debug to true

--]]

-- Default QBCore Tables
DeleteTableList.Tables = {
    {
        table = 'players',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'apartments',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'bank_accounts',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'crypto_transactions',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'phone_invoices',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'phone_messages',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'playerskins',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'player_contacts',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'player_houses',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'player_mails',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'player_outfits',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    },
    {
        table = 'player_vehicles',
        column = 'citizenid',
        type = 'citizenid' -- steam, license, discord, citizenid
    }
}
