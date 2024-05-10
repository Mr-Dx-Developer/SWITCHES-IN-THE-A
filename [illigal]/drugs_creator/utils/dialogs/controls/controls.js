async function controlsDialog() {
    const div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${ getLocalizedText("menu:controls_dialog:title") }</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body text-center" >
                    <p class="info-text text-warning">${ getLocalizedText("menu:controls_dialog:info_1") }</p>
                    <p class="info-text-3 text-danger" style="display:none">${ getLocalizedText("menu:controls_dialog:info_3") }</p>

                    <div class="scrollbar" style="max-height:60vh; overflow-y:auto; overflow-x:hidden;">
                        <table class="table table-hover" style="display:none">
                            <thead>
                                <tr>
                                    <th class="col-3">ID</th>
                                    <th class="col-4">Default</th>
                                    <th class="col">Name</th>
                                </tr>
                            </thead>
                            <tbody class="controls-list text-break">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `);

    // delete the div when the modal is closed
    div.on("hidden.bs.modal", function() {
        div.remove();
    });

    div.modal("show");

    let controlsList = div.find(".controls-list");

    const controls = await $.post(`https://${resName}/detectPressedControls`);
    controlsList.empty();

    return new Promise((resolve, reject) => {
        controls.forEach(control => {
            let row = $(`<tr class="clickable" value=${control.id}><td>${control.id}</td><td>${control.default}</td><td>${control.name}</td></tr>`);
            row.click(() => {
                div.modal("hide");
                resolve(control.id);
            });
            controlsList.append(row);
        });

        div.find("table").show();
        div.find(".info-text").text(getLocalizedText("menu:controls_dialog:info_2"));
        div.find(".info-text-3").show();
    });
}

$(document).on("click", "input[data-dialog-type='control']", async function() { 
	const result = await controlsDialog();
	if (!result) return;

	$(this).val(result);
});