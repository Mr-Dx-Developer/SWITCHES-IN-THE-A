Config = {}
Config.Target = true -- Whether to use target or text UI.

-- You can ignore this if you use target.
-- This cannot be changed on clients that already cached this.
Config.Keybinds = {
    'E', 'G', 'C'
}

Config.Dispatch = {
    Enable = true, -- Enable dispatch
    Type = 'ps-dispatch', --['normal'/'cd_dispatch'/'qs-dispatch'/'ps-dispatch']
	Jobs = {
		'police',
		'sheriff'
	}
}

-- The distance at which peds and props get loaded in for players
Config.SpawnDistance = 100.0

-- The built-in 3D prompts
Config.Prompts = {
	Enabled = true,
	RenderDistance = 3.0, -- Don't put this to more than 5.0 to avoid issues
	SpriteSize = 0.0225,
	SpriteColor = { r = 160, g = 160, b = 255 }
}