Strings = {}

Strings.Notify = {
    lostItem = 'You lost track of the item and move on',
    stopped = 'You stopped metal detecting',
    alreadyDigging = 'You are already digging',
    nothingToDig = 'There is nothing to dig for here',
    menuError = 'There was an error trying to open the menu',
    nothingToSell = 'You don\'t have anything on you worth anything',
    itemFound = {
        one = 'You found x',
        two = ' ',
        three = ' and earned ',
        four = 'XP'
    },
    levelUp = 'You just leveled up in metal detecting!',
    noMoney = 'You do not have enough money',
    noLevel = 'You do not have the required level for this metal detector',
    inVehicle = 'You can\'t do that',
    cantUse = 'You are not experienced enough to use this metal detector',
    cantDetect = 'You cannot metal detect in this area',
    notAuthorized = 'You are not authorized to do this'
}

Strings.TextUI = {
    shop = {
        label = 'E - Open Shop',
        icon = 'basket-shopping',
        bgColor = nil,
        textColor = nil
    },
    searching = {
        label = 'Searching..',
        icon = 'magnifying-glass',
        bgColor = '#FF9D47',
        textColor = 'white'
    },
    distance = {
        closeColor = '#40bf51',
        nearbyColor = '#FF9D47',
        farColor = '#FF5C5C',
        label = 'Distance: ',
        icon = 'location-dot',
        textColor = 'white'
    },
    dig = {
        label = 'Start Digging',
        icon = 'trowel',
        textColor = 'white'
    },
    error = {
        label = 'Error',
        icon = 'exclamation-triangle',
        bgColor = '#FF5C5C',
        textColor = 'white'
    }
}

Strings.Target = {
    shop = {
        icon = 'fas fa-shopping-basket',
        label = 'Open Shop',
    },
    distance = 2
}

Strings.ContextMenu = {
    detector_shop = { -- The shop a player buys their metal detector(s) from
        title = 'Metal Detecting',
        subtitle = ' | $',
        level1 = { -- Blue metal detector
            title = 'Beginner\'s Beacon',
            description = 'Ideal for novices, the Beginner\'s Beacon offers simplicity and reliability. Perfect for those just starting their treasure-hunting journey.',
            icon = 'https://i.ibb.co/6vSTNhG/blue-icon.png',
            image = 'https://i.ibb.co/LkwbVDv/GtdCALL.png',
            metadata = {
                radius = { label = 'Radius', value = '2.5/10', progress = 25 },
                depth = { label = 'Depth', value = '3/10', progress = 30 },
                accuracy = { label = 'Accuracy', value = '3.5/10', progress = 35 }
            }
        },
        level2 = { -- Green metal detector
            title = 'Lustrous Locator',
            description = 'Step up your game with the Lustrous Locator. Enhanced depth capabilities and better material differentiation make this the choice for ambitious explorers.',
            icon = 'https://i.ibb.co/KxBPMVp/green-icon.png',
            image = 'https://i.ibb.co/HT3vcCD/pPGgv3u.png',
            metadata = {
                radius = { label = 'Radius', value = '4.1/10', progress = 41 },
                depth = { label = 'Depth', value = '5/10', progress = 50 },
                accuracy = { label = 'Accuracy', value = '4.3/10', progress = 43 }
            }
        },
        level3 = { -- Red metal detector
            title = 'Treasure Trove Tracker',
            description = 'Unlock the secrets of the ground below. With superior sensitivity and advanced filtering, the Treasure Trove Tracker will lead you right to the riches.',
            icon = 'https://i.ibb.co/Qc64Y43/red-icon.png',
            image = 'https://i.ibb.co/4gJM9xv/9mG4of6.png',
            metadata = {
                radius = { label = 'Radius', value = '5.8/10', progress = 58 },
                depth = { label = 'Depth', value = '6.4/10', progress = 64 },
                accuracy = { label = 'Accuracy', value = '5.2/10', progress = 52 }
            }
        },
        level4 = { -- Orange metal detector
            title = 'Goldseeker\'s Grail',
            description = 'Specifically engineered for the adventurous. The Goldseeker\'s Grail has enhanced detection and refined tuning. No metal or relic escapes its grasp.',
            icon = 'https://i.ibb.co/6J8mBQV/orange-icon.png',
            image = 'https://i.ibb.co/sbyZCp6/4nsbqKS.png',
            metadata = {
                radius = { label = 'Radius', value = '7.5/10', progress = 75 },
                depth = { label = 'Depth', value = '8.5/10', progress = 85 },
                accuracy = { label = 'Accuracy', value = '7.2/10', progress = 72 }
            }
        },
        level5 = { -- Black metal detector
            title = 'Archaeo Ace',
            description = 'Crafted for the discerning professional. The Archaeo Ace boasts unmatched depth detection and intricate object analysis. Dive deeper and discover more.',
            icon = 'https://i.ibb.co/D1X8GNY/black-icon.png',
            image = 'https://i.ibb.co/GshvJXy/3sfO2ou.png',
            metadata = {
                radius = { label = 'Radius', value = '10/10', progress = 100 },
                depth = { label = 'Depth', value = '9.6/10', progress = 96 },
                accuracy = { label = 'Accuracy', value = '8.6/10', progress = 86 }
            }
        }
    },
    sell_shop = {
        title = 'Sell Shop',
        sellAll = {
            title = 'Sell All',
            description = 'Sell all the items you have on you',
            icon = 'fas fa-sack-dollar'
        },
        selectItem = {
            title = 'Select Item',
            description = 'Select which item(s) you want to sell',
            icon = 'fas fa-hand-pointer'
        },
        singleItem = {
            description = 'You have x',
            description2 = ' and they sell for $',
            description3 = ' each',
            icon = 'fas fa-dollar-sign'
        },
        shovel = {
            title = 'Buy Shovel',
            icon = 'fas fa-trowel'
        }
    },
    stats_menu = {
        title = 'Metal Detecting',
        colors = {
            red = 'red',
            yellow = 'yellow',
            green = 'green'
        },
        level = {
            title = 'Current Level',
            description = 'You are currently level ',
            description2 = '/5',
            icon = 'fas fa-ranking-star'
        },
        progress = {
            title = 'Current Progress',
            description = 'Progress towards next level: ',
            description2 = '%',
            icon = 'fas fa-bars-progress',
            metadata = {
                currentXP = {one = 'Current Experience', two = 'XP'},
                nextLevel = {one = 'Next Level In', two = 'XP'}
            }
        },
        itemsFound = {
            title = 'Items Found',
            description = 'You have found a total of ',
            description2 = ' items',
            icon = 'fas fa-person-digging'
        },
        moneyEarned = {
            title = 'Money Earned',
            description = 'You have earned a total of $',
            icon = 'fas fa-sack-dollar'
        }
    }
}

Strings.InputDialog = {
    title = 'Sell ',
    label = 'Quantity',
    description = 'How many do you want to sell? You have x',
    icon = 'hashtag'
}

Strings.AlertDialog = {
    selling = {
        header = '**Confirm**',
        content = 'You are about to sell everything for **$',
        content2 = '**.  \n Are you sure you want to continue?',
        cancel = 'Nevermind',
        confirm = 'Yes'
    },
    buyDetector = {
        content = 'This metal detector costs **$',
        content2 = '** and requires you are level **',
        content3 = '**. Do you want to continue?',
        cancel = 'Nevermind',
        confirm = 'Purchase'
    }
}

Strings.Logs = {
    colors = {
        green = 65280,
        red = 16711680,
        yellow = 16776960,
    },
    labels = {
        name = '**Player Name**: ',
        id = '\n **Player ID**: ',
        identifier = '\n **Identifier**: ',
        message = '\n **Message**: '
    },
    titles = {
        itemFound = '🔍 Item Found',
        itemSold = '💰 Item(s) Sold',
        levelUp = '✅ Level Up',
        detectorBuy = '💸 Detector Purchased'
    },
    messages = {
        itemFound = 'Has successfully found x',
        levelUp = 'Has successfully leveled up from level ',
        levelUp2 = ' to level ',
        itemSold = 'Has successfully sold x',
        itemSold2 = ' for $',
        bulkSold = 'Has successfully sold the following items: ',
        bulkSold2 = ' for a total of $',
        detectorBuy = 'Has successfully purchased a '
    }
}