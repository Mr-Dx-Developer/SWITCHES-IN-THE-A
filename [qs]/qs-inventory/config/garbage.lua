--[[
    Welcome to the Garbages setting!
    In this configuration you will find everything related
    to garbage cans and their items, since a random one will
    appear from the list that you will see below.

    Config.GarbageObjects is simply for target use, so if
    you don't use it, you can ignore it.
]]

Config.GarbageItems = {}

Config.GarbageObjects = {
    'prop_dumpster_02a',
    'prop_dumpster_4b',
    'prop_dumpster_4a',
    'prop_dumpster_3a',
    'prop_dumpster_02b',
    'prop_dumpster_01a'
}

Config.GarbageItemsForProp = {
    [joaat('prop_dumpster_02a')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'iron',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'steel',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_4b')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'plastic',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'plastic',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_4a')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'glass',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'joint',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_3a')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'aluminum',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'lighter',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'rubber',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_02b')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'rubber',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'iron',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'steel',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
    [joaat('prop_dumpster_01a')] = {
        label = 'Garbage',
        slots = 30,
        items = {
            [1] = {
                [1] = {
                    name = 'plastic',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
            [2] = {
                [1] = {
                    name = 'lighter',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 1,
                },
                [2] = {
                    name = 'metalscrap',
                    amount = {
                        min = 1,
                        max = 5
                    },
                    info = {},
                    type = 'item',
                    slot = 2,
                },
            },
        }
    },
}
