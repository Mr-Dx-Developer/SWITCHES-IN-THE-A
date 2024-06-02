# Browns Pocket Books By Brown Development

# Contact Info:
Personal Discord: @bwobrown
Discord Server: discord.gg/browndevelopment

# What does it do?
allows players to buy pocketbook crafting materials from a shop then
take the materials to the pocketbook crafting location to craft pocketbooks
once crafter the player can then use the pocketbook which will open a stash
that the player can store items in. Each crafted pocketbook has its own unique 
stash and is saved in the database so all items stored in each pocketbook will
be there even after a server restart. 

When the pocketbook is used it will show the actual pocketbook prop in the players hand
however if the player drops the pocketbook it will then remove the pocketbook from the 
players hand.

players can only use a pocketbook if they have one in their inventory however
if they have multiple pocketbooks in their inventory then they wont be able to use
any of the pocketbooks until they drop all pocketbooks except for the one they want to use
this was integrated into the script so players cant abuse the pocketbooks by using multiple
pocketbooks with each having their own seperate stash giving the player and unlimited amount
of storage.

# ADMIN (DONT DO'S)
1. Do not spawn in the pocketbooks, why?

because it will not work if you use it, the reason is:
each pocketbook must be crafted. when a pocketbook is crafted it generates a unique 6 digit serial number
and at the same time a stash is registered with that serial number allowing that specific pocketbook to open
the specific stash that was registered with the pocketbooks serial number. therefore if it is spawned it
then it does not generate a serial number therefore it wont open a stash therefore it is useless.
the serial number can be seen by:
ox_inventory - hovering over the item in your inventory
qb-inventory - reading the stash label at the top of the opened stash (it says something like 'stash' then the serial number after)

2. Do not restart the script while the server is live, why?

because if players are using the pocketbooks then that means the pocketbook props are showing in their
hand since thats how the script works to make using the pocketbook more realistic (visually & physically). 
When the script is restarted it will crash everyone on the server because the pocketbook prop which is
spawned in through the script is loaded since it is being displayed in players hands and restarting 
the script will reverse the mechanism used to spawn the prop in while the prop is still being displayed physically 
causing a crash.
However if the no one is using the pocketbook and the prop isnt loaded into the players hands physically
then it wont cause a crash.

3. DO NOT CHANGE THE NAME OF THIS SCRIPT OR IT WILL BREAK!!!

# **Optimization (RESMON)**
# When Script is Running but not being used by players
0.01 
# When Using PocketBook
slight peak of 0.01 - 0.03 for a few seconds while the bag prop is still loading
0.01 once bag prop is loaded and placed in players hands
# When opening pocketbook (stash)
slight peak of 0.02 for less than a second whilst opening stash 
0.01 when stash is opened 
0.01 when transfering items in and out of stash
# DrawText
Enabled: if player is super close to crafting location then constant 0.07
Disabled: if player is super close to crafting location then constant 0.01
# Crafting PocketBook
DrawText Disabled: slight peak of 0.04 for less than a second when begining crafting then back to 0.01 whilst crafting
DrawText Enabled: peak of 0.11 for less than a second when beginning crafting then back to 0.07 whilst crafting

# COMPATIBILITY
Framework: QBCore & ESX
Inventory: QB-Inventory & OX_Inventory
Notifications: QBCore Notifications, OX_Lib Notifications, OKOK Notify, & ESX Notifications
Target: QB-Target & OX_Target
Menu: QB-Menu & OX_Lib Context Menu
Input: QB-Input & OX_Lib Input Dialog (Not Configurable, already set when you choose between 'qb' or 'ox' in Config.Menu)
Progressbar: progressbar (defualt QBCore Progressbar), OX_Lib ProgressBar (circle), & rprogress