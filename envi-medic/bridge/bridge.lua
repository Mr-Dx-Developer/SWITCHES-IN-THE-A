-- Copyright (C) 2023 reFlow Store, licensed under Software Subscription License Agreement

---@class Bridge
Bridge = {
    Version = '0.2.9',
    Resource = GetCurrentResourceName(),
    Context = IsDuplicityVersion() and 'server' or 'client',
    DebugMode = GetConvar('bridge:debug', 'false') == 'true' and true or false,
    Locale = GetConvar('bridge:locale', 'en'),
    Framework = nil,
    FrameworkName = nil,
    FrameworkEvent = nil,
    FrameworkPrefix = nil,
    Inventory = nil,
    InventoryName = nil,
    InventoryImagePath = nil,
    Target = nil,
    TargetName = nil,
    Zone = nil,
    ZoneName = nil,
    Database = nil,
    DatabaseName = nil
}

---@class Framework
Framework = {}

---@class Target
Target = {}

---@class Zone
Zone = {}

---@class Database
Database = {}

-- ❗ FRAMEWORK VERSION ❗
if Bridge.DebugMode then 
    print(('[^2BRIDGE^0] ^1Version^0 %s'):format(Bridge.Version))
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
if not Bridge.Database and GetResourceState('oxmysql'):find('start') then
    if not Bridge.DatabaseName then Bridge.DatabaseName = 'oxmysql' end
    Bridge.Database = 'oxmysql'
end

-- ❕ CUSTOM DATABASE ❕
-- if not Bridge.Database and GetResourceState('custom') == 'started' then
--     if not Bridge.DatabaseName then Bridge.DatabaseName = 'custom' end
--     Bridge.Database = 'custom'
-- end

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
if not Bridge.Framework and GetResourceState('es_extended'):find('start') then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'es_extended' end
    if not Bridge.FrameworkEvent then Bridge.FrameworkEvent = 'esx:getSharedObject' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'esx' end
    Bridge.Framework = 'esx'
end

-- ❕ QBox ❕
if not Bridge.Framework and GetResourceState('qbx_core'):find('start') then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'qbx_core' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'QBCore' end
    Bridge.Framework = 'qbox'
end

-- ❕ QBCore ❕
if not Bridge.Framework and GetResourceState('qb-core'):find('start') then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'qb-core' end
    if not Bridge.FrameworkEvent then Bridge.FrameworkEvent = 'QBCore:GetObject' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'QBCore' end
    Bridge.Framework = 'qb'
end

-- ❕ OX Core ❕
if not Bridge.Framework and GetResourceState('ox_core'):find('start') then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'ox_core' end
    if not Bridge.FrameworkPrefix then Bridge.FrameworkPrefix = 'ox' end
    Bridge.Framework = 'ox'
end

-- ❕ vRP ❕
if not Bridge.Framework and GetResourceState('vrp'):find('start') then
    Bridge.Framework = 'vrp'
end

-- ❕ NDCore ❕
if not Bridge.Framework and GetResourceState('ND_Core'):find('start') then
    if not Bridge.FrameworkName then Bridge.FrameworkName = 'ND_Core' end
    Bridge.Framework = 'ndcore'
end

-- ❕ CUSTOM FRAMEWORK ❕
-- if not Bridge.Framework and GetResourceState('custom') == 'started' then
--     if not Bridge.FrameworkName then Bridge.FrameworkName = 'custom' end
--     Bridge.Framework = 'custom'
-- end

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
if not Bridge.Inventory and Bridge.Framework == 'qb' and (GetResourceState('qb-inventory'):find('start') or GetResourceState('lj-inventory'):find('start') or GetResourceState('aj-inventory'):find('start') or GetResourceState('ax-inventory'):find('start') or GetResourceState('ps-inventory'):find('start')) then
    if not Bridge.InventoryName then 
        if GetResourceState('qb-inventory'):find('start') then Bridge.InventoryName = 'qb-inventory' end
        if GetResourceState('lj-inventory'):find('start') then Bridge.InventoryName = 'lj-inventory' end
        if GetResourceState('aj-inventory'):find('start') then Bridge.InventoryName = 'aj-inventory' end
        if GetResourceState('ax-inventory'):find('start') then Bridge.InventoryName = 'ax-inventory' end
        if GetResourceState('ps-inventory'):find('start') then Bridge.InventoryName = 'ps-inventory' end
    end
    Bridge.InventoryImagePath = ('%s/html/images/'):format(Bridge.InventoryName)
    Bridge.Inventory = 'qb-inventory'
end

-- ❕ OX_INVENTORY ❕
if not Bridge.Inventory and GetResourceState('ox_inventory'):find('start') then
    if not Bridge.InventoryName then Bridge.InventoryName = 'ox_inventory' end
    Bridge.InventoryImagePath = ('%s/web/images/'):format(Bridge.InventoryName)
    Bridge.Inventory = 'ox_inventory'
end

-- ❕ QS-INVENTORY ❕
if not Bridge.Inventory and GetResourceState('qs-inventory'):find('start') then
    if not Bridge.InventoryName then Bridge.InventoryName = 'qs-inventory' end
    Bridge.InventoryImagePath = ('%s/html/images/'):format(Bridge.InventoryName)
    Bridge.Inventory = 'qs-inventory'
end

-- ❕ CUSTOM INVENTORY ❕
-- if not Bridge.Inventory and GetResourceState('inventory'):find('start') then
--     if not Bridge.InventoryName then Bridge.InventoryName = 'inventory' end
--     Bridge.Inventory = 'inventory'
-- end

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
if not Bridge.Target and GetResourceState('ox_target'):find('start') then
    if not Bridge.TargetName then Bridge.TargetName = 'ox_target' end
    Bridge.Target = 'ox_target'
end

-- ❕ META_TARGET ❕
if not Bridge.Target and GetResourceState('meta_target'):find('start') then
    if not Bridge.TargetName then Bridge.TargetName = 'meta_target' end
    Bridge.Target = 'meta_target'
end

-- ❕ QB-TARGET ❕
if not Bridge.Target and GetResourceState('qb-target'):find('start') then
    if not Bridge.TargetName then Bridge.TargetName = 'qb-target' end
    Bridge.Target = 'qb-target'
end

-- ❕ QTARGET ❕
if not Bridge.Target and GetResourceState('qtarget'):find('start') then
    if not Bridge.TargetName then Bridge.TargetName = 'qtarget' end
    Bridge.Target = 'qtarget'
end

-- ❕ CUSTOM TARGET ❕
-- if not Bridge.Target and GetResourceState('target'):find('start') then
--     if not Bridge.TargetName then Bridge.TargetName = 'target' end
--     Bridge.Target = 'target'
-- end

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
if not Bridge.Zone and GetResourceState('ox_lib'):find('start') then
    if not Bridge.ZoneName then Bridge.ZoneName = 'ox_lib' end
    Bridge.Zone = 'ox_lib'
end

-- ❕ PolyZone ❕
if not Bridge.Zone and GetResourceState('PolyZone'):find('start') then
    if not Bridge.ZoneName then Bridge.ZoneName = 'PolyZone' end
    Bridge.Zone = 'polyzone'
end

-- ❕ CUSTOM ZONE ❕
-- if not Bridge.Zone and GetResourceState('zone'):find('start') then
--     if not Bridge.ZoneName then Bridge.ZoneName = 'zone' end
--     Bridge.Zone = 'zone'
-- end

-- ❗ LOADERS ❗

-- ❕ LOAD MODULE LOADER ❕
local resource = LoadResourceFile(Bridge.Resource, 'bridge/shared/loader.lua')
if not resource then return error('Unable To Load Module Loader') end
local moduleloader, err = load(resource, ('@@%s/%s'):format(Bridge.Resource, 'bridge/shared/loader.lua'))
if not moduleloader or err then return error(err) end
moduleloader()

-- ❕ LOAD CACHE ❕
module('shared/cache')

-- ❕ LOAD UTILS ❕
module(('utils/%s'):format(Bridge.Context))

module('utils/shared')

-- ❕ LOAD DATABASE ❕
module(('database/%s/%s'):format(Bridge.Database, Bridge.Context))

-- ❕ LOAD FRAMEWORK ❕
module(('framework/%s/%s'):format(Bridge.Framework, Bridge.Context))

-- ❕ LOAD INVENTORY ❕
module(('inventory/%s/%s'):format(Bridge.Inventory, Bridge.Context))

-- ❕ LOAD TARGET ❕
module(('target/%s/%s'):format(Bridge.Target, Bridge.Context))

-- ❕ LOAD ZONE ❕
module(('zone/%s/%s'):format(Bridge.Zone, Bridge.Context))

-- ❕ LOAD LOCALE ❕
module('shared/locale')