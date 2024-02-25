
KonfigSH = {}

KonfigSH.ForgedCheckItem = 'forgedcheck'

KonfigSH.Prices = {
    ['Generator'] = 5250,
    ['Skimmer'] = 5000,
    ['Printer'] = 100,
    ['Laptop'] = 5250,
    ['WhiteSlip'] = 50,
    ['StolenCard'] = 600,
    ['InfoUSB'] = 600,
    ['Blankcard'] = 400,
}



function getCore()
    local ESX = nil
    ESX = exports['es_extended']:getSharedObject()
    return ESX
end