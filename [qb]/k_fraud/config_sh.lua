ConfigSH = {}


ConfigSH.WhiteCheckSalePrice = 10000
ConfigSH.BankCardPrice = 10000
ConfigSH.WhiteSlipPrice = 10000
ConfigSH.PrinterPrice = 10000
ConfigSH.LaptopPrice = 10000


function GetVersion()
    version = exports['qb-core']:GetCoreObject()
    return version
end