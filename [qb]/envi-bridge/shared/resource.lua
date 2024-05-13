resource = {}

---Resource Version
---@param name string
resource.version = function(name)
    local version = GetResourceMetadata(name, 'version', 0)
    return version
end

---Resource Missing
---@param name string
resource.missing = function(name)
    if not cache.get(name) then cache.set(name, GetResourceState(name) == 'missing') end
    return cache.get(name)
end