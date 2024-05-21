# Changelog

## 3.4.2

    Fix:
        - Current Gear Text location is now better placed - `index.html`
        - Support for planes and helicopters - `drawtext.lua`, `index.html`
            - Replaces info on the rpm meter with altitude
        - Refactored some of the js code - `index.html`
        - Boats and JetSki's getting waterlogged - `extras.lua`
        - Prop staying stuck in hand longer when it should when applying drift tire colours - `cosmetics.lua`

    Changes:
        - Changed angles of a lot of custom cameras
            - they now start at the top of the vehicle and face the player, instead of the other way round
            - `cosmetics.lua`, `damages.lua`, `extras.lua`, `nos.lua`, `performance.lua`, `repair.lua`, `rims.lua`, `functions.lua`

## 3.4.1

    Fix:
        - Hopefully fixed stuttering fade in/out of the hud - `extras.lua`, `index.html`
        - Fix SetGravity Spam when deleting vehicles - `extras.lua`
        - Fix harness/seatbelt spam if you delete a vehicle while seatbelt is on - `extras.lua`
        - Made speedometer not show in planes and helis and it doesn't fully support it for now - `extras.lua`
        - Added scaling options to the speedometer, the markers should place and scale accordingly now - `index.html`, `drawtext.lua`, `config.lua`

## 3.4

    Fix:
        - Typo making cars stay drivable after engine level going too low - `extras.lua`
        - Forgot to add `createUseableItem` events for the two new items - `main.lua`
        - A chance variables may get messed up with old ejection system - `extras.lua`
        - Hopefully fix Repair animations ending too early - `repairs.lua`
        - When changing the xenon colours/underglow colours the car will start so they can be shown - `xenons.lua`
        - Players being able to skip harness progressbars - `extras.lua`
        - Custom Tires now default to off (no more text), but can be toggled - `rims.lua`, `preview.lua`, `emergency.lua`
        - `17mov_hud` causing esx errors on any server type if you have it installed - `extras.lua`
        - Left over `qb-target` function, changed to jim_bridge's `createBoxTarget` - `locfunctions.lua`

    Changes:
        - Attempt to optimize GetVehicleStatus() by using statebags instead of callbacks - `damages.lua`, `functions.lua`, `functionserver.lua` `encfunctionserver.lua`
            - Not sure if this will help but deserves testing
        - Attempt to bring down `ms` when driving as much as possible - `extras.lua`
            - Theres a lot of information being processed by the script
            - When you stop the vehicle it brings down the loop speeds
            - When you drive it speeds them up to track things better like when to eject.
            - `preventRoll` now sets raises vehicle gravity to stop, instead of looping disable controls
            - seatbelt/harnesseasyleave now checks if you are leaving the vehicle and forces you back to your seat
            - To bring this down further you need to disable elements of the script
            - Hightly recommend using the betaEjection system mentioned in previous patch notes to bring it down more
        - Removed callback `jim-mechanic:checkCash` and now using `getPlayer().cash` from `jim_bridge` - `manualrepair.lua`, `emergency.lua`, `functionserver.lua`
        - Lowered default antilagcooldown, you will hear them more often now - `extras.lua`
        - Repairkits not longer require a vehicle to be owned - `functions.lua`
        - Added new Custom tires button to toggle the text variation on wheels - `rims.lua`, `preview.lua`, `emergency.lua`
            - This will only show if you have non-stock wheels on cars as they can't be applied without custom rims
        - Raised wait after onPlayerLoaded to help loading of some props - `locfunctions.lua`
        - Moved the manualRepair benches back out of the "enter location" checks, so they should always be visible - `locfunctions.lua`
        - New/AlteredIcons
            - Some icons have been redone and some have been replaced
            - Optimized Item Images, can help loading speeds of inventories and menus (thank you havek) - `/.install`

    New:
        - Added when a vehicle is underwater, it becomes undriveable until a mechanic repairs the engine - `extras.lua`, `repair.lua`

        - Override Option called `receiveMaterials` - `config.lua`, `performance.lua`, `damages.lua`, `functions.lua`, `recipes.lua`
            - When removing performance parts, players recieve materials instead
            - What they recieve is specified in the new table at bottom of `recipes.lua`
            - By default they receive between: half the amount and the full amount
            - You can add multiple items to be received
            - When set to false the performance items will be recieved as the full parts again

        - Complete rewrite of odometer code `drawtext.lua`, `index.html', `config.lua`,  `extras.lua`, `shared.lua`, `nos.lua` `xenons.lua`, `/html`
        - Now a lot more customisable through the config.lua
        - Custom font for milage to simulate an actual car dashboard
        - Option to only show seatbelt/harness images for passengers
        - More Icon's
            - Door open warning, Manual Transmission, Underglow, Antilag, Fuel Tank damage
        - Icon colours
            - Added a customisable gradient system to gradually change the colour of damages
            - Underglow, Headlights and NosPurge match the colour you have set on the car
            - NosBoost lights up when its in use
            - Seatbelt/Harness are hidable when buckled if you toggle it in config

        - Brand new customisable Speedometer
            - Comes in 3 different variations
            - Customisable via config.lua

        - Hides if the engine is off or the pause menu is open

        - `Share your presets!`

## 3.3.6

    New:
        - Add support for `vlad-gears`
        - Two new items, `manual`, `underglow` - `ox_items.lua`, `qb_items.lua`
            - `underglow` is now required to install enable underglow lighting on a vehicle - `functionserver.lua`, `check_tunes.lua`, `xenons.lua`, `shared.lua`
            - `manual` enables manual transmission through the script `vlad-gears` and `GameBuild 3095` (does nothing otherwise) - `performance.lua`, `extras.lua`, `check_tunes.lua`, `shared.lua`
            - `https://vlad-laboratory.tebex.io/package/6113070`
        - `AltEjection` - `extras.lua`, `config.lua`
            - Testing a alternate car crash ejection system
            - It is enabled through the config in the Harness Section
            - To make use of this add these lines to your server.cfg
            - setr game_enableFlyThroughWindscreen true
            - setr game_enablePlayerRagdollOnCollision true
        - Support for custom blip preview images in the pause menu map. - `locations.lua` `locfunctions.lua`
            - This requires the script blip_info to be running in your server
            - If you dont have one added it will default to the payment logo image, if that isnt set it wont show anything.
            - Custom images can be any size but recommended to be 512x256 png's

    Changes:
        - Adjust ejection logic slightly and add config options to allow users to customise it - `extras.lua`, `config.lua`
            - `If you, as the driver, gets ejected under the minimum crash speed limit, you may have another script trying to eject you`
        - Move manual repair benches back out of polyzone creation, this will make them show up at player load in - `locfunctions.lua`

    Fix:
        - Revert `updateCar` changes, people were reporting issues with saving - `functions.lua`
        - Fix `nil HasHarness()` error if not using built in seatbelts `extras.lua`
        - Fix default rising sun polyzone causing errors with ox_lib - `locations.lua`
        - Remove debug print - `functionserver.lua`
        - Checking for phone items when previewing not checking the whole list - `previews.lua`

## 3.3.5

    Changes:
        - Rearrange "jim_updateVehiclePart" to not skip if you can't see the entity as it wasn't needing to - `damages.lua`
        - Attempt to reduce server callbacks of `jim-mechanic:server:GetStatus` (the above ^ helps with this) - `damages.lua`
        - Rearrange functions based around saving and syncing vehicle mods to help issues some have - `functionserver.lua`
            - This should sync vehicles between players earlier and attempt to save them after
            - In theory this could help saving mods as the vehicle should be synced better and more likely to save mods correctly

    Fix:
        - Kicking players if they used repairkits or advancedrepairkits - `functions.lua`
        - Remove double plate grab from `DamageRandomComponent` - `damages.lua`
        - Possible error with `modName` when applying cosmetics - `cosmetics.lua`
        - Fix `vehicle death simulator (debug only)` option not damaging the extras - `emergency.lua`
        - BossRoles for targets getting confused - `locfunctions.lua`
            - It was checking for the gang role and locking players from eeing the bossmenu options
        - Server side item checks for repair items now checks correctly with new changes - `main.lua`

    New:
        - Added support for custom Manual Repair bench props - `locfunctions.lua`
            - in locations.lua change `prop = true` to your prop model
            - eg. `prop = "gr_prop_gr_bench_03a"`
        - Added Config option to old previous `preview` `preview.lua`, `config.lua`
        - Multi Phone script support with new event `sendNewMail` through `jim_bridge - 1.0.10` - `previews.lua`
            - As of this update, supported phones are:
            - `gks-phone`, `yflip-phone`, `qs-smartphone`, `qs-smartphone-pro`, `roadphone`, `lbphone`, `qb-phone`

## 3.3.4

    Changes:
        - Support for ox_lib's registerMenu to create a menu that can be controlled with arrows - `preview.lua`
            - This is now default for PREVIEWS
        - `Config.Previews.hardCam` is now retired, players can now enable or disable it through their preview menus - `preview.lua`
        - `mechboard` item now shows a slightly different menu - `preview.lua`
        - Made spray painting animations last a bit longer - `paint.lua`

    Fix:
        - Separated removal events for items with the `toolbox` item as it was getting confused - `check_tunes.lua`
        - Fixed typo stopping preivews from setting rims back to stock - `preview.lua`
        - Very minor fixes to menu for starting crafting - `locfunctons.lua`
        - People being able to see boss related targets when they shouldn't `locfunctions.lua`

    New:
        - Added check for if ox based items have been updated from ox_items.txt - `performance.lua`
        - Made the performance items adding/removing events a bit smarter - `performance.lua`
        - Added progressbar item text for Extra damage components when adding/removing them - `damages.lua`

## 3.3.3

`RE-REPLACE YOUR OX_PROPERTIES/QB_PROPERTIES TO FIX LEAKING ISSUE`
    Fix:
        - Remove debug print from getStatus (sorry was testing things) - `functionserver.lua`
        - Fix `updateServerDelay` not doing anything - `functions.lua`, `functionserver.lua`
        - Players can now walk while holding the clipboard - `shared.lua`
        - Add check for `phone` items after preview before checking if you have them on you - `preview.lua`
        - Fix mechboard giving errors when using `ox_lib` - `functionserver.lua`
    New:
        - Add extra config options to help prevent tankHealth damage setting below 0 - `config.lua`, `extras.lua`
    Changes:
        - Added check for forceUpdateCar to only to sync the car with other players, not the one who edited it - `functions.lua`, `functionserver.lua`
        - Added extra check for carwax incase it finds no values - `extras.lua`

## 3.3.2

    Fix:
        - Fix header error when selecting paints in emergency repair bench - `emergency.lua`
        - Old liveries in emergency repair benches refusing to go back to stock - `emergency.lua`
        - Fix suspension allowing higher levels to be attempted to be added - `performance.lua`
        - Fix antilag allowing players to install and kick them if already installed - `performance.lua`
        - Possibly Fixed fivem spam `Warning: [entity] GetNetworkObject:` - `damages.lua`, `extras.lua`, `preview.lua`, `xenons.lua`, `functions.lua`, `jim_bridge`

    New:
        - Minor Rewrite of reapir.lua to add support multiple items for repairs - `repair.lua`, `config.lua`
        - Added config options to toggle reparing damaged wheels with engine or body - `repair.lua`, `config.lua`
            - `Config.Repairs.RepairWheelsWithEngine`
            - `Config.Repairs.RepairWheelsWithBody`

## 3.3.1

    Fix:
        - Not updating hud on seatbelt change - `extras.lua`
        - `harness` kicking players if they tried to install it more than once - `performance.lua`
        - `repairkit` and `advancedrepairkits` events updated and fixed for all frameworks - `ox_items.txt`, `functions.lua`
        - Fix extra damage itemss labels for ox - `ox_items.txt`
        - `qb_properties.txt` using Core instead of QBCore - `qb-properties.txt`
        - `mechboard` item needing old removed config option to work with ox `functionserver.lua`
        - `nosrefill` checking the wrong place because of needing old removed config option to work with ox `locfunctions.lua`
        - `stashrepair` causing an error `repair.lua`
        - Hopefully stopped the damages.lua line 30 error - `damages.lua`
        - Fix qb-callback for `mechCheck` erroring/crashing - `functionserver.lua`
        - Rearrange and cutdown callback code and add duty check to mechCheck `functionserver.lua`

    Changes:
        - Lowered animation/prop timeout so people don't think they are stuck. - `shared.lua`

    Update your `jim_bridge` too
    Don't forget (if needed) replace your ox items and/or qb vehicle properties

## 3.3

    - Major re-write for multi-framework support!
    New:
        - Full support for `qbx_core`
        - This includes a major rewrite of all the files
        - If using `ox_lib` and/or `ox_inventory`, many of those functions will be used instead of qb-core's versions
        - Experimental stash support for `qs-inventory` v2.0
        - Experimental support for `esx` (with `ox_lib`) and `ox_core`
        - Several events moved over to `jim_bridge` which is now a dependancy
        - Added built-in prop emotes when using certain items (as a dash of realism)
        - Added option to enable Rims for Emergency Repair Bench
        - Added "no" and "da" locale files
        - Extra Damages are not longer "visible" on bicycles
        - Odometer doesn't show on bicycles
        - Added "Harness" option to Emergency Repair Bench for police and ems

    Changes:
        - NOS VFX (flame, purge, trails) all use statebags now to reduce server load when activating
        - Rewrite of the Extra Damages systems
            - Damages effects are based on a specific level of damage to be triggered
            - Config options to set what level of damage is needed for each effect
            - Effects are triggered when you crash (when DamageRandomComponent is triggered) instead of randomly
            - Car Battery damage effect now just affects lights
            - Spark plugs now just disable the engine temporarily but doesn't make it undrivable
        - Rewrite of the crash detection
            - Now not as easy to be ejected from vehicle
            - Seatbelt on = travelling over 100mph and 1.8% damage to vehicle
            - Seatlbelt off = travelling over 60mph and 1.8% damage to vehicle
            - Harness on = no ejection (like before)
        - `/preview` cam's starts on the front left, not looking at the front plate
        - `Stashes` now show for all as too many people asked how to enable it without reading the config.
        - `SetVehicleStatus()` now uses statebag's to change extra damages
        - `GetVehicleStatus()` now uses statebag's to sync extra damages
        - Remove Antilag `AddExplosion` native option as 50% of the time didn't want to trigger near the car.
        - `isBike` is now a function and doesn't let you buckle seatbelts on restricted vehicles too early

    Fix:
        - Fix "test" print when using antilag
        - Added config option for `DamageRandomComponent()` being controlled inside jim-mechanic
            - This was doubling the effect if you had `qb-vehiclefailure` installed
        - Crafting/Repair StashNames are determined on entering a location, not the players specfic job
        - Seatbelt icon doesn't show on odometer on vehicle that don't have them
        - Extra damage parts can't be changed (or damaged) on bicycles

## 3.2.6

    Fix:
        - Remove Antilag "test" notify - `extras.lua`
        - Revert more changes to fivem keymappings - `nos.lua`, `extras.lua`
        - Remove random test function print when saving vehicles - `functionserver.lua`
        - Remove print telling servers when vehicles were being saved as this upset some users - `functionserver.lua`
        - Remove vehiclestatus test print when script started as far too many users assumed this was an error - `functionserver.lua`
        - Fix harness prop disappearing instantly when buckling it
    New:
        - Added testing support for cd_garages persistant vehicles when preview plates exploit protection is used - `preview.lua`

## 3.2.5

    Fix:
        - Added event to prevent allowing to add a harness to be installed if its already installed - `performance.lua`
        - Revert changes to FiveM key mapping causing issues for some users - `nos.lua`
        - CosmeticRemoval logic being broken, forcing items except externals being removed - `cosmetics.lua`
        - Manual repair bench showing repairs at $0 if the shared.lua has model hashes as strings - `manualrepair.lua`
        - Added `SetVehicleDeformationFixed()` to repairing body events to help visually repair the body when `SetVehicleFixed` doesn't
            - `repair.lua`, `emergency.lua`, `cosmetics.lua`, `manualrepair.lua`, `preview.lua`
    Changes:
        - Move `checkHSWMods` to `functions.lua` as this was wasn't being found in `shared.lua` for some reason
        - Separated anitLag effects into a separate events, to help with lag, making actual effect clientsided - `extras.lua`, `functionserver.lua`
        - Rewrote `printDifferences` function to cut down code and be a bit smurter - `previews.lua`
    New:
        - Added support for "qs-advancedgarages" repair event (if it is installed) when repairing body
        - Added a config options for the ability to continue using vehiclefailures features in `jim-mechanic`
        - `repairkit`, `advancedrepairkit`, and `/fix` and prevention of flipping vehicle when upside down can now be used without `qb-vehiclefailure`
            - `config.lua`, `functions.lua`, `functionserver.lua`

## 3.2.4

    Fix:
        - Add `unloadModel` after prop creation to try reduce memory usage - `shared.lua``
        - Rearranged carlift spawning to reduce amount of polyzone calls (and lower ms) - `locfunctions.lua`
        - Odometer wheel damage icon restored, it was checking the wrong variable for damages - `extras.lua`
        - Fix LockEmergeny not stopping non emergency cars from being edited - `emergency.lua`
        - Updated event `GetVehicleStatus` to grab vehicle info from a callback
            - This will greatly reduce the amount of server calls and data being sent to all clients
            - `damages.lua`, `check_tunes.lua`, `extras.lua`, `repair.lua`
        - Some peoples vehicles.lua seem to have "hash" as a string, instead of a hash key
            - I've adjusted vehicle info finding events to look for this - `functions.lua`

    New:
        - Added option to show vehicles odometer to all passengers `Config.Odometer.ShowToAll` - `extras.lua`, `config.lua`
        - Added info on how to "mechboard" item card to newer qb-inventory - `install.md`

    Changes:
        - Rewrite seatbelt code to optimize and combine events - `extras.lua`
        - Move `DamageRandomComponent()` inside script, making qb-vehiclefailure (in theory) no longer a dependancy - `extras.lua`
            - `ExtraDamages` is now enabled in the default config as it will work on its own. - `config.lua`
        - Rearrange and remove duplicate `updateVeh` event for ExitVehicle to help reduce errors - `extras.lua`
        - Added extra checks for saving vehicle mods as some were getting the wrong model numbers - `extras.lua`, `functionserver.lua`

## 3.2.3

    Fix:
        - Seatbelt logic fixes - `extras.lua`
        - Workaround to stop doubling up the `toggleseatbelt` event - `extras.lua`
        - Fix possible Mod check claiming cars how more mods than they should - `check_tunes.lua`, `shared.lua`
        - Make sure odometer doesn't spam and lag clients when using `checkHSWMods()` - `extras.lua`
        - Fix some cosmetic items claiming there is no options available - `cosmetics.lua`
        - default romanian locale having whong variables, breaking rgb menu's - `ro.lua`
    New:
        - Added config toggle for if crashing and ejecting kills/hurts the player - `extras.lua`, `config.lua`
        - Added config toggle for loading the toolbox prop or not as some users games are hanging trying to load - `check_tunes.lua`, `config.lua`
    Changes:
        - Change around the `extras` loops to reduce ms while keeping same functionality - `extras.lua`
        - Optimize `SeatBeltLoop` to help reduce ms when using a seatbelt - `extras.lua`
        - Move carwax check to not require HarnessControl to be true... -`extras.lua`
        - Changed milage calculation to be more accurate to gta distances (number up slower now) - `extras.lua` - `functions.lua`
        - Optimize a few server/database events
            - `isVehicleOwned` now caches info of owned vehicles into the server to retrieve instead of checking database every time
            - other database now use `isVehicleOwned()` to reduce the amount of sql checks
            - This involves changes to `encfunctionserver.lua` and `functionserver.lua`

## 3.2.2

    Fix:
        - Add check for if in preview for saving a vehicle on exit - `extras.lua`
        - Hopefully fix the repeating cleaning animation issue - `extras.lua`
        - Preview paints install checks for dashboard/interior paints wrong way round - `previews.lua`
        - Titles for paint previews now show to help keep track of which section you are in - `previews.lua`
        - Interior and Dashboard paint cams disabled as you couldn't see anything - `paint.lua`
        - Add check for duct tape item to stop being able to double up and trigger dupewarn - `extras.lua`
    New:
        - Add odometer option for showing SeatBelt icon - `extras.lua`
            - New image added to html folder for this - `html/img`
        - Added new function `checkHSWMods` to detect HSW mods that won't install on pc.
            - `shared.lua`, `check_tunes.lua`, `emergency.lua`, `performance.lua`
    Changes:
        - Change targets to use `action = function()` - `locfunctions.lua`
        - Updated target and prop creation to help optimize prop loading - `locfunctions.lua`
        - Progressbars no longer stop user input by default (you can now drive and put harness on) - `functions.lua`
        - Changed rpemotes cancel emote event to `ExectueCommand` to help compatability - `functions.lua`
        - Debug mode odometer now shows wether a boat can be anchored or plane is in the air (helpful for `jim-parking`) - `extras.lua`

## 3.2.1 (hotfix)

    New:
        - Added a toggle to forcibly save the vehicle mods to database when player exits it - `extras.lua`, `config.lua`
            - This will cause extra strain on server/database, but makes sure cars are saved more often
    Fix:
        - Missing "repair cost" line when using `mechanic_tools` - `repairs.lua`
        - Antilag effects/sounds - `encfunctionserver.lua`, `extras.lua`
        - Nos Flame + Trails + Purge effects not showing - `functionserver.lua`, `nos.lua`

## 3.2

    Changes:
        - Version bump to signify the amount of code changes.
        - Pretty big rewrite of the menu creation in the script using a new shared file `wrapper.lua`
        - This adds forced support progress bars in `qb-menu` *Experimental*
        - Better integration of both `ox_lib` context menus and `qb-menu`
        - This includes alot fixes and better oraganisation
        - Tidier code, no uncessessary duplicate code for every time a menu is created
        - Better look for both menus...if you look closely
        - I could make a list of changed files...but its every single file that makes a menu
    Fixes:
        - Some mispellings of `isMenuHeader`
        - "List of cosmetics" menu showing internal and external mods when there weren't any
        - added an event from `qb-mechanicjob` to help saving properties when parking with `qb-garages` - `functionserver.lua`
        - Manual Repair Banch now resets vehicle update timer to stop change of vehicle returning to previous damaged state - `manualrepair.lua`
        - Hopefully fixed the `qs-inventory stash` not saving
        - Added "mail" image for gks phone's preview mails
        - Stop server console complaining about `GetNearbyPeds`
            - Also hopefully less `GetNetworkObject` client spam

## 3.1.2

    Hotfixes:
        - Fix horn item giving duplicate buttons - `cosmetics.lua`
        - Fix flames causing a `GetNetworkObject` spam warning message - `nos.lua`
        - Attempted to reduce netowrk object spam from trails - `nos.lua`
        - Fix previews requiring you to leave the zone and come back in - `preview.lua`
        - Fix left over `nil` value from testing sparetires in the config - `config.lua`
            - Should fix the compare number with bool error

## 3.1.1

    Hotfixes:
        - Fixed items claiming you were previewing if `Config.Previews.PreviewLocation` was enabled `shared.lua`
        - Fixed missing preview livery locale `/locales`
        - Removed distance print when a vehicle was higher than you `shared.lua`
        - Corrected horrible typo in config for `modCam` description - `config.lua`
        - Raised nos cool down time to be closer to actual seconds - `nos.lua`

## 3.1

    Changes:
        - Adjustments to debug odometer - `extras.lua`
            - Remove street name
            - ReAdd speed information
            - Add some handling info
        - Added option to disable all handling changes to NOS `config.lua`, `extras.lua`, `nos.lua`
        - Increased distace of `lookWheel` event so you don't need to be AS close to a wheel - `functions.lua`
        - Add different cameras angles per repair choice - `repairs.lua`
        - NOS Flame effects now run a loop on client, but are triggered through server - `nos.lua`, `functionserver.lua`
        - Adjusted some server side database events - `functionserver.lua`
            - This MAY help with garages coming out with modifications removed
            - Stops an database check for unowned vehicles
        - Upgraded Rims Menu - `rims.lua`, `preview.lua`
            - Changed Rims menu "Stock" button, now appears only in the main menu for cars instead of every section
            - Shows what category of wheels what are currently set
    Fixes:
        - Added small wait for ExteredVehicle event to delay info loading
            - This should help with garage spawning systems lagging behind
        - Addressed an exploit, when using an item like paintcan while in the car allowed saving
            - The items now check if you are in preview mode
        - `/ShowOdo` not removing the odometer when told to - `extras.lua`
        - Fix previews not giving emails or mechboard items - `previews.lua`
        - Fix machine gun fire antilag explosions - `extras.lua`
        - Actually fix Duct tape item not removing - `extras.lua`
        - Added missing option to disable modCam - `config.lua`
        - Fix repair animations ending early - `repairs.lua`
        - If missing a job, it will now let you know instead of erroring out - `locfunctions.lua`
        - Crafting Menu remembers location restrictions - `locfunctions.lua`
        - Better handling and detection of missing shared items when crafting - `locfunctions.lua`
        - Hex code Paints now work again when using qb-menu - `paint.lua`
        - Notification added for when lockEmergency is enabled - `locales`, `emergency.lua`
        - Fix typo allowing motorcycles to use seatbelts and harnesses - `extras.lua`
        - Suspension and Transmission shouldn't throw item exisiting errors after installing from default - `performance.lua`

## 3.0.7.1

    - Fix cam breaking on when adding nos to a car - `nos.lua`
    - Seatbelts can no longer be used on `motorcycles` or `bicycles` - `extras.lua`
    - Nos should no longer show if moving from one that has it to one that doesn't `extras.lua`
    - Fix duct tape item not being removed - `extras.lua`
    - Fix drift tires not being removed on use for some users - `performance.lua`
    - Change `/preview` plate changing to a server based event - `extras.lua`, `functionserver.lua`
        - This may help with persistant vehicle scripts duping the car

## 3.0.7

    - Jim Learned how to cam
        - `functions.lua`, `performance.lua`, `cosmetics.lua`, `locfunctions.lua`, `manualrepair.lua`, `nos.lua`, `rims.lua`, `xenons.lua`
        - New togglable cam for when editing vehicles
        - Camera is created either side of the vehicle
        - This is partly built into the `progressBar` event (`cam = cam`)
    - New event added to help optimize: `jim-mechanic:Client:ExitVehicle` - `extras.lua`, `encfunctionserver.lua`
        - This stops the need to check for if players in vehicle as its handled by `baseevents` now
    - Added new config options - `config.lua`
        - Distance options for NOS/Purge effects
        - AntiLag has its own section for more options
        - Added config option to add seatbelt notification
        - Added config table of "phones" for /preview to check for when finishing - `previews.lua`
    - Added some alternative sounds for antilag explosions - `extras.lua`, `shared.lua`, `html folder`
    - Added distance options for NOS Effects - `functionserver.lua`
    - NOS now automatically shuts off if travelling too slow - `nos.lua`
    - Changes to nos boost functions in attempt to fix old issues - `nos.lua`
    - Odometer changes - `extras.lua` / `html folder`
        - Smaller text to fit all the info on
        - Updated/Improved the odometer icon files - `html folder`
        - Fix Nos/Purge not showing on odometer hud - `extras.lua`
        - Increased the refresh speed of the odometer - `extras.lua`
        - Added harness icon option to odometer - `extras.lua` / `config.lua`
    - Added option to toggle itemboxes when items are given or removed - `config.lua`, `encfunctionserver.lua`, `functionserver.lua`
    - Fix only front wheel changing on bikes in previews - `preview.lua`
    - Fixes to RGB paint when using qb-menu - `paints.lua`
    - Better handling of engine + lights when changing xenon/underglow - `xenon.lua`

## 3.0.6.2

    - Added extra debug message for toggleItem to help debug issues with inventories - `encfunctionserver.lua`
    - Changed how the vehicleStatus is retreived from the database and added debug prints to help fix bugs - `functionserver.lua`
    - Added distance check to carlift audio, had reports of it being heard on other side of map - `shared.lua`

## 3.0.6.1

    - ExtraDamages fixes - `extras.lua` / `shared.lua` / `functionserver.lua` / `encfunctionserver.lua`
        - CarWax now load and saves properly
        - Fixed harness, antilag and carwax not saving if you had ExtraDamages disabled
    - Had a request to open `jim-mechanic:server:updateCar` - `encfunctionserver.lua` / `functionserver.lua`

## 3.0.6

    - UPDATED: Yet again.. updated the `GetVehicleProperties` and `SetVehicleProperties` functions - `install.md`
        - This should hopefully fix issues with liveries and extras disappearing
    - UPDATED: Car Wax features - `extras.lua` / `functionsserver.lua`
        - Now persistant on owned vehicles for days (saves to database)
        - The default times for each option are 1, 2 and 3 days.
        - This removes the `WaxActivator` server loop and greatly reduces server stress
    - Change carlifts to only sync the ones you are in the polyzone of - `shared.lua` / `locfunctions.lua`
    - Fix extras removing doors - `functions.lua`
    - Preview menu doesn't allow extras changes if vehicle is damaged - `preview.lua`
    - Fix the possibility of new targets being made every time you enter a polyzone - `locfunctions.lua`
    - Adjust ox_inv item image rerouting to fix a mispelling - `shared.lua`
    - Attempt to fix issues with toggleItem() not removing or throwing errors on use
        - `cosmetics.lua` / `extras.lua` / `nos.lua` / `paint.lua` / `performance.lua` / `rims.lua` / `xenons.lua`
    - Attempt to reduce server traffic for pop servers
        - Reduce amount of times events are called
        - Made events not send to all players as much to lessen the load
        - `emergency.lua` / `damages.lua` / `performance.lua` / `manualrepair.lua` /
        - `repair.lua` / `extras.lua` / `functionserver.lua`
    - Added server side checks for nos effects for nearby players - `functionserver.lua`
        - This SHOULD reduce strain on high pop servers sending info to all players too often
    - Nos Boost now only updates client info, then updates server when leaving the drivers seat - `nos.lua` / `extras.lua`
        - This will greatly reduce the amount of server calls when boosting
    - Added a config toggle for AntiLag explosions - `coinfig.lua` / `extras.lua`
        - NO THERE ISNT A WAY TO TURN IT DOWN THE SOUND
        - If its too loud turn down game audio or disable this for now until i find an alternative.
    - Fix starting preview with harness attached would beak the previews - `extras.lua`
    - Fix qb-target only changing the front rims on bikes - `rims.lua`
    - Attempt to fix formatting of emails - `previews.lua`
    - Attempt to fix line 460 table nil for some users - `functionserver.lua`

## 3.0.5

    - Better mechboard item support for "ox_inv", now shows vehicle in its dscription - `previews.lua`
    - Added `previewJobChecks()` to keep the preview system separate from normal job restrcitions - `previews.lua` / `function.lua`
    - Remove check for stashes needing `ItemRequiresJob` to be true to show up - `locfunctions.lua`
    - Continue upgrading polzyone and job logic - `functions.lua`
    - Reformat of manual repair menu - now slightly pretier for both qb and ox - `manualrepair.lua`
    - Missspelling making `ManualRepairBased` not do anything at all - `manualrepair.lua`
    - Fix `repairEngine = false` not working correctly and allowing engine to repair - `manualrepair.lua`
    - Added the ability to completely disable NOS in the script to allow use other scripts for nos usage
        - `nos.lua` / `check_tunes.lua` / `locfunctions.lua` / `extras.lua` / `encfunctionserver.lua`
    - Change how colour is detected for the paintcan and change animation if vehicle is lifted - `paint.lua`
    - Fix duplicate/broken "extras" button in cosmetics menu - `cosmetics.lua`
    - Fix incorrect extras being applied - `cosmetics.lua`
    - Attempt to improve extras `doCarDamage` effect
        - `functions.lua` / `emergency.lua` / `cosmetics.lua` / `preview.lua`
    - Made new events due to QBCore:Client:EnteredVehicle not working - `encfunctionserver.lua` / `extras.lua`
        - This will fix missing with Odometer + Seatbelt control, Extra Damages and Antilag not working

## 3.0.4

    - FIX CHAMELEON PAINTS - `fxmanifest.lua`
    - Update ox items rerouting to take into account missing set item images - `shared.lua`
    - Add workaround for `mechboard` item created with ox exports - `functionserver.lua`/`previews.lua`
    - Change how location is detected for checking resrtictions - `locfunctions.lua`
        - This fixes trying to edit vehicles error "unsupported operation"
    - Re-write of the polyzone creation to help define each section - `locfunctions.lua`
    - Fix incorrect variable allowing bypass of `ItemRequiresJob` items - `functions.lua`
    - Rewrite of a couple check functions, should now be more logical - `functions.lua`
    - Fix some progressbars not stopping animations - `functions.lua`
    - Add Interior and Dashboard paints to emergency bench - `emergency.lua`
    - Fix for cars with only one livery - `emergency.lua`
    - Fixed `fr.lua` causing errors in repair.lua
        - ANY HELP WITH LOCALES IS GREATLY APPRECIATED

## 3.0.3

    - Added info to `install.md` on how to make harness state show up in `qb-hud`
    - Fix "qs" not saving to stash - `functionsserver.lua`
    - Fix incorrect locale for suspension - `performance.lua`
    - Made the extra damage related items unusable if Config.Repairs.ExtraDamages is false
        - Sorry for the confusion
    - Fix cosmetics not showing on items if there was only 1 available - `cosmetics.lua`
    - Updated `nl.lua`
    - If you use `ox_inv`, the script now reroutes to use `exports.ox_inventory:Items()`
    - Added Harness section to Config - `config.lua` / `check_tunes.lua` / `extras.lua` / `functionserver.lua`
        - HarnessControl variable move to `Config.Harness` to keep it grouped together
        - This controls:
            - Leaving vehicle without removing harness or seatbelt
            - Wether a progressbar will show when removing the harness
    - Fix harness and antiLag saving/loading - `functionserver.lua`
    - Fix harness progressbar animations - `extras.lua`
        - Fixes rare crash if restarting the script
    - Fix passengers not being affected by crashing - `extras.lua`
    - Added check to detect wether player is loaded in before loading zones - `locfunctions.lua`
    - Fix mispellings making emergency bench paints not work for qb-target - `emergency.lua`
    - Fix for `Config.Emergency.requireDutyCheck` - `emergency.lua`
    - Fix emergency bench suspension trying to change spoilers - `emergency.lua`
    - Fix nosrefill vec4 error with ox_target - `locfunctions.lua`
    - Added check to previews.lua for if you have a phone or not when using `PreviewPhone = true` - `previews.lua`
    - Added check for if a location has a blip or not - `previews.lua`

## 3.0.2

    - Add extra check for "null" results in database to stop errors - `functionserver.lua`
    - Fix `qb-target` not being able to open `ox_inv` shops - `locfunctions.lua`
    - Fix performance parts not installing/uninstalling correctly - `performance.lua`
        - It should no longer complain about missing items when sucessfully installing
        - Antilag isntall now waits for info instead of throwing an error
        - this should stop the nil `level` error too
    - Fix extradamage upgrades not installing/uninstalling correctly - `damages.lua`+ `main.lua`
    - Shut up the `Shut` error in nos.lua
    - `HasHarness` nil error should no longer show up if jim-mechanic doesn't control harnesses
    - Added `exports["jim-mechanic"]:updateVehicle(vehicle)` - `shared.lua`
        - This can be added to a garage script to save all the jim-mech damages
    - Updated saveStatus server event to save engine and body damage to stop possibility of setting to "null" - `extras.lua` + `functionserver.lua` + `functions.lua`
    - Added `RFC LS CUSTOMS`, `RFC Redline`, `Rising Sun` and `flyWheels` locations - `locations.lua` + `config.lua`
    - Update Ducttape repair event to new format - `extras.lua`

## 3.0.1

    - Fix fueltanks kicking players/not installing
    - Repair clipboards remove after 4 seconds
    - Doors close when progressbars are finished when checking damages
    - Fix extra damage upgrades not showing in the `toolbox` menu
    - Fix issue with ox_target not telling shops what job you have
    - ACTUALLY fix qs stash support..
    - Fix polyzone creation repeating the wrong info
    - Removed fuel exports infavour of Default GTA Natives

## 3.0

    Disclaimer:
        This is a full re-write, many files have changed.
        You will NEED to completely replace the script for it to function correctly.
        There are alot of changes over a long period of time, so there may be more than I've listed here.

    - New Features:
        - Seatbelt and Harness control
            - Now players get harness prop attached to them when use a vehicle harness
            - These are persistant on each vehicle and can only be removed with the toolbox
        - Extra Damages are now integrated into the script
            - No need for `qb-mechanicjob` to be running aswell anymore
            - This allows for better control and less errors related to damages
            - Allows for new upgrades and items to be added related
        - Support for `OX_Target`, `OX_Lib Context Menus`, `OX_Lib ProgressBars`, `OX_Inventory`, `OX_Lib's Notifications`
        - Added new Item + Feature `AntiLag` (2step)
            - For the boy racers
        - Added usable `Car Lifts` to the script
            - Specify each location in locations.lua
            - Can take control of carlifts in locations, as long as they are two separate models eg. Gabz Tuners
            - Server Synced
    Changes:
    - More Chameleon paints!
    - Fix `SetXenon` warning Spam (hopefully)
    - Slight change to `GetVehicleProperties` function
        - Hopefully fixed livery issues for people
    - Update location support for Gabz Benny's MLO
    - Update `qs-inventory` sql support
    - Completely Reorganised the `config.lua`
        - Better readability and more toggles
    - Completely rewrote `repair.lua`
        - More Optimized, Fixed animations
        - Removed tyre change animations as it wasn't playing well with other scripts
        - Added an attempt to reduce `qb-mechanicjob` related spam
        - Greatly improved stash removal of items, no more "tidyStash" exploits!
    - Compeletly re-wrote `check_tunes.lua`
        - Alot more optimzied and now supports `ox_lib` context menus
        - More organised and smarterer
    - Rewrite of `paint.lua`
        - General Optimizations
        - Redesign of the RGB/HEX Picker menus to accomodate `ox_lib`
        - This merges hex and rgb menus together but adds more behind the scenes functionality
    - Refactored and Optimized `nos.lua`
        - General Optimizations
        - Redesign of the RGB/HEX Picker menus to accomodate `ox_lib`
        - This merges hex and rgb menus together but adds more behind the scenes functionality
        - New sputtering `nos` effect for when boosting too long
    - Refactored and Optimized `xenons.lua`
    - Moved and refactored the `Config.Locations` to `shared/locations.lua`
        - Moved and refactored functions from `locations.lua` to `client/locfunctions.lua`
        - Added the ability to add certain vehicle or modification restrictions for each location
        - eg. set a location to ONLY be able to for repairs
    - Greatly reduced the amount of files in the script
        - cosmetic based events all run from `cosmetics.lua`
        - Vehicle extras are now available through `externals` item by default
    - Added support for roof liveries, used with the livery item
    - `police.lua` is completely replaced by a new file `emergency.lua`
        - This is a rewrite making it possible to add any cosmetic to the emergency mech bench
        - Locations are now kept in the config with the toggles for what should be changeable
        - Added every possible cosmetic and several performance upgrades
        - Added config option `LockEmergency` to lock bench to only Emergency Class vehicles
    - Rewrote how `manualrepair.lua` benches handle calculcations
        - You can repair vehicles with a value of $0
    - Improved `preview.lua` functions, more optimized
        - Exploit prevention, the plate now changes when previewing
            - When you stop, it resets their plate
            - This stops players saving their previewed vehicles
        - Extras now available in the preview menu
        - Added "Stop Previewing" button for the people who cba getting out of their car
        - Support for RoadPhone `/preview` mail messages
        - Fixes to preview printouts, some item names were wrong