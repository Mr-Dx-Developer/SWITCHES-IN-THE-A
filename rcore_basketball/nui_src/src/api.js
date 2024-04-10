import * as $ from "jquery";
import store from './store/index'


export function apiClose() {
    $.post("https://rcore_basketball/close");
}

export function apiInitGame(playerName) {
    $.post(
        "https://rcore_basketball/initGame",
        JSON.stringify({
            name: playerName,
            gameMode: store.state.gameMode,
            difficulty: store.state.difficulty,
            wager: store.state.wager,
        })
    );
}


export function apiStartGame() {
    $.post(
        "https://rcore_basketball/startGame",
        JSON.stringify({})
    );
}

export function apiJoinGame(playerName) {
    $.post(
        "https://rcore_basketball/joinGame",
        JSON.stringify({
            name: playerName
        })
    );
}

export function apiRemovePlayer(serverId) {
    $.post(
        "https://rcore_basketball/removePlayer",
        JSON.stringify({
            id: serverId
        })
    );
}

export function apiStart() {
    setTimeout(function() {
        store.commit('hideBasketball');
    }, 1500);
    $.post("https://rcore_basketball/start");
}

