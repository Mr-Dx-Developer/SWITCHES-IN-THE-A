module 'shared/debug'
module 'shared/resource'
module 'shared/table'
module 'shared/player'

include('vrp', 'lib/utils')

Bridge.Debug('Framework', 'vRP')

local Proxy = module('vrp', 'lib/Proxy')
local Tunnel = module('vrp', 'lib/Tunnel')

vRP = Proxy.getInterface('vRP')
vRPClient = Tunnel.getInterface('vRP', Bridge.Resource)

vRPServerBridge = {}
Tunnel.bindInterface(Bridge.Resource, vRPServerBridge)
Proxy.addInterface(Bridge.Resource, vRPServerBridge)
vRPClientBridge = Tunnel.getInterface(Bridge.Resource, Bridge.Resource)


RegisterNetEvent('vRPcli:playerSpawned', function(user_id, source, name, last_login)
    print('vRPcli:playerSpawned')
    vRPClientBridge.PlayerSpawn(source)
    pcall(Framework.OnPlayerLoaded, Framework)
end)

RegisterNetEvent('vRP:playerLeave', function()
    Framework.Player = {}
    pcall(Framework.OnPlayerUnload, Framework)
end)

RegisterCommand('vrptest', function(source)
    print(json.encode(vRP))
    vRPClientBridge.Test(source, 'This Is Message')
end)