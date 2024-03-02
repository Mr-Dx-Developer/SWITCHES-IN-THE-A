IsResourceLoaded('ox_core', function(state, func)
    if state then
        AddEventHandler('ox:playerLoaded', function(source)
            InternalCharacterLoaded(source)
        end)

        Bridge.GetPlayer = function(source)
            local charData = Ox.GetPlayer(source)
    
            return {
                name = charData.name,
                firstname = charData.firstname,
                lastname = charData.lastname,
                charid = charData.charid,
            }
        end
    
        local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
        local import = LoadResourceFile('ox_core', file)
        local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
        chunk()

        shared.framework = 'OX'
    end
end)