window.addEventListener("message", function(event) {
    var v = event.data  

    switch (v.action) {
        case 'open': 
			// cashRegListItemScanned = JSON.parse(itemScanned)
			 Baby = JSON.parse(v.baby)
			 Couffin = JSON.parse(v.couffin)
			 Stroller = JSON.parse(v.stroller)
			 // aff("Accueil pseudo "+CurrentPseudo)
			 $('.BabyCard').remove()
			 $('.Main').fadeIn(500)
			for (let i = 0; Baby[i] && i < 500; i++) {
				// console.log("Baby name : "+Baby[i].uiname+" qte: "+Baby[i].model)
				$('.ListPart').append(`
					<div class = "BabyCard" id = "pata_baby" onclick = "SpawnBaby(this,'`+Baby[i].model+`')">
					<div class = "BabyImage">
						<img class = "tooltipHeaderImg" src="img/`+Baby[i].model+`.png" />
					</div>
					<div class = "BabyText">
						`+Baby[i].uiname+`
					</div>
				</div>
					`)
			}
			for (let i = 0; Couffin[i] && i < 500; i++) {
				// console.log("Couffin name : "+Couffin[i].uiname+" qte: "+Couffin[i].model)
				$('.ListPart').append(`
					<div class = "BabyCard" id = "pata_baby" onclick = "SpawnCouffin(this,'`+Couffin[i].model+`')">
					<div class = "BabyImage">
						<img class = "tooltipHeaderImg" src="img/`+Couffin[i].model+`.png" />
					</div>
					<div class = "BabyText">
						`+Couffin[i].uiname+`
					</div>
				</div>
					`)
			}
			for (let i = 0; Stroller[i] && i < 500; i++) {
				// console.log("Stroller name : "+Stroller[i].uiname+" qte: "+Stroller[i].model)
				$('.ListPart').append(`
					<div class = "BabyCard" id = "pata_baby" onclick = "SpawnStroller(this,'`+Stroller[i].model+`')">
					<div class = "BabyImage">
						<img class = "tooltipHeaderImg" src="img/`+Stroller[i].model+`.png" />
					</div>
					<div class = "BabyText">
						`+Stroller[i].uiname+`
					</div>
				</div>
					`)
			}
        break;

        
		
		case 'quit':
			CloseAll()
		break;

    }
});

$(document).keyup((e) => {
    if (e.key === "Escape") {
        CloseAll()
    }
});

function CloseAll(){
	
	$('.Main').fadeOut(500)                       

	$.post('https://PataBearScript/exit', JSON.stringify({}));
}

function SpawnBaby(azera,model){
	animationButton(azera)
	setTimeout(function(){
		$.post('https://PataBearScript/SpawnBaby', JSON.stringify({model : model}));
		CloseAll()
	},700);
}

function SpawnCouffin(azera,model){
	animationButton(azera)
	setTimeout(function(){
		$.post('https://PataBearScript/SpawnCouffin', JSON.stringify({model : model}));
		CloseAll()
	},700);
}

function SpawnStroller(azera,model){
	animationButton(azera)
	setTimeout(function(){
		$.post('https://PataBearScript/SpawnStroller', JSON.stringify({model : model}));
		CloseAll()
	},700);
}

function Store(e,model){
	// animationButton(azera)
	// setTimeout(function(){
		$.post('https://PataBearScript/Store', JSON.stringify({}));
		CloseAll()
	// },700);
}

var bubblyButtons = document.getElementsByClassName("BabyCard");
console.log("bubblyButtons "+bubblyButtons)
console.log("bubblyButtons numb "+bubblyButtons.length)
for (var i = 0; i < bubblyButtons.length; i++) {
  console.log("animate button")
  bubblyButtons[i].addEventListener('click', animateButton, false);
}

function animationButton(e) {
console.log("animate the button"+bubblyButtons)
  e.preventDefault;
  //reset animation
  e.classList.remove('animate');
  
  e.classList.add('animate');
  setTimeout(function(){
    e.classList.remove('animate');
  },700);
};