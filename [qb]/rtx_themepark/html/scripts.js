var volumeslider = document.getElementById("volumesliderdata");

var themeparkresourcename = "rtx_themepark";

function closeMain() {
	$("body").css("display", "none");
}

function openMain() {
	$("body").css("display", "block");
}

const colorToHex = (color) => {
	const hexadecimal = color.toString(16);
	return hexadecimal.length == 1 ? "0" + hexadecimal : hexadecimal;
}

const RGBtoHex = (red, green, blue) => {
	return "#" + colorToHex(red) + colorToHex(green) + colorToHex(blue);
}

$(".closebumpercarsbuy").click(function(){
	$.post('https://'+themeparkresourcename+'/closebumper', JSON.stringify({}));
});

$(".closeparkbuy").click(function(){
	$.post('https://'+themeparkresourcename+'/closemanagment', JSON.stringify({}));
});

$(".closeattractionbuyticket").click(function(){
	$.post('https://'+themeparkresourcename+'/closethemeparkticket', JSON.stringify({}));
});

$(".closeparkattractionmenu").click(function(){
	$.post('https://'+themeparkresourcename+'/closecontrolmenu', JSON.stringify({}));
});


$(".closemusicurl").click(function(){
	$("#attractionurlshow").hide();	
});

window.addEventListener('message', function (event) {

	var item = event.data;
	if (item.message == "infonotifyshow") {
		document.getElementsByClassName("infonotifytext")[0].innerHTML = item.infonotifytext;
		openMain();
		$("#infonotifyshow").show();	
	}
	
	if (item.message == "bumpercarsbuyshow") {
		openMain();
		var inputhandler = document.getElementById("bumpercarstimesliderdata");
		inputhandler.setAttribute("max", item.bumpermaxminutesdata);	
		inputhandler.setAttribute("min", item.bumperminminutesdata);	
		$("#gymentrypricesliderdata").val(item.bumperminminutesdata); 
		document.getElementById("bumpercarstimeminutedata").innerHTML = item.bumperminminutesdata;
		document.getElementById("bumpercarspricedata").innerHTML = item.bumperpricedata;
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shooterendshow").hide();	
		$("#shootershow").hide();		
		$("#parkbuyshow").hide();
		$("#parkmanagmentmainshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();	
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#bumpercarsbuyshow").show();		
	}	
	
	if (item.message == "bumperbuyupdateprice") {
		document.getElementById("bumpercarspricedata").innerHTML = item.bumperpricedata;	
	}	

	if (item.message == "bumpercarsshow") {
		openMain();
		if (item.bumperdriver == true) {
			$("#bumpercartimetextshow").show();	
		} else {	
			$("#bumpercartimetextshow").hide();	
		}	
		document.getElementById("bumpercarleavetextkey").innerHTML = item.bumperleavekeydata;
		$("#bumpercarsbuyshow").hide();	
		$("#ferrisshow").hide();	
		$("#shooterendshow").hide();	
		$("#shootershow").hide();		
		$("#parkbuyshow").hide();	
		$("#parkmanagmentmainshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#bumpercarmainshow").show();		
	}	
	
	if (item.message == "bumperupdatetime") {
		document.getElementById("bumpercartimetextdata").innerHTML = item.bumpertimedata;	
	}	

	if (item.message == "ferrisshow") {
		openMain();
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#parkbuyshow").hide();
		$("#parkmanagmentmainshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();	
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#ferrisshow").show();		
	}		
	
	if (item.message == "shootershow") {
		openMain();
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shooterendshow").hide();	
		$("#parkbuyshow").hide();
		$("#parkmanagmentmainshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();	
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#shootershow").show();	
		document.getElementById("shootershottextdata").innerHTML = item.shootsdata;	
		document.getElementById("shootermissestextdata").innerHTML = item.missdata;	
		document.getElementById("shootertimetextdata").innerHTML = item.timedata;	
	}	

	if (item.message == "shooterhit") {
		document.getElementById("shootertexthitdata").innerHTML = item.hittext;	
		$("#shootertexthitshow").fadeIn("fast");
		setTimeout(function() {
			$("#shootertexthitshow").fadeOut("fast");
		}, 1000);		
	}	

	if (item.message == "shooterendshow") {
		openMain();
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#parkbuyshow").hide();	
		$("#parkmanagmentmainshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();	
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#shooterendshow").show();	
		document.getElementById("shooterendshootstextdata").innerHTML = item.shootsdata;	
		document.getElementById("shooterendmissestextdata").innerHTML = item.missdata;	
		$("#shooterendshow").fadeIn("slow");
		setTimeout(function() {
			$("#shooterendshow").fadeOut("slow");
		}, 2500);		
	}

	if (item.message == "parkbuyshow") {
		openMain();
		document.getElementById("parkbuytextpricedata").innerHTML = item.parkprice;
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#shooterendshow").hide();
		$("#parkmanagmentmainshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();	
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#parkbuyshow").show();		
	}	
	
	if (item.message == "parkmanagmentmainshow") {
		openMain();
		document.getElementById("parkmanagmentwithdrawmoneytextdata").innerHTML = item.parkbalance;
		if (item.selldisable == true) {
			$("#showsellpark").hide();	
		} else {	
			$("#showownerparkmain").show();	
			$("#showsellpark").show();	
		}		
		if (item.transferdisable == true) {
			$("#showtransferpark").hide();	
		} else {	
			$("#showownerparkmain").show();	
			$("#showtransferpark").show();	
		}				
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#shooterendshow").hide();
		$("#parkbuyshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#parkmanagmentmainshow").fadeIn("slow");
	}	

	if (item.message == "parkmanagmentshow") {
		openMain();
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#shooterendshow").hide();
		$("#parkbuyshow").hide();	
		$("#parkmanagmentmainshow").hide();	
		$("#attractionbuyticketshow").hide();	
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#parkmanagmentshow").fadeIn("slow");	
		$('#parkmanagmentattraction1').connections({
		  to: '#parkattractionconnector1',
		  'class': 'related'
		});

		$('#parkmanagmentattraction2').connections({
		  to: '#parkattractionconnector2',
		  'class': 'related'
		});

		$('#parkmanagmentattraction3').connections({
		  to: '#parkattractionconnector3',
		  'class': 'related'
		});

		$('#parkmanagmentattraction4').connections({
		  to: '#parkattractionconnector4',
		  'class': 'related'
		});

		$('#parkmanagmentattraction5').connections({
		  to: '#parkattractionconnector5',
		  'class': 'related'
		});

		$('#parkmanagmentattraction6').connections({
		  to: '#parkattractionconnector6',
		  'class': 'related'
		});

		$('#parkmanagmentattraction7').connections({
		  to: '#parkattractionconnector7',
		  'class': 'related'
		});

		$('#parkmanagmentattraction8').connections({
		  to: '#parkattractionconnector8',
		  'class': 'related'
		});

		$('#parkmanagmentattraction9').connections({
		  to: '#parkattractionconnector9',
		  'class': 'related'
		});

		$('#parkmanagmentattraction10').connections({
		  to: '#parkattractionconnector10',
		  'class': 'related'
		});				
	}		

	if (item.message == "updateparkbalance") {
		document.getElementById("parkmanagmentwithdrawmoneytextdata").innerHTML = item.parkbalance;	
	}	
	
	if (item.message == "attractionbuyticketshow") {
		openMain();
		document.getElementById("attractionpricedata").innerHTML = item.ticketprice;
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#shooterendshow").hide();
		$("#parkbuyshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#parkmanagmentmainshow").hide();	
		$("#attractionshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();		
		$("#attractionbuyticketshow").show();	
	}	
	
	if (item.message == "iteminhandshow") {
		openMain();
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#shooterendshow").hide();
		$("#parkbuyshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#parkmanagmentmainshow").hide();	
		$("#attractionbuyticketshow").hide();
		$("#attractionshow").hide();	
		$("#iteminhandshow").show();			
	}	

	if (item.message == "attractionhow") {
		openMain();
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#shooterendshow").hide();
		$("#parkbuyshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#parkmanagmentmainshow").hide();	
		$("#attractionbuyticketshow").hide();
		$("#iteminhandshow").hide();
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();
		if (item.attractionanimchange == true) {
			$("#attractionanimtextshow").show();	
		} else {	
			$("#attractionanimtextshow").hide();	
		}			
		$("#attractionshow").show();
	}		

	if (item.message == "parkattractionshow") {
		openMain();
		volumeslider.value = item.musicvolumedata;		
		document.getElementsByClassName("parkattractioncontroltext")[0].innerHTML = item.attractionname;
		if(item.musicdisabled == true) {		
			$("#parkshowmusic").hide();	
		} else {	
			$("#parkshowmusic").show();	
		}	
		if(item.smokedisabled == true) {		
			$("#parkshowsmoke").hide();	
		} else {	
			$("#parkshowsmoke").show();	
			var colorreformated = RGBtoHex(item.smokecolor.r, item.smokecolor.g, item.smokecolor.b);
			$("#color-picker").spectrum("set", colorreformated);				
		}			
		if(item.turndisabled == true) {		
			$("#parkshowturn").hide();	
		} else {	
			$("#parkshowturn").show();	
		}					
		$("#bumpercarsbuyshow").hide();	
		$("#bumpercarmainshow").hide();	
		$("#ferrisshow").hide();	
		$("#shootershow").hide();			
		$("#shooterendshow").hide();
		$("#parkbuyshow").hide();	
		$("#parkmanagmentshow").hide();	
		$("#attractionbuyticketshow").hide();
		$("#iteminhandshow").hide();
		$("#attractionshow").hide();
		$("#parkmanagmentmainshow").hide();
		$("#attractionurlshow").hide();
		$("#parkattractionshow").show();
	}		
	
	if (item.message == "hidebumperpay") {
		$("#bumpercarsbuyshow").hide();	
	}	
	
	if (item.message == "hidebumpercars") {
		$("#bumpercarmainshow").hide();	
	}	

	if (item.message == "hideferris") {
		$("#ferrisshow").hide();	
	}	
	
	if (item.message == "hideparkbuy") {
		$("#parkbuyshow").hide();	
	}	
	
	if (item.message == "hideiteminhand") {
		$("#iteminhandshow").hide();	
	}	

	if (item.message == "hideattraction") {
		$("#attractionshow").hide();	
	}		
	
	if (item.message == "changeattractionstatus") {
		if(item.attractionhandler == 1) {		
			document.getElementById(item.attractionstatusname).checked = true;
		} else {	
			document.getElementById(item.attractionstatusname).checked = false;
		}	
	}			
	
	if (item.message == "hidemanagmentmenu") {
		$("#parkmanagmentmainshow").hide();	
		$("#parkmanagmentshow").hide();	
		$('#parkmanagmentattraction1').connections('remove');
		$('#parkmanagmentattraction2').connections('remove');
		$('#parkmanagmentattraction3').connections('remove');
		$('#parkmanagmentattraction4').connections('remove');
		$('#parkmanagmentattraction5').connections('remove');
		$('#parkmanagmentattraction6').connections('remove');
		$('#parkmanagmentattraction7').connections('remove');
		$('#parkmanagmentattraction8').connections('remove');
		$('#parkmanagmentattraction9').connections('remove');
		$('#parkmanagmentattraction10').connections('remove');		
	}		

	if (item.message == "hideshooter") {
		$("#shootershow").hide();	
	}	

	if (item.message == "hideticket") {
		$("#attractionbuyticketshow").hide();	
	}	

	if (item.message == "hideattractioncontrol") {
		$("#parkattractionshow").hide();
		$("#attractionurlshow").hide();
	}		

	if (item.message == "hide") {
		$("#infonotifyshow").hide();	
	}	
	
	if (item.message == "updateinterfacedata") {
		themeparkresourcename = item.themeparkresourcenamedata;
		let root = document.documentElement;
		root.style.setProperty('--color', item.interfacecolordata);	
	}

	if (item.message == "updateattractionmusiclabel") {
		document.getElementsByClassName("parkattractioncontrolmusictextdata")[0].innerHTML = item.musiclabel;
	}		
	
    document.onkeyup = function (data) {
        if (open) {
            if (data.which == 27) {
				$.post('https://'+themeparkresourcename+'/closemanagment', JSON.stringify({}));
            }
        }	
	};	
});

function bumpercarstimesliderupdate(e) {
	document.getElementById("bumpercarstimeminutedata").innerHTML = e.value;
	$.post('https://'+themeparkresourcename+'/calculatepricebumper', JSON.stringify({
		bumperselectedminutes: e.value
	}));		
}

$(".bumpercarsbuybutton").click(function () {
	$.post('https://'+themeparkresourcename+'/payforbumper', JSON.stringify({}));
});

$(".buttonparkbuy").click(function () {
	$.post('https://'+themeparkresourcename+'/buythemepark', JSON.stringify({}));
});

$(".parkmanagmentwithdrawbutton").click(function () {
	$.post('https://'+themeparkresourcename+'/withdrawthemepark', JSON.stringify({}));
});

$(".parkmanagmentownershipsellbutton").click(function () {
	$.post('https://'+themeparkresourcename+'/sellthemepark', JSON.stringify({}));
});

$(".parkmanagmentownershipstransferbutton").click(function () {
	$.post('https://'+themeparkresourcename+'/transferthemepark', JSON.stringify({}));
});

$(".parkmanagmentsettingsbutton").click(function () {
	$.post('https://'+themeparkresourcename+'/parkmanagmentsattractions', JSON.stringify({}));
});

for (let int1data = 1; int1data < 11; int1data++) {
	$("#parkattractionopendata" + int1data + "").click(function () {
		if (document.getElementById("parkattractionopendata" + int1data + "").checked == false){
			document.getElementById("parkattractionopendata" + int1data + "").checked = false;
			$.post('https://'+themeparkresourcename+'/updateattractionstatus', JSON.stringify({
				attractionid: int1data,
				attractionstatushandler: false
			}));
		}
		else {
			document.getElementById("parkattractionopendata" + int1data + "").checked = true;
			$.post('https://'+themeparkresourcename+'/updateattractionstatus', JSON.stringify({
				attractionid: int1data,
				attractionstatushandler: true
			}));
		}			
	});		
  
}	

$('#color-picker').spectrum({
	type: "newtype",
	preferredFormat: "rgb",
	showInput: true,
	showPalette: false,
	allowEmpty:false,
	showAlpha: false,
	showButtons: false,
	change: function(){
		var colorhexdata = $("#color-picker").spectrum("get");
		var colorrgbdata = colorhexdata.toRgb()   				
		$.post('https://'+themeparkresourcename+'/updatesmokecolor', JSON.stringify({
			colorR: colorrgbdata.r,
			colorG: colorrgbdata.g,
			colorB: colorrgbdata.b,
		}));
	}, 		
});		

$(".attractionbuyticketbutton").click(function () {
	$.post('https://'+themeparkresourcename+'/buythemeparkticket', JSON.stringify({}));
});

$(".buttonsmokestart").click(function () {
	$.post('https://'+themeparkresourcename+'/smokecontrol', JSON.stringify({
		smokehandler: true
	}));
});

$(".buttonsmokestop").click(function () {
	$.post('https://'+themeparkresourcename+'/smokecontrol', JSON.stringify({
		smokehandler: false
	}));
});

$(".buttonmusicplay").click(function () {
	$("#musicinputdata").val(""); 
	$("#attractionurlshow").show();
});

$(".buttonmusicstop").click(function () {
	$.post('https://'+themeparkresourcename+'/stopmusic', JSON.stringify({}));
});

$(".buttonstartattraction").click(function () {
	$.post('https://'+themeparkresourcename+'/startattraction', JSON.stringify({}));
});


$(".buttonplaynewmusic").click(function () {
	$("#attractionurlshow").hide();		
	$.post('https://'+themeparkresourcename+'/attractionnewurl', JSON.stringify({
		musicurldata: $("#musicinputdata").val().trim()
	}));
});


function volumechange(e) {
	$.post('https://'+themeparkresourcename+'/volumechange', JSON.stringify({
		volumedata: e.value
	})); 
}