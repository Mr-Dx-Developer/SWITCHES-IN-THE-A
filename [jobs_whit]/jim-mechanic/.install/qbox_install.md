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

- Add your chosen images to `ox_inventory` add the `items_ox.lua` to your `ox_inventory > data > items.lua`

----------------------
# Dependancies

`jim-bridge`
- This script is a requirement of jim-mechanic to function and bridge it between frameworks

`jim-payments`
- This script is designed to use `jim-payments` (https://github.com/jimathy/jim-payments) for charging customs and sending money to the society accounts

`jim-jobgarage`
- This script makes us of `jim-jobgarage` (https://github.com/jimathy/jim-jobgarage) for creating temporary vehicles for job roles

----------------------
## NOS + Odometer
There are expanded features included in this scripts with SQL

For the script to function you need to import the `vehaddon.sql` file into your `player_vehicles` database to add the appropriate columns (traveldistance, hasnitro, noslevel)

The `hasnitro` and `noslevel` columns being added enables the of saving Nitrous levels through server restarts

The `traveldistance` column adds an Odometer to the toolbox/mechanic_tools menus, this this can retrieved in miles or kilometers.

----------------------
# Extra Damages and Upgrades

**As of v3.0 you no longer need `qbx_mechanicjob` to use any of this script**
**As of v3.2 you no longer need `qbx_vehcilefailure` as several features are now built in**

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
# Harness Item

The script can take control of the already in place `harness` item

This can be enabled or disabled in the config with `Config.Harness.HarnessControl == true`

If you enable this, there are a few steps you need to take as this is handled in `jim-mechanic`.

1. Delete the file `seatbelt.lua` from `qbx_smallresources > client`
2. **REMOVE** these 3 events from `qbx_smallresources > server > main.lua`:

```lua
exports.qbx_core:CreateUseableItem('harness', function(source, item)
    TriggerClientEvent('seatbelt:client:UseHarness', source, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)

    if not player then return end

    if item.metadata.harnessuses == nil then
        item.metadata.harnessuses = 19
        exports.ox_inventory:SetMetadata(src, item.slot, item.metadata)
    elseif item.metadata.harnessuses == 1 then
        exports.ox_inventory:RemoveItem(src, 'harness', 1)
    else
        item.metadata.harnessuses -= 1
        exports.ox_inventory:SetMetadata(src, item.slot, item.metadata)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)

    local harness = exports.ox_inventory:Search(src, 1, 'harness')

    if not player then return end

    if hp == 0 then
        exports.ox_inventory:RemoveItem(src, 'harness', 1, data.metadata, data.slot)
    else
        harness.metadata.harnessuses -= 1
        exports.ox_inventory:SetMetadata(src, harness.slot, harness.metadata)
    end
end)
```

To make your hud not complain about the harness export you will need to change the name of the export to jim-mechanic
--PS-HUD--
`ps-hud` > `client.lua` > line 80
REPLACE:
```lua
    local hasHarness = exports['qb-smallresources']:HasHarness()
```
WITH:
```lua
    local hasHarness = exports['jim-mechanic']:HasHarness()
```

--QBX_HUD--
REPLACE:
```lua
local function hasHarness(items)
    if not cache.vehicle then return end

    local _harness = false
    if items then
        for _, v in pairs(items) do
            if v.name == 'harness' then
                _harness = true
            end
        end
    end

    harness = _harness
end
```
WITH:
```lua
local function hasHarness(items) harness = exports["jim-mechanic"]:HasHarness() end
```

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
## "mechboard" item

**This isn't fully required but helps organise multiples of the "mechboard"**

The MechBoard item is an item given to the person who uses the preview menu and makes changes

----------------------

## Updating core events

- Replace the `getVehicleProperties` and `setVehicleProperties` in `ox_lib > resource > vehicleProperties > client.lua` with the ones from `properties_ox.lua`