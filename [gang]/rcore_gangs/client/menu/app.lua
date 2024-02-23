local menus = { }
local keys = { up = 188, down = 187, left = 189, right = 190, select = 191, back = 194 }

local tooltip = nil
local currentTooltip = nil

local currentKey = nil
local currentMenu = nil

local currentCount = 0

local currentValue = nil
local currentAction = nil

local currentStorage = {}

local blockInput = false

Menu = {}

local DisableControlAction = DisableControlAction

local function setMenuInfo(id, key, value)
    if not menus[id] then
        return
    end

    local menu = menus[id]

    menu[key] = value

    if currentMenu and currentMenu.id == id then
        SendNUIMessage({
            type = 'DISPLAY',
            action = 'INFO',

            title = menu.title,
            subtitle = menu.subtitle
        })
    end
end

local function setMenuStyle(id, key, value)
    if not menus[id] then
        return
    end

    local menu = menus[id]

    menu.style[key] = value

    if currentMenu and currentMenu.id == id then
        SendNUIMessage({
            type = 'DISPLAY',
            action = 'STYLE',

            style = menu.style
        })
    end
end

local function setMenuButton(id, title, subtitle, available)
    if not currentMenu then
        return
    end

    local buttons = currentMenu.buttons
    local identifiers = currentMenu.identifiers

    currentCount += 1

    local button = buttons[currentCount]

    if button then
        if button.id == id then
            if button.title ~= title or button.subtitle ~= subtitle or button.available ~= available then
                button.title = title
                button.subtitle = subtitle
                button.available = available

                SendNUIMessage({
                    type = 'UPDATE',
                    action = 'BUTTON',

                    index = currentCount - 1,
                    
                    title = title,
                    subtitle = subtitle,
                    available = available
                })
            end
        else
            if identifiers[id] then
                table.remove(buttons, currentCount)

                if currentMenu.button >= currentCount then
                    if currentMenu.button > 1 then
                        currentMenu.button -= 1
                    else
                        currentMenu.button = #currentMenu.buttons
                    end
                end

                currentCount -= 1
                identifiers[button.id] = nil

                SendNUIMessage({
                    type = 'DELETE',
                    action = 'BUTTON',
        
                    index = currentCount
                })
            else
                table.insert(buttons, currentCount, { id = id, title = title, subtitle = subtitle, available = available })

                if currentMenu.button >= currentCount then
                    if currentMenu.button < #currentMenu.buttons then
                        currentMenu.button += 1
                    else
                        currentMenu.button = 1
                    end
                end

                identifiers[id] = buttons[currentCount]

                SendNUIMessage({
                    type = 'CREATE',
                    action = 'BUTTON',
        
                    index = currentCount - 1,
        
                    title = title,
                    subtitle = subtitle,
                    available = available
                })
            end
        end
    else
        table.insert(buttons, currentCount, { id = id, title = title, subtitle = subtitle, available = available })

        identifiers[id] = buttons[currentCount]

        SendNUIMessage({
            type = 'CREATE',
            action = 'BUTTON',

            index = currentCount - 1,

            title = title,
            subtitle = subtitle,
            available = available
        })
    end

    return currentKey == keys.select and currentMenu.button == currentCount
end

local function setMenuTooltip(text)
    if not currentMenu then
        return
    end

    currentTooltip = { text = text }

    if tooltip then
        if tooltip.text ~= text then
            tooltip.text = text

            SendNUIMessage({
                type = 'DISPLAY',
                action = 'TEXT',

                display = true,
    
                text = tooltip.text,
            })
        end
    else
        tooltip = { text = text }

        SendNUIMessage({
            type = 'DISPLAY',
            action = 'TEXT',

            display = true,

            text = tooltip.text,
        })
    end
end

function Menu.CreateMenu(id, title, subtitle)
    local menu = { }

    menu.id = id
    menu.title = title
    menu.subtitle = subtitle

    menu.style = {}

    menu.button = 1
    menu.buttons = {}
    menu.identifiers = {}

    menus[id] = menu
end

function Menu.CreateSubMenu(id, parent, title, subtitle)
    if not menus[parent] then
        return
    end

    Menu.CreateMenu(id, title, subtitle)

    menus[id].parent = parent
end

function Menu.SetTitle(id, title)
    setMenuInfo(id, 'title', title)
end

function Menu.SetSubTitle(id, subtitle)
    setMenuInfo(id, 'subtitle', subtitle)
end

function Menu.SetTitleColor(id, color)
    setMenuStyle(id, 'titleColor', color)
end

function Menu.SetSubTitleColor(id, color)
    setMenuStyle(id, 'subtitleColor', color)
end

function Menu.SetTitleBackground(id, background)
    setMenuStyle(id, 'titleBackground', background)
end

function Menu.SetSubTitleBackground(id, background)
    setMenuStyle(id, 'subtitleBackground', background)
end

function Menu.CurrentMenu()
    return currentMenu and currentMenu.id or nil
end

function Menu.OpenMenu(id)
    if not menus[id] then
        return
    end

    PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

    currentKey = nil
    currentMenu = menus[id]

    currentMenu.button = 1
    currentMenu.buttons = {}
    currentMenu.identifiers = {}

    currentCount = 0

    currentStorage = {}

    SendNUIMessage({
        {
            type = 'READ',
            action = 'OPEN'
        },
        {
            type = 'DISPLAY',
            action = 'CLEAR'
        },
        {
            type = 'DISPLAY',
            action = 'INFO',

            display = true,

            title = currentMenu.title,
            subtitle = currentMenu.subtitle,
        },
        {
            type = 'DISPLAY',
            action = 'STYLE',

            display = true,

            style = currentMenu.style
        }
    })
end

function Menu.CloseMenu(id)
    if not currentMenu then
        return
    end

    PlaySoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

    currentMenu.button = 1
    currentMenu.buttons = {}
    currentMenu.identifiers = {}

    currentKey = nil
    currentMenu = nil

    currentCount = 0

    currentStorage = {}

    SendNUIMessage({
        {
            type = 'READ',
            action = 'CLOSE'
        },
        {
            type = 'DISPLAY',
            action = 'CLEAR'
        }
    })
end

function Menu.SwitchMenu(id)
    if not menus[id] then
        return
    end

    PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

    currentMenu.button = 1
    currentMenu.buttons = {}
    currentMenu.identifiers = {}

    currentKey = nil
    currentMenu = menus[id]

    currentCount = 0

    currentStorage = {}

    SendNUIMessage({
        {
            type = 'DISPLAY',
            action = 'CLEAR'
        },
        {
            type = 'DISPLAY',
            action = 'INFO',

            display = true,

            title = currentMenu.title,
            subtitle = currentMenu.subtitle,
        },
        {
            type = 'DISPLAY',
            action = 'STYLE',

            display = true,

            style = currentMenu.style
        }
    })
end

function Menu.Button(id, title, subtitle, available)
    if not currentMenu then
        return
    end

    local pressed = setMenuButton(id, title, subtitle, available)

    if pressed and available then
        if currentKey == keys.select then
            PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end
    end

    return pressed and available
end

function Menu.MenuButton(id, menu, title, available)
    if not currentMenu then
        return
    end

    local pressed = setMenuButton(id, title, '<i class="fa-solid fa-caret-down"></i>', available)

    if pressed and available then
        currentValue = id
        currentAction = menu
    end

    return pressed and available
end

function Menu.CheckButton(id, title, checked, available)
    if not currentMenu then
        return
    end

    if not currentStorage[id] then
        currentStorage[id] = false
    end

    if type(checked) == 'boolean' then
        currentStorage[id] = checked
    end

    local icon = nil

    if currentStorage[id] then
        icon = '<i class="fa-solid fa-square-check"></i>'
    else
        icon = '<i class="fa-solid fa-square"></i>'
    end

    local pressed = setMenuButton(id, title, icon, available)

    if pressed and available then
        if currentKey == keys.select then
            PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end

        currentStorage[id] = not currentStorage[id]
    end

    return pressed and available, currentStorage[id]
end

function Menu.ComboButton(id, title, options, index, available)
    if not currentMenu then
        return
    end

    if not currentStorage[id] then
        currentStorage[id] = 1
    end

    if type(index) == 'number' then
        currentStorage[id] = index
    end

    local count = #options

    if count < currentStorage[id] then
        currentStorage[id] = 1
    end

    local option = options[currentStorage[id]]

    local pressed = setMenuButton(id, title, '<i class="fa-solid fa-arrow-left"></i> ' .. option .. ' <i class="fa-solid fa-arrow-right"></i>', available)

    if pressed and available then
        if currentKey == keys.select then
            PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end

        return pressed and available, currentStorage[id]
    end

    if currentMenu.button == currentCount and currentKey == keys.left and available then
        PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

        if currentStorage[id] > 1 then
            currentStorage[id] -= 1
        else
            currentStorage[id] = count
        end

        return false, currentStorage[id]
    end

    if currentMenu.button == currentCount and currentKey == keys.right and available then
        PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

        if currentStorage[id] < count then
            currentStorage[id] += 1
        else
            currentStorage[id] = 1
        end

        return false, currentStorage[id]
    end

    return pressed and available, currentStorage[id]
end

function Menu.InputButton(id, title, label, text, length, available)
    if not currentMenu then
        return
    end

    if not currentStorage[id] then
        currentStorage[id] = Locale.MENU_TEXT_NONE
    end

    if type(text) == 'string' then
        currentStorage[id] = text
    end

    local pressed = setMenuButton(id, title, currentStorage[id], available)

    if pressed and available then
        if currentKey == keys.select then
            PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end

        AddTextEntry('FMMC_MPM_NA', label)

        DisplayOnscreenKeyboard(1, 'FMMC_MPM_NA', '', '', '', '', '', length)

        CreateThread(function()
            while true do
                Wait(0)

                DisableAllControlActions(0)

                blockInput = true

                local status = UpdateOnscreenKeyboard()

                if status == 1 then
                    currentStorage[id] = GetOnscreenKeyboardResult()

                    blockInput = false
                    return
                end

                if status == 2 then
                    currentStorage[id] = Locale.MENU_TEXT_NONE

                    blockInput = false
                    return
                end
            end
        end)
    end

    return pressed and available, currentStorage[id]
end

function Menu.Tooltip(text)
    if not currentMenu then
        return
    end

    setMenuTooltip(text)
end

function Menu.IsButtonHovered()
    if not currentMenu then
        return false
    end

    return currentMenu.button == currentCount
end

function Menu.IsButtonSelected()
    if not currentMenu then
        return false
    end

    return currentMenu.button == currentCount and currentKey == keys.select
end

function Menu.CurrentValue()
    return currentValue
end

function Menu.Display()
    if not currentMenu then
        return
    end

    Menu.SwitchMenu(currentAction)

    DisableControlAction(0, keys.up, true)
    DisableControlAction(0, keys.down, true)
    DisableControlAction(0, keys.left, true)
    DisableControlAction(0, keys.right, true)
    DisableControlAction(0, keys.select, true)
    DisableControlAction(0, keys.back, true)

    if not currentTooltip then
        if tooltip then
            SendNUIMessage({
                type = 'DISPLAY',
                action = 'TEXT',
    
                display = false,
            })
        end

        tooltip = nil
    end

    currentTooltip = nil

    currentKey = nil
    currentAction = nil

    if currentCount < #currentMenu.buttons then
        local currentButtons = {}

        for index = #currentMenu.buttons, currentCount + 1, -1 do
            currentMenu.identifiers[currentMenu.buttons[index].id] = nil

            table.remove(currentMenu.buttons, index)
            table.insert(currentButtons, {
                type = 'DELETE',
                action = 'BUTTON',

                index = index - 1
            })

            if currentMenu.button >= index then
                if currentMenu.button > 1 then
                    currentMenu.button -= 1
                else
                    currentMenu.button = #currentMenu.buttons
                end
            end
        end

        SendNUIMessage({ table.unpack(currentButtons) })
    end

    if not blockInput then
        if IsDisabledControlJustPressed(0, keys.up) then
            PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

            if #currentMenu.buttons > 0 then
                if currentMenu.button > 1 then
                    currentMenu.button -= 1
                else
                    currentMenu.button = #currentMenu.buttons
                end

                SendNUIMessage({
                    type = 'KEYPRESS',
                    action = 'UP'
                })
            end
        elseif IsDisabledControlJustPressed(0, keys.down) then
            PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

            if #currentMenu.buttons > 0 then
                if currentMenu.button < #currentMenu.buttons then
                    currentMenu.button += 1
                else
                    currentMenu.button = 1
                end

                SendNUIMessage({
                    type = 'KEYPRESS',
                    action = 'DOWN'
                })
            end
        elseif IsDisabledControlJustPressed(0, keys.left) then
            currentKey = keys.left
        elseif IsDisabledControlJustPressed(0, keys.right) then
            currentKey = keys.right
        elseif IsDisabledControlJustPressed(0, keys.select) then
            currentKey = keys.select
        elseif IsDisabledControlJustPressed(0, keys.back) then
            if menus[currentMenu.parent] then
                Menu.SwitchMenu(currentMenu.parent)
            else
                Menu.CloseMenu()
            end
        end
    end

    currentCount = 0
end