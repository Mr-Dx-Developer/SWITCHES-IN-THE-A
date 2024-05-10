let timerInterval;
let currentCounter;
let lastUpdateTime;
let color;
let translationStrings;


window.addEventListener('message', function(event) {
    if (event.data.action === "initialize") {
        var timerHeading = document.querySelector(".timer-header");
        var toph1 = document.querySelector(".dying-header");
        var textDispatched = document.querySelector(".emergency");
        color = event.data.color;
        translationStrings = event.data.translationStrings;
        toph1.innerHTML = translationStrings.player_dying;
        timerHeading.innerHTML = translationStrings.time_to_respawn;
        textDispatched.innerHTML = translationStrings.player_hurt_find_help_or_ems;

        var styleSheet = document.styleSheets[1]; // Assuming the stylesheet is the first one in the document, adjust as needed

        // Get the color value from the variable
        var colorValue = color;

        // Define the CSS rule with the dynamic color value
        var cssRule = '.color { color: ' + colorValue + '; }';

        // Add or update the CSS rule in the stylesheet
        if (styleSheet.insertRule) {
            // For modern browsers
            var ruleIndex = styleSheet.cssRules.length;
            styleSheet.insertRule(cssRule, ruleIndex);
        } else if (styleSheet.addRule) {
            // For older versions of Internet Explorer
            styleSheet.addRule('.color', 'color: ' + colorValue + ';');
        }
    }
});

window.addEventListener('message', function(event) {
    if (event.data.action === "displayDeathScreen") {
        if (event.data.type === 1) {
            displayScreenOne(event.data);
        } else if (event.data.type === 2) {
            displayScreenTwo(event.data)
        }
        else if (event.data.type === 3) {
            displayScreenThree(event.data)
        }
        else if (event.data.type === 4) {
            displayScreenFour(event.data)
        }
    }
});



function displayScreenOne(data) {
    var containerElement = document.getElementById('container');
    var colorElement = document.querySelector('.color');
    var bodyElement = document.body;
    var timerElement = document.querySelector('.timer');
    var timerHeading = document.querySelector(".timer-header");
    var toph1 = document.querySelector(".dying-header");
    var textDispatched = document.querySelector(".emergency");

    if (data.dispatched === true) {
        textDispatched.innerHTML = translationStrings.ems_on_the_way;
    }

    if (data.canRespawn === true) {
        toph1.innerHTML = translationStrings.player_passed;
        timerHeading.innerHTML = translationStrings.player_hurt_respawn;
    }

    timerElement.style.fontWeight = "bold";
    timerElement.style.fontSize = "2rem";
    timerElement.style.padding = "1%";
    timerElement.style.display = "block";

    containerElement.style.display = 'flex';
    bodyElement.style.backgroundColor = 'rgba(0, 0, 0, 0.329)';

    // Update the timer display based on the received counter value
    var timeLeft = data.counter;
    var minutes = Math.floor(timeLeft / 60);
    var seconds = timeLeft % 60;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = seconds < 10 ? '0' + seconds : seconds;

    // Update the timer element
    timerElement.textContent = minutes + ':' + seconds;

    if (timeLeft <= 0) {
        timerElement.textContent = "00:00";
    }

    containerElement.style.display = 'flex';
}

function displayScreenTwo(data) {
    var containerElement = document.getElementById('container');
    var colorElement = document.querySelector('.color');
    var toph1 = document.querySelector(".dying-header");
    var textDispatched = document.querySelector(".emergency");
    var bodyElement = document.body;
    var timerElement = document.querySelector('.timer');
    var timerHeading = document.querySelector(".timer-header");

    timerElement.style.fontWeight = "bold";
    timerElement.style.fontSize = "2rem";
    timerElement.style.padding = "1%";
    timerElement.style.display = "flex";

    if (data.dispatched === true) {
        textDispatched.innerHTML = translationStrings.ems_on_the_way;
    }

    if (data.canRespawn === true) {
        toph1.innerHTML = translationStrings.player_passed;
        timerHeading.innerHTML = translationStrings.player_hurt_respawn;
    }

    toph1.style.fontSize = "1.2rem";
    bodyElement.style.backgroundColor = 'rgba(0, 0, 0, 0.329)';
    bodyElement.style.fontWeight = "normal";

    // Update the timer display based on the received counter value
    var timeLeft = data.counter;
    var minutes = Math.floor(timeLeft / 60);
    var seconds = timeLeft % 60;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = seconds < 10 ? '0' + seconds : seconds;

    // Update the timer element
    timerElement.textContent = minutes + ':' + seconds;

    if (timeLeft <= 0) {
        timerElement.textContent = "00:00";
    }

    containerElement.style.display = 'flex';
}

function displayScreenThree(data) {
    var containerElement = document.getElementById('container');
    var colorElement = document.querySelector('.color');
    var toph1 = document.querySelector(".dying-header");
    var textDispatched = document.querySelector(".emergency");
    var bodyElement = document.body;
    var timerElement = document.querySelector('.timer');
    var timerHeading = document.querySelector(".timer-header");
    var timerSubheading = document.querySelector(".timer-subheader");
    var minuteTensElement = document.getElementById('minute-tens');
    var minuteOnesElement = document.getElementById('minute-ones');
    var secondTensElement = document.getElementById('second-tens');
    var secondOnesElement = document.getElementById('second-ones');
    var timerBoxElements = document.querySelectorAll('.timer-box');
    var timerSeperator = document.querySelector(".timer-separator");

    var timerContainerElement = document.querySelector('.timer-container');

    containerElement.style.bottom = "5%";
    containerElement.style.top = "20%";

    // Apply the styles
    timerContainerElement.style.display = 'flex';
    timerContainerElement.style.justifyContent = 'center';
    timerContainerElement.style.alignItems = 'center';
    timerContainerElement.style.marginBottom = '20px';

    toph1.innerHTML = translationStrings.player_hurt_severe;
    toph1.style.background = 'linear-gradient(to right, rgba(195, 7, 63, 0.767), #f83d3dcb, #f83d3dcb, rgba(195, 7, 63, 0.767))';
    toph1.style.webkitTextFillColor = 'transparent';
    toph1.style.webkitBackgroundClip = 'text';
    toph1.style.textShadow = '0 0 5px rgba(243, 33, 33, 0.199), 0 0 10px rgba(243, 33, 33, 0.199), 0 0 15px rgba(243, 33, 33, 0.199), 0 0 20px rgba(243, 33, 33, 0.199), 0 0 25px rgba(243, 33, 33, 0.199), 0 0 40px rgba(243, 33, 33, 0.199)';
    toph1.style.fontSize = "1.4rem";
    toph1.style.fontWeight = "bolder";

    timerBoxElements.forEach(function(element) {
        element.style.backgroundColor = "#333";
        element.style.padding = "10px";
        element.style.borderRadius = "5px";
        element.style.margin = "0 5px";
        element.style.display = "flex";
    });
    timerSeperator.innerHTML = ":";

    timerHeading.innerHTML = translationStrings.player_hurt_find_help_or_ems;
    timerHeading.style.fontWeight = "normal";
    timerHeading.style.color = "rgb(185, 185, 185)";
    timerHeading.style.marginBottom = "1.2%";
    timerHeading.style.fontSize = ".8rem";

    timerSubheading.innerHTML = translationStrings.player_hurt_time_to_live;
    timerSubheading.style.marginBottom = "2%";
    timerSubheading.style.marginTop = "1%";
    timerSubheading.style.fontWeight = "bold";
    timerSubheading.style.fontSize = ".8rem";

    textDispatched.innerHTML = "";
    bodyElement.style.backgroundColor = 'rgba(0, 0, 0, 0.329)';

    // Update the timer display based on the received counter value
    var timeLeft = data.counter;
    var minutes = Math.floor(timeLeft / 60);
    var seconds = timeLeft % 60;
    var minuteTens = Math.floor(minutes / 10);
    var minuteOnes = minutes % 10;
    var secondTens = Math.floor(seconds / 10);
    var secondOnes = seconds % 10;

    // Update the original timer element for compatibility
    timerElement.textContent = (minutes < 10 ? '0' + minutes : minutes) + ':' + (seconds < 10 ? '0' + seconds : seconds);

    // Update the spaced-out timer digits
    minuteTensElement.textContent = minuteTens;
    minuteOnesElement.textContent = minuteOnes;
    secondTensElement.textContent = secondTens;
    secondOnesElement.textContent = secondOnes;

    if (timeLeft <= 0) {
        timerElement.textContent = "00:00";
    }

    containerElement.style.display = 'flex';
}

function displayScreenFour(data) {
    var containerElement = document.querySelector('.container');
    var toph1 = document.getElementById('dying-header');
    var textDispatched = document.querySelector(".emergency");
    var bodyElement = document.body;
    var timerElement = document.querySelector('.timer');
    var timerHeading = document.querySelector(".timer-header");
    var timerSubheading = document.querySelector(".timer-subheader");

    // Apply consistent styling for the timer
    timerElement.style.padding = "1%";
    timerElement.style.display = "flex";

    // Update the heading and subheading
    toph1.innerHTML = translationStrings.player_hurt_critical.toUpperCase();
    toph1.className = "fading-text"; // Add the fading class
    toph1.style.fontSize = ".9rem";
    toph1.style.fontWeight = "500"
    toph1.style.backgroundColor = "red";
    toph1.style.padding = "5px";

    timerHeading.innerHTML = translationStrings.player_hurt_find_help_or_ems;
    timerHeading.style.fontWeight = "normal";
    timerHeading.style.color = "rgb(185, 185, 185)";
    timerHeading.style.fontSize = ".8rem";

    timerSubheading.innerHTML = translationStrings.player_hurt_time_to_live;
    timerSubheading.style.marginTop = "1%";
    timerSubheading.style.fontWeight = "450";
    timerSubheading.style.fontSize = ".8rem";

    containerElement.style.bottom = "5%";
    containerElement.style.top = "75%";
    textDispatched.innerHTML = ""

    bodyElement.style.backgroundColor = 'rgba(0, 0, 0, 0.329)';

    // Timer setup
    var timeLeft = data.counter;
    var minutes = Math.floor(timeLeft / 60);
    var seconds = timeLeft % 60;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = seconds < 10 ? '0' + seconds : seconds;
    timerElement.textContent = minutes + ':' + seconds + "s";
    timerElement.style.color = "white";
    timerElement.style.fontSize = "1rem";

    if (timeLeft <= 0) {
        timerElement.textContent = "00:00";
    }

    containerElement.style.display = 'flex';
}

window.addEventListener('message', function(event) {
    if (event.data.action === "updateDeathScreen") {
        let toph1 = document.querySelector(".dying-header");
        let header = document.getElementById('dying-header');
        let textDispatched = document.querySelector(".emergency");
        let timerHeading = document.querySelector(".timer-header");
        let timerElement = document.querySelector('.timer');
        var timerSubheading = document.querySelector(".timer-subheader");
        var containerElement = document.getElementById('container');

        if (event.data.type === 1 || event.data.type === 2) {
            if (event.data.dispatched === true) {
                textDispatched.innerHTML = translationStrings.ems_on_the_way;
            }
            if (event.data.canRespawn === true) {
                toph1.innerHTML = translationStrings.player_passed;
                timerHeading.innerHTML = translationStrings.player_hurt_respawn;
            }
        }

        if (event.data.type === 3) {
            if (event.data.dispatched === true) {
                timerHeading.innerHTML = translationStrings.ems_on_the_way;
            }
            if (event.data.canRespawn === true) {
                toph1.innerHTML = translationStrings.player_hurt_unconscious;
                timerSubheading.innerHTML = translationStrings.player_hurt_respawn;
            }
        }
        
         if (event.data.type === 4) {
            if (event.data.dispatched === true) {
                timerHeading.innerHTML = translationStrings.ems_on_the_way;
            }
            if (event.data.canRespawn === true) {
                header.innerHTML = translationStrings.player_hurt_unconscious;
                timerSubheading.innerHTML = translationStrings.player_hurt_respawn;
            }
        }
        // Update the timer display based on the received counter value
        var timeLeft = event.data.counter;
        var minutes = Math.floor(timeLeft / 60);
        var seconds = timeLeft % 60;
        minutes = minutes < 10 ? '0' + minutes : minutes;
        seconds = seconds < 10 ? '0' + seconds : seconds;

        // Update the original timer element for compatibility
        timerElement.textContent = minutes + ':' + seconds;

        if (event.data.type === 3) {
            var minuteTens = Math.floor(minutes / 10);
            var minuteOnes = minutes % 10;
            var secondTens = Math.floor(seconds / 10);
            var secondOnes = seconds % 10;

            // Update the spaced-out timer digits only for type 3
            var minuteTensElement = document.getElementById('minute-tens');
            var minuteOnesElement = document.getElementById('minute-ones');
            var secondTensElement = document.getElementById('second-tens');
            var secondOnesElement = document.getElementById('second-ones');

            minuteTensElement.textContent = minuteTens;
            minuteOnesElement.textContent = minuteOnes;
            secondTensElement.textContent = secondTens;
            secondOnesElement.textContent = secondOnes;
        }

        if (timeLeft <= 0) {
            timerElement.textContent = "00:00";
        }

        containerElement.style.display = 'flex';
    }
});

window.addEventListener('message', function(event) {
    if (event.data.action === "hideDeathScreen") {
        var containerElement = document.getElementById('container');
        containerElement.style.display = 'none';
        document.body.style.backgroundColor = '';
    }
});
