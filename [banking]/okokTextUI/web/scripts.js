played_sound = false
position = ''

function removeClass() {
	$("#main").removeClass();
	$("#wrapper").removeClass();
}

window.addEventListener('message', function(event) {
	var sound = new Audio('sound.mp3');
	sound.volume = 0.5;

	if (event.data.action == 'open') {
		position = event.data.position;
		message = event.data.message;

		$('#message').html(message);

		if (position == 'right') {
			$('#ui').css('left', '');
			$('#ui').css('right', '1%');
			$('#ui').removeClass('hideright');
			$('#ui').addClass('showright');
		} 
		if (position == 'left') {
			$('#ui').css('right', '');
			$('#ui').css('left', '1%');
			$('#ui').removeClass('hideleft');
			$('#ui').addClass('showleft');
		}   
        
		if (event.data.color == 'lightblue') { // Light Blue
			removeClass();
			$('#main').addClass('lightblue-icon');
			$('#wrapper').addClass('lightblue lightblue-border');
		} else if (event.data.color == 'lightgreen') { // Light Green
			removeClass();
			$('#main').addClass('lightgreen-icon');
			$('#wrapper').addClass('lightgreen lightgreen-border');
		} else if (event.data.color == 'lightred') { // Light Red
			removeClass();
			$('#main').addClass('lightred-icon');
			$('#wrapper').addClass('lightred lightred-border');
		} else if (event.data.color == 'lightgrey') { // Light Red
			removeClass();
			$('#main').addClass('lightgrey-icon');
			$('#wrapper').addClass('lightgrey lightgrey-border');
		} else if (event.data.color == 'darkblue') { // Dark Blue
			removeClass();
			$('#main').addClass('darkblue-icon');
			$('#wrapper').addClass('darkblue darkblue-border');
		} else if (event.data.color == 'darkgreen') { // Dark Green
			removeClass();
			$('#main').addClass('darkgreen-icon');
			$('#wrapper').addClass('darkgreen darkgreen-border');
		} else if (event.data.color == 'darkred') { // Dark Red
			removeClass();
			$('#main').addClass('darkred-icon');
			$('#wrapper').addClass('darkred darkred-border');
		} else if (event.data.color == 'darkgrey') { // Dark Grey
			removeClass();
			$('#main').addClass('darkgrey-icon');
			$('#wrapper').addClass('darkgrey darkgrey-border');
		}

		if (played_sound == false) {
			sound.play();
			played_sound = true;
		}

	} else if (event.data.action == 'close') {

		if (position == 'right') {
			$('#ui').removeClass('hideleft');
			$('#ui').removeClass('showleft');
			$('#ui').removeClass('showright');
			$('#ui').addClass('hideright');
		} 

		if (position == 'left') {
			$('#ui').removeClass('hideright');
			$('#ui').removeClass('showright');
			$('#ui').removeClass('showleft');
			$('#ui').addClass('hideleft');
		}
	}

	played_sound = false;
})

