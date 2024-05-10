
function DbAddScore(identifier)
    local curScore = DbGetScore(identifier)

    if curScore then
        MySQL.Sync.execute('UPDATE basketball_rpg SET score=score+1 WHERE identifier=@ident', {
            ['@ident'] = identifier
        })
    else
        MySQL.Sync.insert([[
            INSERT INTO basketball_rpg (`identifier`, `score`) VALUES (@ident, 1)
        ]], {
            ['@ident'] = identifier,
        })
    end
end

function DbGetScore(identifier)
    local score = MySQL.Sync.fetchAll(
        'SELECT * FROM basketball_rpg WHERE identifier=@ident', 
        {
            ['@ident'] = identifier
        }
    )

    if score and score[1] then
        return score[1].score
    end

    return nil
end
