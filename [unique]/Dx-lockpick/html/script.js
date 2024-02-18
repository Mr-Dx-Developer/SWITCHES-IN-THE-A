rotateValue = 0;
levelCount = 1
control = false
finishCounter = 0

let colorGroupCollisionDivs = [];


level = {
    "1": {
        "class": ".firstLevelDiv",
        "border": ".border-1",
    },
    "2": {
        "class": ".secondLevelDiv",
        "border": ".border-2",
    },
    "3": {
        "class": ".thirdLevelDiv",
        "border": ".border-3",
    },
    "4": {
        "class": ".fourthLevelDiv",
        "border": ".border-4",
    },
    "5": {}
}

const colorGroups = {
    "1" : {
        'color-1': ['control-1'],
        'color-2': ['control-2'],
        'color-3': ['control-3'],
    },
    "2" : {
        'color-5': ['control-5'],
        'color-7': ['control-9'],
        'color-8': ['control-8'],
        'color-9' : ['control-8'],
        'color-10' : ['control-6'],
        'color-12' : ['control-7'],
    },
    "3" : {
        'color-13': ['control-10'],
        'color-14' : ['control-11'],
        'color-16' : ['control-12'],
    },
    "4" : {
        'color-26': ['control-13'],
        'color-27' : ['control-14'],
        'color-22' : ['control-15'],
    },
    "5" : {},
};

randomCss = {
    "1" : {
        'border-1' : 'rotate(30deg);', 
        'border-2' : 'rotate(60deg);', 
        'border-3' : 'rotate(90deg);', 
        'border-4' : 'rotate(120deg);' 
    },
    "2" : {
        'border-1' : 'rotate(120deg);', 
        'border-2' : 'rotate(150deg);', 
        'border-3' : 'rotate(180deg);', 
        'border-4' : 'rotate(210deg);' 
    },
    "3" : {
        'border-1' : 'rotate(120deg);', 
        'border-2' : 'rotate(90deg);', 
        'border-3' : 'rotate(60deg);', 
        'border-4' : 'rotate(30deg);' 
    },
    "4" : {
        'border-1' : 'rotate(00deg);', 
        'border-2' : 'rotate(60deg);', 
        'border-3' : 'rotate(120deg);', 
        'border-4' : 'rotate(30deg);'  
    },
    "5" : {},
}

window.addEventListener("message", function (e) {
    e = e.data
    time = 0
    currentWidth = 38
    switch (e.action) {
      case "MENU_OPEN":
        time = e.time
        return open(e)
      case "CLOSE":
        currentPage = ""
        $.post('http://Dx-lockpick/failed', JSON.stringify({}));
      default:
        return;
    }
});

$(document).on('click', '.rotate-button', function (e) {
    rotate = $(this).data("rotate");
    rotateValue = getCurrentRotation($(level[levelCount].border)[0]);
    
    if (rotate=="left") {
        rotateValue -= 30;
    } else if (rotate=="right") {
        rotateValue += 30;
    }
    $(level[levelCount].border).css({
        "-webkit-transform": "rotate(" + rotateValue + "deg)",
        "-moz-transform": "rotate(" + rotateValue + "deg)",
        "transform": "rotate(" + rotateValue + "deg)"
    });
});



$(document).on('wheel', function (e) {
    rotateValue = getCurrentRotation($(level[levelCount].border)[0]);
    
    if (e.originalEvent.deltaY < 0) {
        rotateValue -= 30;
        control = true
    } else {
        rotateValue += 30;
        control = true
    }

    $(level[levelCount].border).css({
        "-webkit-transform": "rotate(" + rotateValue + "deg)",
        "-moz-transform": "rotate(" + rotateValue + "deg)",
        "transform": "rotate(" + rotateValue + "deg)"
    });
});

$(document).on('keydown', function (e) {
    rotateValue = getCurrentRotation($(level[levelCount].border)[0]);

    if (e.key === 'q' || e.key === 'Q') {
        control = true
        rotateValue -= 30;
    } else if (e.key === 'e' || e.key === 'E') {
        control = true
        rotateValue += 30;
    }

    $(level[levelCount].border).css({
        "-webkit-transform": "rotate(" + rotateValue + "deg)",
        "-moz-transform": "rotate(" + rotateValue + "deg)",
        "transform": "rotate(" + rotateValue + "deg)"
    });
});


$(document).on('keypress', function (e) {
    if (e.which === 13) {
        control = false
        const firstLevelDivs = $(level[levelCount].class);
        const margin = 2;
    
        firstLevelDivs.each(function () {
            const firstLevelDiv = $(this);
            const movingRect = firstLevelDiv[0].getBoundingClientRect();
            const movingColorClass = getFirstLevelColorClass(firstLevelDiv);
    
            let isOverlap = false;
    
            if (colorGroups[levelCount][movingColorClass]) {
                colorGroups[levelCount][movingColorClass].forEach(controlClass => {
                    const colorGroupCollisionDiv = $(`.${controlClass}`).toArray();
                    colorGroupCollisionDivs = colorGroupCollisionDivs.concat(colorGroupCollisionDiv);
                    
                    colorGroupCollisionDiv.forEach(function (collisionDiv) {
                        const collisionRect = collisionDiv.getBoundingClientRect();
        
                        if (
                            movingRect.y + margin < collisionRect.bottom &&
                            movingRect.bottom - margin > collisionRect.y &&
                            movingRect.x + margin < collisionRect.right &&
                            movingRect.right - margin > collisionRect.x
                        ) {
                            isOverlap = true;
                            return false;
                        }
                    });
                });
            } else {
                colorGroupCollisionDivs = $(`.${movingColorClass}`).toArray();
            }
    
            if (isOverlap) {
                checkAndLogLevel(movingColorClass);
                return;
            } else {
                // isOverlap = false;
                // console.log('Geçersiz hareket');
            }
    
            colorGroupCollisionDivs = [];
        });
    }
    if (finishCounter == 4) {
        setTimeout(() => {
            $.post('http://Dx-lockpick/complete', JSON.stringify({}));
            clearInterval(intervalId); 
            $("body").fadeOut(500)
            window.location.reload()
        return;
        }, 1000);
    }
    
    mainControl()
});

function mainControl() { 
    if (!control) {
        $.post('http://Dx-lockpick/failed', JSON.stringify({}));
        clearInterval(intervalId); 
        $("body").fadeOut(500)
        window.location.reload()
        return;
    }
}

const levelPassedColors = new Set();

function checkAndLogLevel(color) {
    control = true
    if (colorGroups[levelCount][color]) {
        if (!levelPassedColors.has(color)) {
            levelPassedColors.add(color);
            if (levelPassedColors.size === Object.keys(colorGroups[levelCount]).length) {
                finishCounter++
                playSound()
                const levelOne = colorGroups[levelCount];
                
                for (const colorKey in levelOne) {
                    levelOne[colorKey].forEach(function (controlClass) {
                        $(`.${controlClass} path`).css({'fill': 'rgb(39 ,211 ,170,0.5)'});
                    });
                }

                $(level[levelCount].border).css({'border-color': 'white'});
                $(level[levelCount].class).css({'background-color': 'rgb(39 ,211 ,170,0.5)'});
                levelCount++;
                $(level[levelCount].border).css({'border-color': 'yellow'});
                levelPassedColors.clear();
            }
        }
    } else {
        console.error(`Geçersiz renk: ${color}`);
    }
}



const animatedDiv = document.getElementById('animatedDiv');

function decreaseWidth() {
  if (currentWidth > 0) {
    currentWidth -= 0.05;
    animatedDiv.style.width = currentWidth + 'rem';
  } else {
    clearInterval(intervalId); 
    $("body").fadeOut(500)
    window.location.reload()
    $.post('http://Dx-lockpick/close', JSON.stringify({}));
    clearInterval(intervalId); 
    curentWidth = 38;   
  }
}


function getFirstLevelColorClass(firstLevelDiv) {
    const classes = firstLevelDiv.attr('class').split(' ');
    for (const className of classes) {
        if (className.startsWith('color-')) {
            return className;
        }
    }
    return null;
}



function getCurrentRotation(el){
    var st = window.getComputedStyle(el, null);
    var tm = st.getPropertyValue("-webkit-transform") ||
             st.getPropertyValue("-moz-transform") ||
             st.getPropertyValue("-ms-transform") ||
             st.getPropertyValue("-o-transform") ||
             st.getPropertyValue("transform") ||
             "none";
    if (tm != "none") {
      var values = tm.split('(')[1].split(')')[0].split(',');
    
      var angle = Math.round(Math.atan2(values[1],values[0]) * (180/Math.PI));
      return (angle < 0 ? angle + 360 : angle);
    }
    return 0;
}

function randomize() {
    randomValue = Math.floor(Math.random() * 2) + 1;
    for (const key in randomCss[randomValue]) {
        val = randomCss[randomValue][key].split('(')[1].split(')')[0].split('deg')[0]
        $("."+key).css({'transform': `rotate(${val}deg)`});
    }
}

function playSound() { 
    var audio = new Audio('../html/up.mp3'); 
    audio.play();
    audio.volume = 0.1;
}


function open(data) { 
    $(".header-new").html(data.title)
    $(".alt-new").html(data.text)

    $("body").fadeIn(500)
    intervalId = setInterval(decreaseWidth, time); 
    randomize()

}
