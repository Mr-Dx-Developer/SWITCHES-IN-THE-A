Config.Installment = {
    enable              = true,      -- Enable or Disable house rent system
    downPayment         = 30,        -- 30% downpayment
    interest            = 3,         -- 3% interest
    returnFundOnCancle  = 20,        -- 20% return if player cancel agreement
    numberOfInstallment = {minimum = 5, maximum = 10}, --Set number of installments that realstate agent can set
    paymentInterval     = 7,         -- 7 days
    kickAfter           = 3,         -- Kick player from the house if he/she fail to pay 3 payments
}

--[[
Note: Scrit will take money from player bank. May go to negative if not enough balance.
If player faild to keep balance in back for the 3rd time, he will be kicked from the house.
]]