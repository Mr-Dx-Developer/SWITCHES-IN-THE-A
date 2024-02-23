import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'



const Vehicle = {
    data() {
        return {
            nitroValue: 0,
            
        }
    },
    props: ["speed", "cruise", "vehicleSignals", "abs", "fuel", "seatbeltEnabled", "vehicleLights", "engineStatus", "handbrake", "nitroneedle"],
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
        },
        
  

    },
    components: {
        inlinesvg,
    },
    computed: {

        ...Vuex.mapState({
        
            hudSettings: state => state.hud.hudSettings,
            locales : state => state.hud.locales
         
        }),
        GetBrakeColor(){
            if(this.handbrake){
                return {
                    'color': '#FF3131',
                    'text-shadow': '0px 0px 53px #FF3131',
                }
            }
            return {
                'color': 'rgba(255, 255, 255, 0.47)'
            } 
        },
        GetABSColor(){
            if(this.abs){
                return {
                    'color': '#FF3131',
                    'text-shadow': '0px 0px 53px #FF3131',
                }
            }
            return {
                'color': 'rgba(255, 255, 255, 0.47)'
            } 
        },
        rpm(){
            return (100 * this.speed.rpm) / 1.0;
        },
        FormatSpeed(){
            const speed = this.speed.current.toFixed(0)
            if(speed.length == 1){
                return `<span style="color: rgba(60, 185, 255, 0.47);">0</span><span style="color: rgba(60, 185, 255, 0.47);">0</span>${speed}`
            }
            if(speed.length == 2){
                return `<span style="color: rgba(60, 185, 255, 0.47);">0</span>${speed}`
            }
            if(speed.length == 3){
                return `${speed}`
            }
            return '<span style="color: rgba(60, 185, 255, 0.47);">0</span><span style="color: rgba(60, 185, 255, 0.47);">0</span><span style="color: rgba(60, 185, 255, 0.47);">0</span>'
        },
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
    

    },
    watch:{
    
    },
    created() {
    },
    beforeDestroy() {
        window.removeEventListener('message', this.messageHandler);

    },
    template: await importTemplate('./app/pages/speedometer/components/driftspeedometer/index.html')
}
export default Vehicle