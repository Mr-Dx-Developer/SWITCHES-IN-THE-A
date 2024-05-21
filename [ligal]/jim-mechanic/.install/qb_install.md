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

- Add the chosen images to your inventory folder eg. `qb-inventory > html > images`

- If using `ox_inventory` add the `ox_items.txt` to your `ox_inventory > data > items.lua`

- If using `qb-inventory` or similar, add the lines from `qb_items.txt` to your `qb-core > shared > items.lua`

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

**As of v3.0 you no longer need `qb-mechanicjob` to use any of this script**
**As of v3.2 you no longer need `qb-vehcilefailure` as several features are now built in**

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

1. Delete the file `seatbelt.lua` from `qb-smallresources > client`
2. **REMOVE** these 3 events from `qb-smallresources > server > main.lua`:

```lua
QBCore.Functions.CreateUseableItem('harness', function(source, item)
    TriggerClientEvent('seatbelt:client:UseHarness', source, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if not Player.PlayerData.items[item.slot].info.uses then
        Player.PlayerData.items[item.slot].info.uses = Config.HarnessUses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    elseif Player.PlayerData.items[item.slot].info.uses == 1 then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['harness'], 'remove')
        Player.Functions.RemoveItem('harness', 1)
    else
        Player.PlayerData.items[item.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if hp == 0 then
        Player.Functions.RemoveItem('harness', 1, data.slot)
    else
        Player.PlayerData.items[data.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
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

--QB-HUD--
REPLACE:
```lua
local function hasHarness(items)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then return end

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

--QB-RADIAL--
Search for:
```lua
    local HasHarnass = exports['qb-smallresources']:HasHarness()
```
and replace with:
```lua
    local HasHarnass = exports['jim-mechanic']:HasHarness()
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

To make full use of this item you need to add the ability for the item to show item info in your inventory system

I have only done this with `qb-inventory` and `ps-inventory` as they are similar

`qb-inventory/html/js/app.js`

- Search for "harness" or Scroll down until you find:
```js
} else if (itemData.name == "harness") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.uses + " uses left.</p>"
    );
```
- Directly underneath this add:
```js
} else if (itemData.name == "mechboard") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.vehplate + "</p>" +
        "<p>" + itemData.info.veh + "</p>"
    );
```

- On newer qb-inventory:
- Search for "harness" or Scroll down until you find:
```js
case "harness":
    return `<p>${itemData.info.uses} uses left</p>`;
```
- Directly underneath this add:
```js
case "mechboard":
    return `<p>${itemData.info.vehplate}</p>
    <p>${itemData.info.veh}</p>`;
```

When successfully added the mechboards will show the vehicle and plate number

----------------------

## Updating core events

If using `ox_lib`:
- Replace the `getVehicleProperties` and `setVehicleProperties` in `ox_lib > resource > vehicleProperties > client.lua` with the ones from `properties_ox.lua`

If using just `qb-core`:
- Replace the `QBCore.Functions.GetVehicleProperties` and `QBCore.Functions.SetVehicleProperties` in `qb-core > client > functions.lua` with the ones from `properties_qb.lua`
```