Locales = {}

-- Debug print
function Debug(...)
    if Config.Debug then
        print("[rcore_drunk]", ...)
    end
end

-- this is for translation
function _U(str, ...)
    if type(Locales) ~= "table" then
        return string.format("[%s] the locales is wrong type, it is not a table..", GetCurrentResourceName())
    end
    if not Locales[Config.Locale] then
        return string.format("[%s] The language does not exists: %s", GetCurrentResourceName(), Config.Locale)
    end
    if not Locales[Config.Locale][str] then
        return string.format("[%s] There isnt such [%s] translation", GetCurrentResourceName(), str)
    end
    return string.format(Locales[Config.Locale][str], ...)
end

-- trigger name
function TriggerName(name)
    return string.format('%s:%s', GetCurrentResourceName(), name)
end

--- Just "better label" for getting random number between 0-100
function GetRandomPercentage()
    return math.random(100)
end

function GetDrinkDataByName(drunkName)
    for k,v in pairs(Config.DrunkList) do
        if v.name == drunkName then
            return v
        end
    end
    error(("Drink by name %s doesnt exists someone might be trying to abuse this event!"):format(drunkName))
end