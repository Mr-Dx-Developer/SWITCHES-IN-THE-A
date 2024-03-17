async function accountsDialog() {
    const div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" data-translation-id="menu:accounts_dialog:title">Accounts List</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body text-center fs-5">
                    <ul class="list-group mt-2 accounts-list">

                    </ul>
                </div>
            </div>
        </div>
    </div>
    `);

    // delete the div when the modal is closed
    div.on("hidden.bs.modal", function() {
        div.remove();
    });

    let accountsList = div.find(".accounts-list");

    const accounts = await $.post(`https://${resName}/getAllAccounts`);
    accountsList.empty();

    return new Promise((resolve, reject) => {
        for(const[accountName, accountLabel] of Object.entries(accounts)) {
            let accountDiv = $(`
                <li class="list-group-item list-group-item-action clickable" value=${accountName}>${firstCharToUpperCase(accountLabel)}</li>
            `);
    
            accountDiv.click(function() {
                div.modal("hide");
                resolve(accountName);
            });
    
            accountsList.append(accountDiv);
        }
    
        div.modal("show");
    });
}

$(document).on("click", "button[data-dialog-type='account']", async function() {
	const target = $(this).data("target");
	if (!target) return console.log("No target specified");

	let targetInput;
	if (target.startsWith("#")) {
		targetInput = $(target);
	} else if (target.startsWith(".")) {
		const closestContainer = $(this).closest(".dynamic-div");
		targetInput = closestContainer.find(target);
	}

	if (targetInput.length === 0) return console.log("Target not found");

	const result = await accountsDialog();
	if (!result) return;

	targetInput.val(result);
});