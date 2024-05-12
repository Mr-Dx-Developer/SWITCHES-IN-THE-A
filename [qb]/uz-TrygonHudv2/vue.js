


const app = new Vue({
  el: '#app',
  data: {
    leftData:{
      server:"UZ ROLEPLAY",
      id:1,
      players:"75/120",
      job:"Police",
      grade:"Officer",
      cash:"752.000.000"
    },
    location:{
      label:"DOWNTOWN ST.",
      p:"Vinewood Blvd"
    },
    allHud: false,
    nitro: false,
    backgroundImageStyle: {
        backgroundImage: "url('assets/img/background.svg')"
    },
    hudSelectdrag: '',
    hudMenu: false, // hudmenu acıksa borderlar her şey
    hudMap: false,
    drag: false,
    colorPicker: false,
    buttonType: localStorage.getItem("buttonType") || "style", // home // position // style
    menuType: "home", // home or position or style
    hudMenuStyle: localStorage.getItem("hudMenuStyle") || "v1", // radial or load or v1
    hudType: "rectangle", // radial or rectangle
    speedType: localStorage.getItem("speedType") || "KM/H", // kmh or mph
    mapType: localStorage.getItem("mapType") || "rectangle", // rectangle or radial
    CalculateDash: {
        nitro: {
            percentage: 0
        },
        rpm: {
            percentage: 0
        }
    },
    rotationAngle: 0,
    selectedColor: null,
    showPicker: false,
    speed: 0,
    show: false,
    selectedColor: '',
    hideTimeout: null,
    colors: {
        hex: '#00FFF0'
    },
    selectHud: "",
    selectStyle: {
      radial: {
          opacity: localStorage.getItem("hudSelectradial") || "0.4"
      },
      load: {
          opacity: localStorage.getItem("hudSelectload") || "0.4"
      },
      v1: {
          opacity: localStorage.getItem("hudSelectv1") || "0.4"
      }
  },
    hudtype: {
      radial: {
          variable: false,
      },
      rectangle: {
          variable: false,
      },
      load: {
          variable: false,
      },
      v1: {
          variable: false
      }
  },
    colorlist:[
      {
        color:"#FFFFFF"
      },
      {
        color:"#FC4E51"
      },
      {
        color:"#00A3FF"
      },
      {
        color:"#ADFE00"
      },
      {
        color:"#FFA048"
      },
      {
        color:"#FF0099"
      },
      {
        color:"#00FFF0"
      }
    ],
    setSpeedComponent : {
      seatbelt:{
        color:"#23DE98" // #23DE98
      },
      engine:{
        color:"#C6E2FF" // C6E2FF
      },
      lights:{
        color:"#32FFCE" // 32FFCE
      },
      signal:{
        left:{
          color:"#25F1A5", // 25F1A5
          opacity:"0.27"
        },
        right:{
          color:"#25F1A5", // 25F1A5
          opacity:"0.27"
        }
      }
    },
    hud: {
      microphone: {
          position: {
              top: localStorage.getItem("hud1MicrophonePositionTop") || "63.35rem",
              left: localStorage.getItem("hud1MicrophonePositionLeft") || "4rem",
          },
          color: localStorage.getItem("hud1microphoneColor") || "white",
          percentage: 4,
      },
      health: {
          position: {
              top: localStorage.getItem("hud1HealthPositionTop") || "63.35rem",
              left: localStorage.getItem("hud1HealthPositionLeft") || "6.5rem",
          },
          color: localStorage.getItem("hud1healthColor") || "#FC4E51",
          percentage: 65,
      },
      healthv3: {
          position: {
              top: localStorage.getItem("hud1Healthv3PositionTop") || "63.7rem",
              left: localStorage.getItem("hud1Healthv3PositionLeft") || "3.3rem",
          },
          color: localStorage.getItem("hud1healthv3Color") || "#FC4E51",
      },
      armorv3: {
          position: {
              top: localStorage.getItem("hud1Armorv3PositionTop") || "63.7rem",
              left: localStorage.getItem("hud1Armorv3PositionLeft") || "6.4rem",
          },
          color: localStorage.getItem("hud1armorv3Color") || "#00A3FF",
      },
      hungerv3: {
          position: {
              top: localStorage.getItem("hud1Hungerv3PositionTop") || "63.7rem",
              left: localStorage.getItem("hud1Hungerv3PositionLeft") || "9.5rem",
          },
          color: localStorage.getItem("hud1hungerv3Color") || "#00A3FF",
      },
      microphonev3: {
          position: {
              top: localStorage.getItem("hud1Microphonev3PositionTop") || "63.9rem",
              left: localStorage.getItem("hud1Microphonev3PositionLeft") || "12.7rem",
          },
          color: localStorage.getItem("hud1microphonev3Color") || "white",
      },
      waterv3: {
          position: {
              top: localStorage.getItem("hud1WaterPositionTop") || "63.7rem",
              left: localStorage.getItem("hud1WaterPositionLeft") || "13.9rem",
          },
          color: localStorage.getItem("hud1waterColor") || "#00FFF0",
      },
      oxygenv3: {
          position: {
              top: localStorage.getItem("hud1oxygenv3PositionTop") || "63.7rem",
              left: localStorage.getItem("hud1oxygenv3PositionLeft") || "17rem",
          },
          color: localStorage.getItem("hud1oxygenv3Color") || "#FFA048",
      },
      stressv3: {
          position: {
              top: localStorage.getItem("hud1Stressv3PositionTop") || "63.7rem",
              left: localStorage.getItem("hud1Stressv3PositionLeft") || "20rem",
          },
          color: localStorage.getItem("hud1stressv3Color") || "#FF0099",
      },
      armor: {
          position: {
              top: localStorage.getItem("hud1ArmorPositionTop") || "63.35rem",
              left: localStorage.getItem("hud1ArmorPositionLeft") || "9.1rem",
          },
          color: localStorage.getItem("hud1armorColor") || "#00A3FF",
          percentage: 75
      },
      hunger: {
          position: {
              top: localStorage.getItem("hud1HungerPositionTop") || "63.35rem",
              left: localStorage.getItem("hud1HungerPositionLeft") || "11.7rem",
          },
          color: localStorage.getItem("hud1hungerColor") || "#ADFE00",
          percentage: 80
      },
      water: {
          position: {
              top: localStorage.getItem("hud1WaterPositionTop") || "63.35rem",
              left: localStorage.getItem("hud1WaterPositionLeft") || "14.4rem",
          },
          color: localStorage.getItem("hud1waterColor") || "#00FFF0",
          percentage: 75
      },
      oxygen: {
          position: {
              top: localStorage.getItem("hud1HungerPositionTop") || "63.35rem",
              left: localStorage.getItem("hud1HungerPositionLeft") || "17rem",
          },
          color: localStorage.getItem("hud1oxygenColor") || "#FFA048",
          percentage: 100
      },
      stress: {
          position: {
              top: localStorage.getItem("hud1Stressv3PositionTop") || "63.35rem",
              left: localStorage.getItem("hud1Stressv3PositionLeft") || "19.7rem",
          },
          color: localStorage.getItem("hud1stressColor") || "#FF0099",
          percentage: 0
      },
      speedometer: {
          speeds: {
              color: localStorage.getItem("hud1speedometerspeedsColor") || "#25F1A5"
          },
          bar: {
              color: localStorage.getItem("hud1speedometerbarColor") || "#25F1A5"
          },
          noss: {
              color: localStorage.getItem("hud1speedometernossColor") || "#25F1A5"
          },
          rpm: {
              color: localStorage.getItem("hud1speedometerrpmColor") || "#25F1A5"
          },
          fuel: {
              percentage: 50
          }
      },
      effect: {
          color: localStorage.getItem("hud1effectColor") || "#25F1A5"
      },
      leftPos: {
          position: {
              top: localStorage.getItem("hud1leftPosPositionTop") || "1rem",
              left: localStorage.getItem("hud1lleftPosPositionLeft") || "104.3rem",
          },
          color: localStorage.getItem("hud1leftPosColor") || "#25F1A5",
      },
      cash: {
          color: localStorage.getItem("hud1cashColor") || "#00FF94",
      },
      job: {
          color: localStorage.getItem("hud1jobColor") || "#00B2FF",
      },
      server: {
          color: localStorage.getItem("hud1serverColor") || "#00B2FF",
      },
  },
  hudNum: parseInt(localStorage.getItem("hudClassNumber")) || 1
},
   methods: {
    darkenColor(color, percent) {
      var num = parseInt(color.replace("#",""),16),
      amt = Math.round(2.55 * percent),
      R = (num >> 16) + amt,
      B = ((num >> 8) & 0x00FF) + amt,
      G = (num & 0x0000FF) + amt;
      return "#" + (0x1000000 + (R<255?R<1?0:R:255)*0x10000 + (B<255?B<1?0:B:255)*0x100 + (G<255?G<1?0:G:255)).toString(16).slice(1);
    },
    setMapLua(type){
      const url = `https://${GetParentResourceName()}/GetMap`,
      data = {
          mapType: type
      };
     fetch(url, {
      method: "POST",
      headers: {
          "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
      }).then(t => t.json()).then(t => {
          console.log(t)
      }).catch(t => {
          console.error(t)
      });
    },

    setSpeedLua(type){
      const url = `https://${GetParentResourceName()}/GetSpeedClass`,
      data = {
          class: type
      };
     fetch(url, {
      method: "POST",
      headers: {
          "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
      }).then(t => t.json()).then(t => {
          console.log(t)
      }).catch(t => {
          console.error(t)
      });
    },

    animateSpeedometer() {
      const speedo = this.$refs.speedo;
      const initialSY = window.innerHeight;

      anime({
        targets: speedo,
        translateY: [initialSY, 0],
        duration: 1200,
        easing: 'easeOutQuart',
        delay: 500,
      });
    },

    animateLocation() {
      const location = this.$refs.locations;
      const initialSY = window.innerHeight;

      anime({
        targets: location,
        translateY: [initialSY, 0],
        duration: 400,
        easing: 'easeOutQuart',
        delay: 500,
      });
    },

    setHudClass(type){
      this.$forceUpdate();
      const borders = [
        this.$refs.border1,
        this.$refs.border2,
        this.$refs.border3,
        this.$refs.border4,
        this.$refs.border5,
        this.$refs.border6,
        this.$refs.border7
      ];
      borders.forEach((border, index) => {
        anime({
          targets: border,
          translateY: [100, 0],
          duration: 700 + 100 * index,
          easing: 'easeInOutSine'
        });
      });
      
      if (type === 'left') {
        if (this.hudNum < 4) {  // Maksimum değerin 4 olmasını sağladık.
            this.hudNum++;
        }
    } else if (type === 'right') {
        if (this.hudNum > 1) {  // Minimum değerin 1 olmasını sağladık.
            this.hudNum--;
        }
    }
    localStorage.setItem('hudClassNumber', this.hudNum.toString());    
    },

    setHudMenu(data){
      this.hudMenuStyle = data;
      this.selectStyle[data].opacity = "1"
      for (const style in this.selectStyle) {
        if (style === data) {
          this.selectStyle[style].opacity = "1";
          localStorage.setItem(`hudSelect${style}`, "1");
        } else {
          this.selectStyle[style].opacity = "0.4";
          localStorage.setItem(`hudSelect${style}`, "0.4");
        }
      }
      localStorage.setItem("hudMenuStyle", data);
      this.colorPicker = true;
    },

    setMenu(data){
      this.buttonType = data;
      
      localStorage.setItem("buttonType", data);
      if (data == 'position'){
        this.drag = true;
      }else {
        this.drag = false;
      }
    },
    setType(data){
      localStorage.setItem("speedType", data);
      this.speedType = data;
    },
    hudColor(type, data, dragSelect){
      this.hudSelectdrag = dragSelect;
      if (type && data) {
        this.selectHud = type + '.' + data; 
      } else {
        this.selectHud = data;  
      }
    },
    togglePicker() {
      this.showPicker = !this.showPicker;
    },
    hidePicker() {
      this.hideTimeout = setTimeout(() => {
          this.showPicker = false;
          this.colorlist.push({
              color: this.selectedColor
          });
          if (this.selectHud != "") {
              let path = this.selectHud.split('.');
              if (path.length == 2) {
                  this.hud[path[0]][path[1]].color = this.selectedColor; 
                  localStorage.setItem(`hud1${path[0]}${path[1]}Color`, this.selectedColor);
              } else {
                  this.hud[this.selectHud].color = this.selectedColor; 
                  localStorage.setItem(`hud1${this.selectHud}Color`, this.selectedColor); 
              }
          }
      }, 300);
  },
    cancelHidePicker() {
      clearTimeout(this.hideTimeout);
    },
    updateColor(color) {
      if (this.selectHud == ''){
        this.hud.effect.color = color.hex;
        localStorage.setItem(`hud1effectColor`, color.hex);
      }
      this.selectedColor = color.hex;
    },
    defaultColor(data) {
      if (this.selectHud == ''){
        this.hud.effect.color = data.color;
        localStorage.setItem(`hud1effectColor`, data.color);
      }
      if (this.selectHud != "") {
          let path = this.selectHud.split('.');
          if (path.length == 2) {
              this.hud[path[0]][path[1]].color = data.color; 
              localStorage.setItem(`hud1${path[0]}${path[1]}Color`, data.color);
          } else {
              this.hud[this.selectHud].color = data.color;  
              localStorage.setItem(`hud1${this.selectHud}Color`, data.color);
          }
      }
      this.selectedColor = data.color;
  },
  
  updateRotationAngle: function(newSpeed) {
      if (newSpeed >= 220){
      const factor = 245.5 / 240;
      this.rotationAngle = newSpeed * factor;
      }
      else if (newSpeed >= 200){
        const factor = 250 / 240;
        this.rotationAngle = newSpeed * factor;
      }
      else if (newSpeed >= 160){
        const factor = 260 / 240;
        this.rotationAngle = newSpeed * factor;
      }
      else if (newSpeed >= 140){
        const factor = 270 / 240;
        this.rotationAngle = newSpeed * factor;
      }
      else if (newSpeed >= 120){
        const factor = 276 / 240;
        this.rotationAngle = newSpeed * factor;
      }
      else if (newSpeed >= 105) {
        const factor = 284 / 240;
        this.rotationAngle = newSpeed * factor;
     } else if (newSpeed >= 100) {
         const factor = 294.5 / 240;
         this.rotationAngle = newSpeed * factor;
     } else if (newSpeed >= 80) {
         const factor = 299 / 240;
         this.rotationAngle = newSpeed * factor;
     } else if (newSpeed >= 60) {
         const factor = 315 / 240;
         this.rotationAngle = newSpeed * factor;
     } else if (newSpeed >= 40) {
         const factor = 355 / 240;
         this.rotationAngle = newSpeed * factor;
     } else if (newSpeed >= 20) {
         const factor = 375 / 220;
         this.rotationAngle = newSpeed * factor;
     } else if (newSpeed >= 0) {
         const factor = 380 / 240;
         this.rotationAngle = newSpeed * factor;
     }
  },
  
  resetPositions: function(data, type) {
    if (data === 'hud' && type === 'all') {
        const defaults = {
            microphone: {
                top: "63.6rem",
                left: "4rem"
            },
            health: {
                top: "63.6rem",
                left: "6.5rem"
            },
            armor: {
                top: "63.6rem",
                left: "9.1rem"
            },
            hunger: {
                top: "63.6rem",
                left: "11.7rem"
            },
            water: {
                top: "63.6rem",
                left: "14.4rem"
            },
            oxygen: {
                top: "63.6rem",
                left: "17rem"
            },
            stress: {
                top: "63.6rem",
                left: "19.6rem"
            },
            leftPos: {
                top: "1rem",
                left: "104.3rem"
            },
            healthv3: {
                top: "63.75rem",
                left: "3.3rem"
            },
            armorv3: {
                top: "63.75rem",
                left: "6.4rem"
            },
            hungerv3: {
                top: "63.75rem",
                left: "9.5rem"
            },
            microphonev3: {
                top: "63.9rem",
                left: "12.7rem"
            },
            waterv3: {
                top: "63.7rem",
                left: "13.9rem"
            },
            stressv3: {
                top: "63.7rem",
                left: "20rem"
            },
            oxygenv3: {
                top: "63.7rem",
                left: "17rem"
            }
        };
        Object.keys(this.hud).forEach(key => {
            if (defaults.hasOwnProperty(key)) {
                localStorage.removeItem(key + "PositionTop");
                localStorage.removeItem(key + "PositionLeft");
                this.hud[key].position = {
                    ...defaults[key]
                };
            }
        });
        this.$forceUpdate();
        const borders = [
            this.$refs.border1,
            this.$refs.border2,
            this.$refs.border3,
            this.$refs.border4,
            this.$refs.border5,
            this.$refs.border6,
            this.$refs.border7
        ];
        borders.forEach((border, index) => {
            anime({
                targets: border,
                translateY: [100, 0],
                duration: 700 + 100 * index,
                easing: 'easeInOutSine'
            });
        });
    } else if (data === 'hud' && type === 'single' && this.hudSelectdrag !== '') {
        // console.log(`Data Verisi ${data}, Drag Verisi ${this.hudSelectdrag}, Type Verisi ${type}`);
        let pos = {
            microphone: {
                top: "63.6rem",
                left: "4rem"
            },
            health: {
                top: "63.6rem",
                left: "6.5rem"
            },
            armor: {
                top: "63.6rem",
                left: "9.1rem"
            },
            hunger: {
                top: "63.6rem",
                left: "11.7rem"
            },
            water: {
                top: "63.6rem",
                left: "14.4rem"
            },
            oxygen: {
                top: "63.6rem",
                left: "17rem"
            },
            stress: {
                top: "63.6rem",
                left: "19.6rem"
            },
            leftPos: {
                top: "1rem",
                left: "104.3rem"
            },
            healthv3: {
                top: "63.75rem",
                left: "3.3rem"
            },
            armorv3: {
                top: "63.75rem",
                left: "6.4rem"
            },
            hungerv3: {
                top: "63.75rem",
                left: "9.5rem"
            },
            microphonev3: {
                top: "63.9rem",
                left: "12.7rem"
            },
            waterv3: {
                top: "63.7rem",
                left: "13.9rem"
            },
            stressv3: {
                top: "63.7rem",
                left: "20rem"
            },
            oxygenv3: {
                top: "63.7rem",
                left: "17rem"
            }
        };
        if (pos.hasOwnProperty(this.hudSelectdrag)) {
            localStorage.removeItem(this.hudSelectdrag + "PositionTop");
            localStorage.removeItem(this.hudSelectdrag + "PositionLeft");
            this.hud[this.hudSelectdrag].position = {
                ...pos[this.hudSelectdrag]
            };
        }
        this.$forceUpdate();
    }
},  
    mouseDownHandler: function (style, data, e) {
      if (this.drag){
      const drag = e.target.closest('.' + style);
      const rect = drag.getBoundingClientRect();
      const pos = { top: rect.top, left: rect.left, x: e.clientX, y: e.clientY };

      drag.style.transform = 'scale(1.1)';
      drag.style.transition = 'transform 0.2s, box-shadow 0.2s';
      drag.style.boxShadow = '0px 10px 20px rgba(0,0,0,0.19), 0px 6px 6px rgba(0,0,0,0.23)';
    
      const mouseMoveHandler = function (e) {
          const dx = e.clientX - pos.x;
          const dy = e.clientY - pos.y;
          pos.top += dy;
          pos.left += dx;
          const appRect = document.getElementById("app").getBoundingClientRect();
          pos.top = Math.max(appRect.top, Math.min(pos.top, appRect.bottom - drag.offsetHeight));
          pos.left = Math.max(appRect.left, Math.min(pos.left, appRect.right - drag.offsetWidth));
          drag.style.top = `${pos.top}px`;
          drag.style.left = `${pos.left}px`;
          pos.x = e.clientX;
          pos.y = e.clientY;

          this.updatePlayerPosition(style, data, pos.top, pos.left);
      }.bind(this);
    
      const mouseUpHandler = function () {
          drag.style.transform = 'scale(1)';
          drag.style.boxShadow = '';
          document.removeEventListener("mousemove", mouseMoveHandler);
          document.removeEventListener("mouseup", mouseUpHandler);
      }.bind(this);
    
      document.addEventListener("mousemove", mouseMoveHandler);
      document.addEventListener("mouseup", mouseUpHandler);
      }
    },

    updatePlayerPosition: function (style, data, top, left) {
      const dataKey = typeof data === "string" ? data : data.id;
      if (this.hud && this.hud[dataKey]) {
        this.hud[dataKey].position = { top: top + "px", left: left + "px" };
        localStorage.setItem(dataKey + "PositionTop", top + "px");
        localStorage.setItem(dataKey + "PositionLeft", left + "px");
      } else {
        console.error(`Could not find object with id "${dataKey}" in hud`);
      }
    },
    loadMapTypeFromLocalStorage() {
      const mapType = localStorage.getItem("mapType");
      if (mapType) {
        this.mapType = mapType;
      }
    },
    TypeMap(data) {
      const mapBorderElement = this.$refs.mapBorder;
      anime({
        targets: mapBorderElement,
        scale: [0, 1],
        opacity: [0, 1],
        duration: 1000,
        easing: 'easeOutExpo',
      });
      const borderElement = this.$refs.border;
      const startPosition = -borderElement.offsetWidth;
      const endPosition = 0;
      anime({
        targets: borderElement,
        translateX: [startPosition, endPosition],
        duration: 500,
        easing: 'linear',
      });
      if (data === 'radial') {
        this.$set(this.hudtype.radial, 'opacity', 1);
        this.$set(this.hudtype.rectangle, 'opacity', 0.5);
        this.$set(this.hudtype.radial, 'variable', !this.hudtype.radial.variable);
        this.$set(this.hudtype.rectangle, 'variable', false);
        this.mapType = 'radial';
        localStorage.setItem('mapType', this.mapType);
        this.setMapLua(this.mapType)
        localStorage.setItem('radialOpacity', this.hudtype.radial.opacity);
        localStorage.setItem('rectangleOpacity', this.hudtype.rectangle.opacity);
        localStorage.setItem('radialVariable', this.hudtype.radial.variable);
        localStorage.setItem('rectangleVariable', this.hudtype.rectangle.variable);
    } else if (data === 'rectangle') {
        this.$set(this.hudtype.rectangle, 'opacity', 1);
        this.$set(this.hudtype.radial, 'opacity', 0.5);
        this.$set(this.hudtype.rectangle, 'variable', !this.hudtype.rectangle.variable);
        this.$set(this.hudtype.radial, 'variable', false);
        this.mapType = 'rectangle';
        localStorage.setItem('mapType', this.mapType);
        this.setMapLua(this.mapType)
        localStorage.setItem('radialOpacity', this.hudtype.radial.opacity);
        localStorage.setItem('rectangleOpacity', this.hudtype.rectangle.opacity);
        localStorage.setItem('radialVariable', this.hudtype.radial.variable);
        localStorage.setItem('rectangleVariable', this.hudtype.rectangle.variable);
    }
    
    

      
      
    },
   },

    components: {
      'chrome-picker': VueColor.Chrome
    },

    created(){var a=this;window.addEventListener('message',function(b){var c=b.data;switch(c.action){case"CARHUD":let d="#32FFCE",e="#C6E2FF",f="1",g="0.27";if(c.fuel>0){a.hud.speedometer.fuel.percentage=Math.floor(c.fuel)}a.CalculateDash.rpm.percentage=c.rpm;a.speed=c.speed;a.setSpeedComponent.seatbelt.color=c.seatbelt?d:e;a.setSpeedComponent.lights.color=c.state?d:e;switch(c.signal){case 2:a.setSpeedComponent.signal.left={color:d,opacity:f};a.setSpeedComponent.signal.right={color:e,opacity:g};break;case 1:a.setSpeedComponent.signal.right={color:d,opacity:f};a.setSpeedComponent.signal.left={color:e,opacity:g};break;case 3:a.setSpeedComponent.signal.left={color:d,opacity:f};a.setSpeedComponent.signal.right={color:d,opacity:f};break;default:a.setSpeedComponent.signal.left={color:e,opacity:g};a.setSpeedComponent.signal.right={color:e,opacity:g};break}break;case 'MENU':a.hudMenu=true;break;case "SETCARHUD":a.hudMap=c.variable;break;case "HEALTH":a.hud.health.percentage=c.health;break;case "ARMOR":a.hud.armor.percentage=c.armor;break;case "HUNGER":a.hud.hunger.percentage=c.hunger;break;case "THIRST":a.hud.water.percentage=c.thirst;break;case "PLAYER_STATUS":a.hud.hunger.percentage=c.hunger;a.hud.water.percentage=c.thirst;a.allHud=true;break;case "STAMINA":a.hud.oxygen.percentage=c.stamina;break;case "STRESS":a.hud.stress.percentage=c.stress;break;case "NOSS":a.CalculateDash.nitro.percentage=c.noss;break;case "STREET":a.location.label=c.StreetName1;a.location.p=c.StreetName2;break;case "UZDATA":const h=c.cash;a.leftData.cash=h.toLocaleString('en-US',{style:'currency',currency:'USD',});a.leftData.job=c.job.charAt(0).toUpperCase()+c.job.slice(1);a.leftData.grade=c.label;a.leftData.players=c.count;a.leftData.id=c.id;break;case "VOICE":a.hud.microphone.percentage=c.val;break;case "UPDATE_JOB":a.leftData.job=c.job.charAt(0).toUpperCase()+c.job.slice(1);a.leftData.grade=c.label;break;case "UPDATE_CASH":a.leftData.cash=c.cash.toLocaleString('en-US',{style:'currency',currency:'USD',});break;case "SERVER":a.leftData.server=c.server;break}})},

   mounted() {
    var width = window.screen.width;
    var height = window.screen.height;
    
    if (!localStorage.getItem("hud1leftPosPositionTop") && width === 3440 && height === 1440) {
      this.hud.leftPos.position.left = "145.3rem"; 
      this.hud.leftPos.position.top = "1rem";
    }

    

    
    
    

    if (this.buttonType == 'position') {
      this.drag = true;
  } else {
      this.drag = false;
  }
  if (this.menuType == 'home') {
      this.colorPicker = true;
  } else {
      this.colorPicker = false;
  }
  const center = this.$refs.centermsg;
  const initialY = window.innerHeight;
  anime({
      targets: center,
      translateY: [initialY, 0],
      duration: 2000,
      easing: 'easeOutQuart',
      delay: 500,
  });
  const speedo = this.$refs.speedo;
  const initialSY = window.innerHeight;
  anime({
      targets: speedo,
      translateY: [initialSY, 0],
      duration: 3000,
      easing: 'easeOutQuart',
      delay: 500,
  });
  this.hudtype.radial.opacity = localStorage.getItem('radialOpacity') || 0.5;
  this.hudtype.rectangle.opacity = localStorage.getItem('rectangleOpacity') || 0.5;
  this.hudtype.radial.variable = JSON.parse(localStorage.getItem('radialVariable')) || false;
  this.hudtype.rectangle.variable = JSON.parse(localStorage.getItem('rectangleVariable')) || false;
  this.loadMapTypeFromLocalStorage();
  const hudKeys = Object.keys(this.hud);
  for (let key of hudKeys) {
      const top = localStorage.getItem(key + "PositionTop");
      const left = localStorage.getItem(key + "PositionLeft");
      if (top && left) {
          if (!this.hud[key].position) {
              continue;
          }
          this.hud[key].position.top = top;
          this.hud[key].position.left = left;
      }
  }
  this.setSpeedLua(this.speedType)
  this.setMapLua(this.mapType)
  },

  watch: {
    speed: function(newSpeed, oldSpeed) {
      if (newSpeed <= 240){
        this.updateRotationAngle(newSpeed);
      }else {
        this.speed = 240;
      }
  },
  'CalculateDash.rpm.percentage': function(newVal, oldVal) {
      if (newVal == 16) {
          app.CalculateDash.rpm.percentage = 0;
      }
  },
  'CalculateDash.nitro.percentage': function(newVal, oldVal) {
      if (newVal > 0) {
          app.nitro = true
      } else {
          setTimeout(() => {
              app.nitro = false
          }, 5000);
      }
  },
  'location.label': function(newVal, oldVal) {
    this.$nextTick(() => {
      this.animateLocation();
  });
},
  },
  
  computed: {
    dashoffset() {
      return 178 + this.CalculateDash.nitro.percentage *1.77;
    },
    dashArray() {
      const percentageValue = this.hud.microphone.percentage;
      const multipliers = [23, 30, 24, 30]; 
      const index = Math.max(0, Math.min(percentageValue - 1, 2));
      const multiplier = multipliers[index];
      const dashArrayValue = percentageValue * multiplier; 
      return dashArrayValue.toString();
    },
    


    ColorPicker() {
      const width = window.screen.width;
      const height = window.screen.height;
    
      const styles = {
        v1: {
          default: {
            top: "3.1rem",
            left: "57.4rem"
          },
          widescreen: {
            top: "2.9rem",
            left: "81.65rem"
          }
        },
        radial: {
          default: {
            top: "4rem",
            left: "57.4rem"
          },
          widescreen: {
            top: "4.2rem",
            left: "83.1rem"
          }
        },
        load: {
          default: {
            top: "4rem",
            left: "57.7rem"
          },
          widescreen: {
            top: "3.8rem",
            left: "83.5rem"
          }
        }
      };
    
      const isWidescreen = width === 3440 && height === 1440;
    
      if (this.hudMenuStyle in styles) {
        return isWidescreen ? styles[this.hudMenuStyle].widescreen : styles[this.hudMenuStyle].default;
      } else {
        return {
          top: "3.1rem",
          left: "57.4rem"
        };
      }
    },    
    
    

    MenuTypes(){
      if (this.buttonType === 'home') {
        return {
          top:"13rem"
        };
      }else if (this.buttonType === 'position') {
        return {
          top:"1.5rem"
        };
      }else if (this.buttonType === 'style') {
        return {
          top:"1.5rem"
        };
      }
    },


    CenterYMessage() {
      if (this.hudMenuStyle === 'v1') {
        return {
          left:"1.9rem",
          color: this.hud.effect.color,
          'text-shadow': '0rem 0rem 0.1rem ' + this.hud.effect.color
        };
      } else if (this.hudMenuStyle === 'radial') {
        return {
          left:"1.5rem",
          color: this.hud.effect.color,
          'text-shadow': '0rem 0rem 0.1rem ' + this.hud.effect.color
        };
      } else if (this.hudMenuStyle === 'load') {
        return {
          left:"1.6rem",
          color: this.hud.effect.color,
          'text-shadow': '0rem 0rem 0.1rem ' + this.hud.effect.color
        };
      } else {
        return {

        };
      }
    },

    CenterNMessage() {
      if (this.hudMenuStyle === 'v1') {
        return {
          left: "30rem",
          color: this.hud.effect.color,
          'text-shadow': '0rem 0rem 0.1rem ' + this.hud.effect.color
        };
      } else if (this.hudMenuStyle === 'radial') {
        return {
          left: "29.5rem",
          color: this.hud.effect.color,
          'text-shadow': '0rem 0rem 0.1rem ' + this.hud.effect.color
        };
      } else if (this.hudMenuStyle === 'load') {
        return {
          left: "29.7rem",
          color: this.hud.effect.color,
          'text-shadow': '0rem 0rem 0.1rem ' + this.hud.effect.color
        };
      }
    },
    

    LocationHudMenu() {
      let left, top;
      if (this.hudMap || this.hudMenu) {
          if (this.mapType === 'rectangle') {
              left = '3rem';
              top = '51rem';
              opacity = "0.5";
          } else if (this.mapType === 'radial') {
              left = '4.9rem';
              top = '49.5rem';
              opacity = '0.5';
          }
      }
      return {
          left,
          top,
          opacity
      };
    },

    
    stylev1Location() {
      let left = '2.4rem';
      let top;
      const borderElement = this.$refs.border || {
          offsetWidth: 0
      };
      const startPosition = -borderElement.offsetWidth;
      const endPosition = 0;
      anime({
          targets: borderElement,
          translateX: [startPosition, endPosition],
          duration: 500,
          easing: 'linear',
      });
      if (this.mapType == 'rectangle') {
          if (this.hudMap || this.hudMenu) {
              top = '47.3rem';
          } else {
              top = '60rem';
          }
      } else {
          if (this.hudMap || this.hudMenu) {
              top = '46.4rem';
          } else {
              top = '60rem';
          }
      }
      return {
          left,
          top
      };
    },
    

    styleLoadLocation() {
      let left = '1.5rem';
      let top;
      const borderElement = this.$refs.border || {
          offsetWidth: 0
      };
      const startPosition = -borderElement.offsetWidth;
      const endPosition = 0;
      anime({
          targets: borderElement,
          translateX: [startPosition, endPosition],
          duration: 500,
          easing: 'linear',
      });
      if (this.mapType == 'rectangle') {
          if (this.hudMap || this.hudMenu) {
              top = '46.35rem';
          } else {
              top = '58.8rem';
          }
      } else {
          if (this.hudMap || this.hudMenu) {
              top = '45.5rem';
          } else {
              top = '59rem';
          }
      }
      return {
        left,
        top
    };
    },



    styleLocation() {
      let left = '2.4rem';
      let top;
      const borderElement = this.$refs.border || {
          offsetWidth: 0
      };
      const startPosition = -borderElement.offsetWidth;
      const endPosition = 0;
      anime({
          targets: borderElement,
          translateX: [startPosition, endPosition],
          duration: 500,
          easing: 'linear',
      });
      if (this.mapType == 'rectangle') {
          if (this.hudMap || this.hudMenu) {
              top = '47.8rem';
          } else {
              top = '60.35rem';
          }
      } else {
          if (this.hudMap || this.hudMenu) {
              top = '46.5rem';
          } else {
              top = '60.35rem';
          }
      }
      return {
          left,
          top
      };
    }    


    
  },
   
  })
  

  document.onkeyup = function (data) {
    if (data.which == 27) {
      app.hudMenu = false;
      $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
    }
  };
  

