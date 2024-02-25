## v2.5
    -vehicle collision disabled while setting garage point
    -detect broken shells and auto skip after 10 seconds
    -loading ui for shells
## v2.6
    -a notification trigger name fixed
## v2.7
    -harvest exploit fixed
## v2.8
    -family blip added
## v2.9
    -harvest bug fixed
    -garage bug fixed
## v3.0
    -admin detection fixed
    -furniture code improved
    -invisible in garage exploit fixed
## v3.1
    -see neighbours furniture issue fixed
## v3.2
    -Inventory weight calculation fixed
## v3.2.1
    -house raid error fixed
## v3.2.2
    -house rob server error fixed
    -house raid server error fixed
## v3.2.3
    -identifier error fixed on startup
## v3.2.4
    -Admin check fixed
## v3.2.5
    -Admin permission level fixed
## v3.2.6
    -vehiclekey support added in garage
## v3.2.7
    -admin permission check fixed
## v3.3
    -ox inventory weight calculation fixed
## v3.4
    -decrease weight on edit furniture fixed
    -alternative way to set admin
## v3.5
    -inaccessible inventory on house raid fixed
## v3.6
    -minor bug fix in furniture
## v3.7
    -Unique id for house to fix inventory duplicate
    -lock/unlock shell house if player have door access
## v3.8
    -Minor bug fix of shell door lock access
## v3.8.1
    -Shell door manage bug fix
## v3.9
    -Inventory bug fix
## v4.0
    -Free housing shells are removed. But you can download from : https://github.com/quasar-scripts/k4mb1shellstarter
## v4.1
    -Not receiving offline house selling commission fixed
## v4.2
    -Zoom feature added in shell creation
## v4.3
    -Entry missing for shell housing fixed
    -Furniture missing fixed
## v4.4
    -few improvement
## v4.5
    -disable sell house option for player added in config
## v4.6
    -all k4mb1 shells added in creation config
## v4.7
    -minor bug fixed
## v4.8
    -max weed plant count fixed
## v4.9
    -minor adjustment
## v5.0
    -Shell selection menu
## v5.1
    -core_inventory support
## v5.1.1
    -qb inventory weight adjustment
## v5.1.2
    -set weed plant option fixed
## v5.2
    -cd_garage support
## v5.3
    -okokGarage support
## v5.4
    -Currently, a player can independently change the coordinate via the house menu, even if the house is not supposed to have a garage (fixed)
## v5.5
    -house member lab access fixed
## v5.6
    -os dev command removed
    Replace:
        => modules/creation/client/creation.lua
## v5.7
    -qb-garage support added
    -garage access check added
    -shell rotation added
    Replace:
        => modules/_init/server/main.lua
        => modules/garage/config.lua
        => modules/garage/client/garage.lua
        => modules/garage/server/garage.lua
        => modules/creation/client/creation.lua
        => modules/main/client/main.lua
## v5.7.1
    -qb-garage adjustment
    Replace:
        => modules/_init/server/main.lua
        => modules/garage/client/garage.lua
## v5.8
    -weed harvest error fixed
    Replace:
        => modules/weed/server/weed.lua
## v5.9
    -jg-advancedgarages support added
    Replace:
        => modules/garage/client/garage.lua
        => modules/garage/config.lua
## v5.9.1
    -management export error fixed
    Replace:
        => utils/server.lua
## v5.9.2
    -old qb-management support added
    Replace:
        => config.lua
        => utils/server.lua
## v6.0
    -command permission notification fixed
    -command permission check fixed
    Replace:
        => modules/realestate/server/realestate.lua
## v6.0.1
    -qb-weathersync compatibility added
    Replace:
        => modules/weather/client/weather.lua
## v6.1
    -ak47_qb_garage support added
    Replace:
        => modules/garage/config.lua
        => modules/garage/client/garage.lua