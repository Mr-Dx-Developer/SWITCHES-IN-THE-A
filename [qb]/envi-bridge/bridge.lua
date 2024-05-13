-- Copyright (C) 2023 reFlow Store, licensed under Software Subscription License Agreement

---@class Bridge
Bridge = {}
Bridge.Resource = GetCurrentResourceName()
Bridge.Name = GetResourceMetadata(Bridge.Resource, 'bridge', 0)
Bridge.Version = GetResourceMetadata(Bridge.Name, 'version', 0)
Bridge.Context = IsDuplicityVersion() and 'server' or 'client'
Bridge.DebugMode = GetConvar('bridge:debug', 'false') == 'true' and true or false
Bridge.Locale = GetConvar('bridge:locale', 'en')
Bridge.Disabled = {}
Bridge.Framework = nil
Bridge.FrameworkName = nil
Bridge.FrameworkEvent = nil
Bridge.FrameworkPrefix = nil
Bridge.Inventory = nil
Bridge.InventoryDisabled = false
Bridge.InventoryName = nil
Bridge.InventoryImagePath = nil
Bridge.Target = nil
Bridge.TargetName = nil
Bridge.Zone = nil
Bridge.ZoneName = nil
Bridge.Database = nil
Bridge.DatabaseName = nil

---@class Framework
Framework = {}

---@class Target
Target = {}

---@class Zone
Zone = {}

---@class Database
Database = {}

if not Bridge.Name then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s^0'):format("Bridge Not Found, Bridge Tag Must Be Included In Resource Manifest."))
    return
end

if not _VERSION:find('5.4') then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s^0'):format("Lua 5.4 Must Be Enabled In The Resource Manifest."))
    return
end

if GetResourceState(Bridge.Name) ~= 'started' then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s %s^0'):format(Bridge.Name, "Must Be Started Before This Resource."))
    return
end

-- ❗ FRAMEWORK VERSION ❗
if Bridge.DebugMode then 
    print(('[^2BRIDGE^0] ^1Version^0 %s'):format(Bridge.Version))
end

-- ❗ MODULE DISABLE ❗
for i = 1, GetNumResourceMetadata(Bridge.Resource, 'bridge_disable') do
    local name = GetResourceMetadata(Bridge.Resource, 'bridge_disable', i - 1)
    Bridge.Disabled[name] = true
    if Bridge.DebugMode then print(('[^2BRIDGE^0] ^1Module Disabled^0 %s'):format(name)) end
end

-- ❗ DATABASE DETECTION ❗

-- ❕ OVERRIDE DATABASE ❕
if GetConvar('bridge:database', '') ~= '' then
    Bridge.Database = GetConvar('bridge:database', '')
end

-- ❕ OVERRIDE DATABASE NAME ❕
if GetConvar('bridge:databasename', '') ~= '' then
    Bridge.DatabaseName = GetConvar('bridge:databasename', '')
end

-- ❕ OXMYSQL ❕
if not Bridge.Database and GetResourceState('oxmysql') ~= 'missing' then
    if not Bridge.DatabaseName then Bridge.DatabaseName = 'oxmysql' end
    Bridge.Database = 'oxmysql'
end

-- ❕ CUSTOM DATABASE ❕
-- if not Bridge.Database and GetResourceState('custom') ~= 'missing' then
--     if not Bridge.DatabaseName then Bridge.DatabaseName = 'custom' end
--     Bridge.Database = 'custom'
-- end

if not Bridge.Disabled['database'] and not Bridge.Database then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s^0'):format("No Compatible Database Resource Found. Please ensure you're using a supported database and that it's running before the bridge."))
    return
end

-- ❗ FRAMEWORK DETECTION ❗

-- ❕ OVERRIDE FRAMEWORK ❕
if GetConvar('bridge:framework', '') ~= '' then
    Bridge.Framework = GetConvar('bridge:framework', '')
end

-- ❕ OVERRIDE FRAMEWORK NAME ❕
if GetConvar('bridge:frameworkname', '') ~= '' then
    Bridge.FrameworkName = GetConvar('bridge:frameworkname', '')
end

-- ❕ OVERRIDE FRAMEWORK EVENT ❕
if GetConvar('bridge:frameworkevent', '') ~= '' then
    Bridge.FrameworkEvent = GetConvar('bridge:frameworkevent', '')
end

-- ❕ OVERRIDE FRAMEWORK PREFIX ❕
if GetConvar('bridge:frameworkprefix', '') ~= '' then
    Bridge.FrameworkPrefix = GetConvar('bridge:frameworkprefix', '')
end

-- ❕ ESX ❕ 
if not Bridge.Framework and GetResourceState('es_extended') ~= 'missing' then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'es_extended' end
    if not Bridge.FrameworkEvent then Bridge.FrameworkEvent = 'esx:getSharedObject' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'esx' end
    Bridge.Framework = 'esx'
end

-- ❕ QBox ❕
if not Bridge.Framework and GetResourceState('qbx_core') ~= 'missing' then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'qbx_core' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'QBCore' end
    Bridge.Framework = 'qbox'
end

-- ❕ QBCore ❕
if not Bridge.Framework and GetResourceState('qb-core') ~= 'missing' then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'qb-core' end
    if not Bridge.FrameworkEvent then Bridge.FrameworkEvent = 'QBCore:GetObject' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'QBCore' end
    Bridge.Framework = 'qb'
end

-- ❕ OX Core ❕
if not Bridge.Framework and GetResourceState('ox_core') ~= 'missing' then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'ox_core' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'ox' end
    Bridge.Framework = 'ox'
end

-- ❕ vRP ❕
if not Bridge.Framework and GetResourceState('vrp') ~= 'missing' then
    Bridge.Framework = 'vrp'
end

-- ❕ NDCore ❕
if not Bridge.Framework and GetResourceState('ND_Core') ~= 'missing' then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'ND_Core' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'ND' end
    Bridge.Framework = 'ndcore'
end

-- ❕ CUSTOM FRAMEWORK ❕
-- if not Bridge.Framework and GetResourceState('custom') ~= 'missing' then
--     if not Bridge.FrameworkName then Bridge.FrameworkName = 'custom' end
--     Bridge.Framework = 'custom'
-- end

if not Bridge.Disabled['framework'] and not Bridge.Framework then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s^0'):format("No Compatible Framework Resource Found. Please ensure you're using a supported framework and that it's running before the bridge."))
    return
end

-- ❗ INVENTORY DETECTION ❗

-- ❕ OVERRIDE INVENTORY ❕
if GetConvar('bridge:inventory', '') ~= '' then
    Bridge.Inventory = GetConvar('bridge:inventory', '')
end

-- ❕ OVERRIDE INVENTORY NAME ❕
if GetConvar('bridge:inventoryname', '') ~= '' then
    Bridge.InventoryName = GetConvar('bridge:inventoryname', '')
end

-- ❕ OVERRIDE INVENTORY PATH ❕
if GetConvar('bridge:inventoryimagepath', '') ~= '' then
    Bridge.InventoryImagePath = GetConvar('bridge:inventoryimagepath', '')
end

-- ❕ QB-INVENTORY | LJ-INVENTORY | AJ-INVENTORY | AX-INVENTORY | PS-INVENTORY ❕
if not Bridge.Inventory and Bridge.Framework == 'qb' and (GetResourceState('qb-inventory') ~= 'missing' or GetResourceState('lj-inventory') ~= 'missing' or GetResourceState('aj-inventory') ~= 'missing' or GetResourceState('ax-inventory') ~= 'missing' or GetResourceState('ps-inventory') ~= 'missing') then
    if not Bridge.InventoryName then 
        if GetResourceState('qb-inventory') ~= 'missing' then Bridge.InventoryName = 'qb-inventory' end
        if GetResourceState('lj-inventory') ~= 'missing' then Bridge.InventoryName = 'lj-inventory' end
        if GetResourceState('aj-inventory') ~= 'missing' then Bridge.InventoryName = 'aj-inventory' end
        if GetResourceState('ax-inventory') ~= 'missing' then Bridge.InventoryName = 'ax-inventory' end
        if GetResourceState('ps-inventory') ~= 'missing' then Bridge.InventoryName = 'ps-inventory' end
    end
    Bridge.InventoryImagePath = ('%s/html/images/'):format(Bridge.InventoryName)
    Bridge.Inventory = 'qb-inventory'
end

-- ❕ OX_INVENTORY ❕
if not Bridge.Inventory and GetResourceState('ox_inventory') ~= 'missing' then
    if not Bridge.InventoryName then Bridge.InventoryName = 'ox_inventory' end
    Bridge.InventoryImagePath = ('%s/web/images/'):format(Bridge.InventoryName)
    Bridge.Inventory = 'ox_inventory'
end

-- ❕ QS-INVENTORY ❕
if not Bridge.Inventory and GetResourceState('qs-inventory') ~= 'missing' then
    if not Bridge.InventoryName then Bridge.InventoryName = 'qs-inventory' end
    Bridge.InventoryImagePath = ('%s/html/images/'):format(Bridge.InventoryName)
    Bridge.Inventory = 'qs-inventory'
end

-- ❕ CODEM-INVENTORY ❕
if not Bridge.Inventory and GetResourceState('codem-inventory') ~= 'missing' then
    if not Bridge.InventoryName then Bridge.InventoryName = 'codem-inventory' end
    Bridge.InventoryImagePath = ('%s/html/itemimages/'):format(Bridge.InventoryName)
    Bridge.Inventory = 'codem-inventory'
end

-- ❕ CUSTOM INVENTORY ❕
-- if not Bridge.Inventory and GetResourceState('inventory') ~= 'missing' then
--     if not Bridge.InventoryName then Bridge.InventoryName = 'inventory' end
--     Bridge.Inventory = 'inventory'
-- end

if not Bridge.Disabled['inventory'] and not Bridge.Inventory then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s^0'):format("No Compatible Inventory Resource Found. Please ensure you're using a supported inventory and that it's running before the bridge."))
    return
end

-- ❗ TARGET DETECTION ❗

-- ❕ OVERRIDE TARGET ❕
if GetConvar('bridge:target', '') ~= '' then
    Bridge.Target = GetConvar('bridge:target', '')
end

-- ❕ OVERRIDE TARGET NAME ❕
if GetConvar('bridge:targetname', '') ~= '' then
    Bridge.TargetName = GetConvar('bridge:targetname', '')
end

-- ❕ OX_TARGET ❕
if not Bridge.Target and GetResourceState('ox_target') ~= 'missing' then
    if not Bridge.TargetName then Bridge.TargetName = 'ox_target' end
    Bridge.Target = 'ox_target'
end

-- ❕ META_TARGET ❕
if not Bridge.Target and GetResourceState('meta_target') ~= 'missing' then
    if not Bridge.TargetName then Bridge.TargetName = 'meta_target' end
    Bridge.Target = 'meta_target'
end

-- ❕ QB-TARGET ❕
if not Bridge.Target and GetResourceState('qb-target') ~= 'missing' then
    if not Bridge.TargetName then Bridge.TargetName = 'qb-target' end
    Bridge.Target = 'qb-target'
end

-- ❕ QTARGET ❕
if not Bridge.Target and GetResourceState('qtarget') ~= 'missing' then
    if not Bridge.TargetName then Bridge.TargetName = 'qtarget' end
    Bridge.Target = 'qtarget'
end

-- ❕ CUSTOM TARGET ❕
-- if not Bridge.Target and GetResourceState('target') ~= 'missing' then
--     if not Bridge.TargetName then Bridge.TargetName = 'target' end
--     Bridge.Target = 'target'
-- end

if not Bridge.Disabled['target'] and not Bridge.TargetName then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s^0'):format("No Compatible Target Resource Found. Please ensure you're using a supported target and that it's running before the bridge."))
    return
end

-- ❗ ZONES DETECTION ❗

-- ❕ OVERRIDE ZONE ❕
if GetConvar('bridge:zone', '') ~= '' then
    Bridge.Zone = GetConvar('bridge:zone', '')
end

-- ❕ OVERRIDE ZONE NAME ❕
if GetConvar('bridge:zonename', '') ~= '' then
    Bridge.ZoneName = GetConvar('bridge:zonename', '')
end

-- ❕ OX_LIB ❕
if not Bridge.Zone and GetResourceState('ox_lib') ~= 'missing' then
    if not Bridge.ZoneName then Bridge.ZoneName = 'ox_lib' end
    Bridge.Zone = 'ox_lib'
end

-- ❕ PolyZone ❕
if not Bridge.Zone and GetResourceState('PolyZone') ~= 'missing' then
    if not Bridge.ZoneName then Bridge.ZoneName = 'PolyZone' end
    Bridge.Zone = 'polyzone'
end

-- ❕ CUSTOM ZONE ❕
-- if not Bridge.Zone and GetResourceState('zone') ~= 'missing' then
--     if not Bridge.ZoneName then Bridge.ZoneName = 'zone' end
--     Bridge.Zone = 'zone'
-- end

if not Bridge.Disabled['zone'] and not Bridge.ZoneName then
    print('[^1BRIDGE ERROR^0]')
    print(('^3%s^0'):format("No Compatible Zone Resource Found. Please ensure you're using a supported zone resource and that it's running before the bridge."))
    return
end

-- ❗ LOADERS ❗

-- ❕ LOAD MODULE LOADER ❕
local resource = LoadResourceFile(Bridge.Name, 'shared/loader.lua')
if not resource then return error('Unable To Load Module Loader') end
local moduleloader, err = load(resource, ('@@%s/%s'):format(Bridge.Name, 'shared/loader.lua'))
if not moduleloader or err then return error(err) end
moduleloader()

-- ❕ LOAD CACHE ❕
module('shared/cache')

-- ❕ LOAD UTILS ❕
module(('utils/%s'):format(Bridge.Context))

module('utils/shared')

-- ❕ LOAD DATABASE ❕
if not Bridge.Disabled['database'] then
    module(('database/%s/%s'):format(Bridge.Database, Bridge.Context))
end

-- ❕ LOAD FRAMEWORK ❕
if not Bridge.Disabled['framework'] then
    module(('framework/%s/%s'):format(Bridge.Framework, Bridge.Context))
end

-- ❕ LOAD INVENTORY ❕
if not Bridge.Disabled['inventory'] then
    module(('inventory/%s/%s'):format(Bridge.Inventory, Bridge.Context))
end

-- ❕ LOAD TARGET ❕
if not Bridge.Disabled['target'] then
    module(('target/%s/%s'):format(Bridge.Target, Bridge.Context))
end

-- ❕ LOAD ZONE ❕
if not Bridge.Disabled['zone'] then
    module(('zone/%s/%s'):format(Bridge.Zone, Bridge.Context))
end

-- ❕ LOAD LOCALE ❕
if not Bridge.Disabled['locale'] then
    module('shared/locale')
end