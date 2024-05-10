<template>
    <div class="bottom-button">
        <div class="register" v-if='!isRegistered'>
            <input type="text" :class='{"register-name": true, "input-error": nameTaken}' placeholder="Your name" v-model="registerName" />
            <button :class='{"disabled": !this.canRegister}' @click='register'>{{ translations['REGISTER'] }}</button>
        </div>
        <div class="interaction-buttons">
            <button v-if='myServerId == ownerServerId' :class='{"disabled": players.length == 0}' @click='start'>{{ translations['START'] }}</button>
            <button @click='close'>{{ translations['CLOSE'] }}</button>
        </div>
    </div>
</template>

<script>
import {apiClose, apiInitGame, apiStartGame, apiJoinGame} from '../api.js';

export default {
    data() {
        return {
            registerName: ''
        }
    },
    computed: {
        translations() {
            return this.$store.state.translations;
        },
        myServerId: function() {
            return this.$store.state.myServerId;
        },
        ownerServerId: function() {
            return this.$store.state.ownerServerId;
        },
        isRegistered: function() {
            for(let player of this.$store.state.players) {
                if(player.ServerId == this.$store.state.myServerId) {
                    return true;
                }
            }

            return false;
        },
        players: function() {
            return this.$store.state.players;
        },
        nameTaken: function() {
            for(let player of this.players) {
                if(player.Name.toLowerCase() == this.registerName.toLowerCase()) {
                    return true;
                }
            }

            return false;
        },
        canRegister() {
            if(!this.registerName) {
                return false;
            }

            if(this.registerName.length == 0) {
                return false;
            }

            if(this.nameTaken) {
                return false;
            }

            return true;
        }
    },
    methods: {
        close() {
            apiClose();
        },
        register() {
            if(!this.canRegister) {
                return;
            }

            if(!this.ownerServerId) {
                apiInitGame(this.registerName);
            } else {
                apiJoinGame(this.registerName);
            }
        },
        start() {
            if(this.myServerId != this.ownerServerId) {
                return;
            }
            
            if(this.players.length == 0) {
                return;
            }

            apiStartGame();
        }
    }
}
</script>

<style scoped>
    .bottom-button {
        padding: 10px 0;
        width: 298px;
        margin: 0 auto;
    }

    .bottom-button .interaction-buttons {
        text-align: center;
    }

    .bottom-button .interaction-buttons button:first-of-type {
        margin-right: 10px;
    }

    .bottom-button .disabled {
        background-color: var(--color-button-disabled-background);
        border-color: var(--color-button-disabled-border);
        color: var(--color-button-disabled-color);
    }

    .bottom-button .register input {
        height: 28px;
        position: relative;
        top: 1px;
        border: 1px solid var(--color-input-border);
        background: var(--color-input-background);
        color: var(--color-input-color);
        margin-right: 10px;
        font-size: 20px;
        width: 150px;
        padding: 0 5px;
    }
    
    .bottom-button .register input:focus {
        outline: 0;
    }

    .bottom-button button {
        font-weight: bold;
    }

    .bottom-button .register input.input-error {
        border: 1px solid red;
        background: #f7d2d2;
    }
</style>