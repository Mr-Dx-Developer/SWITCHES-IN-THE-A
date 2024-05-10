---@generic T
---@param tbl T
---@return T
---Creates a deep copy of a table, including all nested tables and their contents
table.deepclone = function(tbl)
    tbl = table.clone(tbl)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            tbl[k] = table.deepclone(v)
        end
    end
    return tbl
end

---@param tbl1 any
---@param tbl2 any
---@return boolean
---Compares if two values are equal, iterating over tables and matching both keys and values.
table.matches = function(tbl1, tbl2)
    local type1, type2 = type(tbl1), type(tbl2)

    if type1 ~= type2 then return false end
    if type1 ~= 'table' and type2 ~= 'table' then return tbl1 == tbl2 end

    for k1, v1 in pairs(tbl1) do
        local v2 = tbl2[k1]
        if v2 == nil or not table.matches(v1, v2) then return false end
    end

    for k2, v2 in pairs(tbl2) do
        local v1 = tbl1[k2]
        if v1 == nil or not table.matches(v1, v2) then return false end
    end

    return true
end

---@param tbl1 any
---@param tbl2 any
---@return boolean
---Merges tow tables together
table.merge = function(tbl1, tbl2)
    for k, v in pairs(tbl2) do
        local type1 = type(tbl1[k])
        local type2 = type(v)

        if type1 == 'table' and type2 == 'table' then
            table.merge(tbl1[k], v)
        elseif type1 == 'number' and type2 == 'number' then
            tbl1[k] += v
        else
            tbl1[k] = v
        end
    end

    return tbl1
end
