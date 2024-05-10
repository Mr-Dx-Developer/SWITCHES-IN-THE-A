CreateThread(function()
    local URL <const> = 'https://raw.githubusercontent.com/ImTrase/versions/main/dealer.txt'
    local VERSION <const> = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

    PerformHttpRequest(URL, function(status, body)
        if body and status == 200 then
            body = body:match('%d%.%d+%.%d+')
            if VERSION < body then
                print(('^4[Trase_Dealer] ^3[INFO]^0: A new version is available. ^7(Current Version: ^1%s^7, Latest Version: ^2%s^7)'):format(VERSION, body))
            end
        end
    end, 'GET')
end)