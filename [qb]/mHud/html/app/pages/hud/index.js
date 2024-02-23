import importTemplate from '../../utils/importTemplate.js'
import inlinesvg from '../../utils/inlinesvg.js'

import quick from './components/quick/index.js'
import vehicle from './components/vehicle/index.js'
import settings from './components/settings/index.js'
import media from './components/media/index.js'

const Hud = {
  data() {
    return {
      maxVoiceRange: 0,
      mouseCursorKeyLabel: 'CAPS',
      progressBar: {
        hunger: false,
        thirst: false,
        stress: false,
        stamina: false,
        oxygen: false,
        altitude: false,
        health: false,
        armor: false,
        ["thirst-2"]: false,
      },
      inPassengerSide: false,
      enableVehicleModes: false,

      pos: {
        left: 0,
        top: 0,
      },
      clock: '',
      menu : {
        media : true,
        quick : true,
        vehicle : true,
      },
    }
  },
  components: {
    quick,
    vehicle,
    inlinesvg,
    settings,
    media
  },
  methods: {
    ...Vuex.mapMutations({
      setActiveMenu: 'hud/setActiveMenu',
      setCurrentSongInformations: 'media/setCurrentSongInformations',
      setCurrentPlaylist: 'media/setCurrentPlaylist',
      setInVehicle: 'hud/setInVehicle',
    }),
    PlayClick() {
      let audio = new Audio('./assets/sounds/click.ogg');
      audio.play();
      audio.volume = 0.10;
    },
    hexToRGB(hex, alpha) {
      var r = parseInt(hex.slice(1, 3), 16),
        g = parseInt(hex.slice(3, 5), 16),
        b = parseInt(hex.slice(5, 7), 16);

      if (alpha) {
        return "rgba(" + r + ", " + g + ", " + b + ", " + alpha + ")";
      } else {
        return "rgb(" + r + ", " + g + ", " + b + ")";
      }
    },
    getHudColors(type) {
      if (this.hudSettings.monochromeColor) {
        return this.hudSettings.monochromeColor
      }
      return this.hudSettings[type]
    },

    remCalc(px) {
      const html = document.querySelector('html')
      const fontSize = window.getComputedStyle(html).fontSize
      let tempPx = px
      if (typeof px === 'string' || px instanceof String)
        tempPx = tempPx.replace('px', '')

      tempPx = parseInt(tempPx)



      return (1 / parseInt(fontSize)) * tempPx + 'rem'

    },
    ToggleMusic() {
      postNUI('musicAction', {
        type: 'toggle'
      })
    },
    PrevMusic() {
      if (!isNaN(this.currentPlaylist.currentMusicIndex) && this.currentPlaylist.data.musics && this.currentPlaylist.data.musics.length > 0) {
        let index = this.currentPlaylist.currentMusicIndex - 1
        if (!this.currentPlaylist.data.musics[index]) {
          this.setCurrentPlaylist({
            type: 'currentMusicIndex',
            value: this.currentPlaylist.data.musics.length - 1,
          })
          const music = this.currentPlaylist.data.musics[this.currentPlaylist.data.musics.length - 1]
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
          const music = this.currentPlaylist.data.musics[index]
          this.setCurrentPlaylist({
            type: 'currentMusicIndex',
            value: index,
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
    NextMusic() {
      if (!isNaN(this.currentPlaylist.currentMusicIndex) && this.currentPlaylist.data.musics && this.currentPlaylist.data.musics.length > 0) {
        let index = this.currentPlaylist.currentMusicIndex + 1
        if (!this.currentPlaylist.data.musics[index]) {
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
          const music = this.currentPlaylist.data.musics[index]
          this.setCurrentPlaylist({
            type: 'currentMusicIndex',
            value: index,
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
        case "IN_VEHICLE":
          this.setInVehicle(event.data.payload)
          break
        case "SET_IN_PASSENGER_SIDE":
          this.inPassengerSide = event.data.payload
          break
        case "SET_SONG_INFORMATIONS":
          this.setCurrentSongInformations(event.data.payload)
          break
        case "UPDATE_CLOCK":
          this.clock = event.data.payload
          break

        case "ADJUST_HUD_POSITION":
          this.pos = event.data.payload
          break
        case "TOGGLE_VEHICLE_MODES":
          this.enableVehicleModes = event.data.payload
          break
        case "SET_MOUSE_CURSOR_KEY_LABEL":
          this.mouseCursorKeyLabel = event.data.payload
          break
        case "SET_MAX_VOICE_RANGES":
          this.maxVoiceRange = event.data.payload
          break
        case "SET_MENU":
          this.menu = event.data.payload
          break
        default:
          break;
      }
    },
    setupHudProgressbar(type, color) {
      this.progressBar[type] = new ProgressBar.Circle('#' + type, {
        strokeWidth: 10,
        easing: 'easeInOut',
        duration: 1400,
        color: color,
        trailColor: this.hexToRGB(color, 0.22),
        trailWidth: 10,
        svgStyle: null
      });
    },

    getDynamicHudStyle(type) {
      let widthData = {}
      if (this.hudSettings.circleHealthAndArmor) {
        widthData = {
          width: '1.65rem',
          height: '1.65rem'
        }
      }
      if (this.hudSettings.dynamicHudPosition.left && this.hudSettings.dynamicHudPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.dynamicHudPosition.left + 'px',
          top: this.hudSettings.dynamicHudPosition.top + 'px',
          filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors(type), 0.8) + ')',
          ...widthData,

        }
      }
      return {
        ...widthData,
        filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors(type), 0.8) + ')',
      }
    },
  },

  created() {
  },
  computed: {
    ...Vuex.mapState({
      activeMenu: state => state.hud.activeMenu,
      inVehicle: state => state.hud.inVehicle,
      showMapWalking: state => state.hud.showMapWalking,
      status: state => state.hud.status,
      barVisibility: state => state.hud.barVisibility,
      location: state => state.hud.location,
      micSettings: state => state.hud.micSettings,
      enableTopWidget: state => state.hud.enableTopWidget,
      currentSongInformations: state => state.media.currentSongInformations,
      currentPlaylist: state => state.media.currentPlaylist,
      selectedSettingsElement: state => state.hud.selectedSettingsElement,
      hoveredSettingsElement: state => state.hud.hoveredSettingsElement,
      showHudSettings: state => state.hud.showHudSettings,
      hudSettings: state => state.hud.hudSettings,
      locales: state => state.hud.locales,

    }),
    ...Vuex.mapGetters({


    }),
    getMenuHeight() {
      if (this.hudSettings.showHudBars) {
        return this.showMapWalking || this.inVehicle ? '27.5vh' : '7vh'
      } else {
        return this.showMapWalking || this.inVehicle ? '20.5vh' : '0'
      }
    },
    armorHudStyle() {

      if (this.hudSettings.armorPosition.left && this.hudSettings.armorPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.armorPosition.left + 'px',
          top: this.hudSettings.armorPosition.top + 'px',
          background: this.hexToRGB(this.getHudColors('armorColor'), 0.22)
        }
      }
      return {
        background: this.hexToRGB(this.getHudColors('armorColor'), 0.22)
      }
    },
    healthHudStyle() {
      if (this.hudSettings.healthPosition.left && this.hudSettings.healthPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.healthPosition.left + 'px',
          top: this.hudSettings.healthPosition.top + 'px',
          background: this.hexToRGB(this.getHudColors('healthColor'), 0.22)
        }
      }
      return {
        background: this.hexToRGB(this.getHudColors('healthColor'), 0.22)
      }
    },
    getMicStyle() {
      let widthData = {}
      if (this.hudSettings.circleHealthAndArmor) {
        widthData = {
          width: '1.4rem',
          height: '1.4rem'
        }
      }
      if (this.hudSettings.micPosition.left && this.hudSettings.micPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.micPosition.left + 'px',
          top: this.hudSettings.micPosition.top + 'px',
          ...widthData,

        }
      }
      return {
        ...widthData,

      }
    },
    getHungerHUDStyle() {
      let widthData = {}
      if (this.hudSettings.circleHealthAndArmor) {
        widthData = {
          width: '1.65rem',
          height: '1.65rem'
        }
      }
      if (this.hudSettings.hungerHudPosition.left && this.hudSettings.hungerHudPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.hungerHudPosition.left + 'px',
          top: this.hudSettings.hungerHudPosition.top + 'px',
          filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('hungerColor'), 0.8) + ')',
          ...widthData,
        }
      }

      return {
        filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('hungerColor'), 0.8) + ')',
        ...widthData,

      }
    },
    getHealthBarStyle() {
      let widthData = {}
      if (this.hudSettings.circleHealthAndArmor) {
        widthData = {
          width: '1.65rem',
          height: '1.65rem'
        }
      }
      if (this.hudSettings.healthPosition.left && this.hudSettings.healthPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.healthPosition.left + 'px',
          top: this.hudSettings.healthPosition.top + 'px',
          filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('healthColor'), 0.8) + ')',
          ...widthData,
        }
      }


      return {
        filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('healthColor'), 0.8) + ')',
        ...widthData,

      }
    },
    getArmorBarStyle() {
      let widthData = {}
      if (this.hudSettings.circleHealthAndArmor) {
        widthData = {
          width: '1.65rem',
          height: '1.65rem'
        }
      }
      if (this.hudSettings.armorPosition.left && this.hudSettings.armorPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.armorPosition.left + 'px',
          top: this.hudSettings.armorPosition.top + 'px',
          filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('armorColor'), 0.8) + ')',
          ...widthData,

        }
      }

      return {
        filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('armorColor'), 0.8) + ')',
        ...widthData,

      }
    },
    getThirstHUDStyle() {
      let widthData = {}
      if (this.hudSettings.circleHealthAndArmor) {
        widthData = {
          width: '1.65rem',
          height: '1.65rem'
        }
      }
      if (this.hudSettings.thirstHudPosition.left && this.hudSettings.thirstHudPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.thirstHudPosition.left + 'px',
          top: this.hudSettings.thirstHudPosition.top + 'px',
          filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('thirstColor'), 0.8) + ')',
          ...widthData,

        }
      }
      return {
        filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('thirstColor'), 0.8) + ')',
        ...widthData,

      }
    },
    getMicLevelStyle() {
      if (this.hudSettings.micLevelPosition.left && this.hudSettings.micLevelPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.micLevelPosition.left + 'px',
          top: this.hudSettings.micLevelPosition.top + 'px',
        }
      }
      return {
      }
    },

    getStressHudStyle() {
      let widthData = {}
      if (this.hudSettings.circleHealthAndArmor) {
        widthData = {
          width: '1.65rem',
          height: '1.65rem'
        }
      }
      if (this.hudSettings.stressPosition.left && this.hudSettings.stressPosition.top) {
        return {
          position: 'absolute',
          left: this.hudSettings.stressPosition.left + 'px',
          top: this.hudSettings.stressPosition.top + 'px',
          filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('stressColor'), 0.8) + ')',
          ...widthData,
        }
      }
      return {
        filter: 'drop-shadow(0rem 0rem 0.625rem ' + this.hexToRGB(this.getHudColors('stressColor'), 0.8) + ')',
        ...widthData,


      }
    },
    getMenuOverlay() {
      if (this.inVehicle) {
        if (this.activeMenu == 'media') {
          return 'url(./assets/images/media-overlay.png)'
        } else if (this.activeMenu == 'vehicle') {
          return 'url(./assets/images/vehicle-overlay.png)'
        }
      }
      if (this.hudSettings.hideMapOverlay) {
        if (!this.showMapWalking && !this.inVehicle) {
          return 'url(./assets/images/hud-overlay.png)'
        }
        return 'url(./assets/images/hud-overlay-transparent.png)'
      } else {
        return 'url(./assets/images/hud-overlay.png)'
      }
    },
    getMicColor() {

      if (this.micSettings.isMuted) {
        return '#FF4848'
      }
      if (this.micSettings.isTalking) {
        return '#B2FF75'
      }
      return '#FFFFFF'
    },
  },
  watch: {
    'hudSettings.circleHealthAndArmor'(val) {
      if (val) {

        if (!this.progressBar.health) {
          this.setupHudProgressbar('health', this.getHudColors('healthColor'))
        }

        this.progressBar.health.animate(this.status.health / 100);  // Number from 0.0 to 1.0
        if (!this.progressBar.armor) {
          this.setupHudProgressbar('armor', this.getHudColors('armorColor'))
        }

        this.progressBar.armor.animate(this.status.armor / 100);  // Number from 0.0 to 1.0
      }
    },
    'status.health'(val) {
      if (!this.progressBar.health) {
        this.setupHudProgressbar('health', this.getHudColors('healthColor'))
      }

      this.progressBar.health.animate(val / 100);  // Number from 0.0 to 1.0
    },
    'status.armor'(val) {
      if (!this.progressBar.armor) {
        this.setupHudProgressbar('armor', this.getHudColors('armorColor'))
      }

      this.progressBar.armor.animate(val / 100);  // Number from 0.0 to 1.0
    },
    'status.hunger'(val) {
      if (!this.progressBar.hunger) {
        this.setupHudProgressbar('hunger', this.getHudColors('hungerColor'))
      }

      this.progressBar.hunger.animate(val / 100);  // Number from 0.0 to 1.0
    },

    'status.thirst'(val) {

      if (!this.progressBar.thirst) {
        this.setupHudProgressbar('thirst', this.getHudColors('thirstColor'))
        this.setupHudProgressbar('thirst-2', this.getHudColors('thirstColor'))
      }

      this.progressBar.thirst.animate(val / 100);  // Number from 0.0 to 1.0
      this.progressBar["thirst-2"].animate(val / 100);  // Number from 0.0 to 1.0

    },
    'status.stress'(val) {
      if (!this.progressBar.stress) {
        this.setupHudProgressbar('stress', this.getHudColors('stressColor'))
      }
      this.progressBar.stress.animate(val / 100);  // Number from 0.0 to 1.0
    },
    'status.stamina'(val) {

      if (!this.progressBar.stamina) {

        this.setupHudProgressbar('stamina', this.getHudColors('staminaColor'))


      }
      this.progressBar.stamina.animate(val / 100);  // Number from 0.0 to 1.0
    },
    'status.oxygen'(val) {

      if (!this.progressBar.oxygen) {

        this.setupHudProgressbar('oxygen', this.getHudColors('oxygenColor'))

      }
      this.progressBar.oxygen.animate(val / 100);  // Number from 0.0 to 1.0
    },
    'status.altitude'(val) {

      if (!this.progressBar.altitude) {
        this.setupHudProgressbar('altitude', this.getHudColors('altitudeColor'))

      }
      this.progressBar.altitude.animate(val / 2483);  // Number from 0.0 to 1.0
    },
    'hudSettings.altitudeColor'(val) {
      if (this.progressBar.altitude) {
        this.progressBar.altitude.destroy()
        this.setupHudProgressbar('altitude', val)
        this.progressBar.altitude.set(this.status.altitude / 2483);  // Number from 0.0 to 1.0
      }
    },
    'hudSettings.healthColor'(val) {
      if (this.progressBar.health) {
        this.progressBar.health.destroy()
        this.setupHudProgressbar('health', val)
        this.progressBar.health.set(this.status.health / 100);  // Number from 0.0 to 1.0
      }
    },
    'hudSettings.armorColor'(val) {
      if (this.progressBar.armor) {
        this.progressBar.armor.destroy()
        this.setupHudProgressbar('armor', val)
        this.progressBar.armor.set(this.status.armor / 100);  // Number from 0.0 to 1.0
      }
    },
    'hudSettings.hungerColor'(val) {
      if (this.progressBar.hunger) {
        this.progressBar.hunger.destroy()
        this.setupHudProgressbar('hunger', val)
        this.progressBar.hunger.set(this.status.hunger / 100);  // Number from 0.0 to 1.0
      }
    },
    'hudSettings.thirstColor'(val) {
      if (this.progressBar.thirst) {
        this.progressBar.thirst.destroy()
        this.progressBar["thirst-2"].destroy()

        this.setupHudProgressbar('thirst', val)
        this.setupHudProgressbar('thirst-2', val)


        this.progressBar["thirst-2"].set(this.status.thirst / 100);  // Number from 0.0 to 1.0
        this.progressBar.thirst.set(this.status.thirst / 100);  // Number from 0.0 to 1.0
      }
    },
    'hudSettings.stressColor'(val) {
      if (this.progressBar.stress) {
        this.progressBar.stress.destroy()
        this.setupHudProgressbar('stress', val)
        this.progressBar.stress.set(this.status.stress / 100);  // Number from 0.0 to 1.0
      }
    },
    'hudSettings.staminaColor'(val) {
      if (this.progressBar.stamina) {
        this.progressBar.stamina.destroy()
        this.setupHudProgressbar('stamina', val)
        this.progressBar.stamina.set(this.status.stamina / 100);  // Number from 0.0 to 1.0
      }
    },
    'hudSettings.oxygenColor'(val) {
      if (this.progressBar.oxygen) {
        this.progressBar.oxygen.destroy()
        this.setupHudProgressbar('oxygen', val)
        this.progressBar.oxygen.set(this.status.oxygen / 100);  // Number from 0.0 to 1.0
      }
    },

    'hudSettings.monochromeColor'(val) {
      if (val) {
        if (this.progressBar.oxygen) {
          this.progressBar.oxygen.destroy()
          this.setupHudProgressbar('oxygen', val)
          this.progressBar.oxygen.set(this.status.oxygen / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.stamina) {
          this.progressBar.stamina.destroy()
          this.setupHudProgressbar('stamina', val)
          this.progressBar.stamina.set(this.status.stamina / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.stress) {
          this.progressBar.stress.destroy()
          this.setupHudProgressbar('stress', val)
          this.progressBar.stress.set(this.status.stress / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.thirst) {
          this.progressBar.thirst.destroy()
          this.progressBar["thirst-2"].destroy()

          this.setupHudProgressbar('thirst', val)
          this.setupHudProgressbar('thirst-2', val)

          this.progressBar["thirst-2"].set(this.status.thirst / 100);  // Number from 0.0 to 1.0
          this.progressBar.thirst.set(this.status.thirst / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.hunger) {
          this.progressBar.hunger.destroy()
          this.setupHudProgressbar('hunger', val)
          this.progressBar.hunger.set(this.status.hunger / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.health) {
          this.progressBar.health.destroy()
          this.setupHudProgressbar('health', val)
          this.progressBar.health.set(this.status.health / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.armor) {
          this.progressBar.armor.destroy()
          this.setupHudProgressbar('armor', val)
          this.progressBar.armor.set(this.status.armor / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.altitude) {
          this.progressBar.altitude.destroy()
          this.setupHudProgressbar('altitude', val)
          this.progressBar.altitude.set(this.status.altitude / 2483);  // Number from 0.0 to 1.0
        }
      } else {
        if (this.progressBar.oxygen) {
          this.progressBar.oxygen.destroy()
          this.setupHudProgressbar('oxygen', this.getHudColors('oxygenColor'))
          this.progressBar.oxygen.set(this.status.oxygen / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.stamina) {
          this.progressBar.stamina.destroy()
          this.setupHudProgressbar('stamina', this.getHudColors('staminaColor'))
          this.progressBar.stamina.set(this.status.stamina / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.stress) {
          this.progressBar.stress.destroy()
          this.setupHudProgressbar('stress', this.getHudColors('stressColor'))
          this.progressBar.stress.set(this.status.stress / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.thirst) {
          this.progressBar.thirst.destroy()
          this.setupHudProgressbar('thirst', this.getHudColors('thirstColor'))
          this.progressBar.thirst.set(this.status.thirst / 100);  // Number from 0.0 to 1.0


          this.progressBar["thirst-2"].destroy()
          this.setupHudProgressbar('thirst-2', this.getHudColors('thirstColor'))
          this.progressBar.thirst.set(this.status.thirst / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.hunger) {
          this.progressBar.hunger.destroy()
          this.setupHudProgressbar('hunger', this.getHudColors('hungerColor'))
          this.progressBar.hunger.set(this.status.hunger / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.health) {
          this.progressBar.health.destroy()
          this.setupHudProgressbar('health', this.getHudColors('healthColor'))
          this.progressBar.health.set(this.status.hunger / 100);  // Number from 0.0 to 1.0
        }
        if (this.progressBar.armor) {
          this.progressBar.armor.destroy()
          this.setupHudProgressbar('armor', this.getHudColors('armorColor'))
          this.progressBar.armor.set(this.status.armor / 100);  // Number from 0.0 to 1.0
        }
      }

    },
  },
  mounted() {
    window.addEventListener('message', this.messageHandler);
  },
  beforeDestroy() {
    window.removeEventListener('message', this.messageHandler);

  },
  template: await importTemplate('./app/pages/hud/index.html')
}
export default Hud