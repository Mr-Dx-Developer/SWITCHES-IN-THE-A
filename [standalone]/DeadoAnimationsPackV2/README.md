deadopps5707 'Deado Shop'
discord 'https://discord.gg/HqWARfaueE'

# Available in:

* English 🇬🇧
* Brazilian Portuguese 🇧🇷
* Czech 🇨🇿
* Danish 🇩🇰
* Dutch 🇳🇱
* Finnish 🇫🇮
* French 🇫🇷
* German 🇩🇪
* Italian 🇮🇹
* Polish 🇵🇱
* Romanian 🇷🇴
* Spanish 🇪🇸
* Swedish 🇸🇪

All languages were either translated using Google Translate or contributed by you, the community. 

If you happen to find any incorrect translations or would like to add more languages, please feel free to provide an "issue" with the correct / additional translations.

Languages can be selected and/or added in config.lua.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Features

* Search Function 🔎
* Custom Animations 🏃
* Further support for shared and couple poses / animations 👫
* Animal Emotes - Big dog and small dog. *More to come. Stay tuned!* 🐩
* Easily convert Menyoo to dpemotes 🔄
* Shared Dances 🕺💃
* Shared Particle Effects 💨
* QBCore Framework & Keybinding Support ⚙️
* Easy To Understand Configuration File ⚙️

------------------------------------------------------------

# Menu Keybind 🎛️

**Important Note:**

The keybind uses RegisterKeyMapping. By default, the server owner configured keybind in the *initial* config.lua will be the default key, however once the keybind is set for a user, it'll stay with this new value. Editing the config keybind will change it for new players only.


**Menu key:** F5

Server Owners can change this in the `config.lua`.

Alternatively, the player base can set their own menu keybind to open DpEmotes

Esc > settings > keybinds > fivem > dpemotes

* More keybinds are now using key mappings which means that they are now available in your FiveM settings to change (`FavKeybind` and `RagdollKeybind`)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Keybinds and SQL 🎛️

The original dpemotes uses mysql-async which was then changed to ghmattimysql. Unfortunately, they are no longer maintained. 

To use the SQL features, install the [oxmysql](https://github.com/overextended/oxmysql) resource. If you do not want to use the SQL features, comment out the `oxmysql` region in fxmanifest.lua.

Alternatively, you can use the keybind command that comes with FiveM without having the SQL, by entering the following into F8: 

`bind keyboard "Yourbutton" "e youremote"`. To remove the keybind, type `"unbind keyboard "Yourbutton"`.

-------------------------------------------------

# Ragdoll 🥴

* To enable ragdoll, change `RagdollEnabled = false,` to true in config.lua.

Much like the menu key, `RagdollKeybind` is also using RegisterKeyMapping. It is currently set to `U` by default *(server side)* however can be set to the player's preferred keybind in the FiveM keybinds setting found in the settings menu within the Esc Menu.

* New setting: `RagdollAsToggle`, this will make either the ragdoll be a toggle or a hold key

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Adult Emotes 🔞

Adult Emotes can be hidden from the menu by setting `AdultEmotesDisabled` to `true` in the config.lua file.

This will completely conceal the emotes from the lists *(Emotes, Shared Emotes, etc)* at startup making them unusable.

The emotes that are concealed, are the ones flagged in the animation list with `AdultAnimation`. You can see how it is done with `fspose`.

------------------------------------------------------------------------------

# QBCore ⚙️

* QBCore integration to match their fork of the original dpemotes**

- Config option which supports the QB Framework in their fork of dpemotes

If you’re using qb-core, you can now set `Framework = "qb-core"` in the config file, otherwise leave it as `false`.

------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------------------


# Installation Instructions ⚙️:

* add 'DeadoAnimationsPackV2' to your `server.cfg`
* Download the latest recommended artifacts [for Windows](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/) or [for Linux](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)
* [Enforce gamebuild to latest build](https://forum.cfx.re/t/tutorial-forcing-gamebuild-to-casino-cayo-perico-or-tuners-update/4784977) for all emotes and props to work correctly
* Set the desired language and settings in the config.lua
* Qb-Core server owners, set `Framework = 'qb-core'` in the config file, otherwise leave it as false.
* start DeadoAnimationsPackV2


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Shared emotes 👩🏻‍❤️‍💋‍👨🏼

Emotes will work with either `SyncOffset` or `Attachto`.

* If it is with `SyncOffsetFront` or `SyncOffsetSide`, then the offset used is the one of the emote the player started.<br/>
For example, if player one starts the emote `handshake` which has `SyncOffsetFront`, then player one will have the `SyncOffsetFront` but not the other player.


* If it is with `Attachto`, then it'll either be player one's data used for attaching, or the player two's data.<br/>
For example, if player one start the emote carry, then the other player will be attached but not the player one because Attachto is set in `carry2` and not `carry`.<br/>

* If player one starts the emote `carry2`, then player one will be attached and not the other player.
it's the player who start the animation who will in most cases be moved


* Special case, if both emote have the `Attachto` then only the player who started the emote will be attached.*

You can find a list of ped bones to attach the other player here: [Ped Bones](https://wiki.rage.mp/index.php?title=Bones)

Using the website provided above, enter the bone ID, ie `1356` and not `111`, which is the Bone Index.



