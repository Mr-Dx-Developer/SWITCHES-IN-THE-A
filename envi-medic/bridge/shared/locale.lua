---@type { [string]: string }
local locale = {}

Citizen.CreateThreadNow(function()
    local locales = json.decode(LoadResourceFile(Bridge.Resource, ('locales/%s.json'):format(Bridge.Locale)))

    if not locales then
        if Bridge.DebugMode then warn(('failed to load locales/%s.json'):format(Bridge.Locale)) end
        return
    end

    for k, v in pairs(locales) do
        locale[k] = v
    end
end)

Framework.Locale = function (key, params)
    local locstr = locale[key]

    if locstr then
        local result = locstr:gsub('{(.-)}', function(found)
            return params[found]
        end)
        return result
    end

    return key
end

Framework.Locales = function ()
    return locale
end
