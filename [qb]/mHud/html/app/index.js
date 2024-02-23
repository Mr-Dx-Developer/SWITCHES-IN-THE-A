const { createApp } = Vue
import hud from './pages/hud/index.js'
import speedometer from './pages/speedometer/index.js'
import info from './pages/info/index.js'
import settings from './pages/settings/index.js'
String.prototype.format = function () {
  let formatted = this;
  for (let i = 0; i < arguments.length; i++) {
    let regexp = new RegExp('\\{' + i + '\\}', 'gi');
    formatted = formatted.replace(regexp, arguments[i]);
  }
  return formatted;
};




import hudModule from './modules/hud.js'
import infoModule from './modules/info.js'
import mediaModule from './modules/media.js'

import speedometerModule from './modules/speedometer.js'



const Modules = {
  hud: hudModule,
  info: infoModule,
  speedometer: speedometerModule,
  media: mediaModule,
}

const store = Vuex.createStore({
  state: {
    activePage: false,

  },
  mutations: {
    SetActivePage(state, payload) {
      state.activePage = payload
    },
  },
  actions: {},
  modules: Modules
});

const app = createApp({
  data() {
    return {
      showSafezoneNotify: false,
      playerGiftTime: 0,
      giftInformations: {
        text: "",
        time: 0,
        enable: false,
      },
      hudLoaded : false,
      timer: false,
      giftTime: false,
      seatbeltaudio: false,
      keys: [
        {
          key: "F1",
          desc: "PHONE",
        },
        {
          key: "F2",
          desc: "INV",
        },
        {
          key: "F3",
          desc: "MENU",
        },
        {
          key: "N",
          desc: "MIC",
        },
      ],

    }
  },
  components: { hud, speedometer, info, settings },
  computed: {
    ...Vuex.mapState({
      activeMenu: state => state.hud.activeMenu,
      weaponImg: state => state.info.weaponImg,
      ammoInfo: state => state.info.ammoInfo,
      currentPlaylist: state => state.media.currentPlaylist,
      myPlaylists: state => state.media.myPlaylists,
      playlists: state => state.media.playlists,
      showHudSettings: state => state.hud.showHudSettings,
      hudSettings: state => state.hud.hudSettings,
      selectedSettingsElement: state => state.hud.selectedSettingsElement,
      hoveredSettingsElement: state => state.hud.hoveredSettingsElement,
      inVehicle: state => state.hud.inVehicle,
      freeformEdit: state => state.hud.freeformEdit,
      locales: state => state.hud.locales,
      enableSafezoneNotify: state => state.hud.enableSafezoneNotify,
      enableUIKeys: state => state.hud.enableUIKeys,

    }),

    getScreenKeysStyle() {
      if (this.hudSettings.screenKeysPosition.left && this.hudSettings.screenKeysPosition.top) {
        return {
          left: this.hudSettings.screenKeysPosition.left + 'px',
          top: this.hudSettings.screenKeysPosition.top + 'px',

        }
      }
      return {
        right: "3.5rem",
        top: "22rem",
      }
    },
    getGiftContainerStyle() {
      if (this.hudSettings.giftContainerPosition.left && this.hudSettings.giftContainerPosition.top) {
        return {
          left: this.hudSettings.giftContainerPosition.left + 'px',
          top: this.hudSettings.giftContainerPosition.top + 'px',
        }
      }

      return {
        right: "58vh",
        bottom: "0",
      }
    },
    getWeaponStyle() {
      if (this.hudSettings.weaponPosition.left && this.hudSettings.weaponPosition.top) {
        return {
          left: this.hudSettings.weaponPosition.left + 'px',
          top: this.hudSettings.weaponPosition.top + 'px',
        }
      }

      return {
        right: "1rem",
        top: "14rem",
      }
    },
  },
  watch: {
    selectedSettingsElement(val) {
      if (val.length > 0) {
        this.setHoveredSettingsElement("")
      }
    },
    myPlaylists(val) {

      if (this.currentPlaylist.isMyPlaylist && this.currentPlaylist.data) {
        const found = this.myPlaylists.find((data) => data.id == this.currentPlaylist.data.id)
        if (!found) {

          this.setCurrentPlaylist({
            type: 'isMyPlaylist',
            value: false,
          })
          this.setCurrentPlaylist({
            type: 'data',
            value: false,
          })
          this.setActiveMediaMenu('play')
        } else {
          this.setCurrentPlaylist({
            type: 'data',
            value: found,
          })
        }
      }
    },
    inVehicle(val) {
      if (!val) {
        if (this.seatbeltaudio) {
          this.seatbeltaudio.pause();
        }
      }
    },
    playlists(val, old) {
      this.$nextTick(() => {
        if (!this.currentPlaylist.isMyPlaylist && this.currentPlaylist.data) {


          const found = this.playlists.find((data) => data.id == this.currentPlaylist.data.id)
          if (!found) {

            this.setCurrentPlaylist({
              type: 'isMyPlaylist',
              value: false,
            })
            this.setCurrentPlaylist({
              type: 'data',
              value: false,
            })
            this.setActiveMediaMenu('play')
          } else {
            this.setCurrentPlaylist({
              type: 'data',
              value: found,
            })
          }
        }
      })
    },
  },
  methods: {
    ...Vuex.mapMutations({
      setPlayerName: 'info/setPlayerName',
      setJob: 'info/setJob',
      setSecondJob: 'info/setSecondJob',
      setAccount: 'info/setAccount',
      setPlayerId: 'info/setPlayerId',
      setWeaponImage: 'info/setWeaponImage',
      setIdentifier: 'info/setIdentifier',
      setAmmoInfo: 'info/setAmmoInfo',
      setStatus: 'hud/setStatus',
      setShowMapWhileWalking: 'hud/setShowMapWhileWalking',
      setBarVisibility: 'hud/setBarVisibility',
      setLocation: 'hud/setLocation',
      setMicSettings: 'hud/setMicSettings',
      setPlaylists: 'media/setPlaylists',
      setMyPlaylists: 'media/setMyPlaylists',
      setCurrentSongInformations: 'media/setCurrentSongInformations',
      setCurrentPlaylist: 'media/setCurrentPlaylist',
      setActiveMediaMenu: 'hud/setActiveMediaMenu',
      setPlayerPP: 'info/setPlayerPP',
      syncHudSettings: 'hud/syncHudSettings',
      setHoveredSettingsElement: 'hud/setHoveredSettingsElement',
      setShowHudSettings: 'hud/setShowHudSettings',
      setHudSettingsWithoutSave: 'hud/setHudSettingsWithoutSave',
      setFreeformEdit: 'hud/setFreeformEdit',
      setSelectedSettingsElement: 'hud/setSelectedSettingsElement',
      setHoveredSettingsElement: 'hud/setHoveredSettingsElement',
      setforceAccountVisibility: 'info/setforceAccountVisibility',
      setEnableSecondJob: 'info/setEnableSecondJob',
      setLocales: 'hud/setLocales',
      setEnableSafezoneNotify: 'hud/setEnableSafezoneNotify',
      toggleUIKeys: 'hud/toggleUIKeys',
    }),
    setKeys(payload) {
      this.keys = payload
    },
    resizeHandler() {

      postNUI('resize')
    },
    getGiftTime() {
      if (this.timer) {
        clearInterval(this.timer);
        this.timer = false
      }
      const toMilliseconds = (hrs, min, sec) => (hrs * 60 * 60 + min * 60 + sec) * 1000;

      var _second = 1000;
      var _minute = _second * 60;
      var _hour = _minute * 60;
      var _day = _hour * 24;

      var end = new Date((this.playerGiftTime * 1000) + (toMilliseconds(0, this.giftInformations.time, 0)));
      const showRemaining = () => {
        var now = new Date();
   
        var distance = end - now;
        if (distance < 0) {
          this.giftTime = '00:00'
          clearInterval(this.timer);
          this.timer = false
          return;
        }
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);
        if(hours < 10){
          hours = '0'+hours
        }
        if(minutes < 10){
          minutes = '0'+minutes
        }
        if(seconds < 10){
          seconds = '0'+seconds
        }
        this.giftTime =  hours + ':' + minutes + ':' + seconds
      }
      this.timer = setInterval(showRemaining, 1000);

    },
    ChangeMusic() {
      if (!isNaN(this.currentPlaylist.currentMusicIndex) && this.currentPlaylist.data.musics && this.currentPlaylist.data.musics.length > 0) {
        let index = this.currentPlaylist.currentMusicIndex
        if (!this.currentPlaylist.data.musics[index + 1]) {
          this.setCurrentPlaylist({
            type: 'currentMusicIndex',
            value: 0,
          })
          const music = this.currentPlaylist.data.musics[0]
          postNUI('musicAction', {
            type: 'play',
            url: music.url,
            name: music.name,
          })
          this.setCurrentSongInformations({
            type: 'name',
            value: music.name,
          })
          this.setCurrentSongInformations({
            type: 'url',
            value: music.url,
          })
        } else {
          const music = this.currentPlaylist.data.musics[index + 1]
          this.setCurrentPlaylist({
            type: 'currentMusicIndex',
            value: index + 1,
          })
          postNUI('musicAction', {
            type: 'play',
            url: music.url,
            name: music.name,
          })
          this.setCurrentSongInformations({
            type: 'name',
            value: music.name,
          })
          this.setCurrentSongInformations({
            type: 'url',
            value: music.url,
          })
        }
      }
    },
    messageHandler(event) {
      switch (event.data.action) {
        case "CHECK_NUI":
          postNUI('loaded')
          break
        case "HIDE_HUD":
          this.setHudSettingsWithoutSave({
            type: "hideHud",
            value: true,
          })
          break
        case "TOGGLE_SECOND_JOB":
          this.setEnableSecondJob(event.data.payload)
          break
        case "SHOW_HUD":
          this.setHudSettingsWithoutSave({
            type: "hideHud",
            value: false,
          })
          break
        case "ENABLE_UI_KEYS":
          this.toggleUIKeys(event.data.payload)
          break
        case "SET_MICROPHONE_SETTINGS":
          this.setMicSettings(event.data.payload)
          break
        case "LOAD_PLAYER_MONEY":
          this.setAccount(event.data.payload)
          break
        case "CHANGE_MUSIC":
          this.ChangeMusic()
          break
        case "LOAD_PLAYER_JOB":
          this.setJob(event.data.payload)
          break
        case "SET_SECOND_JOB":
          this.setSecondJob(event.data.payload)
          break
        case "LOAD_PLAYER_NAME":
          this.setPlayerName(event.data.payload)
          break
        case "LOAD_PLAYER_ID":
          this.setPlayerId(event.data.payload)
          break
        case "SET_WEAPON_IMAGE":
          this.setWeaponImage(event.data.payload)
          break
        case "SET_WEAPON_AMMO":
          this.setAmmoInfo(event.data.payload)
          break
        case "SET_STATUS":
          this.setStatus(event.data.payload)
          break
        case "LOAD_KEYS":
          this.setKeys(event.data.payload)
          break
        case "SET_SHOW_MAP_WALKING":
          this.setShowMapWhileWalking(event.data.payload)
          break
        case "SET_BAR_VISIBILITY":
          this.setBarVisibility(event.data.payload)
          break
        case "SET_LOCATION":
          this.setLocation(event.data.payload)
          break
        case "SET_IDENTIFIER":
          this.setIdentifier(event.data.payload)
          break
        case "UPDATE_MY_PLAYLISTS":
          this.setMyPlaylists(event.data.payload)
          break
        case "UPDATE_PLAYLISTS":
          this.setPlaylists(event.data.payload)
          break
        case "OPEN_HUD_SETTINGS":
          this.setShowHudSettings(true)
          let audio = new Audio('./assets/sounds/openmenu.ogg');
          audio.play();
          audio.volume = 0.10;
          break
        case "SET_GIFT_INFORMATIONS":
          this.giftInformations = event.data.payload
          break
        case "SET_PLAYER_GIFT_TIME":
          this.playerGiftTime = event.data.payload
          this.getGiftTime()
          break
        case "SET_PLAYER_PP":
          this.setPlayerPP(event.data.payload)
          break
        case "FORCE_ACCOUNT_VISIBILITY":
          this.setforceAccountVisibility(event.data.payload)
          break
        case "SET_LOCALES":
          this.setLocales(event.data.payload)
          break
        case "SHOW_SAFEZONE_NOTIFY":
          this.showSafezoneNotify = true
          break
        case "HIDE_SAFEZONE_NOTIFY":
          this.showSafezoneNotify = false
          break
        case "SET_SAFEZONE_NOTIFY":
          this.setEnableSafezoneNotify(event.data.payload)
          break
        case "SET_DEFAULT_SPEED_TYPE":
          this.syncHudSettings({
            defaultSpeedType: event.data.payload
          })
          setTimeout(() =>{
            postNUI("getHudSetting", {
              type: "compassBehaviour",
              value: this.hudSettings["compassBehaviour"],
            })
            postNUI("getHudSetting", {
              type: "speedType",
              value: this.hudSettings["speedType"],
            })
            postNUI("getHudSetting", {
              type: "cinematicMode",
              value: this.hudSettings["cinematicMode"],
            })
            postNUI("getHudSetting", {
              type: "speedoRefreshRate",
              value: this.hudSettings["speedoRefreshRate"],
            })
          }, 600)
          break

        case "PLAY_SEATBELT_SOUND":
          this.seatbeltaudio = new Audio('./assets/sounds/seatbeltbeep.ogg');
          this.seatbeltaudio.play();
          this.seatbeltaudio.volume = 0.1;
          break

        case "SET_SEATBELT":
          if (event.data.payload) {
            if (this.seatbeltaudio) {
              this.seatbeltaudio.pause();
            }
          }

          break
        case "SET_HUD_LOADED":
          this.hudLoaded = true
          break
        default:
          break;
      }
    },
    keyHandler(e) {
      if (e.which == 27) {
        if (this.showHudSettings) {
          this.DestroyDrag()

          if (this.freeformEdit) {
            this.setFreeformEdit(false)
          } else {

            this.setShowHudSettings(false)
            postNUI('closeSettings')
          }
          let audio = new Audio('./assets/sounds/click.ogg');
          audio.play();
          audio.volume = 0.10;
          this.setSelectedSettingsElement("")
          this.setHoveredSettingsElement("")
        }

      }
    },
    DestroyDrag() {

      if ($('.server-info').data('ui-draggable')) {
        $('.server-info').draggable('destroy');
      }

      if ($('.gift-container').data('ui-draggable')) {
        $('.gift-container').draggable('destroy');
      }
      if ($('.hunger-drag').data('ui-draggable')) {
        $('.hunger-drag').draggable('destroy');
      }
      if ($('.thirst-drag').data('ui-draggable')) {
        $('.thirst-drag').draggable('destroy');
      }
      if ($('.mic-level').data('ui-draggable')) {
        $('.mic-level').draggable('destroy');
      }
      if ($('.stress-drag').data('ui-draggable')) {
        $('.stress-drag').draggable('destroy');
      }
      if ($('.stamina-drag').data('ui-draggable')) {
        $('.stamina-drag').draggable('destroy');
      }
      if ($('.oxygen-drag').data('ui-draggable')) {
        $('.oxygen-drag').draggable('destroy');
      }
      if ($('.armor').data('ui-draggable')) {
        $('.armor').draggable('destroy');
      }
      if ($('.health').data('ui-draggable')) {
        $('.health').draggable('destroy');
      }
      if ($('.mic-icon').data('ui-draggable')) {
        $('.mic-icon').draggable('destroy');
      }
      if ($('.first-speedometer').data('ui-draggable')) {
        $('.first-speedometer').draggable('destroy');
      }
      if ($('.rpm-speedometer').data('ui-draggable')) {
        $('.rpm-speedometer').draggable('destroy');
      }
      if ($('.nos-speedometer').data('ui-draggable')) {
        $('.nos-speedometer').draggable('destroy');
      }
      if ($('.screen-keys').data('ui-draggable')) {
        $('.screen-keys').draggable('destroy');
      }
      if ($('.weapon-widget').data('ui-draggable')) {
        $('.weapon-widget').draggable('destroy');
      }
      if ($('.name-box').data('ui-draggable')) {
        $('.name-box').draggable('destroy');
      }
      if ($('.bank-box').data('ui-draggable')) {
        $('.bank-box').draggable('destroy');
      }
      if ($('.cash-box').data('ui-draggable')) {
        $('.cash-box').draggable('destroy');
      }
      if ($('.boss-money-box').data('ui-draggable')) {
        $('.boss-money-box').draggable('destroy');
      }
      if ($('.black-money-box').data('ui-draggable')) {
        $('.black-money-box').draggable('destroy');
      }
      if ($('.vip-money-box').data('ui-draggable')) {
        $('.vip-money-box').draggable('destroy');
      }
      if ($('.armor-drag').data('ui-draggable')) {
        $('.armor-drag').draggable('destroy');
      }
      if ($('.health-drag').data('ui-draggable')) {
        $('.health-drag').draggable('destroy');
      }

    },
  },
  mounted() {
    window.addEventListener("resize", this.resizeHandler);
    window.addEventListener('message', this.messageHandler);
    window.addEventListener('keyup', this.keyHandler);


  },
  beforeDestroy() {
    window.removeEventListener("resize", this.resizeHandler);
    window.removeEventListener('keyup', this.keyHandler);
    window.removeEventListener('message', this.messageHandler);
  },
  created() {
  },
}).use(store)

let resourceName = 'mHud'
window.postNUI = async (name, data) => {
  try {
    const response = await fetch(`https://${resourceName}/${name}`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json'
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: JSON.stringify(data)
    });
    return !response.ok ? null : response.json();
  } catch (error) {
    // console.log(error)
  }
}

app.mount('#app')



$(document).on("focusout", "input", () => {
  postNUI('OnInputFocusRemove')
})

$(document).on("focusin", "input", () => {
  postNUI('OnInputFocus')
})



