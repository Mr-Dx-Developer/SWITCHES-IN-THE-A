<template>
    <div id="app" :class="{'app-closed': !isShown, 'app-visible': isShown}">
        <Basketball v-if='status == "free" || status == "configuring" || status == "registration" ' />
        <Score v-if='status == "playing" || status == "thrown"' />
    </div>
</template>

<script>
    import {apiClose} from './api.js';
    import * as $ from "jquery";
    import {Howl, Howler} from 'howler';
    import Basketball from './components/Basketball';
    import Score from './components/Score';

    String.prototype.format = function() {
        var args = arguments;
        return this.replace(/{(\d+)}/g, function(match, number) { 
        return typeof args[number] != 'undefined'
            ? args[number]
            : match
        ;
        });
    };

    function rand(sounds) {
        return sounds[Math.floor(Math.random() * Math.floor(sounds.length))];
    }

    export default {
        name: 'App',
        components: {
            Basketball,
            Score
        },
        computed: {
            isShown() {
                return this.$store.state.isShown;
            },
            status() {
                return this.$store.state.status;
            }
        },
        data() {
            return {
                audioPlayer: null,
                rollSounds: {},
            };
        },
        mounted() {
            window.addEventListener("message", this.onEvent);
            // this.show();

            $(window).on("keyup", function(e) {
                if (e.which == 113 || e.which == 27) {
                    e.preventDefault();
                    apiClose();
                }
            });

            this.audioPlayer = new Howl({
                src: ["/assets/basketball.ogg"],
                sprite: {
                    hoop_net_1: [0, 433],
                    hoop_net_2: [690, 500],
                    hoop_net_3: [1441, 480],
                    hoop_net_4: [1977, 470],
                    hoop_net_5: [2588, 550],
                    
                    backboard: [3224, 680],
                    
                    bounce_1: [4006, 350],
                    bounce_2: [4860, 350],
                    bounce_3: [5603, 350],
                    bounce_4: [6419, 350],
                    bounce_5: [7231, 350],
                }
            });

            // this.audioPlayer.pannerAttr({
            //   coneInnerAngle: 360,
            //   coneOuterAngle: 360,
            //   coneOuterGain: 0,
            //   maxDistance: 10000,
            //   panningModel: 'HRTF',
            //   refDistance: 0.8,
            //   rolloffFactor: 0.5,
            //   distanceModel: 'linear',
            // });
        },
        beforeDestroy() {
            window.removeEventListener("message", this.onEvent);
        },
        methods: {
            onEvent(event) {
                if (event.data.type == "showui") {
                    this.show();
                } else if (event.data.type == "hideui") {
                    this.hide();
                } else if (event.data.type == "update") {
                    this.$store.commit('update', event.data);
                } else if (event.data.type == "playSound") {
                  var id = this.audioPlayer.play(rand(event.data.sounds));
                  this.audioPlayer.pos(event.data.position.x, event.data.position.y, event.data.position.z, id);
                  this.audioPlayer.volume(event.data.volume, id);
                } else if (event.data.type == "setOrientation") {
                    Howler.orientation(event.data.fwd.x, event.data.fwd.y, event.data.fwd.z, event.data.up.x, event.data.up.y, event.data.up.z);
                    Howler.pos(event.data.coord.x, event.data.coord.y, event.data.coord.z)
                }
            },
            show() {
                this.$store.commit('showBasketball');
                // document.body.style.display = "block";
            },
            hide() {
                this.$store.commit('hideBasketball');
                // document.body.style.display = "none";
            },
        }
    }
</script>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap');
    
    
    :root {
        --color-bg: #161925;
        --color-border: #235789;

        --color-player-bg: #235789;

        --color-score-bg: #235789;
        --color-score-color: #ffffff;
        --color-player-divider: #3e7db8;
        
        --color-text: #ffffff;
        
        --color-remove-player: #FBB13C;

        --color-button-border: #FBB13C;
        --color-button-background: #F2BB05;
        --color-button-color: #000;

        --color-button-inactive-border: #878E76;
        --color-button-inactive-background: #878E76;
        --color-button-inactive-color: #fff;

        --color-button-disabled-background: #878E76;
        --color-button-disabled-border: #878E76;
        --color-button-disabled-color: #666666;

        --color-input-background: #fff;
        --color-input-color: #000;
        --color-input-border: #000000;

    }

    body {
        background: url('../public/bg.jpg')
    }

    #app {
        user-select: none;
        font-family: 'Fira Sans', sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        margin-top: 60px;
    }

    .app-closed {
        opacity: 0;
    }

    .app-visible {
        opacity: 1;
    }



</style>
