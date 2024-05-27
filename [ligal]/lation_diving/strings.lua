Strings = {}

Strings.Notify = {
    noGroup = 'You must create a group to start',
    notOwner = 'You must be the group owner to start',
    notOwner2 = 'You must be the group owner to do that',
    ownerLeft = 'You left and your group was disbanded',
    started = 'You cannot add a member once you started diving',
    memberLeft = 'You left the group',
    memberOwnsGroup = ' (ID: ',
    memberOwnsGroup2 = ') currently owns their own group',
    missingPermission = 'You are not the owner of the group',
    memberAdded = 'You added ',
    memberAdded2 = ' to your group',
    memberRemoved = 'You removed ',
    memberRemoved2 = ' from your group',
    inGroup = 'You are already in a group',
    cantAfford = 'You cannot afford to rent a boat',
    rentalReturn = 'Successfully returned your rental',
    noMoney = 'You cannot afford to purchase this',
    searching = 'We\'re searching for a crate, please standby..',
    crateFound = 'You successfully picked up the crate',
    newCrate = 'New crate located! Check your GPS for more information',
    cooldownActive = 'Your equip needs a break before being used again',
    cooldownInactive = 'Your equipment is now fully working again',
    anchorTrue = 'Boat successfully anchored in place',
    anchorFalse = 'Boat anchor succesfully lifted'
}

Strings.Targets = {
    startLabel = 'Talk',
    startIcon = 'fas fa-ship',
    pickupLabel = 'Pick up',
    pickupIcon = 'fas fa-box-open',
    anchorLabel = 'Anchor',
    anchorIcon = 'fas fa-anchor'
}

Strings.Progress = {
    gearEquip = 'Equipping..',
    gearRemove = 'Removing..',
    anchorTrueLabel = 'Anchoring..',
    anchorFalseLabel = 'Lifting anchor..',
}

Strings.TextUI = {
    timer = {
        position = 'top-center',
        label = '**Oxygen Tank**  \n',
        label2 = ' seconds',
        icon = 'fas fa-lungs',
        stage1Color = '#48BB78', -- The color of the textUI when 60%+ time remaining
        stage2Color = '#FF9D47', -- The color of the textUI when less than 60% time remaining
        stage3Color = '#F56565', -- The color of the textUI when less than 20% time remaining
        textIconColor = '#FFFFFF' -- The color of the text and icon on the textUI for all stages
    },
    shop = {
        label = '**Scuba Diving**  \n E - Get Started',
        icon = 'anchor'
    },
    crate = {
        label = '**Lost Crate**  \n E - Pick up',
        icon = 'box'
    },
    boat = {
        label = '**Boat**  \n E - Anchor',
        icon = 'anchor'
    }
}

Strings.Input = {
    title = 'Add Member',
    label = 'Enter Player ID',
    description = 'Enter the player\'s ID you want to add',
    icon = 'hashtag'
}

Strings.Menu = {
    menuTitle = 'Scuba Diving',
    startTitle = 'Start Diving',
    startDesc = 'Got your gear? A boat? Lets go!',
    startDesc2 = 'Disband your group to stop diving',
    startIcon = 'fas fa-circle-play',
    orderTankTitle = 'Order Tank',
    orderTankDesc = 'Buy an oxygen tank',
    orderTankIcon = 'fas fa-lungs',
    orderConfirmTitle = '**Purchase Scuba Gear**',
    orderConfirmBody = 'Wise choice.. diving without Scuba Gear is a sure death sentence. It costs $',
    orderConfirmBody2 = 'Do you want to proceed?',
    rentTitle = 'Rental',
    rentDesc = 'Rent a boat from us',
    rentIcon = 'fas fa-ship',
    rentReturnTitle = 'Return Rental',
    rentReturnDesc = 'Return the boat you rented',
    rentReturnIcon = 'fas fa-rotate-left',
    rentConfirmTitle = '**Rental**',
    rentConfirmBody = 'Sure, we can provide a rental for you. This will cost you $',
    rentConfirmBody2 = 'Do you want to proceed?',
    createGroupTitle = 'Create Group',
    createGroupDesc = 'Start a diving group with friends',
    createGroupIcon = 'fas fa-people-group',
    manageGroupTitle = 'Manage Group',
    manageGroupDesc = 'Manage your diving group',
    manageGroupIcon = 'fas fa-people-group',
    addMemberTitle = 'Add Member',
    addMemberDesc = 'Add a new member to your group',
    addMemberIcon = 'fas fa-user-plus',
    removeMemberDesc = 'Click to remove member from your group',
    removeMemberIcon = 'fas fa-user-minus',
    leaveGroupTitle = 'Leave Group',
    leaveGroupDesc = 'Leave your group and stop diving',
    leaveGroupIcon = 'fas fa-users-slash'
}

Strings.Phone = {
    search = {
        title = 'Searching',
        subject = 'Searching',
        sender = 'Surfer Boy',
        name = 'Surfer Boy',
        content = 'Hey it\'s me - give me some time to try and find some information about any known lost crates.. If I get something I\'ll let you know!'
    },
    found = {
        title = 'Crate Located',
        subject = 'Crate Located',
        sender = 'Surfer Boy',
        name = 'Surfer Boy',
        content = 'Hey it\'s me again - I got a new report about the location of a lost crate! I\'ve updated your GPS, good luck & stay safe!'
    }
}

Strings.Logs = {
    colors = {
        green = 65280,
        red = 16711680,
        yellow = 16776960,
    },
    titles = {
        crateRewarded = '📦 Crate Found',
        boatRental = '🛥️ Boat Rental',
        gearPurchase = '🤿 Scuba Gear Purchased',
        crateOpened = '🔓 Crate Opened',
        groupCreated = '✅ Group Created',
        groupDisband = '❌ Group Disbanded',
        memberAdd = '✅ Group Member Added',
        memberRemove = '❌ Group Member Removed',
        memberLeft = '👋 Member Left'
    },
    messages = {
        playerName = '**Player Name**: ',
        playerIdent = '\n **Identifier**: ',
        playerID = '\n **Player ID**: ',
        message = '\n **Message**: ',
        crateRewarded = 'Successfully picked up a new crate.',
        boatRental = 'Successfully rented a boat for $' ..tostring(Config.Boat.RentalPrice),
        gearPurchase = 'Successfully purchased Scuba Gear for $' ..tostring(Config.ScubaGear.Price),
        crateOpened = 'Successfully opened a crate and has been rewarded: ',
        groupCreated = 'Successfully created a new group.',
        groupDisband = 'Successfully disbanded their group.',
        memberAdd = 'Successfully added a new member to their group: ',
        memberRemove = 'Successfully removed the following member from their group: ',
        memberLeft = 'Successfully removed themselves from their group.'
    }
}