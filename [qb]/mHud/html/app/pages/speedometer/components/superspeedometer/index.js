import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'



const Vehicle = {
    data() {
        return {
            nitroValue: 0,
            nosbar: false,
            fuelbar : false,
            vehicle: [
                {
                    name: 'vehiclelights'
                },
                {
                    name: 'vehicleseatbelt'
                },
                {
                    name: 'vehicleengine'
                },
                {
                    name: 'vehiclebreak'
                },

            ]
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
            let maxSpeed = 280;
            let minDegree = -27;
            let maxDegree = 220;

            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.speed.current - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
                transformOrigin: 'right center',
                transition: 'all 0.2s linear 0s'
            }
        },
  
    


    },
    mounted() {
        window.addEventListener('message', this.messageHandler);
        this.nosbar = new ldBar(".superspeedo-nos", {
            "stroke": "#48FFF4",
            "stroke-width": 9,
            "stroke-trail-width": 9,
            "preset": "circle",
            "stroke-trail": "rgba(255, 0, 0, 0)",
            "value": this.nitroValue
        });
        this.fuelbar = new ldBar(".superspeedo-fuel", {
            "stroke": "#0996FE",
            "stroke-width": 9,
            "stroke-trail-width": 9,
            "preset": "circle",
            "stroke-trail": "rgba(255, 0, 0, 0)",
            "value": this.fuel
        });

    },
    watch:{
        fuel(val){
            if(this.fuelbar){

                this.fuelbar.set(val, true)            
            }
        },
    },
    created() {
    },
    beforeDestroy() {
        window.removeEventListener('message', this.messageHandler);

    },
    template: await importTemplate('./app/pages/speedometer/components/superspeedometer/index.html')
}
export default Vehicle