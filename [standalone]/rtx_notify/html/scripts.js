$(function () {
	var notifyresourcename = "rtx_notify";
	var soundhandler = new Howl({
	  src: "sounds/soundnotify.mp3",
	  volume: 0.2,
	});
	
	var currentscale = 1.0;
	var currentvolume = 1;
	var currenthide = 0;
    if (localStorage.default == "false") {
    } else {
        localStorage.scale = 1.0;
		localStorage.soundactivated = 1;
		localStorage.hideactivated = 0;
    }
    
	let defaultValues = {notifytop: "2", notifyleft: "82", scale: "1.0",};
	
	var scaleslider = document.getElementById("scalesliderdata");

	function openMain() {
		$("body").css("display", "block");
	}

    function NotifyDrag() {
		$(".notify-container").css("background-color", "rgba(0, 0, 0, 1.0)");	
		$(".notify-container ").draggable({
            scroll: false,
            axis: "x, y",
            cursor: "move"
        });	
    };		
	
	function currentsliderdata() {
        if (localStorage.default === "true") {
			if (defaultValues.scale == 0.5) {
				return 5;
			} else if (defaultValues.scale == 0.6) {
				return 6;
			} else if (defaultValues.scale == 0.7) {
				return 7;
			} else if (defaultValues.scale == 0.8) {
				return 8;
			} else if (defaultValues.scale == 0.9) {
				return 9;
			} else if (defaultValues.scale == 1.0) {
				return 10;
			} else if (defaultValues.scale == 1.0) {
				return 10;
			} else if (defaultValues.scale == 1.1) {
				return 11;	
			} else if (defaultValues.scale == 1.2) {
				return 12;		
			} else if (defaultValues.scale == 1.3) {
				return 13;	
			} else if (defaultValues.scale == 1.4) {
				return 14;			
			} else if (defaultValues.scale == 1.5) {
				return 15;			
			}	
        } else {
			if (localStorage.scale == 0.5) {
				return 5;
			} else if (localStorage.scale == 0.6) {
				return 6;
			} else if (localStorage.scale == 0.7) {
				return 7;
			} else if (localStorage.scale == 0.8) {
				return 8;
			} else if (localStorage.scale == 0.9) {
				return 9;
			} else if (localStorage.scale == 1.0) {
				return 10;
			} else if (localStorage.scale == 1.0) {
				return 10;
			} else if (localStorage.scale == 1.1) {
				return 11;	
			} else if (localStorage.scale == 1.2) {
				return 12;		
			} else if (localStorage.scale == 1.3) {
				return 13;	
			} else if (localStorage.scale == 1.4) {
				return 14;			
			} else if (localStorage.scale == 1.5) {
				return 15;			
			}	  			
		} 			
	}	

   function ChangeNotify() {      
        if (localStorage.default === "true") {
			var notifytop = defaultValues.notifytop + "%";
            var notifyleft = defaultValues.notifyleft + '%';
            $('.notify-container').css({
                position:'absolute',
                top:notifytop,
                left:notifyleft
            });	
			localStorage.soundactivated = 1;
			localStorage.hideactivated = 0;
			currentvolume = 1;	
			currenthide = 0;	
			localStorage.scale = defaultValues.scale;
			scaleslider.value = currentsliderdata();	
			currentscale = defaultValues.scale;
			$(".notify-container").css("transform", "scale(" + defaultValues.scale + ")");		
			document.getElementById("notifyvolumeswitchdata").checked = true;
			document.getElementById("notifyhideswitchdata").checked = false;
        } else {
			var notifytop = localStorage.notifytop + 'px';
            var notifyleft = localStorage.notifyleft + 'px';	
			var scaledata = localStorage.scale;
			var volumedata = localStorage.soundactivated;
			var hidedata = localStorage.hideactivated;
            $('.notify-container').css({
                position:'absolute',
                top:notifytop,
                left:notifyleft
            });
			scaleslider.value = currentsliderdata();	
			$(".notify-container").css("transform", "scale(" + scaledata + ")");	
			if (volumedata == 1){
				document.getElementById("notifyvolumeswitchdata").checked = true;
			}
			else {
				document.getElementById("notifyvolumeswitchdata").checked = false;
			}
			if (hidedata == 1){
				document.getElementById("notifyhideswitchdata").checked = true;
			}
			else {
				document.getElementById("notifyhideswitchdata").checked = false;
			}			
        }
    };		

	$("#notifyvolumeswitchdata").click(function(){
		if (document.getElementById("notifyvolumeswitchdata").checked == false){
			document.getElementById("notifyvolumeswitchdata").checked = false;
			currentvolume = 0;
		}
		else {
			document.getElementById("notifyvolumeswitchdata").checked = true;
			currentvolume = 1;
		}
	})
	
	$("#notifyhideswitchdata").click(function(){
		if (document.getElementById("notifyhideswitchdata").checked == false){
			document.getElementById("notifyhideswitchdata").checked = false;
			currenthide = 0;
		}
		else {
			document.getElementById("notifyhideswitchdata").checked = true;
			currenthide = 1;
		}
	})	

	$(".closenotifyedit").click(function(){
		ChangeNotify(); 
		$(".notify-container").draggable("destroy");
		$(".notify-container").css("background-color", "rgba(0, 0, 0, 0.0)");	
		$("#notifysettingsshow").hide();	
		$.post('http://'+notifyresourcename+'/closesettingsnotify', JSON.stringify({}));
	});		
	
	$(".buttonsettingsreset").click(function(){
		localStorage.default = "true";
        ChangeNotify(); 
	});		
	
	$(".buttonsettingssave").click(function(){
        $(".notify-container").draggable("disable")
		localStorage.default = "false";
        var notifypos = $(".notify-container").position();
        localStorage.notifytop = notifypos.top;
        localStorage.notifyleft = notifypos.left;	
		localStorage.scale = currentscale;
		localStorage.soundactivated = currentvolume;
		localStorage.hideactivated = currenthide;
        ChangeNotify(); 
		$(".notify-container").draggable("destroy");
		$(".notify-container").css("background-color", "rgba(0, 0, 0, 0.0)");	
		$("#notifysettingsshow").hide();	
		$.post('http://'+notifyresourcename+'/closesettingsnotify', JSON.stringify({}));
	});		

	scaleslider.oninput = function() {
		if (this.value == 5) {
			$(".notify-container").css("transform", "scale(0.5)");
			currentscale = 0.5;
		} else if (this.value == 6) {
			$(".notify-container").css("transform", "scale(0.6)");
			currentscale = 0.6;	
		} else if (this.value == 7) {
			$(".notify-container").css("transform", "scale(0.7)");
			currentscale = 0.7;				
		} else if (this.value == 8) {
			$(".notify-container").css("transform", "scale(0.8)");
			currentscale = 0.8;				
		} else if (this.value == 9) {
			$(".notify-container").css("transform", "scale(0.9)");
			currentscale = 0.9;	
		} else if (this.value == 10) {
			$(".notify-container").css("transform", "scale(1.0)");
			currentscale = 1.0;	
		} else if (this.value == 11) {
			$(".notify-container").css("transform", "scale(1.1)");
			currentscale = 1.1;
		} else if (this.value == 12) {
			$(".notify-container").css("transform", "scale(1.2)");
			currentscale = 1.2;		
		} else if (this.value == 13) {
			$(".notify-container").css("transform", "scale(1.3)");
			currentscale = 1.3;	
		} else if (this.value == 14) {
			$(".notify-container").css("transform", "scale(1.4)");
			currentscale = 1.4;
		} else if (this.value == 15) {
			$(".notify-container").css("transform", "scale(1.5)");
			currentscale = 1.5;								
		}	  
	}	
	
	window.addEventListener('message', function (event) {

		var item = event.data;
			
		if (item.message == "addnotify"){
			if (localStorage.hideactivated == 0) {
				openMain();
				$( ".notifications" ).append('<div class="notify" id = "' + item.notifyrandomid + '">' +
					'<div class="notifytitle" style="color: ' + item.notifycolor + ';"><span style="font-size: 30px;">' + item.notifytitle + '<span></div>' + 
					'<div class="notifytext">' + item.notifytext + '</div>' + 	
					'<div class="notifyprogressmain">' + 	
						'<div class="notifyprogress" style="background-color: ' + item.notifycolor + '; animation: progressanim ' + item.notifytimedata + 's;;"></div>' + 
					'</div>' + 	
					
				'</div>');	
			}
		}	
		if (item.message == "removenotify"){
			$("#" + item.notifyrandomid + "").fadeOut("slow");
		}		
		if (item.message == "playsound") {
			if (localStorage.hideactivated == 0) {
				if (localStorage.soundactivated == 1) {
					soundhandler._src = item.soundsrc;
					soundhandler.load();
					soundhandler.play();
				}
			}
		}	
		if (item.message == "notifysettingsload"){
			notifyresourcename = item.notifyresouredata;
			let root = document.documentElement;
			root.style.setProperty('--color', item.notifysettingsinterfacecolor);				
			if (localStorage.default == "true") {
				if (item.defaultposition == "left") {
					defaultValues.notifyleft = "18";
					$(".notify-container").css("left", "18%");	
				} else if (item.defaultposition == "right") {
					defaultValues.notifyleft = "82";
					$(".notify-container").css("left", "18%");	
				} else if (item.defaultposition == "middle") {	
					defaultValues.notifyleft = "42";
					$(".notify-container").css("left", "42%");	
				}				           
			} else {			
				ChangeNotify();
			}
		}	
		if (item.message == "notifysettingsshow"){
			var volumedata = localStorage.soundactivated;
			var hidedata = localStorage.hideactivated;
			if (volumedata == 1){
				document.getElementById("notifyvolumeswitchdata").checked = true;
			}
			else {
				document.getElementById("notifyvolumeswitchdata").checked = false;
			}
			if (hidedata == 1){
				document.getElementById("notifyhideswitchdata").checked = true;
			}
			else {
				document.getElementById("notifyhideswitchdata").checked = false;
			}				
			openMain();
			$("#notifysettingsshow").show();	
			NotifyDrag();
		}	
		document.onkeyup = function (data) {
			if (open) {
				if (data.which == 27) {
					ChangeNotify(); 
					$(".notify-container").draggable("destroy");
					$(".notify-container").css("background-color", "rgba(0, 0, 0, 0.0)");	
					$("#notifysettingsshow").hide();	
					$.post('http://'+notifyresourcename+'/closesettingsnotify', JSON.stringify({}));
				}
			}	
		};		
	});

})