var volumeslider = document.getElementById("volumesliderdata");

var televisionresourcename = "rtx_tv";

function closeMain() {
	$("body").css("display", "none");
}

function openMain() {
	$("body").css("display", "block");
}

$(".closetvmenu").click(function(){
	$.post('https://'+televisionresourcename+'/quit', JSON.stringify({}));
});

$(".closetvcreatorfinish").click(function(){
	$.post('https://'+televisionresourcename+'/quit', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;

	if (item.message == "tvshow") {
		$("#videoinputtvdata").val(""); 
		document.getElementsByClassName("currentlytexttype")[0].innerHTML = item.tvurltypedata;
		volumeslider.value = item.tvvolumedata;		
		if (item.tvurldata == "") {	
			document.getElementsByClassName("currentlytextdata2")[0].innerHTML = "";
			document.getElementsByClassName("currentlytext")[0].innerHTML = "Currently no video is playing";
		} else {
			document.getElementsByClassName("currentlytext")[0].innerHTML = "Currently playing";
			document.getElementsByClassName("currentlytextdata2")[0].innerHTML = item.tvurldata;
			$("#currentlytextdatashow").show();	
		}			
		$("#vehicletvcreatorshow").hide();
		$("#vehicletvcreatorfinishshow").hide();
		$("#tvshow").show();	
		openMain();
	}	

	if (item.message == "vehicletvcreatorshow") {
		$("#tvshow").hide();
		$("#vehicletvcreatorfinishshow").hide();
		$("#vehicletvcreatorshow").show();	
		openMain();
	}	
	
	if (item.message == "vehicletvcreatorfinishshow") {
		var offsetdatatv = 
		'	{\n' +
		'		vehiclebone = "windscreen",\n' +
		'		offsetx = ' + item.offsetxdata + ',\n' +
		'		offsety = ' + item.offsetydata + ',\n' +
		'		offsetz = ' + item.offsetzdata + ',\n' +
		'		rotation = ' + item.offsetrotationdata + ',\n' +
		'	},';
		$(".tvcopytextdata").val(offsetdatatv); 
		$("#tvshow").hide();
		$("#vehicletvcreatorshow").hide();
		$("#vehicletvcreatorfinishshow").show();	
		openMain();
	}		
	
	if (item.message == "changespeed") {
		document.getElementById("currentspeeddata").innerHTML = item.speeddata;
	}		
	
	if (item.message == "changemode") {
		document.getElementById("currentmodedata").innerHTML = item.modedata;
	}		
		
	if (item.message == "hide") {
		closeMain();
	}
	
	if (item.message == "updateinterfacedata") {
		televisionresourcename = item.televisionresouredata;
		let root = document.documentElement;
		root.style.setProperty('--color', item.interfacecolordata);	
	}		
	
    document.onkeyup = function (data) {
        if (open) {
            if (data.which == 27) {
				$.post('https://'+televisionresourcename+'/quit', JSON.stringify({}));
            }
        }	
	};
});

$(".buttonplay").click(function () {
	$.post('https://'+televisionresourcename+'/playvideo', JSON.stringify({
		videourldata: $("#videoinputtvdata").val().trim()
	}));
});


$(".buttonturnoff").click(function () {
	$.post('https://'+televisionresourcename+'/turnoff', JSON.stringify({}));
});

function volumechange(e) {
	$.post('https://'+televisionresourcename+'/volumechange', JSON.stringify({
		volumedata: e.value
	})); 
}