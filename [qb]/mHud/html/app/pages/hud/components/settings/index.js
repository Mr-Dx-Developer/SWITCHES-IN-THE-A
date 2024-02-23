import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'


const Settings = {
    data() {
        return {
            vehicleMode : 'default'
        }
    },
    watch : {
        vehicleMode(type, old){
        
          
        }
    },
    methods: {
        // ...Vuex.mapMutations({
        //     setVehicleMode : 'hud/setVehicleMode',
        // }),
        
        async setVehicleMode(val){
            const old = this.vehicleMode
            this.vehicleMode = val
            const data = await postNUI('setVehicleMode', {
                type:val,
            })
            if(!data){
                this.vehicleMode = old                
            }else{
                let audio = new Audio('./assets/sounds/wrench.ogg');
                audio.play();
                audio.volume = 0.10;
            }
        },
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },

    },
    components: {
        inlinesvg
    },
    computed: {
        ...Vuex.mapState({
            locales : state => state.hud.locales

        }),
        // ...Vuex.mapState({
        //     vehicleMode: state => state.hud.vehicleMode,
        // }),
     
    },
    created() {
    },
    beforeDestroy() {
        
    },
    template: await importTemplate('./app/pages/hud/components/settings/index.html')
}
export default Settings