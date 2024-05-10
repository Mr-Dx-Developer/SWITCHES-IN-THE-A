import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        isShown: false,
        gameMode: 2,
        difficulty: 0,
        wager: null,
        allowWager: true,
        translations: {
            TOTAL: "Total",
        },
        status: 'free',
        players: [
            // {
            //     ServerId: 2,
            //     Name: 'John',
            //     Throws: [[0], [1,1,0]],
            // },
            // {
            //     ServerId: 3,
            //     Name: 'Carl',
            //     Throws: [[0]],
            // },
        ],
        throwPoints: [], //[1,1,1,1],
        ownerServerId: null, //2,
        myServerId: null, //2,
        horseLetters: [], //['H', 'O', 'R', 'S', 'E']
        turnServerId: null,
    },
    mutations: {
        showBasketball(state) {
            Vue.set(state, 'isShown', true);
        },
        hideBasketball(state) {
            Vue.set(state, 'isShown', false);
        },

        setGameMode(state, gm) {
            Vue.set(state, 'gameMode', gm);
        },
        setDifficulty(state, d) {
            Vue.set(state, 'difficulty', d);
        },
        setWager(state, w) {
            Vue.set(state, 'wager', w);
        },
        update(state, data) {
            Vue.set(state, 'gameMode', data.gameMode);
            Vue.set(state, 'difficulty', data.difficulty);
            Vue.set(state, 'wager', data.wager);
            Vue.set(state, 'status', data.status);
            Vue.set(state, 'players', data.players);
            Vue.set(state, 'throwPoints', data.throwPoints);
            Vue.set(state, 'ownerServerId', data.ownerServerId);
            Vue.set(state, 'myServerId', data.myServerId);
            Vue.set(state, 'horseLetters', data.horseLetters);
            Vue.set(state, 'turnServerId', data.turnServerId);
            Vue.set(state, 'translations', data.translations);
            Vue.set(state, 'allowWager', data.allowWager);
        }
    },
    actions: {
    },
    modules: {
    }
})
