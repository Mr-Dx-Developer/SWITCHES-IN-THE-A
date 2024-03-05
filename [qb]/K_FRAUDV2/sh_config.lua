KonfigSH = {}


KonfigSH.GeneratorItem = 'generator'
KonfigSH.LaptopItem = 'laptop2'
KonfigSH.SkimmerItem = 'skimmer'
KonfigSH.PrinterItem = 'printer'
KonfigSH.ClonedItem = 'clonedcard'
KonfigSH.BlankCardItem = 'blankcard'
KonfigSH.WhiteSlipItem = 'whiteslip'
KonfigSH.ForgedCheckItem = 'forgedcheck'
KonfigSH.InfoUSBItem = 'infousb'
KonfigSH.StolenCardItem = 'stolencard'

function GetQBVersion()
    local version = exports['qb-core']:GetCoreObject()
    return version
end
