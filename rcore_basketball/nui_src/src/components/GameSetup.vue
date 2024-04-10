<template>
    <div>
        <div class="content-header">
            <div :class="{'col-3': allowWager, 'col-6': !allowWager}">{{ translations['GAME_MODE'] }}</div>
            <div :class="{'col-3': allowWager, 'col-6': !allowWager}">{{ translations['DIFFICULTY'] }}</div>
            <div class="col-3" v-if='allowWager'>{{ translations['WAGER'] }}</div>
            <div style="clear: both"></div>
        </div>
        <div class="content-modes" v-if='players.length == 0'>
            <div class="content-col">
                <button :class='{"active": curGameMode == 0}' @click='setGameMode(0)'>{{ translations['horse'] }}</button>
                <br>
                <button :class='{"active": curGameMode == 1}' @click='setGameMode(1)'>{{ translations['atw'] }}</button>
                <br>
                <button :class='{"active": curGameMode == 2}' @click='setGameMode(2)'>{{ translations['free-throw'] }}</button>
            </div>
            <div class="content-col">
                <div class="difficulty-container">
                    <button :class='{"active": curDifficulty == 0}' @click='setDifficulty(0)'>{{ translations['DIF_EASY'] }}</button>
                    <br>
                    <button :class='{"active": curDifficulty == 1}' @click='setDifficulty(1)'>{{ translations['DIF_MEDIUM'] }}</button>
                    <br>
                    <button :class='{"active": curDifficulty == 2}' @click='setDifficulty(2)'>{{ translations['DIF_HARD'] }}</button>
                </div>
            </div>
            <div class="content-col" v-if='allowWager'>
                <div class="wager-container">
                    <div class="wager-currency">$</div>
                    <div class="wager-input">
                        <input :disabled='curGameMode == 2' type="number" placeholder="0" :value="wagerAmount" @input="wagerAmountChange">
                    </div>
                </div>
            </div>
        </div>
        
        <table class="mode-summary" v-if='players.length > 0'>
            <tr>
                <td>
                    <button v-if='curGameMode == 0' :class='{"active": curGameMode == 0}' @click='setGameMode(0)'>{{ translations['horse'] }}</button>
                    <button v-if='curGameMode == 1' :class='{"active": curGameMode == 1}' @click='setGameMode(1)'>{{ translations['atw'] }}</button>
                    <button v-if='curGameMode == 2' :class='{"active": curGameMode == 2}' @click='setGameMode(2)'>{{ translations['free-throw'] }}</button>
                </td>
                <td>
                    <div class="difficulty-container">
                        <button v-if='curDifficulty == 0' :class='{"active": curDifficulty == 0}' @click='setDifficulty(0)'>{{ translations['DIF_EASY'] }}</button>
                        <button v-if='curDifficulty == 1' :class='{"active": curDifficulty == 1}' @click='setDifficulty(1)'>{{ translations['DIF_MEDIUM'] }}</button>
                        <button v-if='curDifficulty == 2' :class='{"active": curDifficulty == 2}' @click='setDifficulty(2)'>{{ translations['DIF_HARD'] }}</button>
                    </div>
                </td>
                <td class='summary-wager' v-if='allowWager && wagerAmount && wagerAmount > 0'>
                    ${{ wagerAmount }}
                </td>
                <td class='summary-wager' v-if='allowWager && !(wagerAmount && wagerAmount > 0)'>
                    {{ translations['WAGER_NONE'] }}
                </td>
            </tr>
        </table>
    </div>
</template>

<script>
export default {
    computed: {
        translations() {
            return this.$store.state.translations;
        },
        players: function() {
            return this.$store.state.players;
        },
        allowWager: function() {
            return this.$store.state.allowWager;
        },
        curGameMode: function() {
            return this.$store.state.gameMode;
        },
        curDifficulty: function() {
            return this.$store.state.difficulty;
        },
        wagerAmount() {
            return this.$store.state.wager;
        },
    },
    methods: {
        setGameMode(gm) {
            if(gm == 2) {
                this.$store.commit('setWager', null);
            }
            this.$store.commit('setGameMode', gm);
        },
        setDifficulty(d) {
            this.$store.commit('setDifficulty', d);
        },
        wagerAmountChange(e) {
            this.$store.commit('setWager', e.target.value);
        }
    }
}
</script>

<style scoped>
    .content .content-header {
        padding: 10px 0;
        font-weight: bold;
        
        border-bottom: 1px solid var(--color-border);
    }
    
    .mode-summary td {
        width: 33%;
        vertical-align: middle;
    }

    .mode-summary {
        width: 100%;
        text-align: center;
        padding: 10px 0;
        border-bottom: 1px solid var(--color-border);
    }

    .summary-wager {
        font-size: 20px;
    }
    
    .mode-summary button {
        margin-bottom: 0;
    }

    .content-modes {
        border-bottom: 1px solid var(--color-border);
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        padding: 10px 0;
    }

    .content-modes .col-3:nth-child(3) {
        border: 0;
    }

    .content-modes button:not(.active) {
        border-color: var(--color-button-inactive-border);
        background-color: var(--color-button-inactive-background);
        color: var(--color-button-inactive-color);
    }

    .content-modes button:last-of-type {
        margin-bottom: 0;
    }

    .wager-currency {
        width: 13px;
        float: left;
        font-weight: bold;
        font-size: 20px;
        position: relative;
        top: 3px;
    }



    .wager-input {
        width: calc(100% - 30px);
        float: left;
        text-align: left;
    }

    .wager-input input:disabled {
        background: rgb(119, 119, 119);
    }
 
    .wager-input input {
        width: 100px;
        border: 1px solid var(--color-input-border);
        background: var(--color-input-background);
        color: var(--color-input-color);
        font-size: 20px;
        padding: 3px 4px 4px;
        position: relative;
    }

    .wager-input input:focus {
        outline: 0;
    }
</style>