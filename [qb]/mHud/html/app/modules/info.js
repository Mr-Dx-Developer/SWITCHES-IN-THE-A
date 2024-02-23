const module = {
    namespaced: true,
    state: {
        enableSecondJob : false,
        accounts: {
            cash: 0,
            bank: 0,
            black_money: 0,
            vip_money: 0,
            boss_money: 0,
        },
        forceAccountsVisibility: {
            cash: true,
            bank: true,
            black_money: false,
            vip_money: false,
            boss_money: false,
        },
        job: {
            job_label: '',
            job_grade_label: '',
        
        },
        second_job: {
            job_label: '',
            job_grade_label: '',
        
        },
        player_name: '',
        id: 0,
        weaponImg: false,
        ammoInfo: {
            ammo: 0,
            maxAmmo: 0,
        },
        identifier: false,
        pp: '',
    },
    mutations: {
        setEnableSecondJob(state, payload){
            state.enableSecondJob = payload
        },
        setPlayerPP(state, payload) {
            state.pp = payload
        },
        setPlayerName(state, payload) {
            state.player_name = payload
        },
        setJob(state, payload) {
            state.job = payload
        },
        setSecondJob(state, payload) {
            state.second_job = payload
        },
        setAccount(state, payload) {
            state.accounts[payload.type] = payload.amount
        },
        setforceAccountVisibility(state, payload) {
            state.forceAccountsVisibility[payload.type] = payload.value
        },
        setPlayerId(state, payload) {
            state.id = payload
        },
        setWeaponImage(state, payload) {
            state.weaponImg = payload
        },
        setAmmoInfo(state, payload) {
            state.ammoInfo = payload
        },
        setIdentifier(state, payload) {
            state.identifier = payload
        },
    },
}

export default module