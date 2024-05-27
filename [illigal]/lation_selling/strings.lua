Strings = {}

Strings.Symbols = {
    dollar = '$',
    quantity = 'x',
    each = ' each'
}

Strings.Notify = {
    title = 'Drugs', -- All notification titles
    icon = 'fas fa-capsules', -- All notification icons
    position = 'top', -- All notification positions
    robbed = 'The buyer just robbed you and took the drugs!',
    gotAway = 'The thief got away with your drugs..',
    tooFar = 'You are too far away from the buyer',
    notEnoughPD = 'There is not enough Police in the city',
    blacklistModel = 'You cannot sell to this individual',
    daytime = 'I should probably wait until it gets dark out..',
    cooldownActive = 'You cannot sell this often - please try again',
    noVehicle = 'You cannot sell from inside your vehicle',
    rejections = { -- These messages are selected randomly when an NPC rejects a sale/calls the police
        'Are you kidding?! Get away from me',
        'I\'m calling the cops on you!',
        'People like you are the problem with this city.. goodbye',
        -- You can add more rejection messages here
    }
}

Strings.Context = {
    mainTitle = 'Drug Sales',
    drugDesc = 'You currently have ',
    metaBuyEach = 'Buyer will purchase for',
    metaBuyQuantity = 'Buyer wants a total of',
    metaTotal = 'Total sale is worth',
    cancelTitle = 'Nevermind',
    cancelDesc = 'Cancel the drug sale with this buyer',
    cancelIcon = 'fas fa-delete-left',
    cancelIconColor = '#FF4444' or ''
}

Strings.Target = {
    distance = 3, -- Distance for all targets
    sellDrugsLabel = 'Sell drugs',
    sellDrugsIcon = 'fas fa-capsules',
    takeDrugsLabel = 'Take drugs',
    takeDrugsIcon = 'fas fa-capsules'
}

Strings.TextUI = {
    position = 'left-center',
    icon = 'capsules',
    sellDrugs = 'E - Sell Drugs',
    collectDrugs = 'E - Take Drugs'
}

Strings.DiscordLogs = {
    colors = {
        green = 65280,
        red = 16711680
    },
    titles = {
        saleComplete = 'Sale Complete',
        playerRobbed = 'Player Robbed',
        returnedItems = 'Returned Items',
        potentialCheating = 'Potential Cheating'
    },
    messages = {
        saleComplete = {
            part1 = ' has successfully sold x',
            part2 = ' for $'
        },
        playerRobbed = ' was just robbed of x',
        returnedItems = ' has just recovered all of their recently stolen drugs',
        potentialCheating = {
            part1 = 'Player with the name: "',
            part2 = '" has triggered the drug selling event while outside a defined zone. This may or may not mean the player has attempted to cheat - investigate further yourself'
        }
    }
}