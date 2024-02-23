import importTemplate from '../../utils/importTemplate.js'
import inlinesvg from '../../utils/inlinesvg.js'
import oldschoolhud from './components/oldschoolhud/index.js'
import superspeedometer from './components/superspeedometer/index.js'
import sportspeedo from './components/sportspeedometer/index.js'
import driftspeedo from './components/driftspeedometer/index.js'




const Hud = {
    data() {
        return {
            speed: {
                current: 0,
                max: 0,
                rpm: 0.0,
                roll: 0,
                headingValue: 0,
                gear : 0,
                wind: 0,
            },
            inBicycle: false,
            lightData: {
                inPoliceVehicle: false,
                inAmbulanceVehicle: false,
                sirenOn: false,
            },
            seatbeltEnabled: false,
            cruise: {
                enabled: false,
                speed: 0,
            },
            clock: {
                minutes: 0,
                hours: 0,
            },
            bar: false,
            vehicleLights: false,
            handbrake: false,
            abs: false,
            vehicleSignals: {
                leftindicator: false,
                rightindicator: false,
                hazardlights: false,
            },
            vehicleSignalStatus: {
                leftindicatorInterval: false,
                rightindicatorInterval: false,
                hazardlightsInterval: false,
                leftindicatorstatus: false,
                rightindicatorstatus: false,
                hazardlightstatus: false,
            },
            engineStatus: false,
            fuel: 0,
            nitroValue: 1,
            nitroNeedle: -124,
            nitroNeedleTimeout: false,
            nitroNeedleInterval: false,

        }
    },
    mounted() {
        window.addEventListener('message', this.messageHandler);
        setTimeout(() => {
            this.SetupNitroBar()
        }, 1000)

    },
    beforeDestroy() {
        window.removeEventListener('message', this.messageHandler);

    },
    methods: {
        getSpeedoColors(type) {
            if (this.hudSettings.speedoMonochromeColor) {
                return this.hudSettings.speedoMonochromeColor
            }

            return this.hudSettings[type]
        },
        getRPMColors(type) {
            if (this.hudSettings.rpmMonochromeColor) {
                return this.hudSettings.rpmMonochromeColor
            }

            return this.hudSettings[type]
        },
        getNitroColors(type) {
            if (this.hudSettings.nosMonoChromeColor) {
                return this.hudSettings.nosMonoChromeColor
            }

            return this.hudSettings[type]
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
        SetupNitroBar() {
            if (!this.bar) {

                this.bar = new ldBar(".nos", {
                    "stroke": this.getNitroColors("nitroStatusColor"),
                    "stroke-width": 11,
                    "stroke-trail-width": 11,
                    "preset": "circle",
                    "stroke-trail": this.hexToRGB(this.getNitroColors("nitroStatusColor"), 0.14),
                    "value": this.nitroValue
                });




            }
        },
        messageHandler(event) {
            switch (event.data.action) {
                case "SET_SPEED":
                    this.speed = event.data.payload

                    break
                case "UPDATE_CLOCK":
                    this.clock = event.data.payload
                    break
                case "SET_LIGHT_DATA":
                    this.lightData = event.data.payload
                    break
                case "SET_SEATBELT":
                    this.seatbeltEnabled = event.data.payload
                    if (this.seatbeltEnabled) {
                        let audio = new Audio('./assets/sounds/buckle.ogg');
                        audio.play();
                        audio.volume = 0.10;
                    } else {
                        let audio = new Audio('./assets/sounds/unbuckle.ogg');
                        audio.play();
                        audio.volume = 0.10;
                    }

                    break
                case "SET_CRUISE":
                    this.cruise = event.data.payload
                    break
                case "VEHICLE_LIGHTS":
                    this.vehicleLights = event.data.payload
                    break
                case "handbrake":
                    this.handbrake = event.data.payload
                    break
                case "abs":
                    this.abs = event.data.payload
                    break
                case "VEHICLE_SIGNALS":
                    this.vehicleSignals = event.data.payload
                    break
                case "FUEL":
                    this.fuel = event.data.payload
                    break
                case "ENGINE_STATUS":
                    this.engineStatus = event.data.payload
                    break
                case "SET_NITRO_VALUE":
                    this.nitroValue = event.data.payload
                    if (this.bar) {
                        this.bar.set(this.nitroValue, true)
                    }
                    break
                case "NITRO_ACTIVE":
                    this.nitroNeedle += 5
                    if (this.nitroNeedle >= 124) {
                        this.nitroNeedle = 124
                    }
                    if (this.nitroNeedleTimeout) {
                        clearTimeout(this.nitroNeedleTimeout)
                        this.nitroNeedleTimeout = false
                    }
                    if (this.nitroNeedleInterval) {
                        clearInterval(this.nitroNeedleInterval)
                        this.nitroNeedleInterval = false
                    }
                    this.nitroNeedleTimeout = setTimeout(() => {
                        this.nitroNeedleInterval = setInterval(() => {
                            this.nitroNeedle -= 5
                            if (this.nitroNeedle <= -124) {
                                this.nitroNeedle = -124
                                clearInterval(this.nitroNeedleInterval)
                                this.nitroNeedleInterval = false
                            }
                        }, 300)
                    }, 500)
                    break
                default:
                    break;
            }
        }
    },
    watch: {

        inVehicle(val) {
            if (val) {
                this.SetupNitroBar()
            }
        },
        'vehicleSignals.leftindicator'(val) {
            if (val) {

                this.vehicleSignalStatus.leftindicatorInterval = setInterval(() => {
                    this.vehicleSignalStatus.leftindicatorstatus = !this.vehicleSignalStatus.leftindicatorstatus
                }, 500)
            } else {
                if (this.vehicleSignalStatus.leftindicatorInterval) {
                    clearInterval(this.vehicleSignalStatus.leftindicatorInterval)
                    this.vehicleSignalStatus.leftindicatorInterval = false
                }
                this.vehicleSignalStatus.leftindicatorstatus = false
            }
        },
        'vehicleSignals.rightindicator'(val) {
            if (val) {
                this.vehicleSignalStatus.rightindicatorInterval = setInterval(() => {

                    this.vehicleSignalStatus.rightindicatorstatus = !this.vehicleSignalStatus.rightindicatorstatus
                }, 500)
            } else {
                if (this.vehicleSignalStatus.rightindicatorInterval) {

                    clearInterval(this.vehicleSignalStatus.rightindicatorInterval)
                    this.vehicleSignalStatus.rightindicatorInterval = false
                }

                this.vehicleSignalStatus.rightindicatorstatus = false
            }
        },
        'vehicleSignals.hazardlights'(val) {
            if (val) {
                this.vehicleSignalStatus.hazardlightsInterval = setInterval(() => {
                    this.vehicleSignalStatus.hazardlightstatus = !this.vehicleSignalStatus.hazardlightstatus
                }, 500)
            } else {
                if (this.vehicleSignalStatus.hazardlightsInterval) {
                    clearInterval(this.vehicleSignalStatus.hazardlightsInterval)
                    this.vehicleSignalStatus.hazardlightsInterval = false
                }
                this.vehicleSignalStatus.hazardlightstatus = false
            }
        },
        'hudSettings.nitroStatusColor'(val) {
            if (val) {
                if (this.bar) {
                    document.querySelector(".nos g .mainline").style.stroke = val
                    document.querySelector(".nos g .baseline").style.stroke = this.hexToRGB(val, 0.14)
                }

            }
        },
        'hudSettings.nosMonoChromeColor'(val) {
            if (val) {
                if (this.bar) {
                    document.querySelector(".nos g .mainline").style.stroke = val
                    document.querySelector(".nos g .baseline").style.stroke = this.hexToRGB(val, 0.14)
                }
            } else {
                if (this.bar) {

                    document.querySelector(".nos g .mainline").style.stroke = this.getNitroColors("nitroStatusColor")
                    document.querySelector(".nos g .baseline").style.stroke = this.hexToRGB(this.getNitroColors("nitroStatusColor"), 0.14)
                }
            }
        },
    },
    components: {
        inlinesvg,
        oldschoolhud,
        superspeedometer,
        sportspeedo,
        driftspeedo,
    },
    computed: {
        ...Vuex.mapState({
            inVehicle: state => state.hud.inVehicle,
            vehicleType: state => state.hud.vehicleType,
            showHudSettings: state => state.hud.showHudSettings,
            hudSettings: state => state.hud.hudSettings,
            selectedSettingsElement: state => state.hud.selectedSettingsElement,
            hoveredSettingsElement: state => state.hud.hoveredSettingsElement,
            location: state => state.hud.location,
            vehicleMode : state => state.hud.vehicleMode,
        }),
        getSpeedemoterStyle() {
            if (this.hudSettings.speedoMeterPosition.left && this.hudSettings.speedoMeterPosition.top) {

                return {
                    left: this.hudSettings.speedoMeterPosition.left + 'px',
                    top: this.hudSettings.speedoMeterPosition.top + 'px',
                    transform: 'scale(' + this.hudSettings.speedometerSize + ')',

                }
            }
            return {
                left: "7vw",
                bottom: "1.5vw",
                transform: 'scale(' + this.hudSettings.speedometerSize + ')',
           

            }
        },
        getHeliSpeedoStyle() {
            if (this.hudSettings.speedoMeterPosition.left && this.hudSettings.speedoMeterPosition.top) {

                return {
                    left: this.hudSettings.speedoMeterPosition.left + 'px',
                    top: (this.hudSettings.speedoMeterPosition.top-(30*this.hudSettings.speedometerSize)) + 'px',
                    transform: 'scale(' + this.hudSettings.speedometerSize + ')',
                }
            }
            return {
                left: "7.25vw",
                bottom: "3.35vw",
                transform: 'scale(' + this.hudSettings.speedometerSize + ')',
           
        
            }
        },
  
        getSirenStyle() {
            if (this.hudSettings.speedoMeterPosition.left && this.hudSettings.speedoMeterPosition.top) {

                return {
                    left: this.hudSettings.speedoMeterPosition.left + 'px',
                    top: (this.hudSettings.speedoMeterPosition.top) + 'px',
                    scale: this.hudSettings.speedometerSize,
                }
            }
            return {
                left: '7vw',
                bottom: '1.5vw' ,
                scale: this.hudSettings.speedometerSize,
            }
        },
        getRPMGaugeStyle() {
            if (this.hudSettings.rpmGaugePosition.left && this.hudSettings.rpmGaugePosition.top) {

                return {
                    left: this.hudSettings.rpmGaugePosition.left + 'px',
                    top: this.hudSettings.rpmGaugePosition.top + 'px',
                    transform: 'scale(' + this.hudSettings.rpmSize + ')'
                }
            }

            return {
                left: "21vw",
                bottom: "13.2vw",
                transform: 'scale(' + this.hudSettings.rpmSize + ')'
            }
        },
        getNOSGaugeStyle() {
            if (this.hudSettings.nosGaugePosition.left && this.hudSettings.nosGaugePosition.top) {

                return {
                    left: this.hudSettings.nosGaugePosition.left + 'px',
                    top: this.hudSettings.nosGaugePosition.top + 'px',
                    transform: 'scale(' + this.hudSettings.nosSize + ')'
                }
            }

            return {
                left: "1vw",
                bottom: "1vw",
                transform: 'scale(' + this.hudSettings.nosSize + ')'
            }
        },
        getFuelColor() {
            if (this.fuel <= 50 && this.fuel >= 20) {
                return "#FFB800"
            } else if (this.fuel < 20) {
                return "#FF4848"
            }
            return "white"
        },

        getBikeSpeedometerProgress() {
            return ((this.speed.current / 100) * (this.speed.max)) * 7
        },
        getRpmNeedleLocation() {
            
            let minSpeed = 0;
            let maxSpeed = 1.0;
            let minDegree = -130;
            let maxDegree = 190;

            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.speed.rpm - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
            
            }
           
        },
        getNitroNeedleLocation() {
            return {
                transform: `rotate(${this.nitroNeedle}deg)`
            }
        },
        getCompassNeedleLocation() {
            let val = this.speed.headingValue.toFixed(0)
            if (358 <= Number(val) || Number(val) <= 2) {

                return {
                    transform: `rotate(${-val}deg)`
                }
            } else {
                return {
                    transition: '0.2s linear 0s',
                    transform: `rotate(${-val}deg)`
                }
            }
        },
        getWindNeedleLocation() {

            return {
                transform: `rotate(${(this.speed.wind * 26.5) - 124}deg)`
            }
        },
        getHeliNeedleLocation() {
            return {
                transform: `rotate(${this.speed.roll}deg)`
            }
        },
        getHeliSpeedo() {
            return {

                'stroke-dasharray': `${((this.speed.current / 100) * 195)} 990`,
            }
        },
        getNeedleLocation() {
            let value = this.speed.current
            if (this.speed.current >= 300) {
                value = 124
            } else {
                // if(this.speed.current <= 100){
                //     value += (this.speed.current-7)
                // } else if(this.speed.current <= 130 ){
                //     value += (this.speed.current-13)
                // } else if(this.speed.current <= 140 ){
                //     value += (this.speed.current-9)
                // }else{
                //     value += (this.speed.current-9)
                // }
                value -= 128 + (this.speed.current / 10)

            }

            return {
                transform: `rotate(${value}deg)`
            }
        },
    },
    template: await importTemplate('./app/pages/speedometer/index.html')
}
export default Hud