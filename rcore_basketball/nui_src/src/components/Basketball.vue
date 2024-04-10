<template>
    <div class="basketball">
        <div class="basketball-ball"></div>
        <div class="header">
            <div class="header-inner">{{ translations['BASKETBALL'] }}</div>
        </div>

        <div class="content">
            <GameSetup />
            <PlayerList v-if='players.length > 0' />
            <BottomButton />
        </div>
    </div>
</template>

<script>

import BottomButton from './BottomButton';
import GameSetup from './GameSetup';
import PlayerList from './PlayerList';

export default {
    computed: {
        players: function() {
            return this.$store.state.players;
        },
        translations() {
            return this.$store.state.translations;
        },
    },
    components: {
        GameSetup,
        BottomButton,
        PlayerList,
    },
}
</script>

<style>
    .basketball {
        width: 500px;
        background: var(--color-bg);
        border: 4px solid var(--color-border);
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        color: var(--color-text);
    }

    .basketball-ball {
        background: url('../../public/basketball.png');
        width: 100px;
        height: 100px;
        background-size: contain;
        position: absolute;
        top: -45px;
        left: -55px;
        border: 4px solid var(--color-border);
        border-radius: 100px;
    }

    .header {
        border-bottom: 4px solid var(--color-border);
    }

    .header-inner {
        text-align: center;
        padding: 5px 0;
        font-size: 29px;
        font-weight: bold;
    }



    .col-3 {
        width: calc(33.3% - 1px);
        float: left;
        text-align: center;
    }
    
    .col-6 {
        width: calc(50% - 1px);
        float: left;
        text-align: center;
    }






    
    button {
        border: 1px solid var(--color-button-border);
        outline: 0;
        background: var(--color-button-background);
        font-size: 16px;
        width: 120px;
        padding: 6px 0;
        margin-bottom: 10px;
        color: var(--color-button-color);
        cursor: pointer;
    }


</style>