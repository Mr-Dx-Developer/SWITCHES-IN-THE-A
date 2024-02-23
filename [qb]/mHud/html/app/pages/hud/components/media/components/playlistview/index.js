import importTemplate from '../../../../../../utils/importTemplate.js'
import inlinesvg from '../../../../../../utils/inlineSvg.js'


const PlayListView = {
    data() {
        return {
            editMode: false,
            newName: '',
            newCover: '',
            showDeleteModal : false,
        }
    },
    methods: {
        ...Vuex.mapMutations({
            setCurrentPlaylist: 'media/setCurrentPlaylist',
            setActiveMediaMenu: 'hud/setActiveMediaMenu',
            setCurrentSongInformations: 'media/setCurrentSongInformations',
        }),
        ToggleDeleteModal(val){
            this.showDeleteModal = val
        },
        SaveEdit() {
            function isImgUrl(url) {
                const img = new Image();
                img.src = url;
                return new Promise((resolve) => {
                    img.onload = () => resolve(true);
                    img.onerror = () => resolve(false);
                });
            }
            if (this.newCover.trim().length > 0) {
                isImgUrl(this.newCover).then((isValidImg) => {
                    if (isValidImg) {
                        postNUI("ChangePlaylistData", {
                            id: this.currentPlaylist.data.id,
                            type: 'cover',
                            val: this.newCover,
                        })
                        this.newCover = ''
                    }
                })
            }
            if (this.newName.trim().length > 0) {
                postNUI("ChangePlaylistData", {
                    id: this.currentPlaylist.data.id,
                    type: 'name',
                    val: this.newName,
                })
                this.newName = ''
            }
            this.SetEditMode(false)
         
        },
        DeleteMusic(musicId) {
            postNUI('DeleteMusic', {
                id: this.currentPlaylist.data.id,
                musicId,
            })
        },
        SetEditMode(val) {
            this.editMode = val
            
        
        },
        PlayClick() {
            let audio = new Audio('./assets/sounds/click.ogg');
            audio.play();
            audio.volume = 0.10;
        },
        LikePlaylist() {
            postNUI('LikePlaylist', {
                id: this.currentPlaylist.data.id
            })
        },
        UnLikePlaylist() {
            postNUI('UnLikePlaylist', {
                id: this.currentPlaylist.data.id
            })
        },
        DeletePlaylist() {
            postNUI('DeletePlaylist', {
                id: this.currentPlaylist.data.id
            })
        },
        PlayRandom() {
            if(this.currentPlaylist.data.musics.length > 0){
                let index
                let music
                if(this.currentPlaylist.data.musics.length > 1){
                    index = Math.floor(Math.random() * this.currentPlaylist.data.musics.length)
                    music = this.currentPlaylist.data.musics[index]
                    while (this.currentPlaylist.currentMusicIndex == index) {
                        index = Math.floor(Math.random() * this.currentPlaylist.data.musics.length)
                        music = this.currentPlaylist.data.musics[index]
                    }

                }else{
                    index = 0
                    music = this.currentPlaylist.data.musics[index]
                }

                this.setCurrentSongInformations({
                    type: 'name',
                    value: music.name,
                })
                this.setCurrentSongInformations({
                    type: 'url',
                    value: music.url,
                })
    
                postNUI('musicAction', {
                    type: 'play',
                    url: music.url,
                    name: music.name,
                })
                this.setCurrentPlaylist({
                    type: 'currentMusicIndex',
                    value: index,
                })
            }
        },
        PlayMusic(music, index) {
            this.setCurrentSongInformations({
                type: 'name',
                value: music.name,
            })
            this.setCurrentSongInformations({
                type: 'url',
                value: music.url,
            })


            postNUI('musicAction', {
                type: 'play',
                url: music.url,
                name: music.name,
            })
            this.setCurrentPlaylist({
                type: 'currentMusicIndex',
                value: index,
            })

        },

    },
    components: {
        inlinesvg
    },
    watch: {
        // playlists(val) {
        //     if (!this.currentPlaylist.isMyPlaylist && this.currentPlaylist.data) {
        //         const found = val.find((data) => data.id == this.currentPlaylist.data.id)
        //         if (!found) {
        //             this.setCurrentPlaylist({
        //                 type: 'isMyPlaylist',
        //                 value: false,
        //             })
        //             this.setCurrentPlaylist({
        //                 type: 'data',
        //                 value: false,
        //             })
        //             this.setActiveMediaMenu('play')
        //         }else{
        //             this.currentPlaylist.data = found
        //         }
        //     }
        // },

        // myPlaylists(val) {
        //     if (this.currentPlaylist.isMyPlaylist && this.currentPlaylist.data) {
        //         const found = val.find((data) => data.id == this.currentPlaylist.data.id)
        //         if (!found) {
        //             this.setCurrentPlaylist({
        //                 type: 'isMyPlaylist',
        //                 value: false,
        //             })
        //             this.setCurrentPlaylist({
        //                 type: 'data',
        //                 value: false,
        //             })
        //             this.setActiveMediaMenu('play')
        //         }
        //     }
        // },
    },
    computed: {
        ...Vuex.mapGetters({
        }),
        ...Vuex.mapState({
            currentPlaylist: state => state.media.currentPlaylist,
            playlists: state => state.media.playlists,
            myPlaylists: state => state.media.myPlaylists,
            identifier: state => state.info.identifier,
            locales: state => state.hud.locales,
        
        }),
    },
    created() {
    },
    beforeDestroy() {
    },
    template: await importTemplate('./app/pages/hud/components/media/components/playlistview/index.html')
}
export default PlayListView