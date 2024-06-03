Locales = {}

function Locale(category, key)
      local lang = Locales[Config.Locale]
      if not lang or not lang[category] then return string.format("Locale Error: %s %s", category, key) end
      return lang[category][key] or key
end

exports('GetLocales', function()
      return Locales
end)
