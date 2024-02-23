
const module = {
    namespaced: true,
    state: {
        enableSafezoneNotify : false,
        freeformEdit: false,
        locales : {},
        enableUIKeys : false,
        defaultHudSettings: {
            hideSafezoneNotify : false,
            hideMapOverlay : false,
            hideHud: false,
            hudMode: 'original',
            circleHealthAndArmor : false,
            cinematicMode: false,
            showAllLocation: true,
            compassColor: '#ffffff',
            locationTextColor: '#ffffff',
            igTimeTextColor: '#ffffff',
            monochromeColor: false,
            healthColor: '#FF4848',
            armorColor: '#4870FF',
            hungerColor: '#FFA048',
            thirstColor: '#48FFF4',
            stressColor: '#FF48F8',
            staminaColor: '#C4FF48',
            oxygenColor: '#48BDFF',
            altitudeColor: '#48FF9C',
            hideCompass: false,
            hideLocation: false,
            hideIGTime: false,
            compassBehaviour: 'playerlook',
            showHudBars: true,
            hideHealth: false,
            hideArmor: false,
            hideHunger: false,
            hideThirst: false,
            hideStress: false,
            hideDynamicStatus: false,
            hideMic: false,
            hideServerInfo: false,
            showWatermark: true,
            hideCharacterInfo: false,
            hideBankMoney: false,
            hideCashMoney: false,
            hideSocietyMoney: false,
            hideBlackMoney: false,
            hideVipCoinMoney: false,
            showWidgets: true,
            hideWeaponWidget: false,
            hideMDriveWidget: false,
            hideKeysWidget: false,
            speedoRefreshRate: 'medium',
            speedType: 'kmh',
            showAllSpeedometer: true,
            hideSpeedometer: false,
            hideRPM: false,
            hideNOS: false,
            speedometerSize: 1.0,
            rpmSize: 1.0,
            nosSize: 1.0,
            speedoMonochromeColor: false,
            speedoOuterCircleColor: '#D9D9D9',
            innerSmallSpeedoLineColor: "#FFFFFF",
            nonHighlightedSpeedIndicatorsColor: "#FFFFFF",
            highlightedSpeedIndicatorsColor: "#FFFFFF",
            speedIndicatorColor: "#FFFFFF",
            needleColor: '#FF4848',
            needleCircleColor: '#FF4848',
            rpmMonochromeColor: false,
            rpmOuterCircle: '#D9D9D9',
            innerSmallRPMLines: '#FFFFFF',
            highlightedRPMIndicators: '#FFFFFF',
            burnOutWarnColor: '#FF0000',
            rpmTextColor: '#FFFFFF',
            rpmNeedle: '#FF4848',
            rpmNeedleCircle: '#FF4848',
            nosMonoChromeColor: false,
            nosOuterCircle: '#D9D9D9',
            nonHighlitedGaugeLines: '#FFFFFF',
            highlitedGaugeLines: '#FFFFFF',
            nitroStatusColor: '#48FFF4',
            nitroTextColor: '#FFFFFF',
            nitroNeedleColor: '#FF4848',
            nitroNeedleCircleColor: '#FF4848',








            speedoMeterPosition: {
                left: false,
                top: false,
            },
            rpmGaugePosition: {
                left: false,
                top: false,
            },
            nosGaugePosition: {
                left: false,
                top: false,
            },
            screenKeysPosition: {
                left: false,
                top: false,
            },
            weaponPosition: {
                left: false,
                top: false,
            },
            hudPosition: {
                left: false,
                top: false,
            },
            nameBoxPosition: {
                left: false,
                top: false,
            },
            bankBoxPosition: {
                left: false,
                top: false,
            },
            cashBoxPosition: {
                left: false,
                top: false,
            },
            bossMoneyBoxPosition: {
                left: false,
                top: false,
            },
            blackMoneyBoxPosition: {
                left: false,
                top: false,
            },
            vipMoneyBoxPosition: {
                left: false,
                top: false,
            },
            serverInfoBoxPosition: {
                left: false,
                top: false,
            },
            giftContainerPosition: {
                left: false,
                top: false,
            },
            hungerHudPosition: {
                left: false,
                top: false,
            },
            thirstHudPosition: {
                left: false,
                top: false,
            },
            micLevelPosition: {
                left: false,
                top: false,
            },
            stressPosition: {
                left: false,
                top: false,
            },
            dynamicHudPosition: {
                left: false,
                top: false,
            },
            armorPosition: {
                left: false,
                top: false,
            },
            healthPosition: {
                left: false,
                top: false,
            },
            micPosition: {
                left: false,
                top: false,
            },
            streamerMode: false,
            playMediaSongs: false,
            showMyPlayerId: false,
        },
        hudSettings: {  
            hideSafezoneNotify : false,
            hideMapOverlay : false,
            hideHud: false,
            hudMode: 'original',
            circleHealthAndArmor : false,
            cinematicMode: false,
            showAllLocation: true,
            compassColor: '#ffffff',
            locationTextColor: '#ffffff',
            igTimeTextColor: '#ffffff',
            monochromeColor: false,
            healthColor: '#FF4848',
            armorColor: '#4870FF',
            hungerColor: '#FFA048',
            thirstColor: '#48FFF4',
            stressColor: '#FF48F8',
            staminaColor: '#C4FF48',
            oxygenColor: '#48BDFF',
            altitudeColor: '#48FF9C',
            hideCompass: false,
            hideLocation: false,
            hideIGTime: false,
            compassBehaviour: 'playerlook',
            showHudBars: true,
            hideHealth: false,
            hideArmor: false,
            hideHunger: false,
            hideThirst: false,
            hideStress: false,
            hideDynamicStatus: false,
            hideMic: false,
            hideServerInfo: false,
            showWatermark: true,
            hideCharacterInfo: false,
            hideBankMoney: false,
            hideCashMoney: false,
            hideSocietyMoney: false,
            hideBlackMoney: false,
            hideVipCoinMoney: false,
            showWidgets: true,
            hideWeaponWidget: false,
            hideMDriveWidget: false,
            hideKeysWidget: false,
            speedoRefreshRate: 'medium',
            speedType: 'kmh',
            showAllSpeedometer: true,
            hideSpeedometer: false,
            hideRPM: false,
            hideNOS: false,
            speedometerSize: 1.0,
            rpmSize: 1.0,
            nosSize: 1.0,
            speedoMonochromeColor: false,
            speedoOuterCircleColor: '#D9D9D9',
            innerSmallSpeedoLineColor: "#FFFFFF",
            nonHighlightedSpeedIndicatorsColor: "#FFFFFF",
            highlightedSpeedIndicatorsColor: "#FFFFFF",
            speedIndicatorColor: "#FFFFFF",
            needleColor: '#FF4848',
            needleCircleColor: '#FF4848',
            rpmMonochromeColor: false,
            rpmOuterCircle: '#D9D9D9',
            innerSmallRPMLines: '#FFFFFF',
            highlightedRPMIndicators: '#FFFFFF',
            burnOutWarnColor: '#FF0000',
            rpmTextColor: '#FFFFFF',
            rpmNeedle: '#FF4848',
            rpmNeedleCircle: '#FF4848',
            nosMonoChromeColor: false,
            nosOuterCircle: '#D9D9D9',
            nonHighlitedGaugeLines: '#FFFFFF',
            highlitedGaugeLines: '#FFFFFF',
            nitroStatusColor: '#48FFF4',
            nitroTextColor: '#FFFFFF',
            nitroNeedleColor: '#FF4848',
            nitroNeedleCircleColor: '#FF4848',








            speedoMeterPosition: {
                left: false,
                top: false,
            },
            rpmGaugePosition: {
                left: false,
                top: false,
            },
            nosGaugePosition: {
                left: false,
                top: false,
            },
            screenKeysPosition: {
                left: false,
                top: false,
            },
            weaponPosition: {
                left: false,
                top: false,
            },
            hudPosition: {
                left: false,
                top: false,
            },
            nameBoxPosition: {
                left: false,
                top: false,
            },
            bankBoxPosition: {
                left: false,
                top: false,
            },
            cashBoxPosition: {
                left: false,
                top: false,
            },
            bossMoneyBoxPosition: {
                left: false,
                top: false,
            },
            blackMoneyBoxPosition: {
                left: false,
                top: false,
            },
            vipMoneyBoxPosition: {
                left: false,
                top: false,
            },
            serverInfoBoxPosition: {
                left: false,
                top: false,
            },
            giftContainerPosition: {
                left: false,
                top: false,
            },
            hungerHudPosition: {
                left: false,
                top: false,
            },
            thirstHudPosition: {
                left: false,
                top: false,
            },
            micLevelPosition: {
                left: false,
                top: false,
            },
            stressPosition: {
                left: false,
                top: false,
            },
            dynamicHudPosition: {
                left: false,
                top: false,
            },
            armorPosition: {
                left: false,
                top: false,
            },
            healthPosition: {
                left: false,
                top: false,
            },
            micPosition: {
                left: false,
                top: false,
            },
            streamerMode: false,
            playMediaSongs: false,
            showMyPlayerId: false,


        },
        defaultRPMColors: {
            rpmMonochromeColor: false,
            rpmOuterCircle: '#D9D9D9',
            innerSmallRPMLines: '#FFFFFF',
            highlightedRPMIndicators: '#FFFFFF',
            burnOutWarnColor: '#FF0000',
            rpmTextColor: '#FFFFFF',
            rpmNeedle: '#FF4848',
            rpmNeedleCircle: '#FF4848',
        },
        defaultSpeedoColors: {
            speedoMonochromeColor: false,
            speedoOuterCircleColor: '#D9D9D9',
            innerSmallSpeedoLineColor: "#FFFFFF",
            nonHighlightedSpeedIndicatorsColor: "#FFFFFF",
            highlightedSpeedIndicatorsColor: "#FFFFFF",
            speedIndicatorColor: "#FFFFFF",
            needleColor: '#FF4848',
            needleCircleColor: '#FF4848',
        },
        defaultNitroColors: {
            nosMonoChromeColor: false,
            nosOuterCircle: '#D9D9D9',
            nonHighlitedGaugeLines: '#FFFFFF',
            highlitedGaugeLines: '#FFFFFF',
            nitroStatusColor: '#48FFF4',
            nitroTextColor: '#FFFFFF',
            nitroNeedleColor: '#FF4848',
            nitroNeedleCircleColor: '#FF4848',
        },
        showHudSettings: false,
        selectedSettingsElement: '',
        hoveredSettingsElement: '',
        location: {
            street: '',
            zone: '',
            heading: '',

        },
        micSettings: {
            mic_level: 2,
            isTalking: false,
            isMuted: false,
        },
        status: {
            health: 0,
            armor: 0,
            stamina: 0,
            hunger: 0,
            thirst: 0,
            oxygen: 0,
            altitude: 0,
        },
        barVisibility: {
            hunger: true,
            thirst: true,
            stress: true,
            stamina: true,
            oxygen: false,
            altitude: false,
        },
        inVehicle: false,
        vehicleType: false,
        showMapWalking: false,
        activeMenu: 'map',
        activeVehicleMenu: 'doors',
        activeMediaMenu: 'play',
        currentMediaPlayPage: 'play',
        activeQuickMenu: false,
        vehicleMode: 'normal',

        enableTopWidget: true,
    },
    getters: {

    },
    mutations: {
        setShowHudSettings(state, payload) {
            state.showHudSettings = payload
        },
        setFreeformEdit(state, payload) {
            state.freeformEdit = payload
        },
        toggleUIKeys(state, payload){
            state.enableUIKeys = payload
        },
        setHudSettings(state, payload) {
            localStorage.setItem(payload.type, JSON.stringify(payload.value));
            state.hudSettings[payload.type] = payload.value
            const colorTypes = [
                'healthColor',
                'armorColor',
                'hungerColor',
                'thirstColor',
                'stressColor',
                'staminaColor',
                'oxygenColor',
                'altitudeColor'
            ]

            if (colorTypes.includes(payload.type)) {
                state.hudSettings.monochromeColor = false
                localStorage.setItem("monochromeColor", JSON.stringify(false));
            }

            const speedoColorTypes = [
                'speedoOuterCircleColor',
                'innerSmallSpeedoLineColor',
                'nonHighlightedSpeedIndicatorsColor',
                'highlightedSpeedIndicatorsColor',
                'speedIndicatorColor',
                'needleColor',
                'needleCircleColor',
            ]
            if (speedoColorTypes.includes(payload.type)) {
                state.hudSettings.speedoMonochromeColor = false
                localStorage.setItem("speedoMonochromeColor", JSON.stringify(false));
            }


            const rpmColorTypes = [
                'rpmOuterCircle',
                'innerSmallRPMLines',
                'highlightedRPMIndicators',
                'burnOutWarnColor',
                'rpmTextColor',
                'rpmNeedle',
                'rpmNeedleCircle',
            ]


            if (rpmColorTypes.includes(payload.type)) {
                state.hudSettings.rpmMonochromeColor = false
                localStorage.setItem("rpmMonochromeColor", JSON.stringify(false));
            }

            const nitroColorTypes = [
                'nosOuterCircle',
                'nonHighlitedGaugeLines',
                'highlitedGaugeLines',
                'nitroStatusColor',
                'nitroTextColor',
                'nitroNeedleColor',
                'nitroNeedleCircleColor',
            ]


            if (nitroColorTypes.includes(payload.type)) {
                state.hudSettings.nosMonoChromeColor = false
                localStorage.setItem("nosMonoChromeColor", JSON.stringify(false));
            }
        },
        setHudSettingsWithoutSave(state, payload) {
            state.hudSettings[payload.type] = payload.value
            const colorTypes = [
                'healthColor',
                'armorColor',
                'hungerColor',
                'thirstColor',
                'stressColor',
                'staminaColor',
                'oxygenColor',
                'altitudeColor'
            ]
            if (colorTypes.includes(payload.type)) {
                state.hudSettings.monochromeColor = false
            }

            const speedoColorTypes = [
                'speedoOuterCircleColor',
                'innerSmallSpeedoLineColor',
                'nonHighlightedSpeedIndicatorsColor',
                'highlightedSpeedIndicatorsColor',
                'speedIndicatorColor',
                'needleColor',
                'needleCircleColor',
            ]
            if (speedoColorTypes.includes(payload.type)) {
                state.hudSettings.speedoMonochromeColor = false
            }

            const rpmColorTypes = [
                'rpmOuterCircle',
                'innerSmallRPMLines',
                'highlightedRPMIndicators',
                'burnOutWarnColor',
                'rpmTextColor',
                'rpmNeedle',
                'rpmNeedleCircle',
            ]


            if (rpmColorTypes.includes(payload.type)) {
                state.hudSettings.rpmMonochromeColor = false
            }

            const nitroColorTypes = [
                'nosOuterCircle',
                'nonHighlitedGaugeLines',
                'highlitedGaugeLines',
                'nitroStatusColor',
                'nitroTextColor',
                'nitroNeedleColor',
                'nitroNeedleCircleColor',
            ]


            if (nitroColorTypes.includes(payload.type)) {
                state.hudSettings.nosMonoChromeColor = false
            }

        },
        syncHudSettings(state, payload) {
            for (let key in state.hudSettings) {
                let stored = JSON.parse(localStorage.getItem(key));
                if (stored != null || stored != undefined) {
                    state.hudSettings[key] = stored
                }else{
                    if(key == "speedType"){
                        localStorage.setItem("speedType", JSON.stringify(payload.defaultSpeedType));
                        state.hudSettings["speedType"] = payload.defaultSpeedType
                    }
                }
            }
        },
        setLocales(state,  payload){
            state.locales = payload
        },
        setEnableTopWidget(state, payload) {
            state.enableTopWidget = payload
        },
        setSelectedSettingsElement(state, payload) {
            state.selectedSettingsElement = payload

        },
        setHoveredSettingsElement(state, payload) {
            state.hoveredSettingsElement = payload
        },
        setLocation(state, payload) {
            state.location = payload
        },

        setMicSettings(state, payload) {
            state.micSettings[payload.type] = payload.value
        },
        setActiveMediaMenu(state, payload) {
            state.activeMediaMenu = payload
        },
        setStatus(state, payload) {
            state.status[payload.type] = payload.value
        },
        setBarVisibility(state, payload) {
            state.barVisibility[payload.type] = payload.value
        },
        setEnableSafezoneNotify(state, payload){
            state.enableSafezoneNotify = payload
        },
        setInVehicle(state, payload) {
            state.inVehicle = payload.value
            state.vehicleType = payload.type
        },
        setActiveQuickMenu(state, payload) {
            state.activeQuickMenu = payload

        },
        setShowMapWhileWalking(state, payload) {
            state.showMapWalking = payload
        },
        setActiveVehicleMenu(state, payload) {
            state.activeVehicleMenu = payload

        },
        setActiveMenu(state, payload) {
            state.activeMenu = payload
        },
        setVehicleMode(state, payload) {
            state.vehicleMode = payload
        },
        setCurrentMediaPlayPage(state, payload) {
            state.currentMediaPlayPage = payload
        },
    },
}

export default module