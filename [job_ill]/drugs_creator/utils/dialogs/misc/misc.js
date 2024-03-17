/*
███████  ██████  ██████  ███    ███ ███████ 
██      ██    ██ ██   ██ ████  ████ ██      
█████   ██    ██ ██████  ██ ████ ██ ███████ 
██      ██    ██ ██   ██ ██  ██  ██      ██ 
██       ██████  ██   ██ ██      ██ ███████ 
*/

function isThereAnyErrorInForm(event) {
	event.preventDefault();
	event.stopPropagation();

    if (!event.target.checkValidity()) {
        const invalidInputs = $(event.target).find(':invalid');
        if (invalidInputs.length > 0) {
            const firstInvalidInput = invalidInputs.first();
            firstInvalidInput.focus();
        }
		
        $(event.target).addClass('was-validated')
		
        swal("ERROR", `There are ${invalidInputs.length} invalid fields somewhere!`, "error");
		
        return true;
    } else {
        // The timeout is needed because otherwise the was-validated class is added afterwards by the theme .js
        setTimeout(() => {
            $(event.target).removeClass("was-validated");
        }, 0);
        return false;
    }
}

/*
 ██████  ██████  ██       ██████  ██████  ███████ 
██      ██    ██ ██      ██    ██ ██   ██ ██      
██      ██    ██ ██      ██    ██ ██████  ███████ 
██      ██    ██ ██      ██    ██ ██   ██      ██ 
 ██████  ██████  ███████  ██████  ██   ██ ███████ 
*/

function componentToHex(c) {
    var hex = c.toString(16);

    return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r, g, b) {
    return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);

    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}

/*
████████ ██████   █████  ███    ██ ███████ ██       █████  ████████ ██  ██████  ███    ██ ███████ 
   ██    ██   ██ ██   ██ ████   ██ ██      ██      ██   ██    ██    ██ ██    ██ ████   ██ ██      
   ██    ██████  ███████ ██ ██  ██ ███████ ██      ███████    ██    ██ ██    ██ ██ ██  ██ ███████ 
   ██    ██   ██ ██   ██ ██  ██ ██      ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██      ██ 
   ██    ██   ██ ██   ██ ██   ████ ███████ ███████ ██   ██    ██    ██  ██████  ██   ████ ███████ 
*/
let TRANSLATIONS = {};
let ENGLISH_TRANSLATIONS = {};

function translateEverything() {
	$("body").find("[data-translation-id], [data-bs-toggle='tooltip']").each(function() {
		let translationId = $(this).data("translationId")

		if( $(this).data("bsToggle") == "tooltip" ) {
			if ($(this).tooltip) {
				$(this).tooltip('dispose');
			}
	
			$(this).attr("data-bs-title", getLocalizedText(translationId));
			$(this).tooltip();
		} else {
			$(this).prop("innerHTML", getLocalizedText(translationId));
		}

	})
} 

function refreshTranslations(locale) {
	$.ajax({
		url: `menu_translations/en.json`,
		success: function (translationsJSON) {
			ENGLISH_TRANSLATIONS = JSON.parse(translationsJSON);

			$.ajax({
				url: `menu_translations/${locale}.json`,
				success: function (translationsJSON) {
					TRANSLATIONS = JSON.parse(translationsJSON);
		
					translateEverything();
				}
			});
		}
	});
}

function loadTranslations() {
	$.ajax({
		url: `https://${resName}/getLocale`,
		success: function (locale) {
			refreshTranslations(locale);
		}
	});
} loadTranslations();

function getLocalizedText(text) {
	return TRANSLATIONS[text] || ENGLISH_TRANSLATIONS[text] || text;
}

/*
 ██████  ██████   ██████  ██████  ██████  ███████ 
██      ██    ██ ██    ██ ██   ██ ██   ██ ██      
██      ██    ██ ██    ██ ██████  ██   ██ ███████ 
██      ██    ██ ██    ██ ██   ██ ██   ██      ██ 
 ██████  ██████   ██████  ██   ██ ██████  ███████ 
*/

async function getCurrentCoords() {
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/getCurrentCoords`, {}, function(coords) {
			resolve(coords);
		})
	});
}

async function chooseCoords() {
	$("html").hide();

	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/chooseCoordinates`, {}, function(data) {
			$("html").show();

			resolve(data);
		})
	});
}

async function getCurrentCoordsAndHeading() {
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/getCurrentCoordsAndHeading`, {}, function(data) {
			resolve(data);
		})
	});
}

/*
 ██████  ████████ ██   ██ ███████ ██████  
██    ██    ██    ██   ██ ██      ██   ██ 
██    ██    ██    ███████ █████   ██████  
██    ██    ██    ██   ██ ██      ██   ██ 
 ██████     ██    ██   ██ ███████ ██   ██ 
*/

async function getJobLabel(jobName) {
    return new Promise((resolve, reject) => {
        $.post(`https://${resName}/getJobLabel`, JSON.stringify({ jobName: jobName }), function (jobLabel) {
            resolve(jobLabel);
        })
    })
}

function getFramework() {
	return new Promise((resolve) => {
		$.post(`https://${resName}/getFramework`, {}, (framework) => {
			resolve(framework)
		})
	}) 
}

function firstCharToUpperCase(string) {
	return string.charAt(0).toUpperCase() + string.slice(1);
}

function setTomSelectValue(id, value) {
    // If id starts with #, remove it
    if(id[0] == "#") id = id.substring(1);

    let select = document.getElementById(id);
    let control = select.tomselect;
    if(!control) return;

    control.setValue(value);
}  

/*
███    ██  ██████  ████████ ██ ███████ ██  ██████  █████  ████████ ██  ██████  ███    ██ ███████ 
████   ██ ██    ██    ██    ██ ██      ██ ██      ██   ██    ██    ██ ██    ██ ████   ██ ██      
██ ██  ██ ██    ██    ██    ██ █████   ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██ ███████ 
██  ██ ██ ██    ██    ██    ██ ██      ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██      ██ 
██   ████  ██████     ██    ██ ██      ██  ██████ ██   ██    ██    ██  ██████  ██   ████ ███████ 
*/
const cssLink = document.createElement("link");
cssLink.href = "../utils/dialogs/misc/misc.css";
cssLink.rel = "stylesheet";
cssLink.type = "text/css";

document.head.appendChild(cssLink);

async function showServerResponse(response) {
	if(response == null) return;

	if(response === true) {
		swal("SUCCESS", "", "success");

	} else {
		swal("ERROR", response || "", "error");
	}
}

async function confirmDeletion(message) {
	const wantsToDelete = await swal({
		title: getLocalizedText("menu:are_you_sure"),
		text: message,
		icon: "warning",
		buttons: true,
		dangerMode: true,
	});
	return wantsToDelete;
}