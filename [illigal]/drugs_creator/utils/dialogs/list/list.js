async function listDialog(title, searchBarText, elements) {
    let div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${title}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="input-group search-bar-div">
                        <span class="input-group-text">${searchBarText}</span>
                        <input type="text" class="form-control element-search">
                    </div>
    
                    <ul class="list-group mt-2 elements-list scrollbar" style="overflow: auto; max-height: 70vh">
    
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

    if(elements.length < 6) div.find(".search-bar-div").hide();

    div.modal("show");

    div.find(".element-search").val("").on("keyup", function() {
        let text = $(this).val().toLowerCase();
    
        div.find(".elements-list li").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
        });
    })
    
    let itemsListDiv = div.find(".elements-list");
    
    elements.forEach(element => {
        const elementDiv = $(`
            <li class="list-group-item list-group-item-action clickable" data-element-value=${element.value}>${element.label}</li>
        `);

        itemsListDiv.append(elementDiv);
    });

    return new Promise((resolve) => {
        div.find(".list-group-item").click(function() {
          let value = $(this).data("element-value");
          div.modal("hide");
          resolve(value);
        });

        div.find(".element-search").keydown(function(e) {
            if (e.keyCode != 13) return;
            
            let searchContent = $(this).val();
            div.modal("hide");
            resolve(searchContent);
        });
    });
}