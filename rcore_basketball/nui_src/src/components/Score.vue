<template>
    <div class='score'>
        <div class="vertical-center">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan='3' class='score-header'>
                        <template v-if='curGameMode == 0'>{{ translations['horse'] }}</template>
                        <template v-if='curGameMode == 1'>{{ translations['atw'] }}</template>
                        <template v-if='curGameMode == 2'>{{ translations['free-throw'] }}</template>
                    </td>
                </tr>
                <tr class='spacer'>
                    <td colspan=3></td>
                </tr>
                <template v-for='player in players'>
                    <score-line 
                        :key='player.ServerId + "_space"' 
                        :name='player.Name' 
                        :throws='player.Throws'
                        :is-turn='curTurnServerId == player.ServerId' 
                    />
                    <tr :key='player.ServerId + "_pspace"' class='spacer'>
                        <td colspan=3></td>
                    </tr>
                </template>

            </table>
        </div>
    </div>
</template>

<script>
import ScoreLine from './ScoreLine';

export default {
    components: {
        ScoreLine
    },
    computed: {
        translations() {
            return this.$store.state.translations;
        },
        players: function() {
            return this.$store.state.players;
        },
        curGameMode: function() {
            return this.$store.state.gameMode;
        },
        curTurnServerId: function() {
            return this.$store.state.turnServerId;
        },
    }
}
</script>

<style >
    .score {
        right: 50px;
        position: absolute;
        top: 50%;
    }

    .vertical-center {
        transform: translate(0, -50%);
    }

    .score img {
        width: 16px;
    }

    .score table tr:not(.spacer) td {
        background-color: var(--color-player-bg);
        color: var(--color-score-color);
        padding: 5px 0;
    }
    
    .score tr.spacer td {
        height: 5px;
    }

    .score img {
        position: absolute;
        top: 7px;
        left: 7px;
    }

    .score tr:not(.spacer) td:not(.score-header):nth-child(1) {
        width: 20px;
        padding: 0 5px;
        position: relative;
    }

    .score tr:not(.spacer) td:nth-child(2) {
        padding-right: 8px;
        text-align: right;
        border-right: 3px solid var(--color-player-divider);
    }
    
    .score tr:not(.spacer) td:nth-child(3) {
        padding: 0 8px;
    }

    .score-header {
        text-align: center;
        padding: 5px 10px !important;
        font-weight: bold;
    }

</style>