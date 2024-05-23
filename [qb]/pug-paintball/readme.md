# Pug Advanced Paintball.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-webstore.tebex.io/
--
# IF YOU HAVE HAD THIS PAINTBALL SCRIPT BEFORE THE 3.0 RELEASE AND THIS IS NOT YOUR FIRST TIME INSTALLING IT, MAKE SURE TO RUN THE NEW TEAMOUTFITS SQL FILE SO THAT THE TEAM OUTFITS WORK.
# ALSO MAKE SURE TO DELETE THE OLD SCRIPT AND INSTALL THIS ONE FROM SCRATCH AS IT IS AN ENTIRE OVERHAUL.
--
Run the Paintball.sql and the TeamOutfits.sql before doing anything else.
Place the (pug-nuketown-arena), and (pug-nuketown-mirrorpark) mlos found on keymaster into your maps folder and make sure they are ensured.
Place the sound files provided pug-paintball/InteractSoundFiles into [standalone]/InteractSound\client\html\sounds. (MORE HAVE BEEN ADDED IN 3.0)
Read through the config.lua thoroughly and adjust everything to match your server. (VERY IMPORTANT)
Adjust the PaintBallNotify() function in open.lua to fit your server (defualt is already setup for base qb-core and esx).
Adjust the DrawTextOptiopnForSpectate() and HideTextOptiopnForSpectate() functions in open.lua to fit your server (defualt is already setup for base qb-core and esx).
If you want to view map images use the ox_lib resource found on github here: https://github.com/overextended/ox_lib/releases
--

--
# OX_INVENTORY USERS: If you are using ox_inventory you will NEED to go ox_inventory/client.lua and around line 1341 you will need to find what looks like this and replace it with this
if weaponType ~= 0 and weaponType ~= `GROUP_UNARMED` then
    if not exports["pug-paintball"]:IsInPaintball() then
        Weapon.Disarm(currentWeapon, true)
    end
end
--

--
# OX_INVENTORY USERS: If you are using ox_inventory you will NEED to go ox_inventory/client.lua and around line 1394 you will need to find what looks like this and replace it with this
if usingItem or invBusy == true or IsPedCuffed(playerPed) then
    if not exports["pug-paintball"]:IsInPaintball() then
        DisablePlayerFiring(playerId, true)
    end
end
--

# (NOT REQUIRED BUT HELPFUL NOTES BELOW)
--
# Important things to know.
FULL MAP MAKING TUTORIAL HERE: https://youtu.be/wALLIIaNoPE (If you make any more new maps please share them in pugs discord in the snippet section. THank you!)
"/redoutfit" and "/blueoutfit" are the commands to save the current outfit you are wearing as each teams outfit. To set the girls outfit you need to be the female model and vice versa
"G" is to open the scorboard while playing
"/surrenderpaintball" is the command to help with any scuff while testing or forfit the game.
--

--
# if you want the player to be placed back on there radio when the match is over you need to add this to pma-voice/client/module/radio.lua at the very bottom
# Make sure to change Config.AddedGetRadioSnippet to true in the config if you add this
local function GetRadioChannel()
	return radioChannel
end

exports('GetRadioChannel', GetRadioChannel)
--

--
# In your dispatch script, search up shot or discharge and add this "if statement" where you can to remove shots fired calls when players are in a paintball match. add "if exports["pug-paintball"]:IsInPaintball() then return end" to your shots fired call at the top of the event or handler so that none of the rest of the code reads when players shoot while in paintball.
# ps-dispatch example here:
AddEventHandler('CEventGunShot', function(witnesses, ped)
    if exports["pug-paintball"]:IsInPaintball() then return end
    if IsPedCurrentWeaponSilenced(cache.ped) then return end
    if inNoDispatchZone then return end
    if BlacklistedWeapon(cache.ped) then return end
        
    WaitTimer('Shooting', function()
        if cache.ped ~= ped then return end

        if PlayerData.job.type == 'leo' then
            if not Config.Debug then
                return
            end
        end

        if inHuntingZone then
            exports['ps-dispatch']:Hunting()
            return
        end

        if witnesses and not isPedAWitness(witnesses, ped) then return end

        if cache.vehicle then
            exports['ps-dispatch']:VehicleShooting()
        else
            exports['ps-dispatch']:Shooting()
        end
    end)
end)
--

--
# (QBCORE ONLY) IF YOU ARE HAVING AN ISSUE WHERE YOUR GUN GETS PUT AWAY WHEN THE MATCH STARTS AND ARE USING QB-ANTICHEAT FIND THIS LOOP IN QB-ANTICHEAT/CLIENT/MAIN.LUA AND REPLACE IT WITH THIS
CreateThread(function()	-- Check if ped has weapon in inventory --
    while true do
        Wait(5000)

        if LocalPlayer.state.isLoggedIn and not exports["pug-paintball"]:IsInPaintball() then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation ~= nil and WeaponInformation["name"] ~= "weapon_unarmed" then
                QBCore.Functions.TriggerCallback('qb-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Weapon removed!", "orange", "** @everyone " ..GetPlayerName(player).. "** had a weapon on them that they did not have in his inventory. QB Anticheat has removed the weapon.")
                    end
                end, WeaponInformation)
            end
        end
    end
end)
--

# Advanced Paintball. For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
Advanced Paintball 3.0 release!

PREVIEW HERE: https://youtu.be/t9G0t4m3ZAs

​Full QBCore & ESX Compatibility. (supports custom qb-core names and all qb custom file dependency names)

This script is partially locked using escrow encryption. 90% of the script is accessible in client/open.lua, server/server.lua, and config.lua

Readme: https://imgur.com/jMJHiR2.png
Config: https://imgur.com/TjwDoBf.png

# This completely configurable script consist of:
● Supports up to 24 players max. (12v12 red vs blue) and 24 players in all FFA game modes (FFA, One in the chamber, & Gun Game).
● All 19 maps are included for free, featuring Nuketown Arena & Nuketown Mirror Park MLOs at no extra cost.
● Create unlimited custom maps anywhere in the GTA 5 world using zones by placing simple vectors in the config.
● Ability to toggle between having a host of the lobby set all of the settings for the game or allow all players to edit the settings for the game.
● A scoreboard UI that displays and organizes all 24 players, updating kills, deaths, map, scores, etc. (G key to display in-game)
● Passive mode spawn protection with a Config.PassiveModeCoolDownWaitTime variable for safety upon respawning.
● Teammate locations are displayed with red and blue blips and an option to keep UAV always on during FFA modes.
● A kill streak system awards a usable UAV after achieving Config.UavKillstreak kills, and a death machine killstreak can be customized with Config.SpecialWeaponItem.
● Paintball can be made an ownable business, taking a portion of each game's combined wager into the Config.PaintballBusinessName account. (QBCORE only)
● /redoutfit & /blueoutfit commands for saving your current outfit as each teams outfit. (no longer need to config teams clothing)
● A wager amount set to minimum Config.MinWager and maximum Config.MaxWager. Rearward at the end of the game is wager amount * total-players / winning team (Configurable).
● Custom game commentary recorded for each action during games. (Sounds files provided)
● Each team spawns in on the same radio and gets placed back on their radio at the end.
● 33 gun options to choose from (Configurable and addon guns do work).
● Team Death Match game mode (12v12 | The team that reaches Config.MaxTDMScorekills first wins)
● Capture The Flag game mode (12v12 | The first team to capture the enemy flag 3 times wins)
● Free For All game mode (Every man for himself! Earn Config.MaxFFAScore kills to win! 450 random spawn vectors pre-configured, 30 per map)
● Gun Game game mode. (With every kill comes a new weapon granted. go through Config.MaxFFAScoreweapons to win! 570 random spawn vectors configured, 30 per map)
● One In The Chamber game mode. (You have 1 bullet. Every kill earns one more bullet. You only have set amount of lives. 570 random spawn vectors configured, 30 per map)
● Hold Your own game mode (12v12 | Each player tries to last as many lives that are set, Whatever team loses all of their lives first loses)
● Unlimited sprint during the match.
● The option to spectate players.
● Starting game cinematic sequence.
● ox_lib menu map image preview.
● Runs at 0.0 ms resmon (0.02 when playing a match)
● Consistent big updates such as this 3.0 update.

# 3.0 changes
● Installation has become as simple as it gets.
● Nuketown Arena & Nuketown Mirror Park MLOS's included and supported for free.
● Many new game modes (Free For All, Gun game, one in the chamber).
● Team blips to show where teammates are on the minimap.
● Massively cleaned up code from 1.0 and 2.0!
● Made adding new custom maps as simple as possible in the config.
● new scoreboard ui updating kills, deaths, map, score etc.
● added more support for more than 16 players.
● max player count is now 12v12 instead of 8v8.
● Added support for vector4's to all spawn locations so that heading is automatically set.
● Players have unlimited parachutes to use during paintball.
● Added the ability to activate or deactivate each weapon class menu with a new "EnableThisMenu" value to each weapon class menu config option.
● Overhauled how the players death is read, removed (Config.UsingLastStand)
● Created an entire lobby hosting system that allows only the host of the lobby to control all of the game settings if Config.HostOnlyCanControllGame is true
● New /redoutfit & /blueoutfit for saving your current outfit as each teams outfit. (no longer need to config teams clothing)
● Now compatible with every ems job script, no problem.
● Created a cool starting game cinematic cam that is randomly generated every time.
● Added passive mode for every time the player respawns with a Config.PassiveModeCoolDownWaitTime variable
● lobbies are now instanced and locals are turned off.
● You can now make location maps all throughout the gta 5 world just by placing simple vectors
● No longer depends on any inventory (all inventories are compatible)
● Added Config.ArmorAmoutGivenToPlayer. Sets the players armor value every time the player spawns throughout the game.
● Changed the weapon menu coming up after respawn automatically. Now you have to press E to open the weapon menu (with notification).
● New maps created in 3.0 include nuketown arena, nuketown mirror park, grove street, stab city, uptown construction, and reds salvage yard.
● Made kill sound effect for all game modes and not just FFA
● Re wrote how the scoreboard ui updates.


Requirements consist of:
QBCore OR ESX (Other frameworks will work but are not officially supported).
qb-menu OR ox_lib (Alternative UI resources compatible if renamed accordingly).
No specific target script, EMS script, or inventory script required. (all are supported)