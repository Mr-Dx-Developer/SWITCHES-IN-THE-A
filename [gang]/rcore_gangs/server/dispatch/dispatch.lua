if not Config.Dispatch or Config.Dispatch == 0 then
    -- Sends a dispatch to all police officers
    -- @param {number} source - The server identifier of the player who sold the drug
    -- @param {string} drug - The name of the drug that was sold
    -- @returns {nil}
    Dispatch = function(source, drug)
        -- If the dispatch you use is not supported by this script, place your code here
        print('^1[GANGS] Dispatch not recognized^7')
    end
end