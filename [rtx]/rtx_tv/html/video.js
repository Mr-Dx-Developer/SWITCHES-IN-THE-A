var videohandler = undefined

window.addEventListener("load", (event) => {
	let tvresourcenamedata = location.host;
	let tvresourcenamedata2 = tvresourcenamedata.substring(8);
	$.post('https://'+tvresourcenamedata2+'/readyyt', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;
			
	if (item.message == "playvideo") {
		if (videohandler == undefined) {
			videohandler = new YT.Player("videoframe", {
				startSeconds: item.videoseconds,
				videoId: item.videoid,
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
						event.target.setVolume(item.videovolume);
						event.target.seekTo(item.videoseconds);
						event.target.playVideo();
					},
					'onError': function(event){						
					},						
					'onStateChange': function(event){
						if (event.data == YT.PlayerState.PLAYING) {
						}
					}
				}
			});	
		} else {	
			videohandler.stopVideo();
			videohandler.destroy();		
			videohandler = new YT.Player("videoframe", {
				startSeconds: item.videoseconds,
				videoId: item.videoid,
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
						event.target.setVolume(item.videovolume);
						event.target.seekTo(item.videoseconds);
						event.target.playVideo();
					},
					'onError': function(event){						
					},						
					'onStateChange': function(event){
						if (event.data == YT.PlayerState.PLAYING) {
						}
					}
				}
			});	
		}
	}
	if (item.message == "updatevolume") {
		if (videohandler == undefined) {
		} else {	
			videohandler.setVolume(item.videovolume);	
		}
	}	
	if (item.message == "stopvideo") {
		if (videohandler == undefined) {
		} else {	
			videohandler.stopVideo();
			videohandler.destroy();
			videohandler = undefined;	
		}
	}		
});