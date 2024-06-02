tgiCore.skillCheck = function(time, easy)
    if config.oxlib then
        local dif = "easy"
        if time < 2000 then
            dif = "hard"
        elseif time < 5000 then
            dif = "medium"
        end
        return lib.skillCheck({dif})
    else
        return exports["tgiann-skillbar"]:taskBar(6500, true)
    end
end
