Inkjet = {}

$(document).ready(function(){
    window.addEventListener('message', function(event){
        var action = event.data.action;

        switch(action) {
            case "open":
                Inkjet.Open(event.data);
                break;
            case "close":
                Inkjet.Close(event.data);
                break;
        }
    });
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            Inkjet.Close();
            break;
        case 9: // ESC
            Inkjet.Close();
            break;
    }
});

Inkjet.Open = function(data) {
    if (data.url) {
        $(".document-container").fadeIn(150);
        $(".document-image").attr('src', data.url);
    } else {
        console.log('No URL linked to document!')
    }
}

Inkjet.Start = function(data) {
    $(".printer-container").fadeIn(150);
}

Inkjet.Close = function(data) {
    $(".printer-container").fadeOut(150);
    $(".document-container").fadeOut(150);
    $.post('https://xmmx_letscookplus/CloseDocument');
}