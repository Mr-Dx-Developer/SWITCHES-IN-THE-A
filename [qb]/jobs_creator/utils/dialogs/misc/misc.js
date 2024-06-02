/*
██ ███    ██ ████████ ██████   ██████  
██ ████   ██    ██    ██   ██ ██    ██ 
██ ██ ██  ██    ██    ██████  ██    ██ 
██ ██  ██ ██    ██    ██   ██ ██    ██ 
██ ██   ████    ██    ██   ██  ██████  
*/
function registerIntroView(introName) {
	$.post(`https://${resName}/registerIntroView`, JSON.stringify({introName}));
}

async function hasIntroBeenViewed(introName) {
	return await $.post(`https://${resName}/hasIntroBeenViewed`, JSON.stringify({introName}));
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

function setTomSelectValue(id, value) {
    // If id starts with #, remove it
    if(id[0] == "#") id = id.substring(1);

    let select = document.getElementById(id);
    let control = select.tomselect;
    if(!control) return;

    control.setValue(value);
}  