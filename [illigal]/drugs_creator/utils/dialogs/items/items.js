async function itemsDialog(title) {
    let div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${title || getLocalizedText("menu:items_dialog:title")}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-text">${getLocalizedText("menu:items_dialog:search_item")}</span>
                        <input type="text" class="form-control item-search">
                    </div>
    
                    <ul class="list-group mt-2 items-list scrollbar" style="overflow: auto; max-height: 70vh">
                        <li class="list-group-item list-group-item-action clickable text-warning" style="display:none;"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    `)

    const placeholderDiv = div.find(".items-list .text-warning");

    // delete the div when the modal is closed
    div.on("hidden.bs.modal", function() {
        div.remove();
    });

    div.modal("show");

    div.find(".item-search").val("").on("keyup", function() {
        const rawVal = $(this).val();
        const lowercaseText = rawVal.toLowerCase();
    
        if (rawVal) {
            placeholderDiv.text(rawVal).data("itemName", rawVal).show();
        } else {
            placeholderDiv.hide();
        }
    
        div.find(".items-list li").not(placeholderDiv).filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(lowercaseText) > -1);
        });
    });    
    
    const items = await $.post(`https://${resName}/getAllItems`)
    let itemsListDiv = div.find(".items-list");

    for(const[itemName, itemData] of Object.entries(items)) {
        let itemDiv = $(`
            <li class="list-group-item list-group-item-action clickable" data-item-name=${itemName}>${itemData.label}</li>
        `);

        itemsListDiv.prepend(itemDiv);
    }

    return new Promise((resolve) => {
        div.find(".list-group-item").click(function() {
          let itemName = $(this).data("itemName");
          div.modal("hide");
          resolve(itemName);
        });

        div.find(".item-search").keydown(function(e) {
            if (e.keyCode != 13) return;
            
            let searchContent = $(this).val();
            div.modal("hide");
            resolve(searchContent);
        });
    });
}