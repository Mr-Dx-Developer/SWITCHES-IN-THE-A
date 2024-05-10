TriggerEvent('chat:addSuggestion', '/giveitem', 'Administrative command to give items to another player', {
    { name = 'id', help = 'Id of the player to whom the item will be delivered' },
    { name = 'item', help = 'Name of the item to deliver' },
    { name = 'amount', help = 'Quantity of the item, if it is a weapon it will be ammo' },
})

TriggerEvent('chat:addSuggestion', '/giveweapon', 'Administrative command to give weapons to another player', {
    { name = 'id', help = 'Id of the player to whom the weapon will be delivered' },
    { name = 'weapon', help = 'Name of the weapon to deliver' },
    { name = 'ammo', help = 'Amount of ammo for the weapon' },
})

TriggerEvent('chat:addSuggestion', '/resetinv', 'Administrative command to reset an inventory, it will not delete it', {
    { name = 'type', help = 'Type of inventory to reset, example: [stash], [trunk], [glovebox]' },
})

TriggerEvent('chat:addSuggestion', '/clearinv', 'Administrative command to remove all items of a certain player', {
    { name = 'id', help = 'Enter the id of the player whose inventory you want to empty' },
})

TriggerEvent('chat:addSuggestion', '/repairweapon', 'Administrative command to repair certain players weapons', {
    { name = 'id', help = 'Select the id of the player to repair his weapon' },
})

TriggerEvent('chat:addSuggestion', '/openinventorytarget', 'Administrative command to check the inventory of a target player', {
    { name = 'id', help = 'Select player id' },
})

TriggerEvent('chat:addSuggestion', '/inventory', 'Command to open the inventory, useful for keybinds', {})
TriggerEvent('chat:addSuggestion', '/hotbar', 'Command to open the hotbar inventory, useful for keybinds', {})
TriggerEvent('chat:addSuggestion', '/handsup', 'Command to raise your arms, useful for keybinds, if you have your arms raised they can steal you', {})
TriggerEvent('chat:addSuggestion', '/reloadweapon', 'Command to reload your weapon, useful for keybinds', {})
TriggerEvent('chat:addSuggestion', '/randomitems', 'Administrative command that delivers various random items to your inventory, helps with debugging', {})
TriggerEvent('chat:addSuggestion', '/searchplayer', 'Command to steal from a nearby player, although we recommend doing it with the NUI raising his hands', {})
TriggerEvent('chat:addSuggestion', '/rob', 'Exclusive qb command to steal players, used for police job frequently', {})
TriggerEvent('chat:addSuggestion', '/invitems', 'Example of code used for getInventory, it will return all the items in your inventory', {})
TriggerEvent('chat:addSuggestion', '/dataitem', 'Example command to give an item with customizable and automatic metadata', {})