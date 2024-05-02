local Menu = Menu
local Locale = Locale

local Colors = {}

local ShowcaseVehicle = 0

local InteractablePlayers = {}

-- GANG MENU
Menu.CreateMenu('MENU_HOME')

Menu.CreateSubMenu('SUBMENU_TERRITORY', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_PLAYERS', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_ACTIONS', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_INVITE', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_MEMBERS', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_MANAGEMENT', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_MANAGEMENT_LEAD', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_MANAGEMENT_KICK', 'MENU_HOME')
Menu.CreateSubMenu('SUBMENU_LEAVE', 'MENU_HOME')

Menu.SetTitleColor('SUBMENU_ACTIONS', 'rgb(255, 255, 255)')
Menu.SetSubTitleColor('SUBMENU_ACTIONS', 'rgb(255, 255, 255)')
Menu.SetTitleBackground('SUBMENU_ACTIONS', 'url("./images/shopui_title_gunvan.png") center / 22vw 12vh no-repeat')

-- ADMIN MENU
Menu.CreateMenu('AMENU_HOME', Locale.MENU_ADMIN_TITLE, Locale.MENU_ADMIN_SUBTITLE)

Menu.CreateSubMenu('SUBAMENU_GANG', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_CREATE', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_DELETE', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_MEMBER', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_MEMBER_MANAGE', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_MEMBERS', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_GARAGE', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_GARAGE_LIST', 'SUBAMENU_GARAGE')
Menu.CreateSubMenu('SUBAMENU_GARAGE_INSERT', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_GARAGE_REMOVE', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_RESERVE', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_CHECKPOINTS', 'AMENU_HOME')
Menu.CreateSubMenu('SUBAMENU_CHECKPOINTS_MANAGE', 'SUBAMENU_CHECKPOINTS')

Menu.SetTitleColor('AMENU_HOME', 'rgb(255, 255, 255)')
Menu.SetSubTitleColor('AMENU_HOME', 'rgb(255, 255, 255)')
Menu.SetTitleBackground('AMENU_HOME', 'rgb(31, 33, 53)')

for name, color in pairs(Config.GangMenuColors) do
    table.insert(Colors, '<i id="' .. name .. '" class="fa-solid fa-circle" style="color: rgb(' .. color.background[1] .. ', ' .. color.background[2] .. ', ' .. color.background[3] .. ')"></i>')
end

for index, menu in ipairs({ 'SUBAMENU_GANG', 'SUBAMENU_CREATE', 'SUBAMENU_DELETE', 'SUBAMENU_MEMBER', 'SUBAMENU_MEMBER_MANAGE', 'SUBAMENU_MEMBERS', 'SUBAMENU_GARAGE', 'SUBAMENU_GARAGE_LIST', 'SUBAMENU_GARAGE_INSERT', 'SUBAMENU_GARAGE_REMOVE', 'SUBAMENU_RESERVE', 'SUBAMENU_CHECKPOINTS', 'SUBAMENU_CHECKPOINTS_MANAGE' }) do
    Menu.SetTitleColor(menu, 'rgb(255, 255, 255)')
    Menu.SetSubTitleColor(menu, 'rgb(255, 255, 255)')
    Menu.SetTitleBackground(menu, 'rgb(31, 33, 53)')
end

if Config.RanksAccess then
    for access, properties in pairs(Config.RanksAccess) do
        properties.icon = string.format('<i class="fa-solid %s"></i>', properties.icon)
    end
end

local function RefreshPlayers()
    InteractablePlayers = table.wipe(InteractablePlayers)

    local localPed = PlayerPedId()
    local localPos = GetEntityCoords(localPed)

    local players = GetActivePlayers()

    for index, player in ipairs(players) do
        if NetworkIsPlayerActive(player) then
            local playerPed = GetPlayerPed(player)
            local playerPos = GetEntityCoords(playerPed)

            if glm.distance(localPos, playerPos) < 5.0 then
                if Config.OtherOptions.anonymousNames then
                    InteractablePlayers[player] = GetPlayerServerId(player)
                else
                    InteractablePlayers[player] = GetPlayerName(player)
                end
            end
        end
    end

    InteractablePlayers[PlayerId()] = nil
end

local function RefreshMenuColors()
    local gang = Gang
    local zone = Zone

    local menus = { 'MENU_HOME', 'SUBMENU_PLAYERS', 'SUBMENU_CHECKPOINTS', 'SUBMENU_CHECKPOINTS_MANAGE', 'SUBMENU_INVITE', 'SUBMENU_MEMBERS', 'SUBMENU_MANAGEMENT', 'SUBMENU_MANAGEMENT_LEAD', 'SUBMENU_MANAGEMENT_KICK', 'SUBMENU_LEAVE' }

    local foreground = Config.GangMenuColors[gang.color].foreground
    local background = Config.GangMenuColors[gang.color].background

    for index, menu in ipairs(menus) do
        Menu.SetTitle(menu, gang.tag)

        Menu.SetTitleColor(menu, 'rgb(' .. foreground[1] .. ',' .. foreground[2] .. ',' .. foreground[3] .. ')')
        Menu.SetSubTitleColor(menu, 'rgb(' .. background[1] .. ',' .. background[2] .. ',' .. background[3] .. ')')
        Menu.SetTitleBackground(menu, 'rgb(' .. background[1] .. ',' .. background[2] .. ',' .. background[3] .. ')')
        Menu.SetSubTitleBackground(menu, 'rgb(' .. foreground[1] .. ',' .. foreground[2] .. ',' .. foreground[3] .. ')')
    end
end

AddEventHandler('rcore_gangs:client:zone_changed', function()
    local gang = Gang
    local zone = Zone

    local respect = Locale.MENU_RESPECT_NONE

    if zone.localGangOwnership then
        if zone.localGangOwnership < 20 then
            respect = Locale.MENU_RESPECT_LOW
        elseif zone.localGangOwnership < 60 then
            respect = Locale.MENU_RESPECT_MID
        else
            respect = Locale.MENU_RESPECT_HIGH
        end
    end

    Menu.SetSubTitle('SUBMENU_TERRITORY', zone.label .. ' ' ..  '(' .. respect .. ')')
    Menu.SetTitleBackground('SUBMENU_TERRITORY', 'url("./images/' .. zone.name .. '.png") center / 22vw 12vh no-repeat')
end)

RegisterCommand(Config.Commands.GANGMENU or 'gangmenu', function()
    local gang = Gang
    local zone = Zone

    if not gang then
        return
    end

    RefreshMenuColors()
    
    Intervals.renderMenu = GetGameTimer()

    Menu.SetTitle('MENU_HOME', gang.tag)
    Menu.SetSubTitle('MENU_HOME', gang.name .. ' ' .. '(' .. gang.rank .. ')')

    if zone then
        local respect = Locale.MENU_RESPECT_NONE

        if zone.localGangOwnership then
            if zone.localGangOwnership < 20 then
                respect = Locale.MENU_RESPECT_LOW
            elseif zone.localGangOwnership < 60 then
                respect = Locale.MENU_RESPECT_MID
            else
                respect = Locale.MENU_RESPECT_HIGH
            end
        end

        Menu.SetSubTitle('SUBMENU_TERRITORY', zone.label .. ' ' .. '(' .. respect .. ')')
        Menu.SetTitleBackground('SUBMENU_TERRITORY', 'url("./images/' .. zone.name .. '.png") center / 22vw 12vh no-repeat')
    else
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)

        Menu.SetSubTitle('SUBMENU_TERRITORY', Config.ZoneNames[GetNameOfZone(playerPos.x, playerPos.y, playerPos.z)])
        Menu.SetTitleBackground('SUBMENU_TERRITORY', 'url("./images/' .. GetNameOfZone(playerPos.x, playerPos.y, playerPos.z) .. '.png") center / 22vw 12vh no-repeat')
    end

    Menu.OpenMenu('MENU_HOME')
end, false)

RegisterKeyMapping(Config.Commands.GANGMENU or 'gangmenu', 'Gang Menu', 'keyboard', 'f10')

function GangMenu(menu)
    local gang = Gang
    local zone = Zone
    
    if not gang then
        return
    end

    if menu == 'MENU_HOME' then
        local rivalry = GetRivalry()
        local finishedRivalry = GetFinishedRivalry()

        Menu.MenuButton('TERRITORY', 'SUBMENU_TERRITORY', Locale.MENU_BUTTON_TERRITORY, true)

        if Config.GangOptions.robbing or Config.GangOptions.kidnapping then
            if gang.leader or (gang.access and gang.access['actions.perform']) then
                Menu.MenuButton('SUBMENU_ACTIONS', 'SUBMENU_PLAYERS', Locale.MENU_BUTTON_ACTIONS, true)
                
                if Menu.IsButtonSelected() then
                    RefreshPlayers()

                    Menu.SetSubTitle('SUBMENU_PLAYERS', Locale.MENU_BUTTON_ACTIONS)
                end
            end
        end

        if Config.DrugOptions.enableSales then
            Menu.MenuButton('DRUGS', 'MENU_DRUGS', Locale.MENU_BUTTON_DRUGS, true)

            if Menu.IsButtonSelected() then
                ExecuteCommand(Config.Commands.SELLDRUGS or 'selldrugs')
            end
        end

        if zone and rivalry then
            Menu.Button('RIVALRY', Locale.MENU_RIVALRY_PROGRESS, FormatTime(rivalry.secondsLeft), true)
        end

        if zone and not rivalry then
            if finishedRivalry then
                if gang.leader or (gang.access and gang.access['rivalry.claim']) then
                    Menu.Button('RIVALRY', Locale.MENU_RIVALRY_FINISH, FormatMoney(finishedRivalry.funds), true)

                    if Menu.IsButtonSelected() then
                        TriggerServerEvent('rcore_gangs:server:finish_rivalry', zone.name)
                    end
                end
            else
                if gang.leader or (gang.access and gang.access['rivalry.begin']) then
                    if zone.gangName == gang.name or not zone.gangName then
                        Menu.Button('RIVALRY', Locale.MENU_RIVALRY_START, nil, false)
                    else
                        Menu.Button('RIVALRY', Locale.MENU_RIVALRY_START, FormatMoney(Config.ZoneOptions.rivalryCost), true)
        
                        if Menu.IsButtonSelected() then
                            TriggerServerEvent('rcore_gangs:server:start_rivalry', zone.name)
                        end
                    end
                end
            end
        end

        if Config.GangOptions.garage or Config.GangOptions.storage or Config.GangOptions.reserve then
            if gang.leader or (gang.access and gang.access['checkpoint.edit']) then
                Menu.MenuButton('CHECKPOINTS', 'SUBMENU_CHECKPOINTS', Locale.MENU_BUTTON_CHECKPOINTS, true)

                if Menu.IsButtonSelected() then
                    Menu.SetSubTitle('SUBMENU_CHECKPOINTS', Locale.MENU_BUTTON_CHECKPOINTS)
                end
            end
        end

        if gang.leader or (gang.access and gang.access['members.invite']) then
            if #gang.members < Config.GangOptions.maxMembers then
                if Menu.MenuButton('SUBMENU_INVITE', 'SUBMENU_PLAYERS', Locale.MENU_BUTTON_INVITE, true) then
                    RefreshPlayers()

                    Menu.SetSubTitle('SUBMENU_PLAYERS', Locale.MENU_BUTTON_INVITE)
                end
            else
                if Menu.MenuButton('SUBMENU_INVITE', 'SUBMENU_PLAYERS', Locale.MENU_BUTTON_INVITE, false) then
                    RefreshPlayers()

                    Menu.SetSubTitle('SUBMENU_PLAYERS', Locale.MENU_BUTTON_INVITE)
                end
            end
        end

        if gang.leader or (gang.access and (gang.access['members.rank'] or gang.access['members.kick'])) then
            if gang.leader and #gang.members > 1 or #gang.members > 2 then
                if Menu.MenuButton('MANAGEMENT', 'SUBMENU_MEMBERS', Locale.MENU_BUTTON_MANAGEMENT, true) then
                    Menu.SetSubTitle('SUBMENU_MEMBERS', Locale.MENU_BUTTON_MANAGEMENT)
                end
            else
                if Menu.MenuButton('MANAGEMENT', 'SUBMENU_MEMBERS', Locale.MENU_BUTTON_MANAGEMENT, false) then
                    Menu.SetSubTitle('SUBMENU_MEMBERS', Locale.MENU_BUTTON_MANAGEMENT)
                end
            end
        end

        if gang.leader then
            if Menu.MenuButton('LEAVE', 'SUBMENU_LEAVE', Locale.MENU_BUTTON_DISBAND, true) then
                Menu.SetSubTitle('SUBMENU_LEAVE', Locale.MENU_WARNING_DISBAND)
            end
        else
            if Menu.MenuButton('LEAVE', 'SUBMENU_LEAVE', Locale.MENU_BUTTON_LEAVE, true) then
                Menu.SetSubTitle('SUBMENU_LEAVE', Locale.MENU_WARNING_LEAVE)
            end
        end
    end

    if menu == 'SUBMENU_TERRITORY' then
        if zone and zone.gangPresence then
            for index, gang in ipairs(zone.gangPresence) do
                Menu.Button(gang.name, gang.name, math.floor(gang.loyalty / zone.totalLoyalty * 100 + 0.5) .. '%', true)
            end
        else
            Menu.Button('ACTIVITY', Locale.MENU_ACTIVITY_NONE, nil, false)
        end
    end

    if menu == 'SUBMENU_PLAYERS' then
        local value = Menu.CurrentValue()

        for playerId, playerName in pairs(InteractablePlayers) do
            if NetworkIsPlayerActive(playerId) then
                Menu.MenuButton(playerId, value, playerName, true)

                if Menu.IsButtonHovered() then
                    local playerPed = GetPlayerPed(playerId)
                    local playerPos = GetEntityCoords(playerPed)

                    local color = Config.GangMenuColors[gang.color].background

                    DrawMarker(2, playerPos.x, playerPos.y, playerPos.z + 1.10, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.4, 0.4, 0.4, color[1], color[2], color[3], 192, false, true, 2, nil, nil, false)
                end

                if Menu.IsButtonSelected() then
                    if value == 'SUBMENU_ACTIONS' then
                        Menu.SetSubTitle(value, Locale.MENU_BUTTON_ACTIONS .. ' - ' .. playerName)
                    end

                    if value == 'SUBMENU_INVITE' then
                        Menu.SetSubTitle(value, Locale.MENU_BUTTON_INVITE .. ' - ' .. playerName)
                    end
                end
            else
                InteractablePlayers[playerId] = nil
            end
        end

        if next(InteractablePlayers) == nil then
            Menu.Button('PLAYER', Locale.MENU_PLAYERS_NONE, nil, false)
        end

        if Menu.Button('REFRESH', Locale.MENU_PLAYERS_REFRESH, nil, true) then
            RefreshPlayers()
        end
    end

    if menu == 'SUBMENU_ACTIONS' then
        local targetPlayer = Menu.CurrentValue()
        local targetPed = GetPlayerPed(targetPlayer)
        local targetId = GetPlayerServerId(targetPlayer)

        local alive = not IsPlayerDead(targetPlayer)
        local vehicle = IsPedInAnyVehicle(targetPed)

        local bagged = IsPlayerBagged(targetId)
        local restrained = IsPlayerRestrained(targetId)
        local escorted = IsPlayerEscorted(targetId)

        if Config.GangOptions.robbing then
            if not vehicle and not escorted and restrained or not alive then
                Menu.Button('SEARCH', Locale.MENU_ACTIONS_ROB, nil, true)

                if Menu.IsButtonSelected() then
                    Menu.CloseMenu()

                    RobPlayer(targetPlayer, targetPed)
                end
            end
        end

        if Config.GangOptions.kidnapping then
            if not vehicle and not escorted then
                if restrained then
                    if Menu.Button('RESTRAIN', Locale.MENU_ACTIONS_TIE_OFF, nil, alive) then
                        RestrainPlayer(targetPlayer, targetPed, false)
                    end
                else
                    if Menu.Button('RESTRAIN', Locale.MENU_ACTIONS_TIE_ON, nil, alive) then
                        RestrainPlayer(targetPlayer, targetPed, true)
                    end
                end

                if bagged then
                    if Menu.Button('BLINDFOLD', Locale.MENU_ACTIONS_BAG_OFF, nil, alive) then
                        BagPlayer(targetPlayer, targetPed, false)
                    end
                else
                    if Menu.Button('BLINDFOLD', Locale.MENU_ACTIONS_BAG_ON, nil, alive) then
                        BagPlayer(targetPlayer, targetPed, true)
                    end
                end
            end

            if restrained then
                if vehicle then
                    if Menu.Button('TRANSPORT', Locale.MENU_ACTIONS_TRANSPORT_OFF, nil, alive) then
                        TransportPlayer(targetPlayer, targetPed, false)
                    end
                else
                    if escorted then
                        if Menu.Button('TRANSPORT', Locale.MENU_ACTIONS_TRANSPORT_ON, nil, alive) then
                            TransportPlayer(targetPlayer, targetPed, true)
                        end
                        
                        if Menu.Button('ESCORT', Locale.MENU_ACTIONS_ESCORT_OFF, nil, alive) then
                            EscortPlayer(targetPlayer, targetPed, false)
                        end
                    else
                        if Menu.Button('ESCORT', Locale.MENU_ACTIONS_ESCORT_ON, nil, alive) then
                            EscortPlayer(targetPlayer, targetPed, true)
                        end
                    end
                end
            end
        end
    end

    if menu == 'SUBMENU_INVITE' then
        local targetPlayer = Menu.CurrentValue()

        if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
            TriggerServerEvent('rcore_gangs:server:invite_member', GetPlayerServerId(targetPlayer))

            Menu.CloseMenu()
        end

        if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
            Menu.CloseMenu()
        end
    end

    if menu == 'SUBMENU_MEMBERS' then
        local identifier = Identifier

        local order = {}
        local empty = true

        for index, rank in ipairs(gang.ranks) do
            order[rank.label] = index
        end

        for index, member in ipairs(gang.members) do
            if member.identifier ~= identifier and order[member.rank] < order[gang.rank] then
                Menu.MenuButton(member.identifier, 'SUBMENU_MANAGEMENT', member.name, true)

                if Menu.IsButtonSelected() then
                    Menu.SetSubTitle('SUBMENU_MANAGEMENT', member.name .. ' ' .. '(' .. member.rank .. ')')
                end

                empty = false
            end
        end

        if empty then
            Menu.MenuButton('EMPTY', Locale.MENU_MANAGEMENT_NONE, nil, false)
        end

        if #gang.members < 2 then
            Menu.CloseMenu()
        end
    end

    if menu == 'SUBMENU_MANAGEMENT' then
        local identifier = Menu.CurrentValue()

        local ranks = {}

        for index, rank in ipairs(gang.ranks) do
            if gang.rank == rank.label then
                break
            end

            ranks[index] = rank.label
        end

        for index, member in ipairs(gang.members) do
            if member.identifier == identifier then
                local pressed, rank = nil, nil

                if gang.leader or (gang.access and gang.access['members.rank']) then
                    pressed, rank = Menu.ComboButton('RANK', Locale.MENU_MANAGEMENT_RANK, ranks, nil, true)

                    if Menu.IsButtonSelected() then
                        TriggerServerEvent('rcore_gangs:server:set_rank', identifier, rank)

                        Menu.CloseMenu()
                    end
                end

                if gang.leader then
                    Menu.MenuButton('LEAD' .. identifier, 'SUBMENU_MANAGEMENT_LEAD', Locale.MENU_MANAGEMENT_SHIP, true)

                    if Menu.IsButtonSelected() then
                        Menu.SetSubTitle('SUBMENU_MANAGEMENT_LEAD', Locale.MENU_WARNING_SHIP)
                    end
                end

                if gang.leader or (gang.access and gang.access['members.kick']) then
                    Menu.MenuButton('KICK' .. identifier, 'SUBMENU_MANAGEMENT_KICK', Locale.MENU_MANAGEMENT_KICK, true)

                    if Menu.IsButtonSelected() then
                        Menu.SetSubTitle('SUBMENU_MANAGEMENT_KICK', Locale.MENU_WARNING_KICK)
                    end
                end

                if gang.leader or (gang.access and gang.access['members.rank']) then
                    if Config.RanksAccess then
                        for access in pairs(gang.ranks[rank].access) do
                            if Config.RanksAccess[access] then
                                Menu.Button(access, Config.RanksAccess[access].label, Config.RanksAccess[access].icon, false)

                                if Menu.IsButtonHovered() then
                                    Menu.Tooltip(Config.RanksAccess[access].description)
                                end
                            end
                        end
                    else
                        if Config.GangRanks then
                            Menu.CheckButton('ACCESS', Locale.MENU_MANAGEMENT_PERM, Config.GangRanks[rank].access, Config.GangRanks[rank].access)
                        end
                    end
                end
            end
        end

        if #gang.members < 2 then
            Menu.CloseMenu()
        end
    end

    if menu == 'SUBMENU_MANAGEMENT_LEAD' then
        local identifier = Menu.CurrentValue()

        if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
            TriggerServerEvent('rcore_gangs:server:set_leader', identifier:sub(string.len('LEAD') + 1, identifier:len()))

            Menu.CloseMenu()
        end

        if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
            Menu.CloseMenu()
        end
    end

    if menu == 'SUBMENU_MANAGEMENT_KICK' then
        local identifier = Menu.CurrentValue()

        if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
            TriggerServerEvent('rcore_gangs:server:kick_member', identifier:sub(string.len('KICK') + 1, identifier:len()))

            Menu.CloseMenu()
        end

        if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
            Menu.CloseMenu()
        end
    end

    if menu == 'SUBMENU_LEAVE' then
        if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
            TriggerServerEvent('rcore_gangs:server:leave')

            Menu.CloseMenu()
        end

        if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
            Menu.CloseMenu()
        end
    end
end

RegisterNetEvent('rcore_gangs:client:set_gangs')
AddEventHandler('rcore_gangs:client:set_gangs', function(gangs)
    Intervals.renderMenu = GetGameTimer()

    Menu.OpenMenu('AMENU_HOME')

    while Menu.CurrentMenu() do
        Wait(0)

        local menu = Menu.CurrentMenu()

        local showcase = false

        if menu == 'AMENU_HOME' then
            if Menu.MenuButton('CREATE', 'SUBAMENU_CREATE', Locale.MENU_CREATE_NEW, true) then
                Menu.SetTitle('SUBAMENU_CREATE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_CREATE', Locale.MENU_CREATE_NEW)
            end

            for id, gang in pairs(gangs) do
                if Menu.MenuButton(id, 'SUBAMENU_GANG', gang.name, true) then
                    Menu.SetTitle('SUBAMENU_GANG', Locale.MENU_ADMIN_TITLE)
                    Menu.SetSubTitle('SUBAMENU_GANG', gang.name .. ' ' .. '(' .. gang.tag .. ')')
                end
            end

            if next(gangs) == nil then
                Menu.Button('GANGS', Locale.MENU_CREATE_NONE, nil, false)
            end
        end

        if menu == 'SUBAMENU_GANG' then
            local id = Menu.CurrentValue()

            if Menu.MenuButton('MEMBERS' .. id, 'SUBAMENU_MEMBERS', Locale.MENU_BUTTON_MEMBERS, true) then
                Menu.SetTitle('SUBAMENU_MEMBERS', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_MEMBERS', Locale.MENU_BUTTON_MEMBERS)
            end

            if Menu.MenuButton('GARAGE' .. id, 'SUBAMENU_GARAGE', Locale.MENU_BUTTON_GARAGE, true) then
                Menu.SetTitle('SUBAMENU_GARAGE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_GARAGE', Locale.MENU_BUTTON_GARAGE)
            end

            if Menu.MenuButton('RESERVE' .. id, 'SUBAMENU_RESERVE', Locale.MENU_BUTTON_RESERVE, true) then
                Menu.SetTitle('SUBAMENU_RESERVE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_RESERVE', Locale.MENU_BUTTON_RESERVE)
            end

            if Menu.MenuButton('CHECKPOINTS' .. id, 'SUBAMENU_CHECKPOINTS', Locale.MENU_BUTTON_CHECKPOINTS, true) then
                Menu.SetTitle('SUBAMENU_CHECKPOINTS', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_CHECKPOINTS', Locale.MENU_BUTTON_CHECKPOINTS)
            end

            if Menu.MenuButton('DELETE' .. id, 'SUBAMENU_DELETE', Locale.MENU_BUTTON_DELETE, true) then
                Menu.SetTitle('SUBAMENU_DELETE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_DELETE', Locale.MENU_WARNING_DELETE)
            end
        end

        if menu == 'SUBAMENU_CREATE' then
            local groupNames = {}
            local groupLabels = {}

            if Config.RanksGroups then
                for name, group in pairs(Config.RanksGroups) do
                    table.insert(groupNames, group.name)
                    table.insert(groupLabels, group.label)
                end
            else
                table.insert(groupNames, 'NULL')
                table.insert(groupLabels, 'NULL')
            end

            local pressed, leader = Menu.InputButton('LEADER', Locale.MENU_CREATE_LEADER, Locale.MENU_CREATE_LEADER_TEXT, nil, 4, true)
            local pressed, tag = Menu.InputButton('TAG', Locale.MENU_CREATE_TAG, Locale.MENU_CREATE_TAG_TEXT, nil, 10, true)
            local pressed, name = Menu.InputButton('NAME', Locale.MENU_CREATE_NAME, Locale.MENU_CREATE_NAME_TEXT, nil, 32, true)

            local pressed, color = Menu.ComboButton('COLOR', Locale.MENU_CREATE_COLOR, Colors, nil, true)

            local pressed, group = Menu.ComboButton('GROUP', Locale.MENU_CREATE_GROUP, groupLabels, nil, not not Config.RanksGroups)

            if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
                tag, name, leader = tag ~= Locale.MENU_TEXT_NONE and tag or nil, name ~= Locale.MENU_TEXT_NONE and name or nil, leader ~= Locale.MENU_TEXT_NONE and leader or nil

                color = string.match(Colors[color], 'id="(%a+)"')

                if Config.RanksGroups then
                    TriggerServerEvent('rcore_gangs:server:create_gang', tonumber(leader), color, groupNames[group], tag, name)
                else
                    TriggerServerEvent('rcore_gangs:server:create_gang', tonumber(leader), color, nil, tag, name)
                end

                Menu.CloseMenu()
            end

            if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
                Menu.CloseMenu()
            end
        end

        if menu == 'SUBAMENU_MEMBER' then
            local value = Menu.CurrentValue()

            local identifier = value:sub(1, value:find('%.') - 1)

            local id = value:sub(value:find('%.') + 1, value:len())
            local id = tonumber(id)

            local gang = gangs[id]

            local ranks = {}

            for index, rank in ipairs(gang.ranks) do
                if rank.leader then
                    break
                end
    
                ranks[index] = rank.label
            end

            for index, member in ipairs(gang.members) do
                if member.identifier == identifier then
                    if gang.identifier == identifier then
                        Menu.Button('RANK', Locale.MENU_MANAGEMENT_RANK, gang.ranks[#gang.ranks].label, false)
                        Menu.CheckButton('ACCESS', Locale.MENU_MANAGEMENT_PERM, true, false)
                        Menu.Button('LEAD', Locale.MENU_MANAGEMENT_SHIP, nil, false)
                        Menu.Button('KICK', Locale.MENU_MANAGEMENT_KICK, nil, false)

                        if Config.RanksAccess then
                            for name, access in pairs(Config.RanksAccess) do
                                Menu.Button(name, access.label, access.icon, false)

                                if Menu.IsButtonHovered() then
                                    Menu.Tooltip(access.description)
                                end
                            end
                        else
                            if Config.GangRanks then
                                Menu.CheckButton('ACCESS', Locale.MENU_MANAGEMENT_PERM, true, false)
                            end
                        end
                    else
                        local pressed, rank = Menu.ComboButton('RANK', Locale.MENU_MANAGEMENT_RANK, ranks, nil, true)

                        if Menu.IsButtonSelected() then
                            TriggerServerEvent('rcore_gangs:server:set_rank', identifier, rank, id)

                            Menu.CloseMenu()
                        end

                        if Menu.Button('LEAD', Locale.MENU_MANAGEMENT_SHIP, nil, true) then
                            TriggerServerEvent('rcore_gangs:server:set_leader', identifier, id)

                            Menu.CloseMenu()
                        end

                        if Menu.Button('KICK', Locale.MENU_MANAGEMENT_KICK, nil, true) then
                            TriggerServerEvent('rcore_gangs:server:kick_member', identifier, id)

                            Menu.CloseMenu()
                        end

                        if Config.RanksAccess then
                            for access in pairs(gang.ranks[rank].access) do
                                if Config.RanksAccess[access] then
                                    Menu.Button(access, Config.RanksAccess[access].label, Config.RanksAccess[access].icon, false)
    
                                    if Menu.IsButtonHovered() then
                                        Menu.Tooltip(Config.RanksAccess[access].description)
                                    end
                                end
                            end
                        else
                            if Config.GangRanks then
                                Menu.CheckButton('ACCESS', Locale.MENU_MANAGEMENT_PERM, Config.GangRanks[rank].access, Config.GangRanks[rank].access)
                            end
                        end
                    end
                end
            end
        end

        if menu == 'SUBAMENU_MEMBER_MANAGE' then
            local value = Menu.CurrentValue()

            local id = string.gsub(value, '%D', '')
            local id = tonumber(id)

            local gang = gangs[id]

            local pressed, player = Menu.InputButton('PLAYER', Locale.MENU_MEMBER_PLAYER, Locale.MENU_MEMBER_PLAYER_TEXT, nil, 4, true)

            if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
                player = player ~= Locale.MENU_TEXT_NONE and player or nil

                TriggerServerEvent('rcore_gangs:server:add_member', tonumber(player), id)

                Menu.CloseMenu()
            end

            if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
                Menu.CloseMenu()
            end
        end

        if menu == 'SUBAMENU_MEMBERS' then
            local value = Menu.CurrentValue()

            local id = string.gsub(value, '%D', '')
            local id = tonumber(id)

            local gang = gangs[id]
            
            if Menu.MenuButton('MEMBER' .. id, 'SUBAMENU_MEMBER_MANAGE', Locale.MENU_MEMBER_NEW, #gang.members <= Config.GangOptions.maxMembers) then
                Menu.SetTitle('SUBAMENU_MEMBER_MANAGE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_MEMBER_MANAGE', Locale.MENU_MEMBER_NEW)
            end

            for index, member in ipairs(gang.members) do
                if Menu.MenuButton(member.identifier .. '.' .. id, 'SUBAMENU_MEMBER', member.name, true) then
                    Menu.SetTitle('SUBAMENU_MEMBER', Locale.MENU_ADMIN_TITLE)
                    Menu.SetSubTitle('SUBAMENU_MEMBER', member.name .. ' ' .. '(' .. member.rank .. ')')
                end
            end
        end

        if menu == 'SUBAMENU_GARAGE' then
            local value = Menu.CurrentValue()

            local id = string.gsub(value, '%D', '')
            local id = tonumber(id)

            local gang = gangs[id]

            if Menu.MenuButton('VEHICLE' .. id, 'SUBAMENU_GARAGE_LIST', Locale.MENU_GARAGE_INSERT1, true) then
                Menu.SetTitle('SUBAMENU_GARAGE_LIST', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_GARAGE_LIST', Locale.MENU_GARAGE_CATALOG)
            end

            if gang.vehicles then
                local vehicles = 0

                for index, vehicle in ipairs(gang.vehicles) do
                    local id = vehicle.model .. '.' .. vehicle.color .. '_' .. id

                    if Config.GarageVehicles[vehicle.model] then
                        vehicles += 1

                        if Menu.MenuButton(id, 'SUBAMENU_GARAGE_REMOVE', Config.GarageVehicles[vehicle.model].label, true) then
                            Menu.SetTitle('SUBAMENU_GARAGE_REMOVE', Locale.MENU_ADMIN_TITLE)
                            Menu.SetSubTitle('SUBAMENU_GARAGE_REMOVE', Config.GarageVehicles[vehicle.model].label)
                        end
                    end
                end

                if vehicles == 0 then
                    Menu.Button('EMPTY', Locale.MENU_GARAGE_EMPTY, nil, false)
                end
            end
        end

        if menu == 'SUBAMENU_GARAGE_LIST' then
            local value = Menu.CurrentValue()

            local id = string.gsub(value, '%D', '')

            for model, vehicle in pairs(Config.GarageVehicles) do
                if IsModelInCdimage(model) then
                    if Menu.MenuButton(model .. '_' .. id, 'SUBAMENU_GARAGE_INSERT', vehicle.label, true) then
                        Menu.SetTitle('SUBAMENU_GARAGE_INSERT', Locale.MENU_ADMIN_TITLE)
                        Menu.SetSubTitle('SUBAMENU_GARAGE_INSERT', vehicle.label)
                    end
                end
            end
        end

        if menu == 'SUBAMENU_GARAGE_INSERT' then
            local value = Menu.CurrentValue()

            local vehicleModel = value:sub(1, value:find('_') - 1)
            local vehicleModel = tonumber(vehicleModel)

            local vehicleColor = 0

            local id = value:sub(value:find('_') + 1, value:len())
            local id = tonumber(id)

            local gang = gangs[id]
            local vehicle = Config.GarageVehicles[vehicleModel]

            showcase = true

            if Config.GangOptions.restrictColors then
                local pressed = Menu.Button('CLASS', Locale.MENU_GARAGE_CLASS, Config.VehicleColorClasses[Config.VehicleColorClasses[gang.color]], nil, false)
                local pressed, color = Menu.ComboButton('COLOR', Locale.MENU_GARAGE_COLOR, Config.VehicleColors[Config.VehicleColorClasses[gang.color]], nil, true)
    
                vehicleColor = Config.VehicleColors[gang.color:lower()][color].index
            else
                local pressed, class = Menu.ComboButton('CLASS', Locale.MENU_GARAGE_CLASS, Config.VehicleColorClasses, nil, true)
                local pressed, color = Menu.ComboButton('COLOR', Locale.MENU_GARAGE_COLOR, Config.VehicleColors[class], nil, true)
    
                vehicleColor = Config.VehicleColors[Config.VehicleColorClasses[class]:lower()][color].index
            end

            if DoesEntityExist(ShowcaseVehicle) then
                SetVehicleColours(ShowcaseVehicle, vehicleColor, vehicleColor)
    
                DisableControlAction(0, 63, true) -- Vehicle Steer Left
                DisableControlAction(0, 64, true) -- Vehicle Steer Right
                DisableControlAction(0, 71, true) -- Vehicle Forward
                DisableControlAction(0, 72, true) -- Vehicle Reverse
            else
                ShowcaseVehicle = CreateShowcaseVehicle(vehicleModel, vehicleColor)
            end

            if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
                if ShowcaseVehicle > 0 then
                    DeleteEntity(ShowcaseVehicle)
                end
    
                ShowcaseVehicle = 0
    
                TriggerServerEvent('rcore_gangs:server:purchase_vehicle', vehicleModel, vehicleColor, id)
    
                Menu.CloseMenu()
            end
    
            if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
                if ShowcaseVehicle > 0 then
                    DeleteEntity(ShowcaseVehicle)
                end
    
                ShowcaseVehicle = 0
    
                Menu.CloseMenu()
            end
        end

        if menu == 'SUBAMENU_GARAGE_REMOVE' then
            local value = Menu.CurrentValue()

            local model = tonumber(value:sub(1, value:find('%.') - 1))
            local color = tonumber(value:sub(value:find('%.') + 1, value:find('_') - 1))

            local id = tonumber(value:sub(value:find('_') + 1, value:len()))

            showcase = true

            if DoesEntityExist(ShowcaseVehicle) then
                DisableControlAction(0, 63, true) -- Vehicle Steer Left
                DisableControlAction(0, 64, true) -- Vehicle Steer Right
                DisableControlAction(0, 71, true) -- Vehicle Forward
                DisableControlAction(0, 72, true) -- Vehicle Reverse
            else
                ShowcaseVehicle = CreateShowcaseVehicle(model, color)
            end

            if Menu.Button('ACCEPT', Locale.MENU_GARAGE_REMOVE2, nil, true) then
                if ShowcaseVehicle > 0 then
                    DeleteEntity(ShowcaseVehicle)
                end
    
                ShowcaseVehicle = 0
    
                TriggerServerEvent('rcore_gangs:server:remove_vehicle', model, color, id)
    
                Menu.CloseMenu()
            end
    
            if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
                if ShowcaseVehicle > 0 then
                    DeleteEntity(ShowcaseVehicle)
                end
    
                ShowcaseVehicle = 0
    
                Menu.CloseMenu()
            end
        end

        if menu == 'SUBAMENU_RESERVE' then
            local value = Menu.CurrentValue()

            local id = string.gsub(value, '%D', '')
            local id = tonumber(id)

            local gang = gangs[id]

            Menu.Button('BALANCE', Locale.MENU_RESERVE_BALANCE, FormatMoney(gang.balance), true)

            local pressed, amount = Menu.InputButton('AMOUNT', Locale.MENU_RESERVE_AMOUNT, Locale.MENU_RESERVE_AMOUNT_TEXT, nil, 10, true)

            local amount = tonumber(amount)

            if amount and amount > 0 then
                if Menu.Button('TAKE', Locale.MENU_RESERVE_INSERT, FormatMoney(amount), true) then
                    TriggerServerEvent('rcore_gangs:server:give_balance', amount, id)

                    Menu.CloseMenu()
                end
    
                if Menu.Button('GIVE', Locale.MENU_RESERVE_REMOVE, FormatMoney(amount), true) then
                    TriggerServerEvent('rcore_gangs:server:take_balance', amount, id)

                    Menu.CloseMenu()
                end
            end
        end

        if menu == 'SUBAMENU_CHECKPOINTS' then
            local value = Menu.CurrentValue()

            local id = string.gsub(value, '%D', '')

            if Menu.MenuButton('GARAGE' .. id, 'SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_CHECKPOINT_GARAGE, true) then
                Menu.SetTitle('SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_CHECKPOINT_GARAGE)
            end
    
            if Menu.MenuButton('STORAGE' .. id, 'SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_CHECKPOINT_STORAGE, true) then
                Menu.SetTitle('SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_CHECKPOINT_STORAGE)
            end

            if Menu.MenuButton('RESERVE' .. id, 'SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_CHECKPOINT_RESERVE, true) then
                Menu.SetTitle('SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_ADMIN_TITLE)
                Menu.SetSubTitle('SUBAMENU_CHECKPOINTS_MANAGE', Locale.MENU_CHECKPOINT_RESERVE)
            end
        end

        if menu == 'SUBAMENU_CHECKPOINTS_MANAGE' then
            local value = Menu.CurrentValue()

            local id = string.gsub(value, '%D', '')
            local checkpoint = string.gsub(value, '%d', '')
    
            if checkpoint == 'GARAGE' then
                id = tonumber(id)

                local gang = gangs[id]

                if gang.garage then
                    if Menu.Button('CHECKPOINT', Locale.MENU_CHECKPOINT_REMOVE, nil, true) then
                        TriggerServerEvent('rcore_gangs:server:delete_checkpoint', checkpoint, id)
    
                        Menu.CloseMenu()
                    end

                    if Menu.IsButtonHovered() then
                        local color = Config.GangMenuColors[gang.color].background

                        local x, y, z in gang.garage

                        Draw3dText(x, y, z + 0.05, Locale('CHECKPOINT_INTERACT_GARAGE', { color = Config.ColorToTextColor[gang.color] }))
                        DrawMarker(2, x, y, z - 0.15, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.25, 0.25, color[1], color[2], color[3], 196, false, true, 2, nil, nil, false)
                    end
                else
                    if Menu.Button('CHECKPOINT', Locale.MENU_CHECKPOINT_PLACE, nil, true) then
                        TriggerServerEvent('rcore_gangs:server:insert_checkpoint', checkpoint, id)
    
                        Menu.CloseMenu()
                    end
                end
            end
    
            if checkpoint == 'STORAGE' then
                id = tonumber(id)

                local gang = gangs[id]

                if gang.storage then
                    if Menu.Button('CHECKPOINT', Locale.MENU_CHECKPOINT_REMOVE, nil, true) then
                        TriggerServerEvent('rcore_gangs:server:delete_checkpoint', checkpoint, id)
    
                        Menu.CloseMenu()
                    end

                    if Menu.IsButtonHovered() then
                        local color = Config.GangMenuColors[gang.color].background

                        local x, y, z in gang.storage

                        Draw3dText(x, y, z + 0.05, Locale('CHECKPOINT_INTERACT_STORAGE', { color = Config.ColorToTextColor[gang.color] }))
                        DrawMarker(2, x, y, z - 0.15, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.25, 0.25, color[1], color[2], color[3], 196, false, true, 2, nil, nil, false)
                    end
                else
                    if Menu.Button('CHECKPOINT', Locale.MENU_CHECKPOINT_PLACE, nil, true) then
                        TriggerServerEvent('rcore_gangs:server:insert_checkpoint', checkpoint, id)
    
                        Menu.CloseMenu()
                    end
                end
            end

            if checkpoint == 'RESERVE' then
                id = tonumber(id)

                local gang = gangs[id]

                if gang.reserve then
                    if Menu.Button('CHECKPOINT', Locale.MENU_CHECKPOINT_REMOVE, nil, true) then
                        TriggerServerEvent('rcore_gangs:server:delete_checkpoint', checkpoint, id)
    
                        Menu.CloseMenu()
                    end

                    if Menu.IsButtonHovered() then
                        local color = Config.GangMenuColors[gang.color].background

                        local x, y, z in gang.reserve

                        Draw3dText(x, y, z + 0.05, Locale('CHECKPOINT_INTERACT_RESERVE', { color = Config.ColorToTextColor[gang.color] }))
                        DrawMarker(2, x, y, z - 0.15, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.25, 0.25, color[1], color[2], color[3], 196, false, true, 2, nil, nil, false)
                    end
                else
                    if Menu.Button('CHECKPOINT', Locale.MENU_CHECKPOINT_PLACE, nil, true) then
                        TriggerServerEvent('rcore_gangs:server:insert_checkpoint', checkpoint, id)
    
                        Menu.CloseMenu()
                    end
                end
            end
        end

        if menu == 'SUBAMENU_DELETE' then
            local value = Menu.CurrentValue()

            if Menu.Button('ACCEPT', Locale.MENU_BUTTON_CONFIRM, nil, true) then
                value = string.gsub(value, '%D', '')

                TriggerServerEvent('rcore_gangs:server:delete_gang', tonumber(value))
    
                Menu.CloseMenu()
            end
    
            if Menu.Button('REJECT', Locale.MENU_BUTTON_CANCEL, nil, true) then
                Menu.CloseMenu()
            end
        end

        if not showcase then
            if ShowcaseVehicle > 0 then
                DeleteEntity(ShowcaseVehicle)
            end
    
            ShowcaseVehicle = 0
        end
    end

    if ShowcaseVehicle > 0 then
        DeleteEntity(ShowcaseVehicle)
    end

    ShowcaseVehicle = 0
end)