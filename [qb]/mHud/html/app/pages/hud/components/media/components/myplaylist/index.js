import importTemplate from '../../../../../../utils/importTemplate.js'
import inlinesvg from '../../../../../../utils/inlineSvg.js'


const MyPlaylist = {
    data() {
        return {
            myPlaylistPage: 'main',
            addSongUrl: "",
            songs: [],
            coverUrl : "",
            playlistName : "",

        }
    },
    methods: {
        ...Vuex.mapMutations({
            setCurrentPlaylist : 'media/setCurrentPlaylist',
            setActiveMediaMenu: 'hud/setActiveMediaMenu'
 
        }),
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
        OpenPlaylist(data){
            if(data.owner == this.identifier){
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
        CreatePlaylist(){     
            function isImgUrl(url) {
                const img = new Image();
                img.src = url;
                return new Promise((resolve) => {
                  img.onload = () => resolve(true);
                  img.onerror = () => resolve(false);
                });
            }
            if(this.playlistName.trim().length > 0){
                isImgUrl(this.coverUrl).then((isValidImg) => {
                    let tempCoverUrl = false
                    if(!isValidImg){
                        tempCoverUrl = 'default'
                    }
                    postNUI('createPlaylist', {
                        name : this.playlistName,
                        cover : tempCoverUrl || this.coverUrl,
                        songs : this.songs,
                    })
                    this.playlistName = ""
                    this.coverUrl = ""
                    this.songs = []
                })
            }
        

        },
        SetMyPlayListPage(payload) {
            this.myPlaylistPage = payload
        },
        DeleteSongFromAddList(index){
            this.songs =  this.songs.filter((el, i) => i != index)
        },
        AddSong() {
            if (this.addSongUrl) {
                $.getJSON('https://noembed.com/embed?url=', { format: 'json', url: this.addSongUrl }, (data) => {
                    let exist = this.songs.find((el) => el.name == data.title)
                    if(!exist){
                        this.songs.push({
                            name : data.title,
                            url : this.addSongUrl, 
                        })
                        this.SetMyPlayListPage('create')
                        this.addSongUrl = ''    
                    }
                })
            }
        },
    },
    components: {
        inlinesvg
    },
    watch: {
        coverUrl(val){
         
            if(val.trim().length > 0){
                function isImgUrl(url) {
                    const img = new Image();
                    img.src = url;
                    return new Promise((resolve) => {
                      img.onload = () => resolve(true);
                      img.onerror = () => resolve(false);
                    });
                }
                isImgUrl(val).then((isValidImg) => {
                    if(!isValidImg){
                        this.coverUrl = ""
                    }
        
                })
            }
        },
    },
    computed: {
        ...Vuex.mapGetters({
        }),
        ...Vuex.mapState({
            currentMediaPlayPage: state => state.hud.currentMediaPlayPage,
            selectableElements: state => state.hud.selectableElements,
            myPlaylists: state => state.media.myPlaylists,
            playlists: state => state.media.playlists,
            identifier: state => state.info.identifier,
            locales : state => state.hud.locales,


        }),
        getComputedPlaylists(){
            let computedPlaylists = [...this.myPlaylists]
            this.playlists.forEach(data => {
                if(data.likes.includes(this.identifier) && data.owner != this.identifier){
                    computedPlaylists.push(data)
                }
            });
            return computedPlaylists
        },
    },
    created() {
    },
    beforeDestroy() {
    },
    template: await importTemplate('./app/pages/hud/components/media/components/myplaylist/index.html')
}
export default MyPlaylist