lib.callback.register("um-multicharacter:server:getSkin", function(_, cid)
    local skinQuery = nil
    local model, skin = nil, nil

    if Config.SkinTable == 'playerskins' then
        skinQuery = MySQL.single.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {cid, 1})
    else
        skinQuery = MySQL.single.await('SELECT skin FROM players WHERE citizenid = ?', {cid})
    end

    if skinQuery ~= nil then
        if Config.SkinTable == 'playerskins' then
            model = skinQuery.model
            skin = json.decode(skinQuery.skin)
        else
            skin = json.decode(skinQuery.skin)
            model = skin.model
        end
    end

    return model, skin
end)