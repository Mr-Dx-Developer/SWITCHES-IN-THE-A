let progressBarTimeout;

function startTimedProgressBar(time, text, color="#47ff33") {
    var cssLink = document.createElement("link");
    cssLink.href = "../utils/dialogs/progressbar/progressbar.css";
    cssLink.rel = "stylesheet";
    cssLink.type = "text/css";

    document.head.appendChild(cssLink);

    const div = $(`
        <section class="fixed-bottom mb-5 progressbar-section">
            <h1 class="progressbar-text">Loading...</h1>
            <ul class="loader p-0">
            
            </ul>
        </section>
    `);

    let duration = time;
    div.find("h1").text(text);

    div.find(".loader").append(`<li class="bar empty"></li>`);
    div.find(".loader").append(`<li class="background-bar"></li>`);

    div.find(".bar").css("transition-duration", `${duration}ms`);
    div.find(".background-bar").css("background-color", `${color}20`); // Aggiunge l'alpha 0.2 al colore
    
    setTimeout(() => {
        div.find(".bar").removeClass("empty");
        div.find(".bar").addClass("filled");
        div.find(".filled").css("box-shadow", `inset 0 0 10px 2px ${color}, 0 0 25px 5px ${color}, 0 0 10px 2px rgba(0, 0, 0, 0.5)`); // Aggiungi questa riga qui
    }, 100);

    progressBarTimeout = setTimeout(() => {
        div.remove();
    }, duration + 100);

    $("body").append(div);
}

function stopProgressBar() {
    clearTimeout(progressBarTimeout);
    $('.progressbar-section').remove();
}

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

    if(action == "progressBar") {
		startTimedProgressBar(data.time, data.text, data.hexColor)
	} else if(action == "stopProgressBar") {
		stopProgressBar();
	}
})