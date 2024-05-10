Hello, thanks for purchasing my script!
`All support is done via my discord at discord.gg/y6RtPVwkXq`
Here is a setup guide to get everything working!


# THIS SCRIPT WORKS WELL WITH K_DISEASES! https://kbase.tebex.io/category/all-frameworks
##### ::::::::::::::::::::::::::::

Step #1:
`Add k_hygiene to your server's resources folder`

Step #2:
`Add the following to the bottom of your server.cfg under all other resources`

ensure k_hygiene

Step 3:
`Pick prefered framework in config.lua (for standalone put None)`

Step 4:
`Run the SQL file from k_hygiene\setup\sql and make sure it creates a database table called "player_hygiene"`

## WHEN EDITING Config.Hygiene YOU MUST WIPE THE `player_hygiene` DATA FROM THE DATABASE

Step 5:
`Download https://github.com/plunkettscott/interact-sound and start it in your server.cfg`

```lua
    ensure interact-sound       
```

The fxmanifest of interact-sound should look like this at files

files {
    'client/html/index.html',
    'client/html/sounds/*.ogg'
}


`Add the sounds from k_hygiene\sounds to interact-sound\client\html\sounds`


Step 6:
`Follow the docs below to setup your own hygiene effects!`

Step 7:
`Enjoy!`

Commands: (Can be disabled)
`/poo`
`/pee`
`/potty`
`/toilet`
`/bath`

You can also have target support for the props within the config.

TriggerEvent('k_hygiene:shitOnGround')

TriggerEvent('k_hygiene:pee')
    
TriggerEvent('k_hygiene:potty')
    
TriggerEvent('k_hygiene:toilet')
    
TriggerEvent('k_hygiene:bath')
  


##### ::::::::::::::::::::::::::::

###### DOCS

If debug is enabled in config.lua the following commands will be enabled:

`/getHygiene` example: `/getHygiene "Dirty Face"` -- this will grant the player this Hygiene
`/removeHygiene` example: `/removeS "Dirty Face"` -- this will remove the players Hygiene
`/removeAllHygiene` example: `/removeAllHygiene` -- this will remove all the players hygienes (just the source player not all)
`/hygiene `example: `/hygiene` -- this will bypass the startup check for ESX and QB (forces the disease system to start)

``
    exports['k_hygiene']:CatchHygiene(type, chance, checkifalreadyhasit)
    TriggerServerEvent('k_hygiene:CatchHygiene', source, type, chance, checkifalreadyhasit)
    TriggerEvent('k_hygiene:CatchHygiene', type, chance, checkifalreadyhasit)
    `This can be used to give a player a specified Hygiene`: (`exports['k_hygiene']:CatchHygiene(type, chance, checkifalreadyhasit)`) Example: exports['k_hygiene']:CatchHygiene("Dirty Face", 100, false)
    type: Config.Hygiene
    chance: Chance in %
    checkifalreadyhasit: Checks if the player already has this hygiene and if they do it wont renew.
``
    exports['k_hygiene']:ClearHygiene(type)
    TriggerServerEvent('k_hygiene:ClearHygiene', source, type)
    TriggerEvent('k_hygiene:ClearHygiene', type)
    `This can be used to remove a player a specified hygiene`: (`exports['k_hygiene']:ClearHygiene(type)`) Example: exports['k_hygiene']:ClearHygiene("Dirty Face")
    type: Config.Hygiene

``
    exports['k_hygiene']:GetHygiene()
    `This is used to return all a players hygienes`: (`exports['k_hygiene']:GetHygiene()`)
    returns: Same layout as Config.Hygiene example: exports['k_hygiene']:GetHygiene()['Dirty Face'].hasThis
``
    exports['k_hygiene']:ClearAllHygiene()
    TriggerServerEvent('k_hygiene:clearall', source)
    TriggerEvent('k_hygiene:clearall')
    `Removes all a specified player's current hygiene`: (`exports['k_hygiene']:ClearAllHygiene()`)
``
    "CatchHygiene", -- exports['k_hygiene']:CatchHygiene(type, chance, check)
    "ClearHygiene", -- exports['k_hygiene']:ClearHygiene(type)
    "GetHygiene",-- exports['k_hygiene']:GetHygiene() -- returns list of hygienes true or false and iterations Example: ( exports['k_hygiene']:GetHygiene()["Dirty Face"].hasThis )
    "ClearAllHygiene" -- exports['k_hygiene']:ClearAllHygiene() -- Clears every sickness (could be used on player revive or something :P)
``
    exports['k_hygiene']:CanPedDoAnim(toggle) -- Toggles if the ped can do the animations. (if false it will wait until set back to true.)
``


`Adding new Hygiene options is relatively easy!`



###### DOCS

Need support?
`All support is done via my discord at discord.gg/y6RtPVwkXq`

Freaquently asked questions:

Can i add onto this script?
`Yes there are callbacks and lots of configurable options!`

Are you going to do an open source version?
`At this moment in time, no sorry`
