import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'
import play from './components/play/index.js'
import search from './components/search/index.js'
import myplaylist from './components/myplaylist/index.js'
import playlistview from './components/playlistview/index.js'
import playlists from './components/playlists/index.js'


import account from './components/account/index.js'






const Media = {
    data() {
        return {
    

        }
    },
    methods: {
        ...Vuex.mapMutations({
            setActiveMediaMenu: 'hud/setActiveMediaMenu'
        }),
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
    },
    components: {
        inlinesvg,
        play,
        search,
        myplaylist,
        account,
        playlistview,
        playlists,
    },
    computed: {
        ...Vuex.mapGetters({


        }),
        ...Vuex.mapState({
            activeMediaMenu: state => state.hud.activeMediaMenu
        }),

    },
 
    beforeDestroy() {

    },
    template: await importTemplate('./app/pages/hud/components/media/index.html')
}
export default Media