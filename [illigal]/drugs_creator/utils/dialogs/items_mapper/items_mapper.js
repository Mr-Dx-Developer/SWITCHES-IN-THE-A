async function itemsMapperDialog(items = []) {
    if(items.length == 0) return {};
    
    let div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${getLocalizedText("menu:items_dialog:title")}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <p class="text-warning">${getLocalizedText("menu:required_items_info")}</p>
    
                    <ul class="list-group mt-2 items-list scrollbar" style="overflow: auto; max-height: 70vh">
    
                    </ul>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary use-placeholders-btn">${getLocalizedText("menu:use_placeholders")}</button>
                    <button type="button" class="btn btn-success keep-items-names-btn" data-bs-dismiss="modal">${getLocalizedText("menu:keep_items_names")}</button>
                </div>
            </div>
        </div>
    </div>
    `)

    // delete the div when the modal is closed
    div.on("hidden.bs.modal", function() {
        div.remove();
    });

    div.modal("show");
    
    let itemsListDiv = div.find(".items-list");

    const itemsExistance = await $.post(`https://${GetParentResourceName()}/getItemsExistance`, JSON.stringify(items));

    let nameMap = {};

    items.forEach(itemName => {
        const elementToAdd = $(`
        <li class="list-group-item list-group-item-action d-flex align-content-center justify-content-between">
            <span class="item-names-wrap my-auto">
                <span class="original-name" data-item-name="${itemName}">${itemName}</span>
                <span class="new-name text-success ms-2" style="display:none;" data-new-item-name=""></span>
            </span>
            <button type="button" class="btn btn-secondary col-auto choose-item-btn"><i class="bi bi-list-ul"></i></button>	
        </li>
        `);
    
        nameMap[itemName] = "CHANGE_ITEM_NAME";
    
        elementToAdd.find(".choose-item-btn").click(async() => {
            const newName = await itemsDialog();
            if (!newName) return;
    
            elementToAdd.find(".original-name").css("text-decoration", "line-through");    
            elementToAdd.find(".new-name").data("newItemName", newName).text(newName).show();

            nameMap[itemName] = newName;
        });
    
        itemsExistance[itemName] ? elementToAdd.addClass("text-success") : elementToAdd.addClass("text-danger");
    
        itemsListDiv.append(elementToAdd);
    });
    
    return new Promise((resolve) => {
        div.find(".use-placeholders-btn").click(() => {
            resolve(nameMap);
            div.modal("hide");
        });
    
        div.find(".keep-items-names-btn").click(() => {
            Object.keys(nameMap).forEach(key => {
                if (nameMap[key] === "CHANGE_ITEM_NAME") nameMap[key] = key;
            });
            resolve(nameMap);
            div.modal("hide");
        });
    });    
}