var labelDiv = document.getElementById("current-label");
var addressDiv = document.getElementById("current-address");
var spawnDiv = document.getElementById("select-spawn");

window.onload = function(e) {
    $('.select-spawn > div').html(translate.spawn)
    $('.last-location-text').html(translate.select_last_position)
}

window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.action == "open") {
        $("body").fadeIn(100)
        spawns = item.spawns
    }
    if (item.action == 'close') {
        $("body").css("display", "none")
    }
    if (item.action == 'change') {
        $('#current-label').html(item.label)
        $('#current-address').html(item.address)
    }
});

$(document).on('click', '.arrow-left', function(e) {
    changeSpawnPoint("left")
});

$(document).on('click', '.arrow-right', function(e) {
    changeSpawnPoint("right")
});

$(document).on('click', '#select-spawn', function(e) {
    $.post('https://vms_spawnselector/select', JSON.stringify({
        isLastPosition: $(this).data('islastpocation')
    }))
});

$(document).on("keydown", function (event) {
    if (event.keyCode == 37) {
        changeSpawnPoint("left")
    } else if (event.keyCode == 39) {
        changeSpawnPoint("right")
    } else if (event.keyCode == 13 || event.keyCode == 32) {
        $.post('https://vms_spawnselector/select', JSON.stringify({}))
    } else if (event.keyCode == 8) {
        $.post('https://vms_spawnselector/select', JSON.stringify({
            isLastPosition: true
        }))
    }
});

changeSpawnPoint = function(direction) {
    labelDiv.classList.add('animate__animated', 'animate__fadeOutDown');
    addressDiv.classList.add('animate__animated', 'animate__fadeOutDown');
    $.post('https://vms_spawnselector/change', JSON.stringify({
        direction: direction
    }))
    setTimeout(() => {
        labelDiv.classList.remove('animate__animated', 'animate__fadeOutDown');
        addressDiv.classList.remove('animate__animated', 'animate__fadeOutDown');
        labelDiv.classList.add('animate__animated', 'animate__fadeInUp');
        addressDiv.classList.add('animate__animated', 'animate__fadeInUp');

        spawnDiv.classList.add('animate__animated', 'animate__tada');
        setTimeout(() => {
            spawnDiv.classList.remove('animate__animated', 'animate__tada');
        }, 1000);
    }, 300);
}