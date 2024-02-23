import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'


const Quick = {
    data() {
        return {

        }
    },
    methods: {
        ...Vuex.mapMutations({
            setActiveQuickMenu: 'hud/setActiveQuickMenu'
        }),
        Waypoint(type){
            postNUI('waypoint', {
                type 
            })
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
        ...Vuex.mapGetters({
            activeQuickMenu: 'hud/activeQuickMenu',

        }),
        ...Vuex.mapState({
            activeQuickMenu: state => state.hud.activeQuickMenu,
            locales: state => state.hud.locales,

        }),
        
        WaypointDesc() {
            if (this.activeQuickMenu == 1) {
                return [this.locales.BANK, "./app/pages/hud/components/quick/images/bank-bg.png", "#48FFF4"]
            }
            else if (this.activeQuickMenu == 2) {
                return [this.locales.GAS_STATION, "./app/pages/hud/components/quick/images/gas-bg.png", "#FF9548"]
            }
            else if (this.activeQuickMenu == 3) {
                return [this.locales.MARKET, "./app/pages/hud/components/quick/images/market-bg.png", "#FF00B8"]
            }
            else if (this.activeQuickMenu == 4) {
                return [this.locales.CLOTHING_SHOP, "./app/pages/hud/components/quick/images/clothing-bg.png", "#00FF85"]
            }
            else if (this.activeQuickMenu == 5) {
                return [this.locales.BARBER_SHOP, "./app/pages/hud/components/quick/images/barber-bg.png", "#FF8A00"]
            }
            else if (this.activeQuickMenu == 6) {
                return [this.locales.TATTOO_SHOP, "./app/pages/hud/components/quick/images/tatto-bg.png", "#FF003D"]
            }
      
            return false
        },
    },
    created() {
    },
    beforeDestroy() {
        this.setActiveQuickMenu(false)
    },
    template: await importTemplate('./app/pages/hud/components/quick/index.html')
}
export default Quick