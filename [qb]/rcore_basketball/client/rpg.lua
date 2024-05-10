TrickCanSpin = false
TrickCanBNR = false

if Config.TricksRPGProgression then
    RegisterNetEvent('rcore_basketball:setTrickAvailable', function(data)
        TrickCanSpin = data.TRICK_SPIN
        TrickCanBNR = data.TRICK_BNR
    end)
else
    TrickCanSpin = true
    TrickCanBNR = true

end