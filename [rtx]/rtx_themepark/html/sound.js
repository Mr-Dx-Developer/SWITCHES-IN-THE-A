var themeparkresourcename = "rtx_themepark";
var soundhandler = {}
var soundcheckerhandler = {}

window.addEventListener('message', function (event) {

	var item = event.data;
	
	
	if (item.message == "playsound") {
		if (item.soundcategory == "youtube") {
			if (soundhandler[item.soundid] == undefined) {
				$("body").append("<div id='"+ item.soundid +"'></div>");
				soundhandler[item.soundid] = new YT.Player(""+ item.soundid +"", {

					startSeconds:Number,
					videoId: item.soundsrc,
					origin: window.location.href,
					enablejsapi: 1,
					width: "0",
					height: "0",
					playerVars: {
						playsinline: 1,
						controls: 0,
					},					
					events: {
						'onReady': function(event){
							event.target.unMute();
							event.target.setVolume(item.soundvolume);
							event.target.playVideo();
						},
						'onError': function(event){
							$.post('https://'+themeparkresourcename+'/sounderror', JSON.stringify({
								soundid: item.soundid
							}));  								
						},						
						'onStateChange': function(event){
							if (event.data == YT.PlayerState.PLAYING) {
								$.post('https://'+themeparkresourcename+'/updatesounddata', JSON.stringify({
									soundid: item.soundid,
									soundname: soundhandler[item.soundid].getVideoData().title,
									soundtime: soundhandler[item.soundid].getCurrentTime(),
									soundtimemax: soundhandler[item.soundid].getDuration()
								}));  
							}
							if (event.data == YT.PlayerState.ENDED) {
								$.post('https://'+themeparkresourcename+'/soundend', JSON.stringify({
									soundid: item.soundid
								}));  								
							}
						}
					}
				});	
			} else {			
				if (typeof soundhandler[item.soundid].setVolume === 'function') {
				  soundhandler[item.soundid].setVolume(item.soundvolume);	
				}			
			}				
		} else {
			if (soundhandler[item.soundid] == undefined) {
				soundhandler[item.soundid] = new Howl({
				  src: item.soundsrc,
				  volume: item.soundvolume,
				  loop: false,
				  html5: true,
				  onplay: function(){
					$.post('https://'+themeparkresourcename+'/updatesounddata', JSON.stringify({
						soundid: item.soundid,
						soundname: "MP3",
						soundtime: soundhandler[item.soundid].seek(),
						soundtimemax: soundhandler[item.soundid].duration()
					}));  
				  },				  
				  onend: function() {
					$.post('https://'+themeparkresourcename+'/soundend', JSON.stringify({
						soundid: item.soundid
					}));															   	 		
				  }  
				});	
				
				soundhandler[item.soundid].play();
			} else {			
				if (typeof soundhandler[item.soundid].volume === 'function') {
					soundhandler[item.soundid].volume(item.soundvolume);	
				}							
				if (soundhandler[item.soundid].playing() == false) {
					soundhandler[item.soundid].play();	
				}				
			}			
		}
	}
	if (item.message == "checkmusicurl") {
		$("body").append("<div id='videourlcheckyoutube'></div>");
		soundcheckerhandler["videourlcheckyoutube"] = new YT.Player("videourlcheckyoutube", {
			startSeconds:Number,
			videoId: item.soundsrc,
			origin: window.location.href,
			enablejsapi: 1,
			width: "0",
			height: "0",
			playerVars: {
				playsinline: 1,
				controls: 0,
			},				
			events: {
				'onReady': function(event){
					event.target.setVolume(0);
					event.target.playVideo();
				},		
				'onError': function(event){
					$.post('https://'+themeparkresourcename+'/checkdone', JSON.stringify({
						soundallowed: false,
					}));  
					soundcheckerhandler["videourlcheckyoutube"].stopVideo();
					soundcheckerhandler["videourlcheckyoutube"].destroy();
					soundcheckerhandler["videourlcheckyoutube"] = null;						
				},						
				'onStateChange': function(event){
					if (event.data == YT.PlayerState.PLAYING) {
						$.post('https://'+themeparkresourcename+'/checkdone', JSON.stringify({
							soundallowed: true,
						}));  
						soundcheckerhandler["videourlcheckyoutube"].stopVideo();
						soundcheckerhandler["videourlcheckyoutube"].destroy();
						soundcheckerhandler["videourlcheckyoutube"] = null;					
					}
				}
			}					
		});										
	}	
	if (item.message == "updatesounddata") {
		if (soundhandler[item.soundid] == undefined) {
		} else {
			if (item.soundcategorytype == "youtube") {
				if (soundhandler[item.soundid].getPlayerState() == 1) {
					$.post('https://'+themeparkresourcename+'/updatesounddata', JSON.stringify({
						soundid: item.soundid,
						soundname: soundhandler[item.soundid].getVideoData().title,
						soundtime: soundhandler[item.soundid].getCurrentTime(),
						soundtimemax: soundhandler[item.soundid].getDuration()
					}));  										
				}
			} else {
				if (soundhandler[item.soundid].playing() == true) {
					$.post('https://'+themeparkresourcename+'/updatesounddata', JSON.stringify({
						soundid: item.soundid,
						soundname: "MP3",
						soundtime: soundhandler[item.soundid].seek(),
						soundtimemax: soundhandler[item.soundid].duration()
					}));  
				}					
			}			
		}
	}		
	
	if (item.message == "setsoundtime") {
		if (soundhandler[item.soundid] == undefined) {
		} else {
			if (item.soundcategorytype == "youtube") {
				soundhandler[item.soundid].seekTo(item.timedata);
			} else {
				soundhandler[item.soundid].seek(item.timedata);
			}			
		}
	}			
	
	if (item.message == "stopsound") {
		if (soundhandler[item.soundid] == undefined) {
		} else {
			if (item.soundcategorytype == "youtube") {
                soundhandler[item.soundid].stopVideo();
                soundhandler[item.soundid].destroy();
                soundhandler[item.soundid] = null;
				$("#'"+ item.soundid +"'").remove();
			} else {
				soundhandler[item.soundid].stop()
				soundhandler[item.soundid] = null;	
			}			
		}
	}
	if (item.message == "updateinterfacedata") {
		themeparkresourcename = item.themeparkresourcenamedata;
		let root = document.documentElement;
		root.style.setProperty('--color', item.interfacecolordata);	
	}			
});