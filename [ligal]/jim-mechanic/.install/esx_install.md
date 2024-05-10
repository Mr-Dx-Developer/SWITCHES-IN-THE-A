If you purchased this anywhere other than my Tebex page you have purchased a leak and supported thieves.

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

Full Credit to wildbrick142 for the inclusion of the Chameleon Paints Mod

# INSTALLATION

## Add the script to the server resources
- I highly recommend putting the `jim-mechanic` folder in a new folder called `[jim]`
- Then add `ensure [jim]` AFTER your other scripts in your server.cfg

---
# Item installation
- There are two image folders, `images_alt` contains tiered images with their rank included

- Add the chosen images to your inventory folder eg. `ox_inventory > web > images`

- Add the lines from `ox_items.lua` to your `ox_inventory > data > items.lua`

----------------------
# Dependancies/Options

`jim-bridge`
- This script is a requirement of jim-mechanic to function and bridge it between frameworks

`jim-payments`
- This script is designed to use `jim-payments` (https://github.com/jimathy/jim-payments) for charging customs and sending money to the society accounts

`jim-jobgarage`
- This script makes us of `jim-jobgarage` (https://github.com/jimathy/jim-jobgarage) for creating temporary vehicles for job roles

----------------------
## NOS + Odometer
There are expanded features included in this scripts with SQL

For the script to function you need to import the `vehaddon.sql` file into your `owned_vehicles` database to add the appropriate columns (traveldistance, hasnitro, noslevel)

The `hasnitro` and `noslevel` columns being added enables the of saving Nitrous levels through server restarts

The `traveldistance` column adds an Odometer to the toolbox/mechanic_tools menus, this this can retrieved in miles or kilometers.

The `status` column adds the ability to save vehicle damages

----------------------
# Extra Damages and Upgrades

Extra Damages and their upgrades can be enabled/disabled in the config with `Config.Repairs.ExtraDamages = true`

The extra damages added by this script are shown as `Oil Level`, `Axle Shaft`, `Spark Plugs`, `Car Battery`and `Fuel Tank`.

These are repaired with the items (through the mechanic_tools repair item)
`newoil` - Fixes `Oil Level`
`sparkplugs` - Fixes `Spark Plugs`
`carbattery` - Fixes `Car Battery`
`axleparts` - Fixes `Axle Shaft`
`steel` - Fixes `Fuel Tank`
These are changeable through the config.

These effects are shown when they are damaged by driving
`Oil Level` damage will "Overheat" the vehicle and slowly damage the engine
`Axle Shaft` damage will affect the steering of the vehicle
`Spark Plugs` damage will make the vehicle stall
`Car Battery` damage will make the vehicle stall
`Fuel Tank` damage will cause fuel to drain faster

----------------------
# Harness/Seatbelts

This can be enabled or disabled in the config with `Config.Harness.HarnessControl == true`

If you enable this, there are a few steps you need to take as this is handled in `jim-mechanic`.

1. Go to `esx_cruisecontrol > config.lua` and set `Seatbelt > Enable` to false

This should give full control of the seatbelt system to `jim-mechanic`

----------------------
## Creating new polyzone for a new location

How do I create PolyZones for a new job location?

These locations determine where a person will be put on duty or taken off duty, and the places where items can be used, if you set them to be restricted to zones.

To start you need to be near the building you want to add.

Type `/pzcreate poly` to start creating a PolyZone. Pick a name, this doesn't matter as you can set this later in locations.lua
You will then get a red line right where you are standing.

Use your ARROW keys to move this around to the first corner/point you want to place.
When its in the correct place, type `/pzadd` and this will lock the current point and allow you to create another

Repeat this until your last corner/point where you will type `/pzfinish`.

This will save all the vectors of the points you have chosen and place them in a file called: `polyzone_created_zones.txt`

In this file is the vectors that you need to copy over to my scripts.
----------------------

## Updating core events

- Replace the `getVehicleProperties` and `setVehicleProperties` in `ox_lib > resource > vehicleProperties > client.lua` with the ones from `ox_properties.lua`