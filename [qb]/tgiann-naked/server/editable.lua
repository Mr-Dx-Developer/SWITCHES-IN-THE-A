function setNewPenis()
    math.randomseed(GetGameTimer())
    local randomPenis = math.random(1, #config.penisCm)
    if randomPenis == 6 then                -- 19cm
        if math.random(1, 100) < 90 then
            randomPenis = math.random(2, 3) -- 9-12cm
        end
    elseif randomPenis == 5 then            -- 16cm
        if math.random(1, 100) < 75 then
            randomPenis = math.random(2, 3) -- 9-12cm
        end
    elseif randomPenis == 4 then            -- 14cm
        if math.random(1, 100) < 85 then
            randomPenis = math.random(2, 3) -- 9-12cm
        end
    elseif randomPenis == 1 then            -- 5cm
        if math.random(1, 100) < 85 then
            randomPenis = math.random(2, 3) -- 9-12cm
        end
    end

    return config.penisCm[randomPenis]
end

function canUse(src, xPlayer) --it works when you use the unclothe command(server)
    return true
end
