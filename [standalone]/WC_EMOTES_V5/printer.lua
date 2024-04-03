print("WC EMOTES V5 | Discord: https://discord.gg/cUxnazUxqU")

SetTimeout( 1000, function ()
    if GetResourceState('dpemotes') == 'started' then
        for i = 1, 10 do
            print("RpEmotes: Warning! dpemotes is on the server, this WILL cause issues.")
        end
    end
end)
