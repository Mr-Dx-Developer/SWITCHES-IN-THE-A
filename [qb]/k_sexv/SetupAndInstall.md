Hello, thanks for purchasing my script!

Here is a simple setup guide to get everything working!

##### ::::::::::::::::::::::::::::

## @@ If you are wanting to get STD's/ you will have to get k_diseases at https://kbase.tebex.io/ and set UsingKDisease = true

Step #1:
`Add k_sexv to your server's resources folder`

Step #2:
`Add the following to your server.cfg`

ensure k_sexv

Step #3: Optional (Recommended)
`If your wanting to save pregnancy data to database you must import the pregnancyImport.sql file into your database.`
`After that is done you need to head to the config.lua and set usingSQL = true.` -- If you don't do this data will not save in the database.
## @ Requires oxmysql!

Step #4:
`Add the images from k_sexv/images to your inventory!`

Step #5:
`By default this script is setup to work on QB so please change it in the config.lua if you need to`
ESX: Import the SQL or OX items from k_sexv/items
QB: Add the items to qb-core/shared/items.lua from k_sexv/items/qbitems.txt

Step #6:
`Add the items to a shop script you have so players can buy them!`

Step #7:
`Head to k_sexv/config.lua and pick your current framework and configure misc settings if you wish`

I'd suggest setting up the clothing in config.lua to have proper clothing incase it looks weird!

Step #8:
Head in game and get some head ;)

Step #9 Misc:

If your wanting STD's you can buy my disease system that will work with this script!

https://kbase.tebex.io/category/all-frameworks

Get access to all my scripts here!
https://kbase.tebex.io/category/subscriptions 










##### ::::::::::::::::::::::::::::

###### USEAGE

Commands:

Setup sex scene: `/sex`

Sleep in bed's from config.lua: `/sleep`

You could also use the following:
`TriggerEvent('k_sexm:sexsetup')` -- Setup sex scenes -- Example useage: Option on a radial menu
`TriggerEvent('k_sexm:sleepsetup')` -- Find and sleep in bed trigger -- Example useage: Option on a radial menu

###### USEAGE

Need support?
`All support is done via my discord at discord.gg/y6RtPVwkXq`

Freaquently asked questions:

Will more animations come?
`Yes, more are planned`

Do we need to use a bed?
`Only for sleeping, you can have sex anywhere you want!`

Can we add new beds?
`Yes you can but the pivot point must be at the headboard of the bed (this will change in the future)`

Are you going to do an source version?
`At this moment in time, no sorry`

Does this script have STD/Diseases?
`Not built in but you can buy my system that works with this script! https://kbase.tebex.io/`
