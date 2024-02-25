Decorations = {}
var houseCategorysIndex = {};
var houseCategorys = {};
var selectedObject = null;
var selectedObjectData = null;
var info = true
var audioPlayer = null;
window.addEventListener('message', function(event) {
    if (event.data.type == "playSound") {
        if (audioPlayer != null) {
            audioPlayer.pause();
        }
        audioPlayer = new Howl({
            src: ["./sounds/" + event.data.file + ".ogg"]
        });
        audioPlayer.volume(event.data.volume);
        audioPlayer.play();
    }
});
$(".container").hide();
$('document').ready(function() {
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type == 'warning') {
            showWarningMessage(item.msg);
        }
        if (item.type == "toggle") {
            if (item.status == true) {
                $(".container").fadeIn(250);
            } else {
                $(".container").fadeOut(250);
            }
        }
        if (info) {
            $("#decorate-keys").css("display", "block");
        } else {
            $("#decorate-keys").css("display", "none");
        }
        if (item.type == "setupContract") {
            $("#welcome-name").html(item.firstname + " " + item.lastname)
            $("#property-adress").html(item.street)
            $("#property-price").html("$ " + item.houseprice);
            $("#property-brokerfee").html("$ " + item.brokerfee);
            $("#property-bankfee").html("$ " + item.bankfee);
            $("#property-taxes").html("$ " + item.taxes);
            $("#property-totalprice").html("$ " + item.totalprice);
        }
        if (item.type == "setupMyObjects") {
            let sortedData = item.data.sort((a, b) => a.objectId - b.objectId);
            let myObjects = sortedData.map((item, index) => {
                return {index: index, ...item};
            });
            $('.decorate-items').html("");
            $.each(myObjects, function(i, object) {
                var elem = '<div class="decorate-item" id="myobject-' + i + '" data-type="myObject"><span id="decorate-item-name"><b>Object: </b>' + object.name + '</span><span id="decorate-item-category"><strong>Price: </strong><span id="item-price">OWNED</span></span></div>';
                $('.decorate-items').append(elem);
                $('#myobject-' + i).removeData('myObjectData');
                $('#myobject-' + i).data('myObjectData', object);
            });
            $(".decorate-items").fadeIn(150);
        }
        if (item.type == "openObjects") {
            Decorations.Open(item);
            var categoryArray = [];
            $.each(item.furniture, function(index, value) {
                categoryArray.push({
                    index: index,
                    value: value
                });
            });
            categoryArray.sort(function(a, b) {
                return a.index.localeCompare(b.index);
            });
            houseCategorys = item.furniture;
            houseCategorysIndex = categoryArray;
        }
        if (item.type == "escapeEdit") {
            selectedObjectData = null;
        }
        if (item.type == "closeUI") {
            Decorations.Close();
        }
        if (item.type == "buyOption") {
            $(".decorate-confirm").css("display", "block");
            $(".decorate-confirm").find("p").html("Are you sure you want to purchase the item for $" + selectedObjectData.price + "?");
        }
        if (item.type == "sellOption") {
            $(".decorate-sell").css("display", "block");
            $(".decorate-sell").find("p").html("Are you sure you want to sell the item for $" + item.price + "?");
        }
        if (item.type == "objectLoaded") {
            $(".decorate-item").css({
                'pointer-events': 'auto'
            });
            $(".object-load-status").css("display", "none");
        }
        if (item.type == "loadon") {
            $(".object-load-status").css("display", "block");
        }
        if (item.type == "loadoff") {
            $(".object-load-status").css("display", "none");
        }
        if (item.type == "frontcam") {
            if (item.toggle) {
                $("#house-cam").fadeIn(150);
                $("#cam-label").html(item.label);
            } else {
                $("#house-cam").fadeOut(150)
            }
        }
    })
    document.onkeyup = function(data) {
        if (data.which == 116) {
            $.post('https://ak47_qb_housing/toggleCursor');
        }
        if (data.which == 13) {
            if (selectedObjectData != null && $(".decorate-confirm").css('display') != 'block') {
                $.post('https://ak47_qb_housing/editOwnedObject', JSON.stringify({
                    objectData: selectedObjectData
                }));
                selectedObjectData = null;
                $.post('https://ak47_qb_housing/setupMyObjects', JSON.stringify({}), function(data) {
                    $('.decorate-items').html("");
                    let sortedData = data.sort((a, b) => a.objectId - b.objectId);
                    let myObjects = sortedData.map((item, index) => {
                        return {index: index, ...item};
                    });
                    $.each(myObjects, function(i, object) {
                        var elem = '<div class="decorate-item" id="myobject-' + i + '" data-type="myObject"><span id="decorate-item-name"><b>Object: </b>' + object.name + '</span><span id="decorate-item-category"><strong>Price: </strong><span id="item-price">OWNED</span></span></div>';
                        $('.decorate-items').append(elem);
                        $('#myobject-' + i).removeData('myObjectData');
                        $('#myobject-' + i).data('myObjectData', object);
                    });
                    $(".decorate-items").fadeIn(150);
                });
            } else if (selectedObject !== null && $(".decorate-confirm").css('display') != 'block') {
                var objId = $(selectedObject).attr('id');
                var objData = $('#' + objId).data('objectData');
                selectedObjectData = objData
                if (objData != null) {
                    $.post("https://ak47_qb_housing/spawnobject", JSON.stringify({
                        object: objData.object,
                    }));
                    $(".decorate-items").fadeOut(150);
                }
                selectedObject = null;
            }
        }
        if (data.which == 27) {
            Decorations.Close();
        }
    };
})
Decorations.Open = function(data) {
    $("#decorate").fadeIn(250);
}
Decorations.SetupCategorys = function() {
    $(".decorate-footer-buttons").html("");
    $(".decorate-footer-buttons").hide();
    $.each(houseCategorysIndex, function(key, category) {
        var elem = '<div class="footer-btn" id="' + category.index + '"><p>' + category.index + '</p></div>';
        $(".decorate-footer-buttons").append(elem);
        $("#" + category.index).data('categoryData', category.value)
    });
    $(".decorate-footer-buttons").fadeIn(150);
}
var selectedHeaderButton = null;
$(document).on('click', '.header-btn', function() {
    if ($(this).attr('id') == "objects-list") {
        selectedObjectData = null;
        $(".decorate-footer-buttons").html("");
        if ($(this).hasClass('header-btn-selected')) {
            $(selectedHeaderButton).removeClass('header-btn-selected');
            $(".decorate-footer-buttons").fadeOut(150);
        } else {
            $(selectedHeaderButton).removeClass('header-btn-selected');
            $(this).addClass('header-btn-selected');
            $('.decorate-items').fadeOut(150);
            Decorations.SetupCategorys();
        }
    }
    if ($(this).attr('id') == "close") {
        Decorations.Close();
    }
    if ($(this).attr('id') == "my-objects") {
        if ($(this).hasClass('header-btn-selected')) {
            $(selectedHeaderButton).removeClass('header-btn-selected');
            $('.decorate-items').fadeOut(150);
        } else {
            $(selectedHeaderButton).removeClass('header-btn-selected');
            $(this).addClass('header-btn-selected');
            $(".decorate-footer-buttons").fadeOut(150);
            $.post('https://ak47_qb_housing/setupMyObjects', JSON.stringify({}), function(data) {
                $('.decorate-items').html("");
                let sortedData = data.sort((a, b) => a.objectId - b.objectId);
                let myObjects = sortedData.map((item, index) => {
                    return {index: index, ...item};
                });
                $.each(myObjects, function(i, object) {
                    var elem = '<div class="decorate-item" id="myobject-' + i + '" data-type="myObject"><span id="decorate-item-name"><b>Object: </b>' + object.name + '</span><span id="decorate-item-category"><strong>Price: </strong><span id="item-price">OWNED</span></span></div>';
                    $('.decorate-items').append(elem);
                    $('#myobject-' + i).data('myObjectData', object);
                });
                $(".decorate-items").fadeIn(150);
            });
        }
    }
    $.post('https://ak47_qb_housing/ResetSelectedProp');
    selectedHeaderButton = this;
})
let selectedFooterButton = null
$(document).on('click', '.footer-btn', function() {
    var selectedCategory = $(this).attr('id');
    if (selectedCategory != "remove-owned-obj") {
        $(selectedFooterButton).removeClass('footer-btn-selected');
        selectedFooterButton = this
        $(selectedFooterButton).addClass('footer-btn-selected');
        $('.decorate-items').html("");
        $.each(houseCategorys[selectedCategory], function(i, item) {
            var elem = '<div class="decorate-item" id="object-' + i + '" data-type="newObject"><span id="decorate-item-name"><b>Object: </b>' + (item.name).charAt(0).toUpperCase() + '' + (item.name).substr(1).toLowerCase() + '</span><span id="decorate-item-category"><strong>Price: </strong><span id="item-price">$' + item.price + '</span></span></div>';
            $('.decorate-items').append(elem);
            $('#object-' + i).data('objectData', item);
        });
        $(".decorate-items").fadeIn(150);
    } else {
        if (selectedCategory == 'remove-owned-obj') {
            $.post('https://ak47_qb_housing/deleteSelectedObjectPrompt');
        }
    }
});
$(document).on('click', '#confirm-sell', function() {
    $(".decorate-items").html("");
    $(".decorate-footer-buttons").html("");
    $(selectedHeaderButton).removeClass('header-btn-selected');
    $.post('https://ak47_qb_housing/deleteSelectedObject');
    $(".decorate-footer-buttons").fadeOut(150);
    $(".decorate-items").fadeOut(150);
    $(".decorate-sell").css("display", "none");
});
$(document).on('click', '#cancel-sell', function() {
    $(".decorate-sell").css("display", "none");
});

$(document).on('click', '#buy-object', function() {
    $.post("https://ak47_qb_housing/buySelectedObject", JSON.stringify({
        data: selectedObjectData,
    }));
    selectedObjectData = null;
    $(".decorate-confirm").css("display", "none");
});
$(document).on('click', '#cancel-object', function() {
    $.post('https://ak47_qb_housing/cancelSelectedObject');
    selectedObjectData = null;
    $(".decorate-confirm").css("display", "none");
});
$(document).on('click', '.decorate-item', function() {
    var objId = $(this).attr('id');
    var objData = $('#' + objId).data('objectData');
    var myObjectData = $('#' + objId).data('myObjectData');
    if (selectedObject != null) {
        $(selectedObject).removeClass('selected-object');
    }
    if ($("#" + objId).data('type') == "newObject") {
        if (selectedObject == this) {
            $(this).removeClass('selected-object');
            selectedObject = null;
            $.post('https://ak47_qb_housing/removeObject');
        } else {
            $(this).addClass('selected-object');
            selectedObject = this;
            $.post("https://ak47_qb_housing/chooseobject", JSON.stringify({
                object: objData.object,
            }));
            $(".decorate-item").css({
                'pointer-events': 'none'
            });
            $(".object-load-status").css("display", "block");
        }
    } else if ($("#" + objId).data('type') == "myObject") {
        if (selectedObject == this) {
            $(this).removeClass('selected-object');
            $.post('https://ak47_qb_housing/deselectOwnedObject')
            selectedObject = null;
        } else {
            $(this).addClass('selected-object');
            selectedObject = this;
            selectedObjectData = myObjectData;
            $.post('https://ak47_qb_housing/selectOwnedObject', JSON.stringify({
                objectData: myObjectData
            }))
            $(".decorate-footer-buttons").html("");
            var elem = '<div class="footer-btn" id="remove-owned-obj"><p>Sell</p></div>';
            $(".decorate-footer-buttons").append(elem);
            $(".decorate-footer-buttons").fadeIn(150);
        }
    }
});
Decorations.Close = function() {
    $("#decorate").css("display", "none");
    $(".decorate-confirm").css("display", "none");
    $(".decorate-sell").css("display", "none");
    $(".decorate-items").css("display", "none");
    $(".decorate-footer-buttons").css("display", "none");
    if (selectedHeaderButton != null) {
        $(selectedHeaderButton).removeClass('header-btn-selected');
    }
    selectedObjectData = null;
    selectedObject = null;
    $.post("https://ak47_qb_housing/closedecorations", JSON.stringify({}));
}
$(".property-accept").click(function(e) {
    $.post('https://ak47_qb_housing/buy', JSON.stringify({}))
});
$(".property-cancel").click(function(e) {
    $.post('https://ak47_qb_housing/exit', JSON.stringify({}));
});
$(document).ready(function() {
    $('.decorate-keys').on('click', function() {
        $('#decorate-keys-slider').animate({
            width: 'toggle'
        }, 500);
        $('#decorate-keys').toggle();
        info = !info
    });
});
$(document).ready(function() {
    $('.decorate-footer-buttons').on('wheel', function(e) {
        e.preventDefault();
        var delta = e.originalEvent.deltaY;
        $(this).scrollLeft($(this).scrollLeft() + delta);
    });
});

function showWarningMessage(message) {
    $('#warning-text').text(message);
    $('#warning-screen').css('display', 'block').addClass('flash');

    setTimeout(function() {
        $('#warning-screen').removeClass('flash').css('display', 'none');
    }, 10000); // Stop flashing and hide after 10 seconds
}
