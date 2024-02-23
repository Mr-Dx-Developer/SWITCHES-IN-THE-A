import importTemplate from '../../../../../../utils/importTemplate.js'
import inlinesvg from '../../../../../../utils/inlineSvg.js'


const Search = {
    data() {
        return {
            name : '',
        }
    },
    methods: {
        ...Vuex.mapMutations({
            setCurrentMediaPlayPage: 'hud/setCurrentMediaPlayPage',
            setCurrentPlaylist : 'media/setCurrentPlaylist',
            setActiveMediaMenu : 'hud/setActiveMediaMenu'
        }),
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
        OpenPlaylist(data){
            
            if(this.identifier == data.owner){
                this.setCurrentPlaylist({
                    type : 'isMyPlaylist',
                    value : true,
                })
            }else{
                this.setCurrentPlaylist({
                    type : 'isMyPlaylist',
                    value : false,
                })
            }
           
            this.setCurrentPlaylist({
                type : 'data',
                value : data,
            })
            this.setActiveMediaMenu('playlistview')
            
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
            playlists : state => state.media.playlists,
            identifier : state => state.info.identifier,
            locales : state => state.hud.locales,


        }),
        getFilteredPlaylists(){
            if(this.name.trim().length == 0){
                let data = this.playlists.sort(function(a, b) {
                    return a.likes.length - b.likes.length;
                });
                return data.slice(0, 9);
            }else{
                return this.playlists.filter((data) => data.name.toLowerCase().includes(this.name.toLowerCase()))
            }
        },
    },
    created() {
    },
    beforeDestroy() {

    },
    template: await importTemplate('./app/pages/hud/components/media/components/search/index.html')
}
export default Search