Config.Rent = {
    enable              = true,      -- Enable or Disable house rent system
    minimumrent         = 500,
    maximumrent         = 15000,
    paymentInterval     = 7,          -- 7 days
    kickAfter           = 3,          -- Kick player from the house if he/she fail to pay 3 payments
}

--[[
Note: Scrit will take money from player bank. May go to negative if not enough balance.
If player faild to keep balance in back for the 3rd time, he will be kicked from the house.
]]