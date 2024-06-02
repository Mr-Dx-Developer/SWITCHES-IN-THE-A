tgiCore = {
    ResourceName: "tgiann-core",
}

window.addEventListener('message', (event) => {
    switch(event.data.type) {
        case "contextOpen":
            const element = document.getElementById("context")
            element.classList.add("display");
            element.innerHTML = event.data.text;
            break;
        case "contextClose":
            document.getElementById("context").classList.remove("display");
            break;
        case 'openMenu': 
            tgiCore.menu.open(event.data.namespace, event.data.name, event.data.data);
            break;
        case 'closeMenu':
            tgiCore.menu.close(event.data.namespace, event.data.name);
            break;
        case 'setElements':
            tgiCore.menu.setElements(event.data.newElements, event.data.namespace, event.data.name);
            break;
        case 'openListMenu':
            tgiCore.menulist.open(event.data.namespace, event.data.name, event.data.data);
            break;
        case 'closeListMenu': 
            tgiCore.menulist.close(event.data.namespace, event.data.name);
            break;
        case 'openDialogMenu':
            tgiCore.menudialog.open(event.data.namespace, event.data.name, event.data.data);
            break;
        case 'closeDialogMenu':
            tgiCore.menudialog.close(event.data.namespace, event.data.name);
            break;
    }
});

$(function() {
    $.post('https://' + tgiCore.ResourceName + '/uiLoaded', JSON.stringify({}), function(data) {
        tgiCore.lang = data
        tgiCore.menu.menuTpl()
        tgiCore.menudialog.MenuDialogTpl()
    });
})