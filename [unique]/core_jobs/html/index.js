var config;
var vehiclemenu;
var firstname;
var lastname;
var level;
var rawlevel;
var job;
var fisherduty;
var thunterduty;
var cargoduty;
var scrapduty;
var gender;



// nesuprantu ka daro bet reikia idetik
function closeMenu() {
    $.post('https://core_jobs/close', JSON.stringify({}));
    playClickSound();

    $("#main_container").fadeOut(400);
    setTimeout(function () {
      $("#main_container").html("");
      $("#main_container").fadeIn();
    }, 300);
}

$(document).keyup(function (e) {
    if (e.keyCode === 27) {
    playClickSound();
    closeMenu();

    }
  
});
//end



//Main menu
function mainMenu() {

    playClickSound();
    var base = 
    '  <div id="gradientbackground"></div>'+
'<div id="main">';

    if (job == "thunter") {
        base = base + '<div id="vehicle" onclick="vehicleMenu()"><div id="carmenu"></div><div id="showtasks"><span id="menuname">VEHICLES</span></div></div>'+
        '<div id="clothes" onclick="clothesMenu()"><div id="clothmenu"></div><div id="showtasks"><span id="menuname">CLOTHES</span></div></div>'+
        '<div id="tasks" onclick="taskMenu()"><div id="taskmenu"></div><div id="showtasks"><span id="menuname">TASKS</span></div></div>';

    } else if (job == "fisher") {
        base = base + '<div id="vehicle" onclick="vehicleMenu()"><div id="boatmenu"></div><div id="showtasks"><span id="menuname">BOATS</span></div></div>'+
        '<div id="clothes" onclick="clothesMenu()"><div id="clothmenu"></div><div id="showtasks"><span id="menuname">CLOTHES</span></div></div>'+
        '<div id="tasks" onclick="taskMenu()"><div id="taskmenu"></div><div id="showtasks"><span id="menuname">TASKS</span></div></div>';
    } else if (job == "cargo") {
        base = base + '<div id="vehicle" onclick="vehicleMenu()"><div id="choppermenu"></div><div id="showtasks"><span id="menuname">CHOPPERS</span></div></div>'+
        '<div id="clothes" onclick="clothesMenu()"><div id="clothmenu"></div><div id="showtasks"><span id="menuname">CLOTHES</span></div></div>'+
        '<div id="tasks" onclick="taskMenu()"><div id="taskmenu"></div><div id="showtasks"><span id="menuname">TASKS</span></div></div>';
    } else if (job == "scrap") {
        base = base + '<div id="vehicle" onclick="vehicleMenu()"><div id="bikemenu"></div><div id="showtasks"><span id="menuname">BIKES</span></div></div>'+
        '<div id="clothes" onclick="clothesMenu()"><div id="clothmenu"></div><div id="showtasks"><span id="menuname">CLOTHES</span></div></div>'+
        '<div id="tasks" onclick="taskMenu()"><div id="taskmenu"></div><div id="showtasks"><span id="menuname">TASKS</span></div></div>';
    }

    base = base + '<span id="mainname">JOB MENU</span>'+

    '<div id="power" onclick="onduty()"><i class="fas fa-power-off"></i></div>'+
    '<div id="capacityline"></div>'+
    '<div id="xpline"></div>'+
    '<span id="level"></span>'+
    '<span id="playername">'+firstname.toUpperCase() + ' ' + lastname.toUpperCase()+ '</span>'+
    '<span id="returnmain" onclick="closeMenu()">⮨</span>'+

'</div>';

    $("#main_container").html(base);

    $("#level").text(level + ' LEVEL');
    setProgress((rawlevel % 100));

}


function onduty() {
 
    $.post('https://core_jobs/onduty', JSON.stringify({}));
    playClickSound();
}

function changecolor() {

    if (job == "thunter") {
        if (thunterduty == true) {
            $("#power").css('color', '#5fff00');
            $("#vehicle").attr("onclick", "vehicleMenu()");
            $("#vehicle").css('opacity', '0.9');

        } else if (thunterduty == false){
            $("#power").css('color', '#c41a1a');
            $("#vehicle").removeAttr("onclick");
            $("#vehicle").css('opacity', '0.5');
        }  
    }
    if (job == "fisher") {
        if (fisherduty == true) {
            $("#power").css('color', '#5fff00');
            $("#vehicle").attr("onclick", "vehicleMenu()");
            $("#vehicle").css('opacity', '0.9');

        } else if (fisherduty == false){
            $("#power").css('color', '#c41a1a');
            $("#vehicle").removeAttr("onclick");
            $("#vehicle").css('opacity', '0.5');
        }  
    }
    if (job == "cargo") {
        if (cargoduty == true) {
            $("#power").css('color', '#5fff00');
            $("#vehicle").attr("onclick", "vehicleMenu()");
            $("#vehicle").css('opacity', '0.9');

        } else if (cargoduty == false){
            $("#power").css('color', '#c41a1a');
            $("#vehicle").removeAttr("onclick");
            $("#vehicle").css('opacity', '0.5');
        }  
    }
    if (job == "scrap") {
        if (scrapduty == true) {
            $("#power").css('color', '#5fff00');
            $("#vehicle").attr("onclick", "vehicleMenu()");
            $("#vehicle").css('opacity', '0.9');

        } else if (scrapduty == false){
            $("#power").css('color', '#c41a1a');
            $("#vehicle").removeAttr("onclick");
            $("#vehicle").css('opacity', '0.5');
        }  
    }
}



function vehicleMenu() {

    playClickSound();
    var base = 
    '  <div id="gradientbackground"></div>'+

'<div id="vehmenu">'+
    '<div class=e6_41>';

if (job == "thunter") {

    for (const [key2, value2] of Object.entries(config.Jobs.TreasureJob.vehiclemenu.cars)) {

        if (value2.level > level) { 

        base = base + '  <div id="buttonbackground" style="opacity: 0.5; background: url(img/cars/'+key2+'.png) no-repeat center center;"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';
        
        } else {
        
        base = base + '  <div id="buttonbackground" style="background: url(img/cars/'+key2+'.png) no-repeat center center;" onclick="selectVehicle(\'' + key2 + '\', \''+ value2.price +'\')"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';

        }
    }
} else if (job == "fisher") {

    for (const [key2, value2] of Object.entries(config.Jobs.Fisher.boatmenu.boats)) {

        if (value2.level > level) { 

        base = base + '  <div id="buttonbackground" style="opacity: 0.5; background: url(img/boats/'+key2+'.png) no-repeat center center;"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';
        
        } else {
        
        base = base + '  <div id="buttonbackground" style="background: url(img/boats/'+key2+'.png) no-repeat center center;" onclick="selectVehicle(\'' + key2 + '\', \''+ value2.price +'\')"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';

        }
    }
} else if (job == "cargo") {

    for (const [key2, value2] of Object.entries(config.Jobs.Cargo.chopermenu.chopers)) {

        if (value2.level > level) { 

        base = base + '  <div id="buttonbackground" style="opacity: 0.5; background: url(img/choppers/'+key2+'.png) no-repeat center center;"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';
        
        } else {
        
        base = base + '  <div id="buttonbackground" style="background: url(img/choppers/'+key2+'.png) no-repeat center center;" onclick="selectVehicle(\'' + key2 + '\', \''+ value2.price +'\')"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';

        }
    }
} else if (job == "scrap") {

    for (const [key2, value2] of Object.entries(config.Jobs.ScrapMiner.vehiclemenu.bikes)) {

        if (value2.level > level) { 

        base = base + '  <div id="buttonbackground" style="opacity: 0.5; background: url(img/bikes/'+key2+'.png) no-repeat center center;"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';
        
        } else {
        
        base = base + '  <div id="buttonbackground" style="background: url(img/bikes/'+key2+'.png) no-repeat center center;" onclick="selectVehicle(\'' + key2 + '\', \''+ value2.price +'\')"><span class="e6_29">'+ value2.label +'</span><span class="e6_30">LEVEL '+value2.level +'</span><span class="e6_31">$'+ value2.price +'</span></div>';

        }
    }
}


    base = base + '</div>' + 
    '<span id="return" onclick="mainMenu()">⮨</span>'+
    '  <div class="e6_16"></div>'+
    '  <div class="e6_17"></div>'+
    '  <span class="e6_13">VEHICLES</span>'+
    '  <span class="e6_18">LEVEL 1</span>'+
'</div>';
       
    $("#main_container").html(base);

    $(".e6_18").text(level + ' LEVEL');
    setProgress((rawlevel % 100));
}    

function selectVehicle(vehicle, price) {

    $.post('https://core_jobs/selectVehicle', JSON.stringify({vehicle: vehicle, price: price}));
    playClickSound();

}


function clothesMenu() {

    playClickSound();

    var NotShowList = ["WomenUniform", "WomenUniform2", "WomenUniform3"] 

    var base = 
    '  <div id="gradientbackground"></div>'+

'<div id="vehmenu">'+
    '<div class=e6_411>';

if (job == "thunter") {
    for (const [key2, value2] of Object.entries(config.Jobs.TreasureJob.clothingmenu.clothes)) {

        if (value2.level > level) { 
            if (gender == value2.gender) {

                base = base +   '<div id="clothbuttonbackground" style="opacity: 0.5";><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
            
            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                    base = base + '<div id="clothbuttonbackground" style="opacity: 0.5";><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }
            }
        } else {
            if (gender == value2.gender) {

                base = base +   '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
            
            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                    base = base + '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }    
            }
        }
    }

} else if (job == "fisher") {
    for (const [key2, value2] of Object.entries(config.Jobs.Fisher.clothingmenu.clothes)) {

        if (value2.level > level) { 
            if (gender == value2.gender) {

                base = base +   '<div id="clothbuttonbackground" style="opacity: 0.5";><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
            
            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                base = base + '<div id="clothbuttonbackground" style="opacity: 0.5";><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }
            }
        } else {
            if (gender == value2.gender) {

                base = base + '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';

            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                    base = base + '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }
            }
        }
    }

} else if (job == "cargo") {
    for (const [key2, value2] of Object.entries(config.Jobs.Cargo.clothingmenu.clothes)) {

        if (value2.level > level) { 
            if (gender == value2.gender) {

                base = base +   '<div id="clothbuttonbackground" style="opacity: 0.5;"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
            
            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                    base = base + '<div id="clothbuttonbackground" style="opacity: 0.5;"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }
            }
        } else {
            if (gender == value2.gender) {

                base = base +  '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
            
            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                    base = base + '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }
            }
        }
    }

} else if (job == "scrap") {

    for (const [key2, value2] of Object.entries(config.Jobs.ScrapMiner.clothingmenu.clothes)) {

        if (value2.level > level) { 
            if (gender == value2.gender) {

                base = base +   '<div id="clothbuttonbackground" style="opacity: 0.5";><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
            
            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                    base = base + '<div id="clothbuttonbackground" style="opacity: 0.5";><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }
            }
        } else {
            if (gender == value2.gender) {
                base = base + '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
            } else if (gender != value2.gender) {
                if (NotShowList.includes(key2) == false) { 

                    base = base + '<div id="clothbuttonbackground" onclick="selectClothes(\'' + key2 + '\')"><span class="e6_299">'+ value2.label +'</span><span class="e6_309">LEVEL '+value2.level +'</span></div>';
                }    
            }
        }
    }
}

    base = base + '</div>' +
    '<span id="return9" onclick="mainMenu()">⮨</span>'+
    '  <div class="e6_169"></div>'+
    '  <div class="e6_179"></div>'+
    '  <span class="e6_13">CLOTHES</span>'+
    '  <span class="e6_189">LEVEL 1</span>'+
'</div>';
       
    $("#main_container").html(base);

    $(".e6_189").text(level + ' LEVEL');
    setProgress((rawlevel % 100));
}    

function selectClothes(choice) {

    $.post('https://core_jobs/selectClothes', JSON.stringify({choice:choice}));
    playClickSound();

}


function taskMenu() {

    playClickSound();
    var base = 
    '  <div id="gradientbackground"></div>'+

'<div id="vehmenu">'+
    '<div id="taskmen">';

if (job == "thunter") {    
    for (const [key2, value2] of Object.entries(config.Jobs.TreasureJob.taskmenu.tasks)) {

        base = base + '  <div id="taskbuttonbackground" onclick="showTasks(\'' + key2 + '\', '+value2.xpgain +', '+value2.reward +', '+value2.AmountToFind +')"><span id="taskname">'+ value2.label +'</span><span id="levelgain">'+value2.xpgain +' XP</span><span id="reward">$'+ value2.reward +'</span></div>';

    }
} else if (job == "fisher") {
    for (const [key2, value2] of Object.entries(config.Jobs.Fisher.taskmenu.tasks)) {

        base = base + '  <div id="taskbuttonbackground" onclick="showTasks(\'' + key2 + '\', '+value2.xpgain +', '+value2.reward +', '+value2.AmountToFind +')"><span id="taskname">'+ value2.label +'</span><span id="levelgain">'+value2.xpgain +' XP</span><span id="reward">$'+ value2.reward +'</span></div>';

    }

} else if (job == "cargo") {
    for (const [key2, value2] of Object.entries(config.Jobs.Cargo.taskmenu.tasks)) {

        base = base + '  <div id="taskbuttonbackground" onclick="showTasks(\'' + key2 + '\', '+value2.xpgain +', '+value2.reward +', '+value2.AmountToFind +')"><span id="taskname">'+ value2.label +'</span><span id="levelgain">'+value2.xpgain +' XP</span><span id="reward">$'+ value2.reward +'</span></div>';

    }
} else if (job == "scrap") {
    for (const [key2, value2] of Object.entries(config.Jobs.ScrapMiner.taskmenu.tasks)) {

        base = base + '  <div id="taskbuttonbackground" onclick="showTasks(\'' + key2 + '\', '+value2.xpgain +', '+value2.reward +', '+value2.AmountToFind +')"><span id="taskname">'+ value2.label +'</span><span id="levelgain">'+value2.xpgain +' XP</span><span id="reward">$'+ value2.reward +'</span></div>';

    }
}
    base = base + '</div>' +
    '<span id="return" onclick="mainMenu()">⮨</span>'+
    '  <div class="e6_16"></div>'+
    '  <div class="e6_17"></div>'+
    '  <span class="e6_13">TASKS</span>'+
    '  <span class="e6_18">LEVEL 1</span>'+
'</div>';
        
    $("#main_container").html(base);
 
    $(".e6_18").text(level + ' LEVEL');
    setProgress((rawlevel % 100));
}    

function showTasks(tasks, xpgain, reward, AmountToFind) {

    $.post('https://core_jobs/showTasks', JSON.stringify({tasks: tasks, xpgain: xpgain, reward: reward, AmountToFind: AmountToFind}));
    playClickSound();

}

// END






// FISHER

function bucket(caught, cancatch)  {
    if ($("#bucketas").length) {

        $("#bucketas").find(".home-text").text(caught + ' / '+ cancatch);


    } else {

        var base = 
        '    <div id="bucketas">'+
        '      <span class="home-text">'+ caught +' / '+ cancatch +'</span>'+
        '      <div class="home-image"/></div>'+
        '    </div>';
 
    }
    $("#bckt").html(base);

}

// END FISHER


// CARGO

function vehicleHealth(health)  {

    if ($("#healthas").length) {

        $("#healthas").find(".home-text").text(health +'%');


    } else {

        var base = 
        '<div>'+
        
        '    <div id="healthas">'+
        '      <span class="home-text">'+ health +'%</span>'+
        '      <div class="home-vehimage"/></div>'+
        '    </div>'+
        '</div>';

    }
    $("#vehhp").html(base);

}


// SCRAP

function battery(found, needfind)  {

    if ($(".home-container1").length) {

        $(".home-container1").find(".home-text").text(found + ' / '+ needfind);


    } else {

        var base = 

        
        '    <div class="home-container1">'+
        '      <span class="home-text">'+ found +' / '+ needfind +'</span>'+
        '      <div class="home-batteryimage"/></div>'+
        '    </div>'+
        '</div>';
 
    }
    $("#btry").html(base);

}
// END SCRAP



// END CARGO

function playClickSound() {
    var audio = document.getElementById("clickaudio");
    audio.volume = 0.5;
    audio.play();
}


function setProgress(p) {

    var prog = (510 / 100) * p;
    var prog1 = (470 / 100) * p;
    var prog2 = (500 / 100) * p;

    $("#xpline").animate({width: prog}, 800, function () {});
    $(".e6_17").animate({width: prog1}, 800, function () {});
    $(".e6_179").animate({width: prog2}, 800, function () {});

  
}





window.addEventListener("message", function (event) {


    var edata = event.data;

    if (edata.type == "showbucket") {
        bucket(edata.caught, edata.cancatch);
    } else if (edata.type == "hidebucket") {
        $("#bckt").fadeOut(400);
        setTimeout(function() {
            $("#bckt").fadeIn();
            $("#bckt").html("");

        }, 400)
    }
    if (edata.type == "showhealth") {
        vehicleHealth(edata.health);
    } else if (edata.type == "hidehealth") {
        $("#vehhp").fadeOut(400);
        setTimeout(function() {
            $("#vehhp").fadeIn();
            $("#vehhp").html("");

        }, 400)
    }
    if (edata.type == "showbattery") {
        battery(edata.found, edata.needfind);
    } else if (edata.type == "hidebattery") {
        $("#btry").fadeOut(400);
        setTimeout(function() {
            $("#btry").fadeIn();
            $("#btry").html("");

        }, 400)
    }
    
    if (edata.type == "changecolor") {
        thunterduty = edata.thunterduty;
        fisherduty = edata.fisherduty;
        cargoduty = edata.cargoduty;
        scrapduty = edata.scrapduty;
        changecolor();
    }
    if (edata.type == "show") {
        
        config = edata.config;
        firstname = edata.firstname;
        lastname = edata.lastname;
        level = (edata.level - (edata.level % 100)) / 100;
        rawlevel = edata.level;
        job = edata.job;
        gender = edata.gender;
        mainMenu();
    }

    if (edata.type == "hide") {

        $("#main_container").fadeOut(400);
        setTimeout(function() {

            $("#main_container").html("");

        }, 400)
    }
});