
const Targeting = Vue.createApp({
    data() {
        return {
            Show: false, // leave this
            ChangeTextIconColor: false, // This is if you want to change the color of the icon next to the option text with the text color
            StandardEyeIcon: "", // This is the default eye icon
            CurrentIcon: this.StandardEyeIcon, // leave this
            SuccessColor: "var(--main-color)", // This is the color when the target has found the option
            StandardColor: "white", // This is the standard color, change this to the same as the StandardColor if you have changed it
            TargetEyeStyleObject: {
                color: 'white', // leave this
            },
        }
    },
    destroyed() {
        window.removeEventListener("message", this.messageListener);
        window.removeEventListener("mousedown", this.mouseListener);
        window.removeEventListener("keydown", this.keyListener);
        window.removeEventListener("mouseover", this.mouseOverListener);
        window.removeEventListener("mouseout", this.mouseOutListener);
    },
    mounted() {
        this.targetLabel = document.getElementById("target-label");
        this.messageListener = window.addEventListener("message", (event) => {
            switch (event.data.response) {
                case "addcolors":
                    let rt = document.querySelector(':root');
                    rt.style.setProperty('--main-color', event.data.ccc);
                    break;
                case "openTarget":
                    this.OpenTarget();
                    break;
                case "closeTarget":
                    this.CloseTarget();
                    break;
                case "foundTarget":
                    this.FoundTarget(event.data);
                    break;
                case "validTarget":
                    this.ValidTarget(event.data);
                    break;
                case "leftTarget":
                    this.LeftTarget();
                    break;
            }
        });

        this.mouseListener = window.addEventListener("mousedown", (event) => {
            let element = event.target;
            if (element.id) {
                const split = element.id.split("_");
                if (split[0] === "f9tg" && split[1] !== "eye" && event.button == 0) {
                    Sounds.modbeep();
                    fetch(`https://qb-target/selectTarget`, {
                        method: "POST",
                        headers: { "Content-Type": "application/json; charset=UTF-8" },
                        body: JSON.stringify(split[1])
                    }).then(resp => resp.json()).then(_ => {});
                    closecursor();
                    $("#target-eye").fadeOut(50);
                    $('.blackbeforeye').fadeOut(0);
                    // $(".linenumber1").animate({ width: '0vh' }, 25);
                    // $(".linenumber2").animate({ height: '0vh' }, 50);
                    this.Show = false;
                }else if(split[0] === "target-option" && split[1] !== "eye" && event.button == 0){
                    Sounds.modbeep();
                    fetch(`https://qb-target/selectTarget`, {
                        method: "POST",
                        headers: { "Content-Type": "application/json; charset=UTF-8" },
                        body: JSON.stringify(split[1])
                    }).then(resp => resp.json()).then(_ => {});
                    closecursor();
                    $("#target-eye").fadeOut(50);
                    $('.blackbeforeye').fadeOut(0);
                    // $(".linenumber1").animate({ width: '0vh' }, 25);
                    // $(".linenumber2").animate({ height: '0vh' }, 50);
                    this.Show = false;
                }else if(split[0] === "target-text" && split[1] !== "eye" && event.button == 0){
                    Sounds.modbeep();
                    fetch(`https://qb-target/selectTarget`, {
                        method: "POST",
                        headers: { "Content-Type": "application/json; charset=UTF-8" },
                        body: JSON.stringify(split[1])
                    }).then(resp => resp.json()).then(_ => {});
                    closecursor();
                    $("#target-eye").fadeOut(50);
                    $('.blackbeforeye').fadeOut(0);
                    // $(".linenumber1").animate({ width: '0vh' }, 25);
                    // $(".linenumber2").animate({ height: '0vh' }, 50);
                    this.Show = false;
                }
            }

            if (event.button == 2) {
                this.LeftTarget();
                fetch(`https://qb-target/leftTarget`, {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: ""
                }).then(resp => resp.json()).then(_ => {});
            }
        });

        this.keyListener = window.addEventListener("keydown", (event) => {
            if (event.key == "Escape" || event.key == "Backspace") {
                this.CloseTarget();
                fetch(`https://qb-target/closeTarget`, {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: ""
                }).then(resp => resp.json()).then(_ => {});
            }
        });

        // this.mouseOverListener = window.addEventListener("mouseover", (event) => {
        //     const element = event.target;
        //     if (element.id) {
        //         const split = element.id.split("-");
        //         if (split[0] === "target" && split[1] === "option") {
        //             // event.target.style.color = this.SuccessColor;
        //             if (this.ChangeTextIconColor) document.getElementById(`target-icon-${index}`).style.color = this.SuccessColor;
        //         }
        //     }
        // });

        // this.mouseOutListener = window.addEventListener("mouseout", (event) => {
        //     const element = event.target;
        //     if (element.id) {
        //         const split = element.id.split("-");
        //         if (split[0] === "target" && split[1] === "option") {
        //             // element.style.color = this.StandardColor;
        //             if (this.ChangeTextIconColor) document.getElementById(`target-icon-${index}`).style.color = this.StandardColor;
        //         }
        //     }
        // });




        this.mouseOverListener = window.addEventListener("mouseover", (event) => {
            const element = event.target;
            if (element.id) {
                const split = element.id.split("_");
                if (split[0] === "f9tg" || split[1] === "f9tg_") {
                    Sounds.hoversound3();
                }
            }
        });

        this.mouseOutListener = window.addEventListener("mouseout", (event) => {
            const element = event.target;
            if (element.id) {
                const split = element.id.split("-");
                if (split[0] === "target" && split[1] === "option") {
                    // $('.target-eventlabel').css('display', 'none');
                    // $('.target-eventlabel').html('-');
                }
            }
        });








    },
    methods: {
        OpenTarget() {
            ResetAllevents();
            $('.targetallevents').css('transform','translateY(-50%) translateX(-50%) scale(0.2)');
            $('.cursorafter').css('background', 'white');
            $('.cursorsqaure').css('background', '#8c909000');
            $('.cursor').fadeIn(1);
            $('.target-square').fadeOut(1);
            $("#target-eye").fadeIn(50);
            // this.targetLabel.innerHTML = "";
            this.Show = true;
            this.TargetEyeStyleObject.color = this.StandardColor;
            $('.blackbeforeye').fadeIn(50);
            $('#target-eye').css('transform','translateY(-50%) translateX(-50%) scale(0.9)').css('opacity','1');
            $('.blackbeforeye').css('animation', 'pulse 0.9s ease forwards');
        },

        CloseTarget() {
            closecursor();
            $('.cursorafter').css('background', 'white');
            $('.cursorsqaure').css('background', '#8c909000');
            $('.target-square').fadeOut(50);
            $('.themainlines').fadeOut(50);
            $('#target-eye').css('transform','translateY(-50%) translateX(-50%) scale(0.8)')
            setTimeout(() => {
                $('.blackbeforeye').fadeOut(0);
                $("#target-eye").fadeOut(50);
                // this.targetLabel.innerHTML = "";
            }, 10);
            $('.blackbeforeye').css('animation', 'pulse 0.9s ease forwards');
            this.TargetEyeStyleObject.color = this.StandardColor;
            this.Show = false;
            this.CurrentIcon = this.StandardEyeIcon;
            ResetAllevents();
        },

        FoundTarget(item) {
            Sounds.audio1();
            setTimeout(() => {
                $('.cursorafter').css('background', 'var(--main-color)');
                $('.cursorsqaure').css('background', '#8c9090');
                $('#target-eye').css('transform','translateY(-50%) translateX(-50%) scale(1)');
                $('.blackbeforeye').css('animation', 'pulse2 0.9s ease forwards');
                $('.themainlines').fadeIn(50);
            }, 10);
            setTimeout(() => {
                $('#target-eye').css('transform','translateY(-50%) translateX(-50%)  scale(1)');
            }, 80);
            // if (item.data) this.CurrentIcon = item.data;
            // else this.CurrentIcon = this.StandardEyeIcon;
            this.TargetEyeStyleObject.color = this.SuccessColor;
        },

        ValidTarget(item) {
            // this.targetLabel.innerHTML = "";
            // $(".linenumber2").animate({ height: '1.1vh' }, 100);
            setTimeout(() => {
                for (let [index, itemData] of Object.entries(item.data)) {
                    if (itemData !== null) {
                        index = Number(index) + 1;
    
                        $('#f9tg_'+index).css({'display': 'flex', 'filter': 'opacity(1)'});
                        $('#f9tg_'+index).data('label', itemData.label)
                        $('#f9tg_'+index).html('<div class="f9-theicon"><i id="target-option_'+index+'" class="'+itemData.icon+'"></i></div> <div id="target-text_'+index+'" class="f9-titleofoption">'+itemData.label+'</div>');
                        // if (this.ChangeTextIconColor) {
                        //     this.targetLabel.innerHTML +=
                        //     `<div class="targetclass" id="target-option-${index}" style="margin-bottom: 0.3vh; color: ${this.StandardColor}">
                        //         <span id="target-icon-${index}" style="color: ${this.StandardColor}">
                        //             <i class="${itemData.icon}"></i>
                        //         </span>
                                
                        //     </div>`;
                        // } else {
                        //     this.targetLabel.innerHTML +=
                        //     `<div class="targetclass" id="target-option-${index}" style="margin-bottom: 0.3vh; color: ${this.StandardColor}">
                        //         <span id="target-icon-${index}" style="color: var(--main-color)">
                        //             <i class="${itemData.icon}"></i>
                        //         </span>
                        //         ${itemData.label}
                        //     </div>`;
                        // }
                    }
                }
                $('.target-square').fadeIn(50);
                $('.targetallevents').css('transform','translateY(-50%) translateX(-50%) scale(0.6)');
                Sounds.basssound();
            }, 100);
        },

        LeftTarget() {
            $('.targetallevents').css('transform','translateY(-50%) translateX(-50%) scale(0.2)');
            $('.cursorafter').css('background', 'white');
            $('.cursorsqaure').css('background', '#8c909000');
            $('.themainlines').fadeOut(50);
            $('.blackbeforeye').css('animation', 'unset');
            $('#target-eye').css('transform','translateY(-50%) translateX(-50%) scale(0.9)').css('opacity','1');
            closecursor();
            // $(".linenumber2").animate({ height: '0vh' }, 50);
            setTimeout(() => {
                $('.target-square').fadeOut(100);
                // this.targetLabel.innerHTML = "";
                this.CurrentIcon = this.StandardEyeIcon;
                this.TargetEyeStyleObject.color = this.StandardColor;
            }, 70);
        }
    }
});

Targeting.use(Quasar, { config: {} });
Targeting.mount("#target-wrapper");




Sounds = {}
Sounds.audio1 = function () {
    var audio1s = document.getElementById("openeye");
    audio1s.volume = 0.03;
    audio1s.play();
  }

Sounds.hoversound = function () {
    var audio1 = document.getElementById("hover");
    // audio1.pause();
    audio1.currentTime = 0;
    audio1.volume = 0.68;
    audio1.play();
}

Sounds.hoversound2 = function () {
    var audioh2 = document.getElementById("hover2");
    // audioh2.pause();
    audioh2.currentTime = 0;
    audioh2.volume = 0.5;
    audioh2.play();
}

Sounds.hoversound3 = function () {
    var audioh3 = document.getElementById("hover3");
    // audioh3.pause();
    audioh3.currentTime = 0;
    audioh3.volume = 0.68;
    audioh3.play();
}

Sounds.hoversound4 = function () {
    var audioh4 = document.getElementById("ex_hover");
    audioh4.volume = 0.68;
    audioh4.play();
}

Sounds.clicksound = function () {
    var audio2 = document.getElementById("click");
    // audio2.pause();
    audio2.currentTime = 0;
    audio2.volume = 0.09;
    audio2.play();
}

Sounds.pausesound = function () {
    var audio5 = document.getElementById("openpause");
    audio5.pause();
    audio5.currentTime = 0;
    audio5.volume = 0.6;
    audio5.play();
}

Sounds.basssound = function () {
    var audio6 = document.getElementById("f9dompui");
    audio6.pause();
    audio6.currentTime = 0;
    audio6.volume = 0.99;
    audio6.play();
}

Sounds.bassxsound = function () {
    var audio7 = document.getElementById("f9domui");
    audio7.pause();
    audio7.currentTime = 0;
    audio7.volume = 0.99;
    audio7.play();
}

Sounds.modbeep = function () {
    var audio12 = document.getElementById("beep");
    audio12.currentTime = 0;
    audio12.volume = 0.23;
    audio12.play();
}




function ResetAllevents() {
    $('.targetright-menu').html(`
                    <div class="f9r-oneoption1 oneaction" id="f9tg_1" style="display: none;">
                    </div>
                    <div class="f9r-oneoption2 oneaction" id="f9tg_3" style="display: none;">
                    </div>
                    <div class="f9r-oneoption3 oneaction" id="f9tg_5" style="display: none;">
                    </div>
                    <div class="f9r-oneoption4 oneaction" id="f9tg_7" style="display: none;">
                    </div>
    `);

    $('.targetleft-menu').html(`
                    <div class="f9l-oneoption1 oneaction" id="f9tg_2" style="display: none;">
                    </div>
                    <div class="f9l-oneoption2 oneaction" id="f9tg_4" style="display: none;">
                    </div>
                    <div class="f9l-oneoption3 oneaction" id="f9tg_6" style="display: none;">
                    </div>
                    <div class="f9l-oneoption4 oneaction" id="f9tg_8" style="display: none;">
                    </div>
    `);
}




document.addEventListener("DOMContentLoaded", function() {
	var pointer = document.getElementById("targetsmall-sqaure"),
	pointerBox = pointer.getBoundingClientRect(),
	centerPoint = window.getComputedStyle(pointer).transformOrigin,
	centers = centerPoint.split(" ");
    
  function rotatePointer(e) {
    
    var pointerEvent = e;
    
    if (e.targetTouches && e.targetTouches[0]) {
      e.preventDefault(); // Prevent mouse event/scrolling
      pointerEvent = e.targetTouches[0];
    }
    
    var pageX = pointerEvent.pageX;
    var pageY = pointerEvent.pageY;
    
    var centerY = pointerBox.top + parseInt(centers[1]) - window.scrollY,
		    centerX = pointerBox.left + parseInt(centers[0]) - window.scrollX,
    		radians = Math.atan2(pageX - 957, pageY - 539),
    		degrees = (radians * (180 / Math.PI) * -1) + 180; 
    		pointer.style.transform = 'rotate('+degrees+'deg)';
  }


window.addEventListener('mousemove', rotatePointer);
window.addEventListener('touchmove', rotatePointer);
window.addEventListener('touchstart', rotatePointer);
});


// Cursor 

// function Showloadingcursor(thetime) {
//     $('.f9loadingpagecursor').fadeIn(100);
//     setTimeout(() => {
//         $('.f9loadingpagecursor').fadeOut(100);
//     }, thetime);
// }

// const cursor = document.querySelector(".cursor");
// $('.cursoralt').fadeOut(10)
// $('.cursoralt2').fadeOut(10)
// var timeout;
// document.addEventListener("mousemove", (e) => {
//   let x = e.pageX;
//   let y = e.pageY;

//   cursor.style.top = y + "px";
//   cursor.style.left = x + "px";
//   cursor.style.display = "flex";

//   function mouseStopped(){
//     cursor.style.display = "none";
//   }
//   clearTimeout(timeout);
//   timeout = setTimeout(mouseStopped, 8000);
// });

// document.addEventListener("mouseout", () => {
//   cursor.style.display = "none";
// });


// var mouseDown = false;
// var mouseDrag = false;
// $(document).on('mousedown', function(event) {
//   mouseDrag = false;
//   mouseDown = true;
//   $('.cursorafter').css('transform', 'scale(5.5)');
// }
// ).on('mousemove', function(event) {
//   if ( mouseDown ){
//       mouseDrag = true;
//       // $('.cursorafter').css('transform', 'scale(1)');
//   }
// }
// ).on('mouseup', function(event) { 
//   mouseDrag = false;
//   mouseDown = false;
//   $('.cursorafter').css('transform', 'scale(1.3)');
// }
// ); 

function closecursor(){
    // $('.cursor').fadeOut(100);
    // $('.cursoralt').fadeOut(100);
}

// function updateedmousehover(){
//   $(".mousealtinfo").hover(
//     function () {
//         var helptext = $(this).data('help');
//         var helpleft = $(this).data('left');
//         if(helptext){
//             if(helpleft || leftorrith == 'right'){
//               $('.cursoralttext').html(helptext)
//               $('.cursoralt2').css('display', 'flex');
//             }else{
//               $('.cursoralttext').html(helptext)
//               $('.cursoralt').css('display', 'flex');
//             }

//         }
//     },
//     function () {
//         $('.cursoralt').css('display', 'none');
//         $('.cursoralt2').css('display', 'none');
//     }
//   )

//   $(".f9itsbutton").hover(
//     function () {
//         Sounds.hoversound();
//       $('.cursorafter').css('transform', 'scale(2.3)');
//     },
//     function () {
//       $('.cursorafter').css('transform', 'scale(1.3)');
//     }
//   )
// }

// $(".f9itsbutton").hover(
//   function () {
//     Sounds.hoversound();
//     $('.cursorafter').css('transform', 'scale(2.3)');
//   },
//   function () {
//     $('.cursorafter').css('transform', 'scale(1.3)');
//   }
// )

// $(".mousealtinfo").hover(
//     function () {
//         var helptext = $(this).data('help');
//         var helpleft = $(this).data('left');
//         if(helptext){
//             if(helpleft || leftorrith == 'right'){
//               $('.cursoralttext').html(helptext)
//               $('.cursoralt2').css('display', 'flex');
//             }else{
//               $('.cursoralttext').html(helptext)
//               $('.cursoralt').css('display', 'flex');
//             }

//         }
//     },
//     function () {
//         $('.cursoralt').css('display', 'none');
//         $('.cursoralt2').css('display', 'none');
//     }
// )