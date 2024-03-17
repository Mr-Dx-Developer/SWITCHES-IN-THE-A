let isMissingMenuDialogActive = false;

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	if (action != 'showMissingMenuDialog') return;
    if (isMissingMenuDialogActive) return; else isMissingMenuDialogActive = true;

    let div = $(`
    <div style="background: rgba(25, 25, 25, 0.7); width: 100%; height: 100%; position: absolute; display: flex; align-items: center; font-family: 'Roboto', sans-serif;">
        <div class="container border border-danger rounded py-3" style="background-color: #222; color: white; width: 50%;">
            <button type="button" class="btn-close btn-close-white float-end"></button>

            <p class="text-center fs-1">${getLocalizedText("menu:missing_menu_default")}</p>
            <p class="text-center fs-3">${getLocalizedText("menu:missing_menu_default:description")}</p>

            <div class="d-flex justify-content-center mt-3">
                <a class="btn btn-success fs-3" href="https://cdn.discordapp.com/attachments/895599870268817418/987388095169179688/menu_default.rar" target="_blank"  onclick='window.invokeNative("openUrl", "https://cdn.discordapp.com/attachments/895599870268817418/987388095169179688/menu_default.rar")'>${getLocalizedText("menu:download")}</a>
            </div>
        </div>
    </div>
    `);

    div.find('.btn-close').click(() => {
        div.remove();
        toggleCursor(false);

        isMissingMenuDialogActive = false;
    });

    
    $("html").append(div);
    toggleCursor(true);
})
