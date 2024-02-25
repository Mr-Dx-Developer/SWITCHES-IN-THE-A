if using a modifed version of ESX you can edit the Core data in the configs of each script :P
I will not alter the script to your core.

Requirements:

https://github.com/whooith/nh-context -- The shops require this, but if your not using my shops then you don't need this
https://github.com/overextended/qtarget -- Not required optional
https://github.com/mkafrin/PolyZone -- (Only if using QTarget)
https://github.com/utkuali/datacrack -- optional used for cloning/printing minigame (Recommended)


how to install:

Simplay drag the following + any optional resources into your resources folder:

K_FRAUDV2
K_FRAUDATMS
K_FRAUDSHOPS
K_FRAUDPROPS

 
Import the SQL file or make new items the same names as the sql in your database/what ever it is you use

add the resources to your server.cfg

ensure nh-context
ensure datacrack
ensure K_FRAUDV2
ensure K_FRAUDATMS
ensure K_FRAUDSHOPS
ensure K_FRAUDPROPS

(If using QTarget/PolyZone make sure they are started before all that)

or put the all in the one folder in your resources folder like this

resources/[K_FRAUD]

then add 
ensure [K_FRAUD]

Both Shops/ATMS are not encrypted so you are free to edit them as you please
and K_FRAUD has alot of configs so you can edit mostly anything but if you want something else to edit just pop it in the discord

