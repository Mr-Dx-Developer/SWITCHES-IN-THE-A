-- Shared Events

Framework = {
    Events = {
        -- Character
        loadedC = 'QBCore:Client:OnPlayerLoaded',
        loadedS = 'QBCore:Server:OnPlayerLoaded',
        loadedSP = 'QBCore:Server:PlayerLoaded',
        unload = 'QBCore:Server:OnPlayerUnload',

       -- House / Apartment
        house = 'qb-houses:client:LastLocationHouse',
        houseS = 'qb-houses:server:SetInsideMeta',
        apart = 'qb-apartments:client:LastLocationHouse',
        apartS = 'qb-apartments:server:SetInsideMeta',
        logout = 'qb-houses:server:LogoutLocation',
    }
}


-- Functions Shared [um-multicharacter\framework\custom.lua]

if not Config.ConvertQBoxLicense then

    function Framework:Core()
        QBCore = exports['qb-core']:GetCoreObject()
        return QBCore
    end

    function Framework:GetPlayerData()
        return QBCore.Functions.GetPlayerData() or Debug('GetPlayerData ?')
    end

    -- Functions Server [um-multicharacter\framework\custom.lua]
    if IsDuplicityVersion() then

        Debug('Framework Func() Start for Server')

        function Framework:GetPlayer(src)
            return QBCore.Functions.GetPlayer(src) or Debug('GetPlayer ?')
        end

        function Framework:GetIdentifier(src, type)
            return QBCore.Functions.GetIdentifier(src, type) or Debug('Getidentifier ?')
        end

        function Framework:GetLicense(src)
            return Framework:GetIdentifier(src, 'license') or Debug('GetLicense ?')
        end

        function Framework:GetPlayerQuery(src)
            return MySQL.query.await('SELECT * FROM players WHERE license = ? OR license = ?', {Framework:GetIdentifier(src, 'license'), Framework:GetIdentifier(src, 'license2')})
        end

        function Framework:Login(src, any, new)
            return QBCore.Player.Login(src, any, new) or Debug('Login ?')
        end

        function Framework:RefreshCommand(src)
            QBCore.Commands.Refresh(src)
            Debug('Refreshed Commands')
        end

    end

else

    -- Functions Shared [um-multicharacter\framework\custom.lua]

    function Framework:Core()
        QBX = exports.qbx_core
        return QBX
    end

    function Framework:GetPlayerData()
        return QBX:GetPlayerData() or Debug('GetPlayerData ?')
    end

    -- Functions Server [um-multicharacter\framework\custom.lua]
    if IsDuplicityVersion() then

        Debug('Framework Func() Start for Server')

        function Framework:GetPlayer(src)
            return QBX:GetPlayer(src) or Debug('GetPlayer ?')
        end

        function Framework:GetIdentifier(src, type)
            return GetPlayerIdentifierByType(src, type) or Debug('Getidentifier ?')
        end

        function Framework:GetLicense(src)
            return Framework:GetIdentifier(src, 'license2') or Debug('GetLicense ?')
        end

        function Framework:GetPlayerQuery(src)
            return MySQL.query.await('SELECT * FROM players WHERE license = ? OR license = ?', {Framework:GetIdentifier(src, 'license'), Framework:GetIdentifier(src, 'license2')})
        end

        function Framework:Login(src, any, new)
            return QBX:Login(src, any, new) or Debug('Login ?')
        end

        function Framework:RefreshCommand(src)
            Debug('Refreshed Commands')
        end

    end

end