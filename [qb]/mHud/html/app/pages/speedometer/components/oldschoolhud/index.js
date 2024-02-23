import importTemplate from '../../../../utils/importTemplate.js'
import inlinesvg from '../../../../utils/inlineSvg.js'



const Vehicle = {
    data() {
        return {
      
            bar:false,
            nitroValue : 0,
            vehicle: [

                {
                    name: 'vehicleLights',
                    activeColor: '#FFFFFF',
                    disabledColor: '#ffffff3d',
                    svg: (color) => {
                        return `
                        <svg width="11" height="9" viewBox="0 0 11 9" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7.04687 6.26877H11V7.18762H6.91159C6.96127 6.90532 7.00793 6.59728 7.04687 6.26877ZM7.1543 4.5C7.1543 4.65514 7.15161 4.80832 7.14674 4.95942H11V4.04058H7.14674C7.15161 4.1916 7.1543 4.34486 7.1543 4.5ZM6.89934 1.74347C6.95003 2.02469 6.99812 2.33282 7.03857 2.66231H11V1.74347H6.89934ZM5.67473 8.67302C5.70007 8.59648 6.29492 6.77171 6.29492 4.5C6.29492 2.22829 5.70007 0.40343 5.67473 0.326889L5.56664 0L5.24303 0.0215354C5.19066 0.0250349 3.94591 0.11324 2.68345 0.679531C0.92794 1.46683 0 2.78794 0 4.5C0 6.21197 0.92794 7.53308 2.68345 8.32047C3.94591 8.88667 5.19057 8.97497 5.24294 8.97847L5.56664 9L5.67473 8.67302ZM5.43555 4.5C5.43555 6.0553 5.12755 7.41176 4.96398 8.02256C4.53732 7.96101 3.76119 7.81053 2.99774 7.46506C1.57885 6.82277 0.859375 5.82523 0.859375 4.5C0.859375 3.17477 1.57885 2.17714 2.99774 1.53494C3.76144 1.18929 4.5379 1.03881 4.96432 0.977348C5.12805 1.5868 5.43555 2.93958 5.43555 4.5Z" fill="${color}" />
                            <path d="M5.43555 4.5C5.43555 6.0553 5.12755 7.41176 4.96398 8.02256C4.53732 7.96101 3.76119 7.81053 2.99774 7.46506C1.57885 6.82277 0.859375 5.82523 0.859375 4.5C0.859375 3.17477 1.57885 2.17714 2.99774 1.53494C3.76144 1.18929 4.5379 1.03881 4.96432 0.977348C5.12805 1.5868 5.43555 2.93958 5.43555 4.5Z" fill="${color}" />
                        </svg>
                    `
                    }
                },
                {
                    name: 'seatbeltEnabled',
                    activeColor: '#FFFFFF',
                    disabledColor: '#FF0000',
                    svg: (color) => {
                        return `
                        <svg width="8" height="9" viewBox="0 0 8 9" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path style="transition:all .2s ease;"  d="M7.88129 6.83775C7.39129 6.37461 6.84763 6.01874 6.27697 5.75774C6.1803 4.89824 5.96098 4.13698 5.65265 3.54599L7.23564 1.76511C7.36596 1.61849 7.36596 1.38149 7.23564 1.23487C7.10531 1.08825 6.89464 1.08825 6.76431 1.23487L5.25133 2.93663C5.14266 2.80537 5.02833 2.688 4.908 2.59237C5.168 2.31824 5.33333 1.93163 5.33333 1.5C5.33333 0.672751 4.73533 0 4.00001 0C3.26469 0 2.6667 0.672751 2.6667 1.5C2.6667 1.93163 2.83202 2.31824 3.09202 2.59237C2.40203 3.13988 1.89003 4.30125 1.72503 5.74314C1.14804 6.00563 0.602043 6.36751 0.115376 6.84151C-0.0239512 6.97688 -0.0392949 7.21388 0.0813759 7.37026C0.201375 7.527 0.412373 7.54427 0.551372 7.40851C0.895697 7.07363 1.27304 6.80101 1.67103 6.58538C1.67003 6.6405 1.6667 6.69413 1.6667 6.75C1.6667 7.43962 1.7447 8.10413 1.89903 8.72587C1.93903 8.88787 2.07036 9 2.22003 9H3.33335C3.51734 9 3.66667 8.83201 3.66667 8.62501L3.664 7.28325C3.84932 7.07512 4.15099 7.07512 4.33332 7.27574V8.62499C4.33332 8.83199 4.48265 8.99998 4.66665 8.99998H5.77996C5.92963 8.99998 6.06096 8.88785 6.10096 8.72585C6.25529 8.10409 6.33329 7.43961 6.33329 6.74998C6.33329 6.69935 6.33029 6.65061 6.32962 6.60035C6.72561 6.81486 7.10428 7.08298 7.45193 7.41224C7.5146 7.47111 7.5906 7.49999 7.6666 7.49999C7.7616 7.49999 7.8556 7.45462 7.92193 7.36648C8.04029 7.20787 8.02196 6.97125 7.88129 6.83775ZM3.13433 5.31862C2.90066 5.35538 2.66801 5.40224 2.43967 5.46974C2.67799 4.04586 3.29566 2.99999 3.99998 2.99999C4.28231 2.99999 4.55065 3.16762 4.7863 3.45975L3.13433 5.31862ZM4.13399 5.2545L5.16398 4.09575C5.33898 4.485 5.47598 4.95899 5.56265 5.48287C5.09464 5.34186 4.61465 5.268 4.13399 5.2545Z" fill="${color}"/>
                        </svg>
                    `
                    }
                },
                {
                    name: 'engineStatus',
                    activeColor: '#FFFFFF',
                    disabledColor: '#ffffff3d',
                    svg: (color) => {
                        return `
                        <svg width="11" height="7" viewBox="0 0 11 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7.19728 1.75408L6.62043 1.24258H5.66652V0.777327H5.97334V0.0927734H3.54141V0.777327H3.84825V1.24258H2.85509L2.27823 1.75408H1.36913V2.09637V3.45428H0.684554V2.58061H0V5.01256H0.684554V4.13884H1.36913V5.49675V5.83904H2.85509L4.05869 6.90621H8.10591V1.75408H7.19728Z" fill="${color}" />
                            <path d="M10.1337 2.28584L10.0341 2.11914H8.79004V6.5192H10.0341L10.1337 6.35248C10.1708 6.29043 10.4962 5.70594 10.4962 4.31916C10.4962 2.93238 10.1708 2.34791 10.1337 2.28584Z" fill="${color}" />
                        </svg>
                        
                    `
                    }
                },

                {
                    name: 'handbrake',
                    activeColor: '#FF0000',
                    disabledColor: '#ffffff3d',
                    svg: (color) => {
                        return `
                        <svg width="10" height="7" viewBox="0 0 10 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5.02586 0C3.18186 0 1.68164 1.50022 1.68164 3.34426C1.68164 5.18826 3.18186 6.68844 5.02586 6.68844C6.86986 6.68844 8.37008 5.18826 8.37008 3.34426C8.37012 1.50025 6.86986 0 5.02586 0ZM5.02586 6.10873C3.50153 6.10873 2.26138 4.86863 2.26138 3.3443C2.26138 1.81992 3.50153 0.57978 5.02586 0.57978C6.55019 0.57978 7.79034 1.81992 7.79034 3.3443C7.79038 4.86859 6.55023 6.10873 5.02586 6.10873Z" fill="${color}"/>
                            <path d="M2.23128 0.549545C2.34448 0.436341 2.34448 0.252795 2.23128 0.139591C2.11804 0.0263865 1.93453 0.0263865 1.82132 0.139591C0.0543501 1.9066 0.0543501 4.78181 1.82132 6.54886C1.87795 6.60548 1.95211 6.63378 2.02632 6.63378C2.10049 6.63378 2.1747 6.60548 2.23128 6.54886C2.34452 6.43566 2.34452 6.25215 2.23132 6.13895C0.690326 4.59792 0.690326 2.09054 2.23128 0.549545Z" fill="${color}"/>
                            <path d="M8.23119 0.139591C8.11794 0.0263865 7.93444 0.0263865 7.82123 0.139591C7.70803 0.252795 7.70803 0.436341 7.82123 0.549545C9.36226 2.09054 9.36226 4.59792 7.82123 6.13895C7.70803 6.25215 7.70803 6.4357 7.82123 6.54886C7.87785 6.60545 7.95206 6.63378 8.02623 6.63378C8.1004 6.63378 8.1746 6.60548 8.23122 6.54886C9.99824 4.78177 9.99824 1.9066 8.23119 0.139591Z" fill="${color}"/>
                            <path d="M5.0262 4.23324C5.18632 4.23324 5.31607 4.10345 5.31607 3.94337V1.47444C5.31607 1.31436 5.18632 1.18457 5.0262 1.18457C4.86607 1.18457 4.73633 1.31436 4.73633 1.47444V3.94337C4.73633 4.10345 4.86611 4.23324 5.0262 4.23324Z" fill="${color}"/>
                            <path d="M5.0256 5.21428C5.22473 5.21428 5.38616 5.05286 5.38616 4.85372C5.38616 4.65459 5.22473 4.49316 5.0256 4.49316C4.82647 4.49316 4.66504 4.65459 4.66504 4.85372C4.66504 5.05286 4.82647 5.21428 5.0256 5.21428Z" fill="${color}"/>
                        </svg>
                        
                    `
                    }
                },

                // {
                //     name: 'vehicleengine'
                // },
                // {
                //     name: 'vehiclebreak'
                // },

            ]
        }
    },
    props: ["speed", "cruise", "vehicleSignals", "fuel", "seatbeltEnabled", "vehicleLights", "engineStatus", "handbrake", "nitroneedle"],
    methods: {
        messageHandler(event) {
            switch (event.data.action) {
                case "SET_NITRO_VALUE":
                    this.nitroValue = event.data.payload
                    if (this.bar) {
                        this.bar.set(this.nitroValue, true)
                    }
                    break
                default:
                    break;
            }
        }

    },
    components: {
        inlinesvg,
    },
    computed: {
        ...Vuex.mapState({
        
            hudSettings: state => state.hud.hudSettings,
         
        }),
        FormatSpeed(){
            const speed = this.speed.current.toFixed(0)
            if(speed.length == 1){
                return `<span>0</span><span>0</span>${speed}`
            }
            if(speed.length == 2){
                return `<span>0</span>${speed}`
            }
            if(speed.length == 3){
                return `${speed}`
            }
            return '<span>0</span><span>0</span><span>0</span>'
        },
        SpeedometerIndicator() {

            let minSpeed = 0;
            let maxSpeed = 280;
            let minDegree = -35;
            let maxDegree = 220;

            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.speed.current - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
                transformOrigin: 'right center',
                transition: 'all 0.2s linear 0s'
            }
        },
        NitroIndicator() {

            let minSpeed = -124;
            let maxSpeed = 124;
            let minDegree =-36;
            // let minDegree = -88;

            let maxDegree = 220;
            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.nitroneedle - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
                transformOrigin: 'right center',
                transition: 'all 0.2s linear 0s'
            }
        },
        RpmIndicator(){
            let minSpeed = 0;
            let maxSpeed = 1;
            let minDegree = 1;
            // let minDegree = -88;
            let maxDegree = 175;
            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.speed.rpm - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
                transformOrigin: 'right center',
                transition: 'all 0.2s linear 0s'
            }
        },
        FuelIndicator(){
            let minSpeed = 100;
            let maxSpeed = 0;
            let minDegree = -107;
            // let minDegree = -88;
            let maxDegree =   -71;
            let scale = (maxDegree - minDegree) / (maxSpeed - minSpeed);
            let val = minDegree + ((this.fuel - minSpeed) * scale);
            if (val > maxDegree) {
                val = maxDegree;
            }

            return {
                transform: ' rotate(' + val + 'deg)',
                transformOrigin: 'right center',
                transition: 'all 0.2s linear 0s'
            }
        },
     
      
     


    },
    mounted() {
        window.addEventListener('message', this.messageHandler);
       this.bar = new ldBar(".oldschool-nos", {
           "stroke": "#00fff06e",
           "stroke-width": 11,
           "stroke-trail-width": 11,
           "preset": "circle",
           "stroke-trail": "linear-gradient(180deg, rgba(131, 131, 131, 0.43) 0%, rgba(17, 17, 17, 0.43) 100%)",
           "value": this.nitroValue
       });

     
    },
    created() {
    },
    beforeDestroy() {
        window.removeEventListener('message', this.messageHandler);

    },
    template: await importTemplate('./app/pages/speedometer/components/oldschoolhud/index.html')
}
export default Vehicle