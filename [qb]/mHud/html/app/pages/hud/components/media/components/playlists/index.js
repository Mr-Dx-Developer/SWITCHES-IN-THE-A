import importTemplate from '../../../../../../utils/importTemplate.js'
import inlinesvg from '../../../../../../utils/inlineSvg.js'


const Play = {
    data() {
        return {

        }
    },
    methods: {
        ...Vuex.mapMutations({
            setCurrentMediaPlayPage: 'hud/setCurrentMediaPlayPage',
            setCurrentSongInformations: 'media/setCurrentSongInformations',
            setCurrentPlaylist: 'media/setCurrentPlaylist',
            setActiveMediaMenu: 'hud/setActiveMediaMenu'
        }),
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
        OpenPlaylist(data) {

            if (this.identifier == data.owner) {
                this.setCurrentPlaylist({
                    type: 'isMyPlaylist',
                    value: true,
                })
            } else {
                this.setCurrentPlaylist({
                    type: 'isMyPlaylist',
                    value: false,
                })
            }

            this.setCurrentPlaylist({
                type: 'data',
                value: data,
            })
            this.setActiveMediaMenu('playlistview')

        },
    },
    components: {
        inlinesvg
    },
    computed: {
        ...Vuex.mapGetters({


        }),
        ...Vuex.mapState({
            currentMediaPlayPage: state => state.hud.currentMediaPlayPage,
            currentSongInformations: state => state.media.currentSongInformations,
            playlists: state => state.media.playlists,
            player_name: state => state.info.player_name,
            identifier: state => state.info.identifier,
            locales: state => state.hud.locales,


        }),
        getTopPlaylists() {
            let data = this.playlists.sort(function (a, b) {
                return b.likes.length - a.likes.length;
            });
            return data.slice(0, 9);
        },

    },
    created() {

    },
    beforeDestroy() {

    },
    template: await importTemplate('./app/pages/hud/components/media/components/playlists/index.html')
}
export default Play