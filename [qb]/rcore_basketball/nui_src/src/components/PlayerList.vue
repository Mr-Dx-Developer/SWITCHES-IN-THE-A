<template>
    <div class="player-list">
        <table cellspacing="0" cellpadding="0">
            <template v-for='player in players'>
                <PlayerLine :key='player.ServerId' :server-id='player.ServerId' :name='player.Name' :allow-remove='player.ServerId != ownerServerId' />
                <tr :key='player.ServerId + "_space"' class='spacer'>
                    <td></td>
                </tr>
            </template>
        </table>
    </div>
</template>

<script>
import PlayerLine from './PlayerLine';

export default {
    components: {
        PlayerLine,
    },
    computed: {
        translations() {
            return this.$store.state.translations;
        },
        players: function() {
            return this.$store.state.players;
        },
        myServerId: function() {
            return this.$store.state.myServerId;
        },
        ownerServerId: function() {
            return this.$store.state.ownerServerId;
        }
    }
}
</script>

<style>
    .player-list {
        border-bottom: 1px solid var(--color-border);
    }

    .player-list table {
        margin: 10px auto;
        border: 0;
    }

    .player-list tr:not(.spacer) {
        background: var(--color-player-bg);
        width: auto;
        margin-bottom: 5px;
    }

    .player-list tr:not(.spacer) td {
        padding: 5px 15px;
        height: 20px;
    }

    .player-list tr:not(.spacer) td:first-of-type {
        text-align: center;
    }
 
    .player-list tr:not(.spacer) td.remove-player{
        position: relative;
        width: 20px;
        padding-left: 0;
    }

    .player-list tr.spacer td {
        height: 5px;
    }

    .remove svg {
        height: 20px;
        width: 20px;
        fill: var(--color-remove-player);
        position: relative;
        top: 1px;
        cursor: pointer;
        position: absolute;
        top: 5px;
    }
</style>