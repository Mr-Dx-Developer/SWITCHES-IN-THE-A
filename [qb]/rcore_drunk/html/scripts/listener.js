var TesterApp = new Vue({
	el: '#breath_tester',
	data:
	{
        CurrentDrunkAdded: 0,
        CurrentDrunk: 0,
        MaximumMilligramsInBlood: 6.09,
	},

    computed: {
        animatedDrunk: function() {
            return this.CurrentDrunkAdded.toFixed(1);
        },
    },

    watch: {
        CurrentDrunk: function(newValue) {
            gsap.to(this.$data, { duration: 5.0, CurrentDrunkAdded: newValue });
        },
    },

	methods: {}
})

var ClosePlayersApp = new Vue({
	el: '#close_players',
	data:
	{
		ClosestPlayers: [],
	},

    methods: {
        // User select someone and we will show modal for transfer + save data
        selectPlayer: function(id){
            $("#close_players").modal("hide");
            $.post('https://rcore_drunk/userSelectedPlayer', JSON.stringify({ SelectedID: id}));
        },
    },
})

var HudApp = new Vue({
	el: '#hud',
	data:
	{
	    Enabled: true,

        CurrentDrunkAdded: 0,
        CurrentDrunk: 0,

        CurrentHeadacheAdded: 0,
        CurrentHeadache: 0,
	},

    computed: {
        animatedDrunk: function() {
            return this.CurrentDrunkAdded.toFixed(2);
        },

        animatedHeadache: function() {
            return this.CurrentHeadacheAdded.toFixed(2);
        },
    },
    
    watch: {
        CurrentDrunk: function(newValue) {
            gsap.to(this.$data, { duration: 5.0, CurrentDrunkAdded: newValue });
        },

        CurrentHeadache: function(newValue) {
            gsap.to(this.$data, { duration: 5.0, CurrentHeadacheAdded: newValue });
        },
    },

	methods: {}
})

function sendAlert(msg, style = 'success') {
    $.notify( { message: msg,}, {
        type: style,
        showProgressbar: false,
        newest_on_top: true,
        animate:
        {
            enter: "animated bounceInRight",
            exit: "animated bounceOutRight",
        }
    });
}

function Close(){
    $("#textboard").modal("hide");
    $("#close_players").modal("hide");
    $.post('http://rcore_drunk/close', JSON.stringify({}));
}

function HideAllWarningDots(){
    $(".green_dot").hide();
    $(".orange_dot").hide();
    $(".red_dot").hide();
}

function ShowWarningByLevel(level){
    switch(level){
        case 0: $(".green_dot").show(); break;
        case 1: $(".orange_dot").show(); break;
        case 2: $(".orange_dot").show(); break;
        case 3: $(".red_dot").show(); break;
        case 4: $(".red_dot").show(); break;
    }
}

// display close players
$(function(){
    $.post('http://rcore_drunk/init', JSON.stringify({}));

	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "max_alcohol"){
            TesterApp.MaximumMilligramsInBlood = item.maxAlcohol;
        }

        if(item.type === "display_closest_players_keys"){
            ClosePlayersApp.ClosestPlayers = item.closestPlayers;

            ClosePlayersApp.$nextTick(function () {
                $('#close_players').modal({
                    backdrop: 'static',
                    keyboard: false
                });
            });
        }
	})
});

// UI state
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "UI"){
		    HudApp.Enabled = item.status;
		}
	})
});

// translation
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "translation"){
		    $(item.div).text(item.text);
		}
	})
});

// Notification
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "error_message"){
		    sendAlert(item.message, item.alert);
		}
	})
});

// show / hide tester
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "slideTester"){
		    $("#breath_tester").slideToggle(1500);
		}
	})
});

// edit value in tester
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "edit_value"){
            var finalRes = TesterApp.MaximumMilligramsInBlood * (item.drunk / 100);
            TesterApp.CurrentDrunkAdded = 0;
            TesterApp.CurrentDrunk = finalRes;

		    HideAllWarningDots();
            ShowWarningByLevel(item.level ?? 0);

		    //$("#tester_numbers").text(finalRes.toFixed(3));
		}
	})
});

// Edit values in hud for drunk / headache
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "drunk"){
            HudApp.CurrentDrunk = item.value;
		}

		if(item.type === "headache"){
            HudApp.CurrentHeadache = item.value;
		}
	})
});

// notification about confirmation
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "hideNotifTest"){
           $("#notification").hide(1500);
		}

		if(item.type === "showNotifTest"){
            $("#notification").show(1500);
		}
	})
});

// Debug
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "display_for_copy"){
			$('#textboard').modal("show");
			$(".textarea").val(item.text);
        }
	})
});