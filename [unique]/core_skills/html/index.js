var Config;
var firstname;
var lastname;
var level;
var rawlevel;
var job;
var oldpoints;
var ownedskills;
var newskill;
var ResetAvailable;

var totalxp;
var needxp;

var LineWidth = 248;
var timePassed = 0;
var timerInterval = null;

var mainhtmlLine;
var htmlLine;


var __scale=1;
var screenwidth;
var width;
var screenheight;
var height;
var currentBubble;





function closeMenu() {
    $.post('https://core_skills/close', JSON.stringify({}));
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





function mainMenu() {
    var base = 
    '<div id="notmovingdiv">'+
        '<div id="gradientbackground"></div>'+
        '<div id="gradientbackground1"></div>'+

        '<div class=e2_29>'+
            '<div class="e1_9"><div id="profilepic"></div></div>'+
            '<span class="e1_10">'+firstname.toUpperCase()+' '+lastname.toUpperCase()+'</span>'+

            '<span class="e1_11">JOB :<span class="regular"> '+job.toUpperCase()+'</span></span>'+
            '<span class="e1_12">LEVEL :<span class="regular1"> '+level+'</span></span>'+
        '</div>'+

        '<div class=e7_50>'+
            '<span class="e7_44">'+oldpoints+'</span>'+
            '<span class="e7_46">SKILL POINTS</span>'+
        '</div>'+
        
        '<div id="esccontainer">'+
        '   <span id="esctext">RETURN</span>'+
        '   <div id="escimg"></div>'+
        '</div>'+
        '<div id="mwheelcontainer">'+
        '   <div id="mwheeltext">ZOOM</div>'+
        '   <div id="mwheelimg"></div>'+
        '</div>'+
        '<div id="Rkeycontainer">'+
        '   <div id="Rkeytext">RESET ALL</div>'+
        '   <div id="Rkeyimg"></div>'+
        '</div>'+

        '<span class="e7_41">'+Config.StartingSkill.SkillName+' '+firstname+'</span>'+
        '<div class="e7_43"><span id="text">'+Config.StartingSkill.SkillDescription+'</span></div>';

        if (ownedskills.includes("StartingSkill") == false) { 
            base = base +
            '<span class="e7_105">PURCHASE ('+Config.StartingSkill.Purchase+')</span>';
        } else {
            base = base +
            '<span class="e7_105" style="color:white; text-shadow:none; font-size:22px;">YOU OWN THIS SKILL</span>';

        }




        base = base +
        '<div id="scalingdiv">'+
            '<div id="movingdiv" onwheel="zoom(event)">';

                if (ownedskills.includes("StartingSkill") == true) { 
                    base = base + 

                    '<div class="backgroundreactor">'+
                    ' <div class="arc_reactor"></div>' + 
                    '    <div class="case_container">' + 
                    '      <div class="e7">' + 
                    '        <div class="semi_arc_3 e5_1">' + 
                    '          <div class="semi_arc_3 e5_2">' + 
                    '            <div class="semi_arc_3 e5_3">' + 
                    '              <div class="semi_arc_3 e5_4">' + 
                    '              </div>' + 
                    '            </div>' + 
                    '          </div>' + 
                    '        </div>' + 
                    '        <div class="core2" style="background-color: #cedce0; box-shadow: 0px 0px 60px rgba(2, 254, 255, 0.8);">'+
                    '           <div id="skillpointimg" style="background-image: url(img/skillpoints/'+Config.StartingSkill.image+'.png);"></div>'+  
                    '       </div>' + 
                    '      </div>' +  
                    '    </div>' + 
                    '</div>'+

                    '<div id="maincircle"></div>';
                } else {
                    base = base +

                    '<div class="backgroundreactor">'+
                    '    <div class="case_container">' + 
                    '      <div class="e7">' + 
                    '        <div class="semi_arc_3 e5_1" style="display:none;">' + 
                    '          <div class="semi_arc_3 e5_2">' + 
                    '            <div class="semi_arc_3 e5_3">' + 
                    '              <div class="semi_arc_3 e5_4">' + 
                    '              </div>' + 
                    '            </div>' + 
                    '          </div>' + 
                    '        </div>' + 
                    '        <div class="core2" style="background-color: #cedce0;" >'+
                    '           <div id="skillpointimg" style="background-image: url(img/skillpoints/'+Config.StartingSkill.image+'.png);"></div>'+  
                    '       </div>' + 
                    '      </div>' +  
                    '    </div>' + 
                    '</div>'+

                    '<div id="maincircle"></div>';
                }
            
                for (const [key3, value3] of Object.entries(Config.Skills)) {
                    
                    var x = value3.x - 40;
                    var y = value3.y - 40;

                    if (ownedskills.includes(key3)) { 
                    
                        base = base + 
                        '<div class="smallbackgroundreactor" style="left:'+x+';top:'+y+';">'+
                            '<div class="smallarc_reactor">'+  
                            ' <div class="smallcase_container">'+ 
                            '   <div class="semi_arc_3 e5_1">' + 
                            '     <div class="semi_arc_3 e5_2">' + 
                            '       <div class="semi_arc_3 e5_3">' + 
                            '       </div>'+
                            '     </div>'+
                            '   </div>'+
                            '      <div class="core" style="background-color: #cedce0; box-shadow: 0px 0px 40px rgba(2, 254, 255, 0.9);"'+
                            '           Skill="'+key3+'"'+
                            '           SkillName="'+value3.SkillName+'"'+ 
                            '           SkillDescription="'+value3.SkillDescription+'"'+
                            '           Purchase="'+value3.Purchase+'">'+   
                            '           <div id="skillpointimg" style="background-image: url(img/skillpoints/'+value3.image+'.png);"></div>'+  
                            '       </div>' + 
                            '  </div>' +
                            '</div>' +
                        '</div>';



                    } else {

                        base = base + 
                        '<div class="smallbackgroundreactor" style="left:'+x+';top:'+y+';">'+
                        '   <div class="smallcase_container">' + 
                            '   <div class="semi_arc_3 e5_1" style="display:none;">' + 
                            '     <div class="semi_arc_3 e5_2">' + 
                            '       <div class="semi_arc_3 e5_3">' + 
                            '       </div>'+
                            '     </div>'+
                            '   </div>'+
                        '      <div class="core" style="background-color: #cedce0;"'+
                        '           Skill="'+key3+'"'+
                        '           SkillName="'+value3.SkillName+'"'+ 
                        '           SkillDescription="'+value3.SkillDescription+'"'+
                        '           Purchase="'+value3.Purchase+'">'+ 
                        '           <div id="skillpointimg" style="background-image: url(img/skillpoints/'+value3.image+'.png);"></div>'+  
                        '       </div>' + 
                        '   </div>' + 
                        '</div>';

                    }
                }

            base = base + '</div>'+
        '</div>'+

        '<div id="questionbackground" style="display:none;">'+
            '<div id="questiondiv">'+
                '<div id="questionName"></div>'+
                '<div id="questionDescription"></div>'+
                '<div id="questionPurchase"></div>'+
                '<div id="questionconfirm">CONFIRM</div>'+
                '<div id="questioncancel">CANCEL</div>'+
            '</div>'+
        '</div>'+

        '<div id="resetbackground" style="display:none;">'+
            '<div id="resetdiv">'+
                '<div id="resetName"></div>'+
                '<div id="resetDescription"></div>'+
                '<div id="resetPurchase"></div>'+
                '<div id="resetconfirm">CONFIRM</div>'+
                '<div id="resetcancel">CANCEL</div>'+
            '</div>'+
        '</div>'+

    '</div>';
    $("#main_container").html(base);



    $(".core2").hover(function(){

        $(".e7_41").text(Config.StartingSkill.SkillName+' '+firstname);
        $("#text").text(Config.StartingSkill.SkillDescription);

        if (ownedskills.includes("StartingSkill") == false) { 

            $(".e7_105").text('PURCHASE ('+Config.StartingSkill.Purchase+')');
            $(".e7_105").css('font-size', '26px');        
            $(".e7_105").css('color', '#2abc27cc');
            $(".e7_105").css('text-shadow', '#2abc27cc');

        } else {

            $(".e7_105").text('YOU OWN THIS SKILL');
            $(".e7_105").css('font-size', '22px');        
            $(".e7_105").css('color', 'white');
            $(".e7_105").css('text-shadow', 'none');
        } 
    });
    
    $(document).ready(function(){
        $(".core").hover(function(){
            $(".e7_41").text($(this).attr('SkillName'));
            $("#text").text($(this).attr('SkillDescription'));
            
            if (ownedskills.includes($(this).attr('Skill'))) { 

                $(".e7_105").text('YOU OWN THIS SKILL');
                $(".e7_105").css('font-size', '22px');         
                $(".e7_105").css('color', 'white');
                $(".e7_105").css('text-shadow', 'none');

            } else if (oldpoints >= $(this).attr('Purchase')) {

                $(".e7_105").text('PURCHASE ('+$(this).attr('Purchase')+')');
                $(".e7_105").css('font-size', '26px');      
                $(".e7_105").css('color', '#2abc27cc');
                $(".e7_105").css('text-shadow', '#2abc27cc');

            } else if (oldpoints < $(this).attr('Purchase')){

                $(".e7_105").text('REQUERES '+$(this).attr('Purchase')+' SKILL POINTS');
                $(".e7_105").css('font-size', '25px');        
                $(".e7_105").css('color', '#f00707cc');
                $(".e7_105").css('text-shadow', 'none');
            } 
        }); 
    });

    $(document).ready(function(){
        $(".core2").click(function(){
            if (ownedskills.includes("StartingSkill") == false) { 

                $('.backgroundreactor').addClass('arc_reactor');
                $('.core2').addClass('lightup');

                setTimeout(function() {

                    $(".e7").children( ".semi_arc_3" ).css( "display", "flex");

                }, 300)


                StartingSkillPoints = Config.StartingSkill.StartingSkillPoints;
                StartingSkillId = "StartingSkill"; 
                StartingSkill(StartingSkillPoints, StartingSkillId);

                oldpoints = oldpoints + StartingSkillPoints
                $(".e7_44").text(oldpoints);
                
                $(".e7_105").text('YOU OWN THIS SKILL');
                $(".e7_105").css('font-size', '22px');         
                $(".e7_105").css('color', 'white');
                $(".e7_105").css('text-shadow', 'none');
                
            } 
        });

        $(".core").click(function(){

            for (const [key3, value3] of Object.entries(Config.Skills)) {                

                if (ownedskills.includes(value3.ConnectLineTo) == true) { 
                    
                    if (key3 == $(this).attr('Skill')) {

                        if (ownedskills.includes($(this).attr('Skill')) == false) { 

                            $("#questionName").text($(this).attr('SkillName'));
                            $("#questionDescription").text($(this).attr('SkillDescription'));
                            $("#questionPurchase").text('COST '+$(this).attr('Purchase')+' SKILL POINTS');
                            Purchase = $(this).attr('Purchase');
                            Skill = $(this).attr('Skill');
                            
                            currentBubble = $(this);

                            playClickSound();
                            $("#questionbackground").show();
                            $("#questionbackground").on('wheel', function() {
                                return false;
                            });

                            $('#questiondiv').addClass('entrence');
                            setTimeout(function() {

                                $('#questiondiv').removeClass('entrence');

                            }, 300)
                        } 
                    }
                } 
            }
        });

        $("#questioncancel").click(function(){
            playClickSound();
            $('#questiondiv').addClass('exit');
            setTimeout(function() {
    
                $('#questiondiv').removeClass('exit');
                $("#questionbackground").hide();
                $('#questionPurchase').removeClass('glowred');
            }, 250)
        });
        $("#questionconfirm").click(function(){
            if (oldpoints >= Purchase) {
                $('#questionPurchase').addClass('glowgreen');
                
                buySkill(Skill, Purchase); // ADDS SKILL

                oldpoints = oldpoints - Purchase
                $(".e7_44").text(oldpoints);


                $(".e7_105").text('YOU OWN THIS SKILL');
                $(".e7_105").css('font-size', '22px');         
                $(".e7_105").css('color', 'white');
                $(".e7_105").css('text-shadow', 'none');

                setTimeout(function() {
                    $('#questiondiv').addClass('exit');
                    setTimeout(function() {
    
                        $('#questiondiv').removeClass('exit');
                        $('#questionPurchase').removeClass('glowgreen');
                        $("#questionbackground").hide();

                        MainLineChangeColor();
                        LineChangeColor();

                        setTimeout(function() {

                            currentBubble.addClass('smalllightup');
                            currentBubble.parent(".smallcase_container").children( ".semi_arc_3" ).css( "display", "flex");

                            setTimeout(function() {

                                currentBubble.parent(".smallcase_container").parent(".smallbackgroundreactor").addClass("smallarc_reactor");

                            }, 200)

                        }, 600)
                    }, 200)
                }, 300)


            } else {
                $('#questionPurchase').addClass('glowred');
                $('#questiondiv').addClass('shake');
                setTimeout(function() {
    
                    $('#questiondiv').removeClass('shake');
        
                }, 500)
            }
        });

    });




    $('.e1_12').click(function(){
        $('.e1_12').text(function(i, text){
            return text === "XP: "+totalxp+' / '+needxp ? "LEVEL: "+level : "XP: "+totalxp+' / '+needxp;
        })

    });


    $(".e7_50").on('wheel', function() {
        return false;
    });
    $(".e2_29").on('wheel', function() {
        return false;
    });

    
    width = $('#scalingdiv').width(); 
    height = $('#scalingdiv').height();

    screenwidth = $('#notmovingdiv').width();
    screenheight = $('#notmovingdiv').height();

    mainposition = $('#maincircle').position();


    $(document).ready(function(){ 
            
        $('.smallbackgroundreactor').each(function(index, value) {

            var skillbubbleLeft = $(this).position().left;
            var skillbubbleTop = $(this).position().top;


            $(this).css('left', screenwidth * skillbubbleLeft/1920);
            $(this).css('top',  screenheight * skillbubbleTop/1080);

        });
    });

    //console.log('screenwidth: ' +screenwidth+ ' screenheight: ' +screenheight);
    //console.log('mainleft: ' +mainposition.left+' maintop: '+mainposition.top);
    connect();
    connectmain();

   $(document).ready(function(){

        $('#scalingdiv').draggable({

            scroll: false,
            drag: function(event, ui) {

                if(ui.position.left > -(width*(1-__scale)/2))  { 
    
                    ui.position.left = -(width*(1-__scale)/2);

                }

                if(ui.position.left < -(width-screenwidth) + (width*(1-__scale)/2))  { 
    
                    ui.position.left = -(width-screenwidth) + (width*(1-__scale)/2);

                }
                if(ui.position.top > -(height*(1-__scale)/2))  { 
    
                    ui.position.top = -(height*(1-__scale)/2);

                }
                if(ui.position.top < -(height-screenheight) + (height*(1-__scale)/2))  {  
    
                    ui.position.top = -(height-screenheight) + (height*(1-__scale)/2);

                } 
    
            }

        });
    });



}

function buySkill(Skill, Purchase) {
    $.post('https://core_skills/buySkill', JSON.stringify({Skill: Skill, Purchase: Purchase}));
    playClickSound();
}

function StartingSkill(StartingSkillPoints, StartingSkillId) {
    $.post('https://core_skills/StartingSkill', JSON.stringify({StartingSkillPoints: StartingSkillPoints, StartingSkillId: StartingSkillId}));
    playClickSound();

}
function RestoreDefault() {
    $.post('https://core_skills/RestoreDefault', JSON.stringify({}));
}











function LineChangeColor() {


    for (const [key3, value3] of Object.entries(Config.Skills)) {    

        if (currentBubble.attr('Skill') == key3) {

            $('.line').each(function(index, value) {

                var LineStart = $(this).attr('Start');
                var LineEnd = $(this).attr('End');
                    
                if (LineStart.includes(key3) && LineEnd.includes(value3.ConnectLineTo)) { 

                    $(this).css('background', 'linear-gradient(to left, rgba(2, 255, 255, 0.5) 40%, rgba(255,255,255,1) 50%) right');
                    $(this).css('background-size', '200%');
                    $(this).css('transition', '0.6s ease-out');

                }
            });
        }
    }


}

function MainLineChangeColor() {


    for (const [key3, value3] of Object.entries(Config.Skills)) {

        if (currentBubble.attr('Skill') == key3) {

            $('.mainline').each(function(index, value) {

                var LineStart = $(this).attr('Start');
                    
                if (LineStart.includes(key3)) { 
                    

                    $(this).css('background', 'linear-gradient(to left, rgba(2, 255, 255, 0.5) 40%, rgba(255,255,255,1) 50%) right');

                    $(this).css('background-size', '200%');
                    $(this).css('transition', '0.6s ease-out');


                }
            });
        }
    }
}



function playClickSound() {
    var audio = document.getElementById("click2");
    audio.volume = 0.5;
    audio.play();
}
function playNotificationSound() {
    var audio = document.getElementById("celebration");
    audio.volume = 0.5;

    var isPlaying = audio.currentTime > 0 && !audio.paused && !audio.ended 
    && audio.readyState;

    if (!isPlaying) {
        audio.play();
    }
}
function setProgress(p) {

    var prog = (195 / 100) * p;
    $(".e6_17").animate({width: prog}, 800, function () {});
  
}





function NotificationLevelUp(addedpoints, experience) {
    playNotificationSound();
        var base = 
        '<div id="notifbackground">'+
            '<div id="notifdiv">';
                if (level < 10) {
                    base = base +
                    '<div id="notifName">LEVEL UP</div>'+
                    '<div id="notiflevel">'+level+'</div>'+
                    '<div id="notifSkillPoint">+'+addedpoints+' SKILL POINT</div>'+
                    '<div id="notifExperience">+'+experience+' EXPERIENCE</div>'+
                    '<div id="notiftimer"></div>';
                    //'<div id="notiftimeline"></div>'+
                } else {
                    base = base +
                    '<div id="largernotifName">LEVEL UP</div>'+
                    '<div id="largernotiflevel">15</div>'+
                    '<div id="largernotifSkillPoint">+'+addedpoints+' SKILL POINT</div>'+
                    '<div id="largernotifExperience">+'+experience+' EXPERIENCE</div>'+
                    '<div id="largernotiftimer"></div>';
                    //'<div id="largernotiftimeline"></div>'+
                }
            base = base +
            '</div>'+
        '</div>';

    $("#notif").html(base);


    
    timerInterval = setInterval(() => {
        timePassed = timePassed += 20;
        timeLeft = TimeLimit - timePassed;

        //$("#notifcancel").text(formatTime(timeLeft));
        
        setLineDasharray();

        if (timeLeft <= 0) {
            onTimesUp();
            $("#notif").fadeOut(400);
            setTimeout(function() {
                $("#notif").fadeIn();
                $("#notif").html("");

            }, 400)
             LineWidth = 248;
             TimeLimit = 5000;
             timePassed = 0;
             timeLeft = TimeLimit;
             timerInterval = null;
        }
    }, 20);
}

function onTimesUp() {
    clearInterval(timerInterval);
}

function calculateTimeFraction() {
    rawTimeFraction = timeLeft / TimeLimit;
    return rawTimeFraction - (1 / TimeLimit) * (1 - rawTimeFraction);
}
  
function setLineDasharray() {

    LineDasharray = LineWidth * calculateTimeFraction();

    $("#notiftimeline").animate({width: LineDasharray}, 10, function () {});
    
}

function formatTime(time) { /// jeigu reik kad rasytu virusi naudoju
    //var minutes = Math.floor(time / 60);
    //var seconds = Math.floor(time / 1000);
    var milisec = time;
    //if (seconds < 10) {
      //seconds = `0${seconds}`;
    //}
    return `${milisec}`;
}










function zoom(event) {
    event.preventDefault();

    __scale += event.deltaY * -0.0007;

    // Restrict scale
    __scale = Math.min(Math.max(screenwidth/width, __scale), 1);


    // Apply scale transform
    
    $('#movingdiv').css('transform', `scale(${__scale})`);


    var offset = $('#scalingdiv').offset();
    var leftPos = offset.left;
    var topPos = offset.top;

    if(leftPos > -(width*(1-__scale)/2))  { 
    
        leftPos = -(width*(1-__scale)/2);

    }

    if(leftPos < -(width-screenwidth) + (width*(1-__scale)/2))  {  

        leftPos = -(width-screenwidth) + (width*(1-__scale)/2);

    }
    if(topPos > -(height*(1-__scale)/2))  { 

        topPos = -(height*(1-__scale)/2);

    }
    if(topPos < -(height-screenheight) + (height*(1-__scale)/2))  { 

        topPos = -(height-screenheight) + (height*(1-__scale)/2);

    }

    $('#scalingdiv').css('left', leftPos);
    $('#scalingdiv').css('top', topPos);

}









function connect() { // draw a line connecting elements

    for (const [key3, value3] of Object.entries(Config.Skills)) {

        var x1 = screenwidth * value3.x/1920 + 30;
        var y1 = screenheight * value3.y/1080 + 30;     

        for (const [key4, value4] of Object.entries(Config.Skills)) {    
            
            if (key3 == value4.ConnectLineTo) {
    
                var x2 = screenwidth * value4.x/1920 + 30;
                var y2 = screenheight * value4.y/1080 + 30; 
    
                var lineStart = key4;
                var lineEnd = value4.ConnectLineTo;
        
                // distance
                var length = Math.sqrt(((x2-x1) * (x2-x1)) + ((y2-y1) * (y2-y1)));
                // center
                var cx = ((x1 + x2) / 2) - (length / 2);
                var cy = ((y1 + y2) / 2) - (1 / 2);
                // angle
                var angle = Math.atan2((y1-y2),(x1-x2))*(180/Math.PI);
                // make hr
    
                if (ownedskills.includes(lineStart) && ownedskills.includes(lineEnd)) { 

                    htmlLine = 
                    '<div class="line"'+
                        'Start="'+lineStart+'"'+
                        'End="'+lineEnd+'"'+
                        'style="height:8px; background:linear-gradient(90deg, rgba(2, 255, 255, 0.5) 70%, rgba(255,255,255,1) 100%); line-height:1px; position:absolute; left:'+ cx +'px; top:'+ cy +'px; width:'+ length +'px; -moz-transform:rotate(' + angle + 'deg);-webkit-transform:rotate(' + angle + 'deg); -o-transform:rotate(' + angle + 'deg); -ms-transform:rotate(' + angle + 'deg); transform:rotate(' + angle + 'deg);">'+
                    '</div>';
                } else {

                    htmlLine = 
                    '<div class="line"'+
                        'Start="'+lineStart+'"'+
                        'End="'+lineEnd+'"'+
                        'style="height:8px; background-color:white; line-height:1px; position:absolute; left:'+ cx +'px; top:'+ cy +'px; width:'+ length +'px; -moz-transform:rotate(' + angle + 'deg);-webkit-transform:rotate(' + angle + 'deg); -o-transform:rotate(' + angle + 'deg); -ms-transform:rotate(' + angle + 'deg); transform:rotate(' + angle + 'deg);">'+
                    '</div>';
                }
                $('#movingdiv').append(htmlLine);
            }
        }
    }
}

function connectmain() { // draw a line connecting elements

    var main = $("#maincircle").position();
    
    for (const [key3, value3] of Object.entries(Config.Skills)) {

        if (value3.ConnectLineTo == "StartingSkill") {

            var lineStart = key3;

            var off2left = screenwidth * value3.x/1920;
            var off2top = screenheight * value3.y/1080;

 
            // bottom right
            var x1 = main.left + 60;
            var y1 = main.top + 60;
            // top right
            var x2 = off2left + 30;
            var y2 = off2top + 30;
            // distance
            var length = Math.sqrt(((x2-x1) * (x2-x1)) + ((y2-y1) * (y2-y1)));
            // center
            var cx = ((x1 + x2) / 2) - (length / 2);
            var cy = ((y1 + y2) / 2) - (1 / 2);
            // angle
            var angle = Math.atan2((y1-y2),(x1-x2))*(180/Math.PI);
            // make hr


            if (ownedskills.includes(key3)) { 

                mainhtmlLine = 

                    '<div class="mainline"'+
                        'Start="'+lineStart+'"'+
                        'style="height:8px; background:linear-gradient(90deg, rgba(2, 255, 255, 0.5) 70%, rgba(255,255,255,1) 100%); line-height:1px; position:absolute; left:'+ cx +'px; top:'+ cy +'px; width:'+ length +'px; -moz-transform:rotate(' + angle + 'deg);-webkit-transform:rotate(' + angle + 'deg); -o-transform:rotate(' + angle + 'deg); -ms-transform:rotate(' + angle + 'deg); transform:rotate(' + angle + 'deg);">'+
                    '</div>';

            } else {

                mainhtmlLine = 

                    '<div class="mainline"'+
                        'Start="'+lineStart+'"'+
                        'style="height:8px; background-color:white; line-height:1px; position:absolute; left:'+ cx +'px; top:'+ cy +'px; width:'+ length +'px; -moz-transform:rotate(' + angle + 'deg);-webkit-transform:rotate(' + angle + 'deg); -o-transform:rotate(' + angle + 'deg); -ms-transform:rotate(' + angle + 'deg); transform:rotate(' + angle + 'deg);">'+
                    '</div>';
            }
            //
            // alert(htmlLine);

            $('#movingdiv').append(mainhtmlLine);
        }
    }
}



    
$(document).keyup(function (e) {
    if (e.keyCode === 82) {
        if (Config.RestoreDefault.allowRestore == true) {
            playClickSound();

            $("#resetName").text(Config.RestoreDefault.Name);
            $("#resetDescription").text(Config.RestoreDefault.Description);
            $("#resetPurchase").text(Config.RestoreDefault.Purchase);
            
            var Have = false;

            $("#resetbackground").show();
            $("#resetbackground").on('wheel', function() {
                return false;
            });

            $('#resetdiv').addClass('entrence');
            setTimeout(function() {

                $('#resetdiv').removeClass('entrence');

            }, 300)


            $("#resetcancel").click(function(){
                playClickSound();
                $('#resetdiv').addClass('exit');
                setTimeout(function() {
        
                    $('#resetdiv').removeClass('exit');
                    $("#resetbackground").hide();
                }, 250)
            });
            $("#resetconfirm").click(function(){
                if (ResetAvailable == true) {
                    for (const [key3, value3] of Object.entries(Config.Skills)) {                
 
                        if (ownedskills.includes(key3) == true) { 
                            

                            if (oldpoints > 0) {
                                oldpoints = 0                
                                $(".e7_44").text(oldpoints);
                            }

                            if (level > 0) {
                                level = 0
                                $(".regular1").text(level);
                            }
                            $(".e7").children( ".semi_arc_3" ).css( "display", "none");
                            $('.arc_reactor').css( "display", "none");
                            $(".core2").css( "box-shadow", "0px 0px 0px rgba(2, 254, 255, 0.8)");

                            $(".smallcase_container").children( ".semi_arc_3" ).css( "display", "none");
                            $(".smallarc_reactor").removeClass("smallarc_reactor");
                            $(".core").css( "box-shadow", "0px 0px 0px rgba(2, 254, 255, 0.8)");



                            $('.line').css('background', 'white');
                            $('.mainline').css('background', 'white');

                            Have = true;
                            setTimeout(function() {
                                $('#resetdiv').addClass('exit');
                                setTimeout(function() {
                                    
                                    RestoreDefault();

                                    $('#resetdiv').removeClass('exit');
                                    $("#resetbackground").hide();
                                }, 450)
                            }, 500)

                        } 
                    }

                    if (Have == false) {
                    
                        $("#resetPurchase").text(Config.RestoreDefault.NoSkills);
                        $('#resetdiv').addClass('shake');
                        setTimeout(function() {
            
                            $('#resetdiv').removeClass('shake');
                
                        }, 500)
                    }

                } else {

                    $("#resetPurchase").text(Config.RestoreDefault.NotAvailable);
                    $('#resetdiv').addClass('shake');
                    setTimeout(function() {
        
                        $('#resetdiv').removeClass('shake');

                    }, 500)
                }
            });
        }
    }
});





window.addEventListener("message", function (event) {

    var edata = event.data;

    if (edata.type == "show") {
        
        Config = edata.config;
        firstname = edata.firstname;
        lastname = edata.lastname;
        level = edata.level;
        job = edata.job;
        oldpoints = edata.oldpoints;
        ownedskills = edata.ownedskills;
        ResetAvailable = edata.Ravailable;
        totalxp = edata.totalxp;
        needxp = edata.needxp;
        mainMenu();
    }

    if (edata.type == "hide") {

        $("#main_container").fadeOut(400);
        setTimeout(function() {

            $("#main_container").html("");

        }, 400)
    }


    if (edata.type == "newownedskill") {

        ownedskills = edata.newownedskill;
        ResetAvailable = edata.Ravailable;

    }
    if (edata.type == "shownotification") {

        level = edata.lvl;
        TimeLimit = edata.NotificationTimer;
        NotificationLevelUp(edata.addedpoints, edata.experience);
    }
});

