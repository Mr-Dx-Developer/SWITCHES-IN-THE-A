module 'shared/debug'
module 'shared/resource'
module 'shared/player'

module 'framework/vrp/lib/Tunnel'
module 'framework/vrp/lib/Proxy'

-- Add Version Detection somehow ?
Bridge.Debug('Framework', 'vRP')

vRPTunnelBridge = {}
Tunnel.bindInterface(Bridge.Resource, vRPTunnelBridge)
Proxy.addInterface(Bridge.Resource, vRPTunnelBridge)
vRPServerBridge = Tunnel.getInterface(Bridge.Resource, Bridge.Resource)
vRP = Proxy.getInterface('vRP')

vRPTunnelBridge.event = {}


function vRPTunnelBridge.event:playerSpawn(user, first_spawn)
    print('vRPTunnelBridge.event:playerSpawn')
end

AddEventHandler('vRP:playerSpawn', function()
    print(Bridge.Context, 'vRP:playerSpawn')
end)

RegisterNetEvent('vRP:playerSpawn', function()
    print('Event vRP:playerSpawn')
end)

vRP.playerSpawn = function ()
    print('Function vRP:playerSpawn')
end

vRP.onPlayerSpawned = function ()
    print('vRP.onPlayerSpawned')
end

vRPTunnelBridge.PlayerSpawn = function()
    pcall(Framework.OnPlayerLoaded, Framework)
end

vRPTunnelBridge.Test = function(message)
    print(Bridge.Context)
    print(message)
end