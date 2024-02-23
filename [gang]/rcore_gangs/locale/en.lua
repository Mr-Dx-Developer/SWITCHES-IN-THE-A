Locale = Locale or {}
Locale['EN'] = {
    -- DRUGS --
    DRUGS_MISSING_COPS = 'There aren\'t enough police officers on duty to sell drugs.',
    DRUGS_MISSING_DRUGS = 'You have no drugs on you.',
    DRUGS_MISSING_CUSTOMER = 'There is no one around to buy drugs.',

    NOTIFICATION_DRUGS_TITLE = 'Drug Sales',
    NOTIFICATION_DRUGS_SUBJECT = 'Stranger',

    -- RIVALRY --
    RIVALRY_MISSING_MONEY = 'You don\'t have enough money to start a rivalry.',

    NOTIFICATION_RIVALRY_TITLE = 'Territory',

    NOTIFICATION_RIVALRY_ATTACK = 'Your gang has started a rivalry.',
    NOTIFICATION_RIVALRY_DEFEND = 'An enemy gang has started a rivalry.',

    -- TERRITORY --
    NOTIFICATION_LOYALTY_TITLE = 'Territory',

    NOTIFICATION_LOYALTY_INCREASED = 'Loyalty has been increased.',

    NOTIFICATION_LOYALTY_RIVAL_DRUGS = 'An enemy gang has sold drugs in your territory.',
    NOTIFICATION_LOYALTY_RIVAL_SPRAY = 'An enemy gang has sprayed their tag in your territory.',
    NOTIFICATION_LOYALTY_RIVAL_MURDER = 'An enemy gang has murdered a civilian in your territory.',
    NOTIFICATION_LOYALTY_RIVAL_HOTWIRE = 'An enemy gang has stolen a vehicle in your territory.',
    NOTIFICATION_LOYALTY_RIVAL_ROBBERY = 'An enemy gang has robbed a business in your territory.',
    NOTIFICATION_LOYALTY_RIVAL_VENDETTA = 'An enemy gang has killed other rival in your territory.',
    NOTIFICATION_LOYALTY_RIVAL_PRESENCE = 'An enemy gang has been present in your territory for a long time.',

    NOTIFICATION_LOYALTY_DECREASED_SPRAY = 'Your tag has been removed, loyalty has been decreased.',
    NOTIFICATION_LOYALTY_DECREASED_MURDER = 'You have killed a civilian, loyalty has been decreased.',
    NOTIFICATION_LOYALTY_DECREASED_HOTWIRE = 'You have stolen a vehicle, loyalty has been decreased.',
    NOTIFICATION_LOYALTY_DECREASED_ROBBERY = 'You have robbed a business, loyalty has been decreased.',
    NOTIFICATION_LOYALTY_DECREASED_VENDETTA = 'You have been killed by an enemy, loyalty has been decreased.',

    -- PROTECTION --
    PROTECTION_COLLECT_MONEY = 'Collect Money',
    PROTECTION_MISSING_MONEY = 'Empty Cashier',
    PROTECTION_RECEIVE_MONEY = 'You have collected {amount} from {business}.',

    -- ACTIONS --
    ACTIONS_TARGET_AWAY = 'The player is too far away.',
    ACTIONS_TARGET_FACING = 'The player must have its back to you.',
    ACTIONS_TARGET_SEARCH = 'You are being searched.',
    ACTIONS_TARGET_BAG_ON = 'You have been blindfolded.',
    ACTIONS_TARGET_BAG_OFF = 'You have been unblindfolded.',
    ACTIONS_TARGET_TIE_ON = 'You have been tied up.',
    ACTIONS_TARGET_TIE_OFF = 'You have been untied.',
    ACTIONS_TARGET_ESCORT_ON = 'You are being escorted.',
    ACTIONS_TARGET_ESCORT_OFF = 'You are no longer escorted.',
    ACTIONS_TARGET_TRANSPORT_ON = 'You are being transported.',
    ACTIONS_TARGET_TRANSPORT_OFF = 'You are no longer transported.',

    ACTIONS_VEHICLE_AWAY = 'You are not looking at any vehicle.',
    ACTIONS_VEHICLE_FULL = 'This vehicle has every seat occupied.',

    ACTIONS_MISSING_BAG = 'You don\'t have paper bag.',
    ACTIONS_MISSING_TIE = 'You don\'t have zipties.',

    -- CHECKPOINTS --
    CHECKPOINT_INTERACT_GARAGE = '{color}[E]~s~ Open Garage',
    CHECKPOINT_INTERACT_STORAGE = '{color}[E]~s~ Open Storage',
    CHECKPOINT_INTERACT_RESERVE = '{color}[E]~s~ Open Reserve',

    CHECKPOINT_ERROR_AWAY = 'The checkpoint is too far away.',
    CHECKPOINT_ERROR_CLOSE = 'The checkpoint is too close to another.',
    CHECKPOINT_ERROR_GARAGE = 'The garage must be empty.',
    CHECKPOINT_ERROR_STORAGE = 'The storage must be empty.',
    CHECKPOINT_ERROR_RESERVE = 'The reserve must be empty.',
    CHECKPOINT_SUCCESS_PLACE = 'You have successfully placed the checkpoint.',
    CHECKPOINT_SUCCESS_REMOVE = 'You have successfully removed the checkpoint.',

    CHECKPOINT_VEHICLE_INSERT = 'You have successfully purchased the vehicle.',
    CHECKPOINT_VEHICLE_REMOVE = 'You have successfully removed the vehicle.',
    CHECKPOINT_VEHICLE_EXIST = 'This vehicle has already been purchased.',
    CHECKPOINT_VEHICLE_MONEY = 'You don\'t have enough money to purchase this vehicle.',
    CHECKPOINT_VEHICLE_USED = 'This vehicle is already being driven by someone else.',
    CHECKPOINT_VEHICLE_TAKE = 'You have successfully taken this vehicle from the garage.',
    CHECKPOINT_VEHICLE_PARK = 'You have successfully returned this vehicle to the garage.',
    CHECKPOINT_RESERVE_GIVE = 'You have successfully added {amount} to balance.',
    CHECKPOINT_RESERVE_TAKE = 'You have successfully taken {amount} from balance.',

    -- GANGS --
    GANG_ERROR_INVITE = 'You have no pending invitations.',
    GANG_ERROR_PLAYER = 'The specified player is not a valid player.',
    GANG_ERROR_MEMBER = 'This player is already a member of your gang.',
    GANG_ERROR_RIVAL = 'This player is already a member of a rival gang.',
    GANG_ERROR_LIMIT = 'You have reached the maximum number of members.',
    GANG_ERROR_RANK = 'The specified rank cannot be assigned to a member.',

    GANG_SUCCESS_CREATE = 'You have successfully created {gang}.',
    GANG_SUCCESS_DELETE = 'You have successfully deleted {gang}.',
    GANG_SUCCESS_JOIN = 'You have successfully joined {gang}.',
    GANG_SUCCESS_KICK = 'You have been kicked out from {gang}.',
    GANG_SUCCESS_LEAVE = 'You have successfully left {gang}.',
    GANG_SUCCESS_DISBAND = 'You have successfully disbanded {gang}.',
    GANG_SUCCESS_INVITE = 'You have been invited to {gang}, use /acceptgang to accept the invitation.',
    GANG_SUCCESS_ADD = 'You have successfully added the player to {gang}.',

    GANG_LEADER_INVITE = 'The invitation has been sent.',
    GANG_LEADER_RANK = 'You have successfully changed the rank.',
    GANG_LEADER_KICK = 'You have successfully kicked out the member.',
    GANG_LEADER_SHIP = 'You have successfully transferred the leadership.',

    GANG_PLAYER_RANK = 'Your rank has been changed to {rank}.',
    GANG_PLAYER_SHIP = 'The leadership has been transferred to you in {gang}.',

    -- MENU --
    MENU_TEXT_NONE = 'Not Specified',

    MENU_DRUGS_RIVALRY = 'Rivalry',
    MENU_DRUGS_SELLING = 'Selling...',

    MENU_GARAGE_SUBTITLE = 'Garage',
    MENU_GARAGE_CATALOG = 'Vehicle Catalog',
    MENU_GARAGE_LIST = 'Purchased Vehicles',

    MENU_GARAGE_RETURN = 'Return Vehicle',
    MENU_GARAGE_INSERT1 = 'Purchase Vehicle',
    MENU_GARAGE_REMOVE1 = 'Remove Vehicle',
    MENU_GARAGE_EMPTY = 'Garage Empty',
    MENU_GARAGE_DRIVE = 'Drive',
    MENU_GARAGE_INSERT2 = 'Purchase',
    MENU_GARAGE_REMOVE2 = 'Remove',
    MENU_GARAGE_CANCEL = 'Cancel',
    MENU_GARAGE_CLASS = 'Color Class',
    MENU_GARAGE_COLOR = 'Vehicle Color',

    MENU_RESERVE_SUBTITLE = 'Reserve',

    MENU_RESERVE_BALANCE = 'Current Balance',
    MENU_RESERVE_GIVE = 'Give Money',
    MENU_RESERVE_TAKE = 'Take Money',
    MENU_RESERVE_INSERT = 'Add Balance',
    MENU_RESERVE_REMOVE = 'Remove Balance',
    MENU_RESERVE_AMOUNT = 'Amount',
    MENU_RESERVE_AMOUNT_TEXT = 'Choose Amount (Number)',

    MENU_RESPECT_NONE = 'No Respect',
    MENU_RESPECT_LOW = 'Low Respect',
    MENU_RESPECT_MID = 'Medium Respect',
    MENU_RESPECT_HIGH = 'High Respect',

    MENU_BUTTON_TERRITORY = 'Territory',
    MENU_BUTTON_ACTIONS = 'Actions',
    MENU_BUTTON_DRUGS = 'Sell Drugs',
    MENU_BUTTON_CHECKPOINTS = 'Checkpoints',
    MENU_BUTTON_INVITE = 'Invite Members',
    MENU_BUTTON_MANAGEMENT = 'Member Management',
    MENU_BUTTON_DISBAND = 'Disband',
    MENU_BUTTON_LEAVE = 'Leave',
    MENU_BUTTON_MEMBERS = 'Members',
    MENU_BUTTON_GARAGE = 'Garage',
    MENU_BUTTON_RESERVE = 'Reserve',
    MENU_BUTTON_DELETE = 'Delete',
    MENU_BUTTON_CONFIRM = 'Confirm',
    MENU_BUTTON_CANCEL = 'Cancel',

    MENU_RIVALRY_START = 'Start Rivalry',
    MENU_RIVALRY_PROGRESS = 'Rivalry',
    MENU_RIVALRY_FINISH = 'Finish Rivalry',

    MENU_ACTIVITY_NONE = 'No Gang Activity',

    MENU_PLAYERS_NONE = 'No Players Found',
    MENU_PLAYERS_REFRESH = 'Refresh Players',

    MENU_ACTIONS_ROB = 'Rob',
    MENU_ACTIONS_BAG_ON = 'Put Bag On',
    MENU_ACTIONS_BAG_OFF = 'Take Bag Off',
    MENU_ACTIONS_TIE_ON = 'Tie Hands',
    MENU_ACTIONS_TIE_OFF = 'Untie Hands',
    MENU_ACTIONS_ESCORT_ON = 'Start Escorting',
    MENU_ACTIONS_ESCORT_OFF = 'Stop Escorting',
    MENU_ACTIONS_TRANSPORT_ON = 'Enter Vehicle',
    MENU_ACTIONS_TRANSPORT_OFF = 'Exit Vehicle',

    MENU_CHECKPOINT_PLACE = 'Place Checkpoint',
    MENU_CHECKPOINT_REMOVE = 'Remove Checkpoint',
    MENU_CHECKPOINT_GARAGE = 'Garage Checkpoint',
    MENU_CHECKPOINT_STORAGE = 'Storage Checkpoint',
    MENU_CHECKPOINT_RESERVE = 'Reserve Checkpoint',

    MENU_MANAGEMENT_RANK = 'Rank',
    MENU_MANAGEMENT_PERM = 'Privileged Rank',
    MENU_MANAGEMENT_SHIP = 'Transfer Leadership',
    MENU_MANAGEMENT_KICK = 'Kick Member',
    MENU_MANAGEMENT_NONE = 'No Members To Manage',

    MENU_MEMBER_NEW = 'Add Member',
    MENU_MEMBER_PLAYER = 'Player',
    MENU_MEMBER_PLAYER_TEXT = 'Player (Server Identifier)',

    MENU_CREATE_NEW = 'Create Gang',
    MENU_CREATE_NONE = 'No Gangs Created',
    MENU_CREATE_LEADER = 'Leader',
    MENU_CREATE_COLOR = 'Color',
    MENU_CREATE_GROUP = 'Rank Group',
    MENU_CREATE_NAME = 'Name',
    MENU_CREATE_TAG = 'Tag',
    MENU_CREATE_LEADER_TEXT = 'Leader (Server Identifier)',
    MENU_CREATE_NAME_TEXT = 'Name (Max 32 Characters)',
    MENU_CREATE_TAG_TEXT = 'Tag (Max 10 Characters)',

    MENU_ADMIN_TITLE = 'Management',
    MENU_ADMIN_SUBTITLE = 'Admin Menu',

    MENU_WARNING_SHIP = 'Do you want to transfer the leadership?',
    MENU_WARNING_KICK = 'Do you want to kick this member?',
    MENU_WARNING_DISBAND = 'Do you want to disband your gang?',
    MENU_WARNING_LEAVE = 'Do you want to leave your gang?',
    MENU_WARNING_DELETE = 'Do you want to delete this gang?',
    MENU_WARNING_GIVE = 'Do you want to add ({amount}) to balance?',
    MENU_WARNING_TAKE = 'Do you want to take ({amount}) from balance?',

    -- COMMANDS --
    COMMAND_MISSING_GANG = 'The gang has not been specified!',
    COMMAND_INVALID_GANG = 'The specified gang does not exist!',

    COMMAND_MISSING_LEADER = 'The leader has not been specified!',
    COMMAND_MISSING_COLOR = 'The color has not been specified!',
    COMMAND_MISSING_GROUP = 'The group has not been specified!',
    COMMAND_MISSING_NAME = 'The name has not been specified!',
    COMMAND_MISSING_TAG = 'The tag has not been specified!',

    COMMAND_INVALID_LEADER1 = 'The specified leader is not a valid player!',
    COMMAND_INVALID_LEADER2 = 'The specified leader is already in a gang!',
    COMMAND_INVALID_COLOR = 'The specified color is not a valid color!',
    COMMAND_INVALID_NAME1 = 'The name must not be longer than 32 characters!',
    COMMAND_INVALID_NAME2 = 'The specified name is already assigned to another gang!',
    COMMAND_INVALID_TAG1 = 'The tag must not be longer than 10 characters!',
    COMMAND_INVALID_TAG2 = 'The specified tag is already assigned to another gang!',

    COMMAND_MISSING_CHECKPOINT = 'The checkpoint type has not been specified!',
    COMMAND_INVALID_CHECKPOINT = 'The specified type is not a valid checkpoint!',

    COMMAND_MISSING_VEHICLE = 'The vehicle has not been specified!',
    COMMAND_INVALID_VEHICLE = 'The specified vehicle is not a valid vehicle!',

    COMMAND_MISSING_AMOUNT = 'The amount has not been specified!',
    COMMAND_INVALID_AMOUNT1 = 'You don\'t have enough money!',
    COMMAND_INVALID_AMOUNT2 = 'The reserve doesn\'t have enough money!',

    COMMAND_MISSING_PERMS = 'You are not allowed to use this command!',
}