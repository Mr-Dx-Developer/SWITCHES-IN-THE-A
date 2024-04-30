if not string.match(GetCurrentResourceName(), "maximum_housingprops") then print("Resource can not be started. Reason: Resource name changed") return end

local prop = nil
local propPosition = nil
local propRotation = nil
local hasSpawned = false

RegisterNetEvent('maximum_housingprops:client:spawnProp', function(objectId, propModel)
    local ped = PlayerPedId()    
    spawnAndPositionProp(objectId, propModel) 
end)

-- event handler to receive confirmation that prop position was saved
RegisterNetEvent('maximum_housingprops:client:propPositionSaved')
AddEventHandler('maximum_housingprops:client:propPositionSaved', function()
    if Config.Notify == "qb" then
        QBCore.Functions.Notify(Config.Locales["prop_saved"], 'success')
    elseif Config.Notify == "ox" then
        exports.ox_lib:notify({ title = '', description = Config.Locales["prop_saved"], type = "success", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, position = "top", })
    elseif Config.Notify == "chat" then 
        TriggerEvent('chat:addMessage', { args = { Config.Locales["prop_saved"] } })
    end
end)

RegisterNetEvent('maximum_housingprops:client:loadProps')
AddEventHandler('maximum_housingprops:client:loadProps', function(objectId, props)
    if Config.Debug then print('Props received from Server') end
    for i = 1, #props do
        local propData = props[i]
        local model = propData.model
        local x, y, z, heading = propData.x, propData.y, propData.z, propData.heading
        local propEntity = CreateObject(model, x, y, z, false, false, false)  
        
        while not DoesEntityExist(propEntity) do
            Wait(500)
        end

        SetEntityHeading(propEntity, heading)      
        NetworkRequestControlOfEntity(propEntity)
        SetEntityCoords(propEntity, x, y, z)
        FreezeEntityPosition(propEntity, true)

        ObjectList[objectId] = {
            id = objectId,
            object = propEntity,  -- Corrected to propEntity
            coords = vector3(x, y, z),
            heading = heading
        }
        local prop = propEntity
        TargetObject(prop)
    end
end)

RegisterNetEvent("maximum_housingprops:CheckPropData")
AddEventHandler("maximum_housingprops:CheckPropData", function(prop)
    if Config.Debug then print("[MAXIMUM] Emergency/LSPD Prop Spawned on Client. Entity ID: ".. tostring(prop)) end
    if Config.SaveProps then TriggerServerEvent("maximum_housingprops:server:DeleteProp", prop) end
end)

RegisterNetEvent("maximum_housingprops:client:DeleteProp")
AddEventHandler("maximum_housingprops:client:DeleteProp", function(prop)
    DeleteEntity(prop)
    ClearPedTasks(PlayerPedId())
end)


local insideStudio = false

local function CreateObjectId()
    local objectId = math.random(10000, 99999)
    return objectId
end

local function IsImageFileExists(file)
    local resource = GetCurrentResourceName()
    local exists = false

    if file and LoadResourceFile(resource, file) ~= nil then
        exists = true
    end

    return exists
end

function ShowSubMenu(options)
    exports.ox_lib:registerContext({
        id = 'submenu',
        title = "**" .. options.title .. "**",
        options = options.children,
        menu = "studioProps",
    })
    exports.ox_lib:showContext('submenu')
end

function StudioProps()
    if Config.UseZones then
        if not insideStudio then 
            if Config.Notify == "qb" then
                QBCore.Functions.Notify(Config.Locales["not_in_zone"], 'error')
            elseif Config.Notify == "ox" then
                exports.ox_lib:notify({ title = '', description = Config.Locales["not_in_zone"], type = "error", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, position = "top", })
            elseif Config.Notify == "chat" then 
                TriggerEvent('chat:addMessage', { args = { Config.Locales["not_in_zone"] } })
            end
            return 
        end
    end

    local studioProps = {}

    for propType, models in pairs(Props) do
        local submenu = {}
        for _, model in ipairs(models) do
            local currentResource = GetCurrentResourceName()
            local image

            -- Construct the image file path
            local imagePath = "html/images/" .. string.lower(model.model) .. ".png"
        
            -- Check if the image file exists, if not, use a default image URL
            if IsImageFileExists(imagePath) then
                image = "nui://" .. currentResource .. "/" .. imagePath
            else
                image = "nui://" .. currentResource .. "/html/images/undefined.png" -- Replace "default_image.png" with default image URL
            end

            submenu[#submenu + 1] = {
                title = string.upper(model.label),
                description = model.desc,
                icon = model.icon,
                image = image,
                arrow = true,
                onSelect = function()
                    local objectId = CreateObjectId()
                    local propModel = model.model
                    spawnAndPositionProp(objectId, propModel)
                end,
            }
        end

        studioProps[#studioProps + 1] = {
            title = string.upper(propType),
            icon = "camera",
            arrow = true,
            children = submenu,
            onSelect = function()
                ShowSubMenu({
                    title = string.upper(propType),
                    children = submenu
                })
            end
        }
    end

    exports.ox_lib:registerContext({
        id = 'studioProps',
        title = Config.Locales["menu_header"],
        options = studioProps
    })

    exports.ox_lib:showContext('studioProps')
end

local function StudioZones()
    function onEnter(self)
        InStudio()
        insideStudio = true
    end
    
    function onExit(self)
        OutStudio()
        insideStudio = false
    end
    
    function inside(self)
        if Config.Debug then
            print('You are inside zone ' .. self.id)
        end
    end
    
    for locationName, locationData in pairs(Config.Locations) do
        local points = {}
        for _, pointData in ipairs(locationData.Zone) do
            table.insert(points, vec(pointData.x, pointData.y, pointData.z))
        end
    
        local zoneName = "studio_" .. locationName
    
        local poly = lib.zones.poly({
            points = points,
            thickness = locationData.thickness,
            debug = Config.Debug,  -- Set this to true to see the zone boundaries
            inside = inside,
            onEnter = onEnter,
            onExit = onExit,
            id = zoneName  -- assuming you want to associate a unique id with each zone
        })
    end    
end

RegisterNetEvent("maximum_housingprops:Init")
AddEventHandler("maximum_housingprops:Init", function()
    StudioZones()
end)