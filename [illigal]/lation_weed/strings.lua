-- All icon fields use the free FontAwesome icons, you can find more here: https://fontawesome.com/v5/search?o=r&m=free
Strings = {}

-- Notifications
Strings.Notify = {
    cached = 'This plant was harvested already',
    nothing = 'You didn\'t find anything of interest here',
    max = 'You already have a maximum of ' ..Config.MaxPlantCount.. ' plants',
    vehicle = 'Planting a seed inside a vehicle seems like a silly idea..',
    cant = 'You cannot plant here',
    missing = 'You are missing something required to roll this',
    buds = 'You do not have enough bud',
    pot = 'You are missing a pot to plant this in',
    broke = 'You broke the plant pot while harvesting',
    shovel = 'You do not have a shovel',
    water = 'You do not have a watering can',
    food = 'You do not have any fertilizer',
    shears = 'You do not have shears to harvest',
    error = 'You are busy - please try again',
    money = 'You do not have enough money',
    police = 'There are not enough police in the city',
    -- Admin menu related notifications
    added = 'All plants have been added to the map',
    oneAdd = 'Plant added to map',
    removed = 'All plants have been removed from the map',
    oneRemove = 'Plant removed from map',
    copied = 'Successfully copied to clipboard',
    gps = 'Your GPS has been successfully updated'
}

-- Targets
Strings.Target = {
    distance = 1.75,
    searchIcon = 'fas fa-cannabis',
    searchLabel = 'Search',
    plantIcon = 'fas fa-cannabis',
    plantLabel = 'Check status',
    rollIcon = 'fas fa-joint',
    rollLabel = 'Roll joints',
    shopIcon = 'fas fa-shopping-basket',
    shopLabel = 'Open shop',
    enterIcon = 'fas fa-right-to-bracket',
    enterLabel = 'Enter',
    exitIcon = 'fas fa-right-from-bracket',
    exitLabel = 'Exit'
}

-- Context menus
Strings.Menu = {
    plants = {
        title = 'Strain: ',
        thirst = 'Thirst',
        thirstDesc = 'Current thirst level - ',
        thirstDesc2 = '% (Click here to water)',
        thirstIcon = 'droplet',
        hunger = 'Hunger',
        hungerDesc = 'Current hunger level - ',
        hungerDesc2 = '% (Click here to feed)',
        hungerIcon = 'burger',
        growth = 'Growth',
        growthDesc = 'Current growth level - ',
        growthDesc2 = '%',
        growthIcon = 'seedling',
        quality = 'Quality',
        qualityDesc = 'Current quality level - ',
        qualityDesc2 = '%',
        qualityIcon = 'chart-simple',
        destroy = 'Destroy',
        destroyDesc = 'Irreversibly destroy this plant',
        destroyIcon = 'delete-left',
        destroyColor = '#FF5555',
        harvest = 'Harvest',
        harvestDesc = 'Harvesting is only available at 100% growth',
        harvestDesc2 = 'You can now harvest this plant',
        harvestIcon = 'trowel',
        -- Progress bar colors inside menu
        colors = {
            green = 'green',
            yellow = 'yellow',
            red = 'red'
        }
    },
    admin = {
        title = 'Plant Management',
        total = 'Total Plant Count',
        totalDesc = 'There are currently ',
        totalDesc2 = ' active plants',
        totalIcon = 'seedling',
        byID = 'View Plants by Plant ID',
        byIDTitle = 'Plants by ID',
        byIDDesc = 'View details of each plant by its ID',
        byIDIcon = 'hashtag',
        plantID = 'Plant ID: ',
        plantIDDesc = 'Click to view details',
        plantIDIcon = 'hashtag',
        byOwner = 'View Plants by Owner',
        byOwnerTitle = 'Plants by Owner',
        byOwnerDesc = 'View all plants grouped by their owners',
        byOwnerIcon = 'fingerprint',
        ownerTitle = 'Owner | Click to view plants ',
        ownerIcon = 'fingerprint',
        ofOwnerTitle = 'Plants of Owner',
        ofOwnerIcon = 'hashtag',
        delete = 'Delete Plant',
        deleteDesc = 'Irreversibly delete this plant',
        deleteIcon = 'delete-left',
        deleteColor = '#F96868',
        add = 'Add Blips to Map',
        addDesc = 'Display all plants as blips on the map',
        addIcon = 'map-pin',
        remove = 'Remove Blips from Map',
        removeDesc = 'Remove all plant blips from the map',
        removeIcon = 'eraser',
        addOne = 'Add to Map',
        addOneDesc = 'Create a blip for this plant',
        addOneIcon = 'map-pin',
        removeOne = 'Remove from Map',
        removeOneDesc = 'Remove the blip for this plant',
        removeOneIcon = 'eraser',
        gps = 'Set GPS to Plant',
        gpsDesc = 'Create a waypoint to the plant',
        gpsIcon = 'location-arrow',
        tele = 'Teleport to Plant',
        teleDesc = 'Teleport to the plant location',
        teleIcon = 'street-view',
        location = 'Location',
        locationDesc = 'Click to copy coordinates to clipboard',
        locationIcon = 'map-location-dot',
        online = 'Owner | ONLINE',
        onlineColor = '#7DD477',
        offline = 'Owner | OFFLINE',
        offlineColor = '#F96868',
        statusDesc = 'Click to copy identifer to clipboard',
        statusIcon = 'fingerprint',
    },
    roll = {
        title = 'Rolling Table',
        desc = 'You have ',
        desc2 = ' available'
    },
    shop = {
        title = 'Smoke on the Water',
        desc = 'Purchase ',
        desc2 = ' for $'
    }
}

-- Alert dialogs
Strings.Alert = {
    destroy = {
        title = '**Confirm**',
        body = 'You are about to irreversibly destroy this plant and receive nothing in return, *are you sure you want to continue?*'
    }
}

-- Input dialogs
Strings.Input = {
    roll = {
        title = 'Rolling Table',
        label = 'Quantity',
        desc = 'How many ',
        desc2 = '\'s do you want to roll?',
        icon = 'hashtag'
    },
    shop = {
        label = 'Quantity',
        desc = 'How many do you want to purchase?',
        icon = 'hashtag'
    }
}

-- TextUI
Strings.TextUI = {
    controls = {
        text = '**Controls**  \n **W**: Move Forward  \n **S**: Move Backward  \n **A**: Move Left  \n **D**: Move Right  \n **X**: Cancel  \n **Space**: Confirm',
        icon = 'hand'
    },
    search = {
        text = '**Weed Plant**  \n E - Search',
        icon = 'fas fa-cannabis'
    },
    plants = {
        text = '**Weed Plant**  \n E - Check status',
        icon = 'fas fa-cannabis'
    },
    shop = {
        text = '**Smoke on the Water**  \n E - Open Shop',
        icon = 'shopping-basket'
    },
    rolling = {
        text = '**Rolling Table**  \n E - Start Rolling',
        icon = 'joint'
    },
    lab = {
        enter = {
            text = '**Weed Lab**  \n E - Enter',
            icon = 'fas fa-right-to-bracket'
        },
        exit = {
            text = '**Weed Lab**  \n E - Exit',
            icon = 'fas fa-right-from-bracket'
        }
    }
}

-- Discord logs
Strings.Logs = {
    colors = {
        green = 65280,
        red = 16711680,
        yellow = 16776960,
    },
    titles = {
        seedsFound = '🔍 Seeds Found',
        seedPlanted = '🌿 Planted Seed',
        plantFed = '🍔 Plant Fed',
        plantWater = '🚰 Plant Watered',
        plantHarvested = '✅ Plant Harvested',
        plantDeleted = '❌ Plant Deleted',
        jointRolled = '🚬 Joint(s) Rolled',
        itemPurchased = '🛒 Item(s) Purchased'
    },
    messages = {
        playerName = '**Player Name**: ',
        playerID = '\n **Player ID**: ',
        playerIdent = '\n **Identifier**: ',
        message = '\n **Message**: ',
        coords = '\n **Coords**: ',
        plantID = '\n **Plant ID**: ',
        seedsFound = 'Successfully found x',
        seedPlanted = 'Successfully planted a ',
        seedPlanted2 = ' plant.',
        plantFed = 'Successfully fertilized a plant',
        plantWatered = 'Successfully watered a plant',
        plantHarvested = 'Successfully harvested a plant and received x',
        plantHarvested2 = ' and x',
        plantDeleted = 'Successfully deleted the plant',
        jointRolled = 'Successfully rolled x',
        itemPurchased = 'Successfully purchased x',
        itemPurchased2 = ' for $'
    }
}