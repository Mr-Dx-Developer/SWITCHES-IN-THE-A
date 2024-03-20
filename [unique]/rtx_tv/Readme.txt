Thank you for purchasing rtx_tv we're grateful for your support. If you'd ever have a question and / or need our help, please reach out to us by sending an email or go ahead and create a ticket on our discord: https://discord.gg/P6KdaDpgAk


Install instructions (Standalone):
1. Put rtx_tv folder to your resources
2. Configure your config.lua to your preferences (Configure notify line in bottom of config.lua you need use our notify system or you need change notify line to your system system)
3. Put rtx_tv to the server.cfg
4. Download generic_texture_renderer_gfx (https://forum.cfx.re/uploads/default/original/3X/c/7/c76b3b6ee05a3800c19f83dfc3a5e61944882433.zip)
5. Put generic_texture_renderer_gfx folder to your resources
6. Put generic_texture_renderer_gfx to the server.cfg

Install instructions (QBCore):
1. Put rtx_tv folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "qbcore"
4. Configure your config.lua to your preferences
5. Upload sql sql_QBCORE.sql file to your mysql database.
6. Add new items to qb-core/shared/items.lua - items name: tvremote, vehicletv
Example items line for items.lua:
['tvremote'] = {['name'] = 'tvremote', ['label'] = 'TV Remote', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'tvremote.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'TV Remote'},
['vehicletv'] = {['name'] = 'vehicletv', ['label'] = 'TV Remote', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'vehicletv.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Vehicle TV'},

7. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua', 
8. Put rtx_tv to the server.cfg
9. Download generic_texture_renderer_gfx (https://forum.cfx.re/uploads/default/original/3X/c/7/c76b3b6ee05a3800c19f83dfc3a5e61944882433.zip)
10. Put generic_texture_renderer_gfx folder to your resources
11. Put generic_texture_renderer_gfx to the server.cfg



Install instructions (ESX):
1. Put rtx_tv folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "esx"
4. Configure your config.lua to your preferences
5. Upload sql sql_ESX.sql file to your mysql database.
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/yoULcX4.png) remove -- from line 10, or replace line 10 with '@mysql-async/lib/MySQL.lua',
7. Put rtx_tv to the server.cfg
8. Download generic_texture_renderer_gfx (https://forum.cfx.re/uploads/default/original/3X/c/7/c76b3b6ee05a3800c19f83dfc3a5e61944882433.zip)
9. Put generic_texture_renderer_gfx folder to your resources
10. Put generic_texture_renderer_gfx to the server.cfg


Video Tutorial for new vehicle offsets:
https://www.youtube.com/watch?v=7Cu8LqRgvj0


License agreement / Terms of Service
1. Any purchase is non-refundable.
2. Each product is to be used on a singular server, with the exception of a test server.
3. Any form of redistribution of our content is considered copyright infringement.
4. If any of these rules are broken, legal actions can be taken.
© 2024 RTX Development, all rights reserved.