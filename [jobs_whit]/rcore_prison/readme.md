rcore_prison - README

-----------------------------------------

Setup guide:


1] Use setup command in server console which will deploy stuff automatically
2] Define your server.cfg for rcore_prison, check below.
3] Restart you server, have fun.
* If you are using own framework: check docs (https://documentation.rcore.cz/paid-resources/rcore_prison/bridge#how-to-integrate-own-framework)

### Permissions

* Its required to add those permissions in your server.cfg.


```lua
add_ace resource.rcore_prison command.add_ace allow
add_ace resource.rcore_prison command.remove_ace allow
add_ace resource.rcore_prison command.add_principal allow
add_ace resource.rcore_prison command.remove_principal allow
```

-----------------------------------------

SCRIPT STARTUP ORDER:

NOTE: !!! Make sure that you are having correct script server order, and you are having this order after framework & inventory & interior & target!!!

[GABZ]

ensure cfx-gabz-prison
ensure rcore_prison_models_gabz
ensure rcore_prison

[RCORE]

ensure rcore_prison_models
ensure rcore_prison_map
ensure rcore_prison

[QBCORE]

ensure [defaultmaps]
ensure rcore_prison

-----------------------------------------

FOR DEVS:

Events & Exports

Docs: https://documentation.rcore.cz/paid-resources/rcore_prison/integrations#events-and-exports

FRONTEND APP (JAILCP):

Do you have supported phone that we support?

Check out: rcore_prison/web/build/config.js

* You can change all jailcp, labels and strings.
* You can define phone format prefix and select your phone.

CHAT COMMANDS

/startcs serverId perollCount (Start community service)
/jail serverId jailTime jailReason or /jailcp -> addSentence
/unjail serverId - unjail Prisoner
/jaillcp - Shows jail panel with everything
/stopzone serverId - Stop community service for specific CS user.
/clearzone serverId - Clear area around specific user (target).
/cancelcs - Cancel current mission (task) for CS only

OTHERS:

** rcore_basketball **

[GABZ] - interior

{
        pos = vector3(1719.605957, 2549.730469, 42.594742),
        rot = vector4(0.000000, 0.000000, 0.244000, 0.969775),
        State = nil,
        Model = `prop_basketball_net`,
        IsSubscribed = false,
        threePointFwdDist = 0.0,
        threePointSideDist = 0.0,
        threePointRadius = 30.0,
        hideBlip = true,
},

{
        pos = vector3(1731.837646, 2526.304688, 42.583992),
        rot = vector4(-0.000000, 0.000000, 0.968675, -0.248330),
        State = nil,
        Model = `prop_basketball_net`,
        IsSubscribed = false,
        threePointFwdDist = 0.0,
        threePointSideDist = 0.0,
        threePointRadius = 30.0,
        hideBlip = true,
},

[RCORE] - interior

{
    pos = vector3(1671.640381, 2502.784912, 44.557003), 
    rot = vector4(0.000000, 0.000000, 0.942665, 0.333741),
    State = nil,
    Model = `prop_basketball_net`,
    IsSubscribed = false,
    threePointFwdDist = 0.0,
    threePointSideDist = 0.0,
    threePointRadius = 30.0,
    hideBlip = true,
},

{
    pos = vector3(1689.102173, 2523.121094, 44.641594), 
    rot = vector4(0.000000, 0.000000, -0.329191, 0.944263),
    State = nil,
    Model = `prop_basketball_net`,
    IsSubscribed = false,
    threePointFwdDist = 0.0,
    threePointSideDist = 0.0,
    threePointRadius = 30.0,
    hideBlip = true,
},

{
    pos = vector3(1729.442505, 2525.064697, 44.558537), 
    rot = vector4(-0.000000, 0.000000, 0.965665, -0.259790),
    State = nil,
    Model = `prop_basketball_net`,
    IsSubscribed = false,
    threePointFwdDist = 0.0,
    threePointSideDist = 0.0,
    threePointRadius = 30.0,
    hideBlip = true,
},

{
    pos = vector3(1718.615479, 2545.604004, 44.588676), 
    rot = vector4(0.000000, 0.000000, 0.239589, 0.970874),
    State = nil,
    Model = `prop_basketball_net`,
    IsSubscribed = false,
    threePointFwdDist = 0.0,
    threePointSideDist = 0.0,
    threePointRadius = 30.0,
    hideBlip = true,
},
