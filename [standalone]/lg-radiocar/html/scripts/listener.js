var currentIndex = null;

var vueJS = new Vue({
	el: '#musicList',
	data: 
	{
		songs: [],
	},
	
	methods: {
		showIndex: function (index) {
			currentIndex = index;
			$("#musicList").hide();
			$("#playCustom").hide();
			$("#editSong").show();
		},	
		
		playMusic: function (index) {
			var url = this.songs[index].url
			updateName(url);
			$("#status").text(locales.playing);
			$.post('https://lg-radiocar/play', JSON.stringify({
				url: url,
			}));
		}
	}
}) 

function editSong(){
	vueJS.songs[currentIndex].label = $("#AddName").val();
	vueJS.songs[currentIndex].url = $("#AddUrl").val();
	$("#musicList").show();
	$("#playCustom").hide();
	$("#editSong").hide();

	$.post('https://lg-radiocar/editSong', JSON.stringify({
		index: currentIndex,
		label: $("#AddName").val(),
		url: $("#AddUrl").val(),
	}));
}

$(function(){
    function display(bool) {
        if (bool) {
            $("#body").show();		
        } else { 
            $("#body").hide();
        }
    }
    display(false);

	window.addEventListener('message', function(event) {
		var item = event.data;
		if (item.type === "ui"){
			display(item.status);
		}

        if (item.type === "edit"){
            vueJS.songs[item.index].label = item.label;
            vueJS.songs[item.index].url = item.url;
        }

		if (item.type === "clear"){
            vueJS.songs = []
        }


        if (item.type === "add"){
			vueJS.songs.push({
				label: item.label,
				url: item.url,
			});
        }
		
		if (item.type === "timeSong"){
			var leftTime = (item.timeSong + "").toHHMMSS();

			$("#timeSong").text(locales.timeSong.format(leftTime))
		}

        if (item.type === "update"){
            $("#status").text(locales.playing);
            updateName(item.url);
        }

        if (item.type === "reset"){
            $("#status").text(locales.nothing);
            $("#nameSong").text(locales.nameSong);
            $("#timeSong").text(locales.timeSong.format("00:00:00"))
        }
		
		if (item.type === "timeWorld"){
			$("#time").text(item.timeWorld)
		}
		
		if (item.type === "volume"){
			$("#volume").text((item.volume * 100).toFixed(0) + "% ")
		}		
	})

});

$(document).keyup(function(e) {
	if (e.key === "Escape") {
		$.post('https://lg-radiocar/exit', JSON.stringify({}));
    }
});

String.prototype.toHHMMSS = function () {
    var sec_num = parseInt(this, 10); // don't forget the second param
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (hours   < 10) {hours   = "0"+hours;}
    if (minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    return hours+':'+minutes+':'+seconds;
}

if (!String.prototype.format) {
  String.prototype.format = function(...args) {
    return this.replace(/(\{\d+\})/g, function(a) {
      return args[+(a.substr(1, a.length - 2)) || 0];
    });
  };
}