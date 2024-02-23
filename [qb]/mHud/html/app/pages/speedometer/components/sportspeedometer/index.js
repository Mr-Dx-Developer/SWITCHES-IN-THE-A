import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'



const Vehicle = {
    data() {
        return {
            nitroValue: 0,
            rpmprogress: false,
            speedprogress: false,
            fuelprogress: false,
            nitroprogress: false,
        }
    },
    props: ["speed", "cruise", "vehicleSignals", "fuel", "seatbeltEnabled", "vehicleLights", "engineStatus", "handbrake", "nitroneedle"],
    methods: {
        messageHandler(event) {
            switch (event.data.action) {
                case "SET_NITRO_VALUE":
                    this.nitroValue = event.data.payload
                    if (this.nosbar) {
                        this.nosbar.set(this.nitroValue, true)
                    }
                    break
                default:
                    break;
            }
        }

    },
    components: {
        inlinesvg,
    },
    computed: {

        ...Vuex.mapState({

            hudSettings: state => state.hud.hudSettings,

        }),
        SpeedometerIndicator() {

            let minSpeed = 0;
            let maxSpeed = 290;
            let minDegree = -202;

            let maxDegree = -12;
            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.speed.current - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
                transformOrigin: 'bottom',
                transition: 'all 0.2s linear 0s'
            }
        },
        RpmIndicator() {
            let minSpeed = 1;
            let maxSpeed = 0;
            let minDegree = 9;
            let maxDegree = 207;
            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.speed.rpm - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
                transformOrigin: 'bottom',
                transition: 'all 0.2s linear 0s'
            }
        },



    },
    mounted() {
        window.addEventListener('message', this.messageHandler);
        if (!this.fuelprogress) {
            this.fuelprogress = new ProgressBar.Path("#fuel-line", {
                easing: 'easeInOut',
                duration: 200
            });
            this.fuelprogress.animate(-(this.fuel / 100))        
        }
        if (!this.nitroprogress) {
            this.nitroprogress = new ProgressBar.Path("#nitro-line", {
                easing: 'easeInOut',
                duration: 200
            });
            this.nitroprogress.animate(-(this.nitroValue / 100))        

        }

    },
    watch: {

        'speed.rpm'(val) {
            if (!this.rpmprogress) {
                this.rpmprogress = new ProgressBar.Path("#rpm-line", {
                    easing: 'easeInOut',
                    duration: 200
                });
                this.rpmprogress.set(0)
            }
            if (val > 0.82) {
                this.rpmprogress.animate(-0.82)
            } else {
                this.rpmprogress.animate(-val)
            }
        },
        'fuel'(val) {
            if (!this.fuelprogress) {
                this.fuelprogress = new ProgressBar.Path("#fuel-line", {
                    easing: 'easeInOut',
                    duration: 200
                });
                this.fuelprogress.set(0)
            }
            this.fuelprogress.animate(-(val / 100))
        },
        'nitroValue'(val) {
            if (!this.nitroprogress) {
                this.nitroprogress = new ProgressBar.Path("#nitro-line", {
                    easing: 'easeInOut',
                    duration: 200
                });
                this.nitroprogress.set(0)
            }

            this.nitroprogress.animate(-(val / 100))

        },
        'speed.current'(val) {
            if (!this.speedprogress) {
                this.speedprogress = new ProgressBar.Path("#speedo-line", {
                    easing: 'easeInOut',
                    duration: 200
                });
                this.speedprogress.set(0)

            }
            this.speedprogress.animate(-(val / 260))
        },



    },
    created() {
    },
    beforeDestroy() {
        window.removeEventListener('message', this.messageHandler);

    },
    template: await importTemplate('./app/pages/speedometer/components/sportspeedometer/index.html')
}
export default Vehicle