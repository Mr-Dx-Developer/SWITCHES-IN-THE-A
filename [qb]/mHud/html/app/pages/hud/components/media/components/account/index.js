import importTemplate from '../../../../../../utils/importTemplate.js'
import inlinesvg from '../../../../../../utils/inlineSvg.js'


const Account = {
    data() {
        return {
            songName: '',
            list: [],
            songs: [],
        }
    },
    methods: {
        ...Vuex.mapMutations({
            setCurrentMediaPlayPage: 'hud/setCurrentMediaPlayPage',
            setEnableTopWidget : 'hud/setEnableTopWidget'
        }),
        
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
    },
    components: {
        inlinesvg
    },
    watch: {
    
    },
    computed: {
        ...Vuex.mapGetters({
        }),
        ...Vuex.mapState({
            currentMediaPlayPage: state => state.hud.currentMediaPlayPage,
            selectableElements: state => state.hud.selectableElements,
            enableTopWidget : state => state.hud.enableTopWidget,
            myPlaylists : state => state.media.myPlaylists,
            player_name : state => state.info.player_name,
            pp : state => state.info.pp,
            locales : state => state.hud.locales,



        }),
        getComputedLikes(){
            let likes = 0
            this.myPlaylists.forEach(data => {
                likes += data.likes.length
            });
            return likes
        }

    },
    created() {
    },
    beforeDestroy() {

    },
    template: await importTemplate('./app/pages/hud/components/media/components/account/index.html')
}
export default Account