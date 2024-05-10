async function multiSelectDialog(title, searchBarText, elements) {
    let div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${title}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-text">${searchBarText}</span>
                        <input type="text" class="form-control element-search">
                    </div>
    
                    <ul class="list-group mt-2 elements-list scrollbar" style="overflow: auto; max-height: 70vh">
    
                    </ul>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">${getLocalizedText("menu:close")}</button>
                    <button type="button" class="btn btn-success multi-select-confirm-btn">${getLocalizedText("menu:confirm")}</button>
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

    div.find(".element-search").on("keyup", function() {
        let text = $(this).val().toLowerCase();
    
        div.find(".elements-list .form-check").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
        });
    })
    
    let itemsListDiv = div.find(".elements-list");
    
    elements.forEach(element => {
        const elementDiv = $(`
        <div class="form-check fs-3 mb-2 ms-1">
            <input class="form-check-input" type="checkbox" data-element-value="${element.value}">
            <label class="form-check-label">${element.label}</label>
        </div>
        `);

        itemsListDiv.append(elementDiv);
    });

    return new Promise((resolve) => {
        div.find(".multi-select-confirm-btn").click(function() {
            let values = [];
            div.find(".form-check-input:checked").each(function() {
                const value = $(this).data("element-value");
                values.push(value);
            });

            div.modal("hide");
            resolve(values.length > 0 ? values : null);
        });
    });
}