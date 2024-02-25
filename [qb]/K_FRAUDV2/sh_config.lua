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



function getCore()
    if IsDuplicityVersion() then
        ESX = exports['es_extended']:getSharedObject() 
        return ESX
    end
end