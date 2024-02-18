var characters = {}
var char = -1
var switching = false
var maxchars = 0
var reloading = false

$(document).ready(function() {
    $('.input-length input').characterCounter();
    $('select').formSelect();
    $('.datepicker').datepicker({format: "dd/mm/yy", yearRange: 95});

    window.addEventListener("message", function (event) {
        data = event.data;

        if (data.event == 'open') {
            characters = data.characters;
            maxchars = data.max;
            $("body").fadeIn(300);
            $('.deletechar_modal').hide();

            createSlider(characters);
            if (characters.length > 0) {
                char = 1;
                $('.container__create').hide();
                $(".container #slider").fadeIn(300);
                resolveInfo(0);
                $('.container__info').fadeIn(300);
            } else {
                $(".container #slider").hide();
                $('.container__info').hide();
                $('.container__create').fadeIn(300);
            }
        }
    });
});

$(document).on("click", ".container #slider #selectcharacter", function (e) {
    var selected = $(this).attr("data-char")
    var ele = $(this)

    if (selected != char && switching == false) {
        switching = true;
        $('.container__create').fadeOut(200);
        $('.container__info').fadeOut(200);
        
        $.post("https://qb-multicharacter/switch", JSON.stringify({ char: selected, citizenid: ele.attr("data-citizenid")}), function(data) {
            if (selected >= 0) {
                setTimeout(()=>{
                    resolveInfo(selected - 1)
                    $('.container__info').fadeIn(300);
                }, 300)
            } else {
                setTimeout(()=>{
                    $('.container__create').fadeIn(300);
                }, 300)
            }
    
            char = selected;
            setTimeout(()=>{
                switching = false;
            }, 1700)
        });
    }
});

$(document).on("click", "#createchar_button", function (e) {
    var player_firstname = $("#p_firstname").val();
    var player_lastname = $("#p_lastname").val();
    var player_gender = $("select").val();
    var player_dob = $("#p_dob").val();
    var player_nationality = $("#p_nationality").val();
    var player_backstory = $("#p_backstory").val();

    if (player_firstname == "" || player_lastname == "" || player_dob == "" || player_nationality == "") {
        return
    }
    
    var createdCharacter = {
        firstname: player_firstname,
        lastname: player_lastname,
        birthdate: player_dob,
        gender: player_gender - 1,
        nationality: player_nationality,
        backstory: player_backstory,
        cid: characters.length + 1
    }

    $.post("https://qb-multicharacter/create", JSON.stringify({ char: createdCharacter})).then((res) => {
        if (res) {
            $("body").fadeOut(300);
            $('.deletechar_modal').fadeOut(0);
            $('.container__create').fadeOut(0);
            $('.container__info').fadeOut(0);
            $(".container #slider").fadeOut(0);
        }
    });
});

$(document).on("click", "#spawnplayer_button", function (e) {
    if (!switching) {
        $.post("https://qb-multicharacter/select", JSON.stringify({ citizenid: $(`.container #slider #selectcharacter[data-char='${char}']`).attr('data-citizenid')}));
        $("body").fadeOut(500);
        $('.deletechar_modal').fadeOut(350);
        $('.container__create').fadeOut(350);
        $('.container__info').fadeOut(350);
        $(".container #slider").fadeOut(350);
    }
});

$(document).on("click", "#deleteplayer_button", function (e) {
    $(".deletechar_modal #header span").html(characters[char-1]["name"])
    $(".container").css("filter", "blur(5px)")
    setTimeout(()=>{$(".deletechar_modal").fadeIn(250);}, 200)
});

$(document).on("input", "#deleteplayer_input", function (e) {
    if ($(this).val() == characters[char-1]["name"]) {
        reloading = true;
        $('.deletechar_modal #data').fadeOut(0);
        setTimeout(()=> {$('.deletechar_modal .preloader-wrapper').fadeIn(100);}, 50)

        $.post("https://qb-multicharacter/delete", JSON.stringify({ citizenid: $(`.container #slider #selectcharacter[data-char='${char}']`).attr('data-citizenid')}))
        .then((res) => {
            if (res) {
                characters = res.characters;
                maxchars = res.max;

                createSlider(characters);
                if (characters.length > 0) {
                    char = 1;
                    $('.container__create').hide();
                    $(".container #slider").fadeIn(300);
                    resolveInfo(0);
                    $('.container__info').fadeIn(300);
                } else {
                    $(".container #slider").hide();
                    $('.container__info').hide();
                    $('.container__create').fadeIn(300);
                }

                $(".deletechar_modal").fadeOut(0);
                $(".container").css("filter", "blur(0px)")
                $('.deletechar_modal #data').fadeIn(0);
                $('.deletechar_modal .preloader-wrapper').fadeOut(0);
            } else {
                $('.deletechar_modal .preloader-wrapper').fadeOut(0);
                setTimeout(()=>{$('.deletechar_modal #data').fadeIn(250);}, 50)
            }

            reloading = false
        });
    }
});

$(document).keyup(function (e) {
	if (e.keyCode === 27 && !reloading) {
		$(".deletechar_modal").fadeOut(250);
        $(".container").css("filter", "blur(0px)")
	}
});

function resolveInfo(char) {
    var character = characters[char];
    $(".container__info #playername").html(character['name']);
    $(".container__info #c-cid").html(character['cid']);
    $(".container__info #c-cash").html(character['cash']);
    $(".container__info #c-gender").html(character['gender']);
    $(".container__info #c-bank").html(character['bank']);
    $(".container__info #c-dob").html(character['birth']);
    $(".container__info #c-job").html(character['job'].toUpperCase());
}

function createSlider(chars) {
    var slider = "";

    if (chars.length > 0) {
        slider += `<a class="btn-floating btn-small waves-effect white black-text" id="selectcharacter" data-char='1' data-citizenid='${chars[0].citizenid}'>1</a>`;
    }
    for (var i = 1; i < chars.length; i++) {
        slider += `<a class="btn-floating btn-small waves-effect white black-text" id="selectcharacter" data-char='${(i + 1)}' data-citizenid='${chars[i].citizenid}'>${(i + 1)}</a>`;
    }
    if (chars.length < maxchars) {
        slider += `<a class="btn-floating btn-small waves-effect white black-text" id="selectcharacter" data-char='create' data-citizenid='none'><i class="fa-solid fa-plus black-text"></i></a>`;
    }

    $(".container #slider").html(slider);
}

const copyToClipboard = (str) => {
    const el = document.createElement('textarea');
    el.value = str;
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
    return true
};