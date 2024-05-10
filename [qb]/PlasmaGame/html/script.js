$(function() {
	window.addEventListener('message', function(event) {
		if (event.data.type == "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none";
		}
	});

	document.onkeyup = function (data) {
		if (data.which == 27) { // Escape key
			$.post('https://PlasmaGame/escape', JSON.stringify({}));
		}
	};
	
	$("#register").submit(function(event) {
		event.preventDefault(); // Prevent form from submitting
		// console.log("yolo")
		// f=$('#NbImpact :selected').text()
		// a = $("#sessionName").val()
		// b = $("#creatorPseudo").val()
		// c = $("#NbPersEquip").val()
		// d = $("#NbManche").val()
		// e = $("#NbImpact").val()
		// console.log(a)
		// console.log(b)
		// console.log("NbPersEquip "+c)
		// console.log(d)
		// console.log(e)
		// console.log(f)
		
		
		
		// Verify date
		
		$.post('https://PlasmaGame/validate', JSON.stringify({
			
			sessionname: $("#sessionName").val(),
			creatorname: $("#creatorPseudo").val(),
			nbpersequip: $("#NbPersEquip").val(),
			nbmanche: $("#NbManche").val(),
			// nbimpact: $("#NbImpact").val(),
			
			
			// firstname: $("#firstname").val(),
			// lastname: $("#lastname").val(),
			// dateofbirth: date,
			// sex: $(".sex:checked").val(),
			// height: $("#height").val(),
			// resident: $(".resident:checked").val(),
			
		}));
	});
});
