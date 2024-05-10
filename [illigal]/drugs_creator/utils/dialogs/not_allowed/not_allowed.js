let isDialogActive = false;

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	if (action != 'showNotAllowedDialog') return;
    if (isDialogActive) return;

    const div = $(`
    <div style="background: rgba(25, 25, 25, 0.7); width: 100%; height: 100%; position: absolute; display: flex; align-items: center;"">
        <div class="container border border-danger rounded py-3" style="background-color: #222; color: white; width: 50%;">
            <button type="button" class="btn-close btn-close-white float-end"></button>

            <p class="text-center fs-1">${getLocalizedText("menu:not_allowed:you_are_not_allowed")}</p>
            <p class="text-center fs-3">${getLocalizedText("menu:not_allowed:if_you_are_admin")}</p>
            <p class="text-center fs-5 text-danger">Server restart required</p>
            
            <p class="text-center text-white fs-4 mt-5 mb-2"># Only use one of these. If one doesn't work, try another one</p>

            <div class="container text-warning p-2">
                <hr class="mb-4">

                <p class="not-allowed-steamid font-monospace"></p>
                
                <hr class="my-4">

                <p class="not-allowed-license font-monospace"></p>

                <hr class="my-4">
                
                <p class="not-allowed-license2 font-monospace"></p>
            </div>
        </div>
    </div>
    `);

    div.find('.btn-close').click(() => {
        div.remove();
        toggleCursor(false);

        isDialogActive = false;
    });

    div.find(".not-allowed-license").text(`
        add_ace identifier.license:${data.playerIdentifiers["license"]} ${data.acePermission} allow # Add permission to '${data.playerName}' Rockstar license
    `);

    div.find(".not-allowed-license2").text(`
        add_ace identifier.license2:${data.playerIdentifiers["license2"]} ${data.acePermission} allow # Add permission to '${data.playerName}' Rockstar license2
    `);

    div.find(".not-allowed-steamid").text(`
        add_ace identifier.steam:${data.playerIdentifiers["steam"]} ${data.acePermission} allow # Add permission to '${data.playerName}' Steam account
    `);

    $("html").append(div);
    toggleCursor(true);

    isDialogActive = true;
})