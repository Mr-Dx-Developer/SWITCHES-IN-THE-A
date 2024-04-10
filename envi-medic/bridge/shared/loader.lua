local modules = {}

-- Override standard Lua module
module = module

---Module Loader
---@param path string
module = function(path)
    if path == nil then return end
    local module = modules[path]
    if not module then
        local resource = LoadResourceFile(Bridge.Resource, ('%s/%s.lua'):format('bridge', path))
        if resource then
            local module, err = load(resource, ('@@%s/%s'):format(Bridge.Resource, ('%s/%s'):format('bridge', path)))
            if not module or err then
                modules[path] = nil
                return error(err)
            end
            if Bridge.DebugMode then print(('[^2MODULE^0] ^5Loaded^0 %s'):format(path)) end
            modules[path] = module(path)
            return modules[path]
        end
    end
    return module
end

---Module Loader From Other Resources
---@param path string
include = function(resource, path)
    if path == nil then return end
    local module = modules[path]
    if not module then
        local resource = LoadResourceFile(resource, ('%s.lua'):format(path))
        if resource then
            local module, err = load(resource, ('@@%s'):format(resource, ('%s'):format(path)))
            if not module or err then
                modules[path] = nil
                return error(err)
            end
            if Bridge.DebugMode then print(('[^2IMPORT^0] ^5Loaded^0 %s'):format(path)) end
            modules[path] = module(path)
            return modules[path]
        end
    end
    return module
end

local OnReady = function(obj, cb)
    while not obj do
        Wait(50)
    end
    return cb and cb() or true
end

---@private
Framework.OnReady = setmetatable({
    await = OnReady
}, {
    __call = function(_, obj, cb)
        Citizen.CreateThreadNow(function() OnReady(obj, cb) end)
    end,
})