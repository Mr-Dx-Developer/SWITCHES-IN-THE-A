import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'


const Vehicle = {
    data() {
        return {
            lights: {
                r: false,
                g: false,
                b: false,
            },
            neons: {
                left: false,
                right: false,
                front: false,
                back: false,
            },
            vehicleImg : 'vehicle-1.png'
        }
    },
    methods: {
        ...Vuex.mapMutations({
            setActiveVehicleMenu: 'hud/setActiveVehicleMenu',
        }),
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
        ToggleWindow(window, door){
            postNUI('toggleWindow', {
                window,
                door
            })
        },
        ChangeSeat(seat){
            postNUI('changeSeat', {
                seat
            })
        },
        ToggleNeon(type, value) {
            postNUI('toggleNeon', {
                type,
                value,
            })
        },
        vehicleDoors(value){
            postNUI('vehicleDoors', {
                value,
            })
        },
        messageHandler(event) {
            switch (event.data.action) {
                case "NEON_ENABLED":
                    this.neons[event.data.payload.type] = event.data.payload.value
                    break
                case "NEON_LIGHTS":
                    this.lights.r = event.data.payload.r
                    this.lights.g = event.data.payload.g
                    this.lights.b = event.data.payload.b
                    break
                case "VEHICLE_DOORS":
                    this.vehicleImg = event.data.payload
                    break
                default:
                    break
            }
        }
    },
    components: {
        inlinesvg
    },
    computed: {
        ...Vuex.mapGetters({

        }),
        ...Vuex.mapState({
            activeVehicleMenu: state => state.hud.activeVehicleMenu,
            locales: state => state.hud.locales,


        }),
        computedRGB() {
            return `rgba(${this.lights.r}, ${this.lights.g}, ${this.lights.b})`
        },


    },
    mounted() {
        window.addEventListener('message', this.messageHandler);

    },
    created() {
    },
    beforeDestroy() {
        window.removeEventListener('message', this.messageHandler);

    },
    template: await importTemplate('./app/pages/hud/components/vehicle/index.html')
}
export default Vehicle