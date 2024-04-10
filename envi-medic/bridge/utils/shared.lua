Framework.Round = function(value, decimals)
    if not decimals then return math.floor(value + 0.5) end
    local power = 10 ^ decimals
    return math.floor((value * power) + 0.5) / (power)
end

Framework.FirstToUpper = function(str)
    return (str:gsub("^%l", string.upper))
end

Framework.RandomString = function(num)
    local str = {} 
    for i = 1, num do
        local randomChar = math.random(0, 1) == 0 and math.random(65, 90) or math.random(97, 122)
        str[i] = string.char(randomChar)
    end
    return table.concat(str)
end

Framework.RandomInteger = function(num)
    local int = {}
    for i = 1, num do
        int[i] = string.char(math.random(48, 57))
    end
    return table.concat(int)
end
