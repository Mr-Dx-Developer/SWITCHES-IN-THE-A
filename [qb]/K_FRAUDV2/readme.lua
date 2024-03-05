Requirements:

https://github.com/utkuali/datacrack -- optional used for cloning/printing minigame


how to install:

Simplay drag the following into your resources folder:

K_FRAUDV2
K_FRAUDATMS
K_FRAUDSHOPS
K_FRAUDPROPS

And install the Requirements ^^
 

add the resources to your server.cfg

ensure datacrack
ensure K_FRAUDV2-QB
ensure K_FRAUDATMS-QB
ensure K_FRAUDSHOPS-QB
ensure K_FRAUDPROPS

or put the all in the one folder in your resources folder like this

resources/[K_FRAUD]

then add 
ensure [K_FRAUD]

Both Shops/ATMS are not encrypted so you are free to edit them as you please
and K_FRAUD has alot of configs so you can edit mostly anything but if you want something else to edit just pop it in the discord

Add these to qb-core/shared/items.lua
    ['laptop2'] 			 = {['name'] = 'laptop2', 					['label'] = 'Laptop #2', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'laptop2.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['whiteslip'] 			 = {['name'] = 'whiteslip', 				['label'] = 'White Slip', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'whiteslip.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['stolencard'] 			 = {['name'] = 'stolencard', 				['label'] = 'Stolen Bankcard', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'stolencard.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['infousb'] 			 = {['name'] = 'infousb', 					['label'] = 'Information USB', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'infousb.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['forgedcheck'] 		 = {['name'] = 'forgedcheck', 				['label'] = 'Forged Check', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'forgedcheck.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['blankcard'] 			 = {['name'] = 'blankcard', 				['label'] = 'Blank Card', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'blankcard.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['clonedcard'] 			 = {['name'] = 'clonedcard', 				['label'] = 'Cloned Card', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'blankcard.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['printer'] 			 = {['name'] = 'printer', 					['label'] = 'Printer', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'printer.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['skimmer'] 			 = {['name'] = 'skimmer', 					['label'] = 'Skimmer', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'skimmer.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
	['generator'] 			 = {['name'] = 'generator', 				['label'] = 'Generator', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'generator.png', 		['unique'] = false, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},

