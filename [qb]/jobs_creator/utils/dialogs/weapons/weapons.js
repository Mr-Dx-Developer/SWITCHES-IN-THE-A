async function weaponsDialog() {
    let div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${getLocalizedText("menu:weapons_dialog:title")}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-text">${getLocalizedText("menu:weapons_dialog:search_weapon")}</span>
                        <input type="text" class="form-control weapon-search">
                    </div>
    
                    <ul class="list-group mt-2 weapons-list scrollbar" style="overflow: auto; max-height: 70vh">
    
                    </ul>
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

    div.find(".weapon-search").val("").on("keyup", function() {
        let text = $(this).val().toLowerCase();
    
        div.find(".weapons-list li").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
        });
    })
    
    const weapons = await $.post(`https://${resName}/getAllWeapons`)
    let weaponsListDiv = div.find(".weapons-list");
    weaponsListDiv.empty();

    for(const weaponData of weapons) {
        let weaponDiv = $(`
            <li class="list-group-item list-group-item-action clickable" data-weapon-name=${weaponData.name}>${weaponData.label}</li>
        `);

        weaponsListDiv.append(weaponDiv);
    }

    return new Promise((resolve) => {
        div.find(".list-group-item").click(function() {
          let weaponName = $(this).data("weaponName");
          div.modal("hide");
          resolve(weaponName);
        });

        div.find(".weapon-search").keydown(function(e) {
            if (e.keyCode != 13) return;
            
            let searchContent = $(this).val();
            div.modal("hide");
            resolve(searchContent);
        });
    });
}