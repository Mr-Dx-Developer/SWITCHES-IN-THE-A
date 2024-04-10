cache = {}

---Cache Set
---@param key string
---@param value any
cache.set = function(key, value)
    if value == cache[key] then return end
    cache[key] = value
end

---Cache Get
---@param key string
cache.get = function(key)
    return cache[key]
end