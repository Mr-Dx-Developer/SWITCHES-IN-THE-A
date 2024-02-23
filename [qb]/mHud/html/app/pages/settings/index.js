import importTemplate from '../../utils/importTemplate.js'

const Hud = {
    data() {
        return {
            showRefreshRateList: false,
        }
    },
    methods: {
        ...Vuex.mapMutations({
            setSelectedSettingsElement: 'hud/setSelectedSettingsElement',
            setHoveredSettingsElement: 'hud/setHoveredSettingsElement',
            setHudSettings: 'hud/setHudSettings',
            setHudSettingsWithoutSave: 'hud/setHudSettingsWithoutSave',
            setFreeformEdit: 'hud/setFreeformEdit',

        }),
        SetSpeedometerSizeToDefault(type) {
            this.setHudSettings({
                type,
                value: 1.0,
            })
            this.PlayClick()
        },
        setRefreshRate(type) {

            this.setHudSettings({
                type: 'speedoRefreshRate',
                value: type,
            })
            this.showRefreshRateList = false
            postNUI("getHudSetting", {
                type: "speedoRefreshRate",
                value: type,
            })
        },
        setSpeedType(type) {
            this.setHudSettings({
                type: 'speedType',
                value: type,
            })

            postNUI("getHudSetting", {
                type: "speedType",
                value: type,
            })
        },
        changeInputSettings(type, event) {
            let value = event.currentTarget.value

            this.setHudSettings({
                type,
                value
            })

        },
        ChangeCompass(value) {
            this.setHudSettings({
                type: "compassBehaviour",
                value
            })
            postNUI("getHudSetting", {
                type: "compassBehaviour",
                value
            })
        },
        ChangeHUDMode(value) {
            if (this.hudSettings.hudMode == 'original' && value == 'original') {
                this.setHudSettings({
                    type: "hudMode",
                    value: "text",
                })
            } else if (this.hudSettings.hudMode == 'text' && value == 'text') {
                this.setHudSettings({
                    type: "hudMode",
                    value: "original",
                })
            } else {
                this.setHudSettings({
                    type: "hudMode",
                    value
                })
            }

        },
        changeColor(type, event) {
            const value = event.target.value


            this.setHudSettingsWithoutSave({ type, value })
            // this.setHudSettings({
            //     type: type,
            //     value
            // })
        },
        restoreSpeedoColors() {
            for (let key in this.defaultSpeedoColors) {
                const value = this.defaultSpeedoColors[key]
                this.setHudSettings({
                    type: key,
                    value
                })
            }
        },
        EnableFreeMode() {
            this.setFreeformEdit(true)
            this.InitDrag()
        },
        MakeElementDraggable(classname, type) {
            let started = false
            $(classname).draggable({
                helper: "clone",
                revertDuration: 0,
                revert: false,
                containment: "body",
                scroll: false,
                containment: "body",
                start: (event, ui) => {
                    this.PlayClick()
                    started = true
                },
                drag: function (event, ui) {

                },
                stop: (event, ui) => {
                    let left = ui.position.left;
                    let top = ui.position.top;
                    // let type = $(event.target).attr('data-type');
                    // this.positionsData[type] = { left: `${left}px`, top: `${top}px`, position: `absolute` };
                    this.setHudSettings({
                        type,
                        value: {
                            left,
                            top,
                        },
                    })
                    this.PlayClick()

                }
            });
        },
        InitDrag() {
            this.MakeElementDraggable(".first-speedometer", "speedoMeterPosition")
            this.MakeElementDraggable(".rpm-speedometer", "rpmGaugePosition")
            this.MakeElementDraggable(".nos-speedometer", "nosGaugePosition")

            this.MakeElementDraggable(".screen-keys", "screenKeysPosition")
            this.MakeElementDraggable(".weapon-widget", "weaponPosition")
            this.MakeElementDraggable(".name-box", "nameBoxPosition")
            this.MakeElementDraggable(".bank-box", "bankBoxPosition")
            this.MakeElementDraggable(".cash-box", "cashBoxPosition")
            this.MakeElementDraggable(".boss-money-box", "bossMoneyBoxPosition")
            this.MakeElementDraggable(".black-money-box", "blackMoneyBoxPosition")
            this.MakeElementDraggable(".vip-money-box", "vipMoneyBoxPosition")


            this.MakeElementDraggable(".server-info", "serverInfoBoxPosition")
            this.MakeElementDraggable(".gift-container", "giftContainerPosition")
            this.MakeElementDraggable(".hunger-drag", "hungerHudPosition")
            this.MakeElementDraggable(".thirst-drag", "thirstHudPosition")
            this.MakeElementDraggable(".mic-level", "micLevelPosition")
            this.MakeElementDraggable(".stress-drag", "stressPosition")
            this.MakeElementDraggable(".stamina-drag", "dynamicHudPosition")
            this.MakeElementDraggable(".oxygen-drag", "dynamicHudPosition")
            this.MakeElementDraggable(".armor", "armorPosition")
            this.MakeElementDraggable(".health", "healthPosition")
            this.MakeElementDraggable(".mic-icon", "micPosition")


            this.MakeElementDraggable(".armor-drag", "armorPosition")
            this.MakeElementDraggable(".health-drag", "healthPosition")

        },
        restoreRPMGaugeColors() {

            for (let key in this.defaultRPMColors) {
                const value = this.defaultRPMColors[key]
                this.setHudSettings({
                    type: key,
                    value
                })
            }
        },
        restoreNitroColors() {
            for (let key in this.defaultNitroColors) {
                const value = this.defaultNitroColors[key]
                this.setHudSettings({
                    type: key,
                    value
                })
            }
        },
        ResetHudPositionByType(type) {
            this.setHudSettings({
                type,
                value: {
                    left: false,
                    top: false,
                },
            })
        },
        RestoreFreemode() {
            this.ResetHudPositionByType("speedoMeterPosition")
            this.ResetHudPositionByType("rpmGaugePosition")
            this.ResetHudPositionByType("nosGaugePosition")
            this.ResetHudPositionByType("screenKeysPosition")
            this.ResetHudPositionByType("weaponPosition")
            this.ResetHudPositionByType("nameBoxPosition")
            this.ResetHudPositionByType("bankBoxPosition")
            this.ResetHudPositionByType("cashBoxPosition")
            this.ResetHudPositionByType("bossMoneyBoxPosition")

            this.ResetHudPositionByType("blackMoneyBoxPosition")
            this.ResetHudPositionByType("vipMoneyBoxPosition")

            this.ResetHudPositionByType("serverInfoBoxPosition")
            this.ResetHudPositionByType("giftContainerPosition")
            this.ResetHudPositionByType("hungerHudPosition")
            this.ResetHudPositionByType("thirstHudPosition")
            this.ResetHudPositionByType("micLevelPosition")
            this.ResetHudPositionByType("stressPosition")
            this.ResetHudPositionByType("dynamicHudPosition")
            this.ResetHudPositionByType("armorPosition")
            this.ResetHudPositionByType("healthPosition")
            this.ResetHudPositionByType("micPosition")



        },
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
        restoreToDefaultAllHud() {
            for (let type in this.defaultHudSettings) {
                const value = this.defaultHudSettings[type]
                this.setHudSettings({
                    type,
                    value,
                })
            }

        },
        saveColor(type, event) {
            const value = event.target.value
            this.setHudSettings({
                type: type,
                value: value,
            })
        },
        hexToRGB(hex, alpha) {
            var r = parseInt(hex.slice(1, 3), 16),
                g = parseInt(hex.slice(3, 5), 16),
                b = parseInt(hex.slice(5, 7), 16);

            if (alpha) {
                return "rgba(" + r + ", " + g + ", " + b + ", " + alpha + ")";
            } else {
                return "rgb(" + r + ", " + g + ", " + b + ")";
            }
        },
        getHudColors(type) {
            if (this.hudSettings.monochromeColor) {
                return this.hudSettings.monochromeColor
            }
            return this.hudSettings[type]
        },

    },
    mounted() {
        Coloris({
            themeMode: 'dark',
        });
    },
    watch: {
        'hudSettings.showAllLocation'(value) {
            this.setHudSettings({
                type: "showAllLocation",
                value
            })
        },
        'hudSettings.circleHealthAndArmor'(value) {
            this.setHudSettings({
                type: "circleHealthAndArmor",
                value
            })
        },
        'hudSettings.hideCompass'(value) {
            this.setHudSettings({
                type: "hideCompass",
                value
            })
        },
        'hudSettings.hideLocation'(value) {
            this.setHudSettings({
                type: "hideLocation",
                value
            })
        },
        'hudSettings.showHudBars'(value) {
            this.setHudSettings({
                type: "showHudBars",
                value
            })
        },
        'hudSettings.hideIGTime'(value) {
            this.setHudSettings({
                type: "hideIGTime",
                value
            })
        },
        'hudSettings.hideArmor'(value) {
            this.setHudSettings({
                type: "hideArmor",
                value
            })
        },
        'hudSettings.hideHealth'(value) {
            this.setHudSettings({
                type: "hideHealth",
                value
            })
        },
        'hudSettings.hideMapOverlay'(value) {
            this.setHudSettings({
                type: "hideMapOverlay",
                value
            })
        },
        
        'hudSettings.hideHunger'(value) {
            this.setHudSettings({
                type: "hideHunger",
                value
            })
        },
        'hudSettings.hideThirst'(value) {
            this.setHudSettings({
                type: "hideThirst",
                value
            })
        },
        'hudSettings.hideStress'(value) {
            this.setHudSettings({
                type: "hideStress",
                value
            })
        },
        'hudSettings.hideDynamicStatus'(value) {
            this.setHudSettings({
                type: "hideDynamicStatus",
                value
            })
        },
        'hudSettings.hideMic'(value) {
            this.setHudSettings({
                type: "hideMic",
                value
            })
        },
        'hudSettings.showWatermark'(value) {
            this.setHudSettings({
                type: "showWatermark",
                value
            })
        },
        'hudSettings.hideSafezoneNotify'(value) {
            this.setHudSettings({
                type: "hideSafezoneNotify",
                value
            })
        },
        
        'hudSettings.hideServerInfo'(value) {
            this.setHudSettings({
                type: "hideServerInfo",
                value
            })
        },
        'hudSettings.hideCharacterInfo'(value) {
            this.setHudSettings({
                type: "hideCharacterInfo",
                value
            })
        },
        'hudSettings.hideBankMoney'(value) {
            this.setHudSettings({
                type: "hideBankMoney",
                value
            })
        },
        'hudSettings.hideCashMoney'(value) {
            this.setHudSettings({
                type: "hideCashMoney",
                value
            })
        },
        'hudSettings.hideSocietyMoney'(value) {
            this.setHudSettings({
                type: "hideSocietyMoney",
                value
            })
        },
        'hudSettings.hideSocietyMoney'(value) {
            this.setHudSettings({
                type: "hideSocietyMoney",
                value
            })
        },
        'hudSettings.hideBlackMoney'(value) {
            this.setHudSettings({
                type: "hideBlackMoney",
                value
            })
        },
        'hudSettings.hideVipCoinMoney'(value) {
            this.setHudSettings({
                type: "hideVipCoinMoney",
                value
            })
        },
        'hudSettings.showWidgets'(value) {
            this.setHudSettings({
                type: "showWidgets",
                value
            })
        },
        'hudSettings.hideWeaponWidget'(value) {
            this.setHudSettings({
                type: "hideWeaponWidget",
                value
            })
        },
        'hudSettings.hideMDriveWidget'(value) {
            this.setHudSettings({
                type: "hideMDriveWidget",
                value
            })
        },
        'hudSettings.hideKeysWidget'(value) {
            this.setHudSettings({
                type: "hideKeysWidget",
                value
            })
        },
        'hudSettings.showAllSpeedometer'(value) {
            this.setHudSettings({
                type: "showAllSpeedometer",
                value
            })
        },

        'hudSettings.hideSpeedometer'(value) {
            this.setHudSettings({
                type: "hideSpeedometer",
                value
            })
        },
        'hudSettings.hideRPM'(value) {
            this.setHudSettings({
                type: "hideRPM",
                value
            })
        },
        'hudSettings.hideNOS'(value) {
            this.setHudSettings({
                type: "hideNOS",
                value
            })
        },
        'hudSettings.speedometerSize'(value) {
            this.setHudSettings({
                type: "speedometerSize",
                value
            })
        },
        'hudSettings.rpmSize'(value) {
            this.setHudSettings({
                type: "rpmSize",
                value
            })
        },
        'hudSettings.nosSize'(value) {
            this.setHudSettings({
                type: "nosSize",
                value
            })
        },
        'hudSettings.hideHud'(value) {
            this.setHudSettings({
                type: "hideHud",
                value
            })
        },
        'hudSettings.cinematicMode'(value) {
            this.setHudSettingsWithoutSave({
                type: "cinematicMode",
                value
            })
            postNUI("getHudSetting", {
                type: "cinematicMode",
                value: this.hudSettings["cinematicMode"],
            })
        },
        'hudSettings.streamerMode'(value) {
            this.setHudSettings({
                type: "streamerMode",
                value
            })
            postNUI("getHudSetting", {
                type: "streamerMode",
                value: this.hudSettings["streamerMode"],
            })
        },
        'hudSettings.playMediaSongs'(value) {
            this.setHudSettings({
                type: "playMediaSongs",
                value
            })
            postNUI("getHudSetting", {
                type: "playMediaSongs",
                value: this.hudSettings["playMediaSongs"],
            })
        },
        'hudSettings.showMyPlayerId'(value) {
            this.setHudSettings({
                type: "showMyPlayerId",
                value
            })
        },

    },
    computed: {
        ...Vuex.mapState({
            selectedSettingsElement: state => state.hud.selectedSettingsElement,
            activeMenu: state => state.hud.activeMenu,
            inVehicle: state => state.hud.inVehicle,
            showMapWalking: state => state.hud.showMapWalking,
            status: state => state.hud.status,
            barVisibility: state => state.hud.barVisibility,
            location: state => state.hud.location,
            micSettings: state => state.hud.micSettings,
            enableTopWidget: state => state.hud.enableTopWidget,
            currentSongInformations: state => state.media.currentSongInformations,
            currentPlaylist: state => state.media.currentPlaylist,
            hoveredSettingsElement: state => state.hud.hoveredSettingsElement,
            showHudSettings: state => state.hud.showHudSettings,
            hudSettings: state => state.hud.hudSettings,
            defaultSpeedoColors: state => state.hud.defaultSpeedoColors,
            defaultRPMColors: state => state.hud.defaultRPMColors,
            defaultNitroColors: state => state.hud.defaultNitroColors,
            freeformEdit: state => state.hud.freeformEdit,
            defaultHudSettings: state => state.hud.defaultHudSettings,
            forceAccountsVisibility: state => state.info.forceAccountsVisibility,
            locales: state => state.hud.locales,
            enableSafezoneNotify: state => state.hud.enableSafezoneNotify,
            enableUIKeys : state => state.hud.enableUIKeys,



        }),
        getSpeedoRefreshRateLabel() {
            if (this.hudSettings.speedoRefreshRate == 'realtime') {
                return this.locales.REAL_TIME
            }
            return this.hudSettings.speedoRefreshRate.toUpperCase()
        },
        getMonochromeColor() {
            return this.hudSettings.monochromeColor || '#ffffff'
        },
        getSpeedoMonochromeColor() {
            return this.hudSettings.speedoMonochromeColor || '#ffffff'
        },
        getRPMMonochromeColor() {
            return this.hudSettings.rpmMonochromeColor || '#ffffff'
        },
        getNOSMonochromeColor() {
            return this.hudSettings.nosMonoChromeColor || '#ffffff'
        },

        getMicColor() {

            if (this.micSettings.isMuted) {
                return '#FF4848'
            }
            if (this.micSettings.isTalking) {
                return '#B2FF75'
            }
            return '#FFFFFF'
        },
    },
    template: await importTemplate('./app/pages/settings/index.html')
}
export default Hud