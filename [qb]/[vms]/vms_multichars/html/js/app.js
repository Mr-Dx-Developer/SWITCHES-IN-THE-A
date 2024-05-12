var money = Intl.NumberFormat('en-US', {
	style: 'currency',
	currency: 'USD',
	minimumFractionDigits: 0
});

var slots
var selectedChar = null;
var playerCanDelete = false
var NChar = null;

(() => {
    var selectFirstChar = false
    var firstCharacter = null
    $(document).on('click', '.character', function(e) {
        var cDataPed = $(this).data('cData');
        var charDisabled = $(this).data('disabled');
        e.preventDefault();
        if (charDisabled) {return}
        if (selectedChar === null) {
            selectedChar = $(this);
            if ((selectedChar).data('cid') == "") {
                $(selectedChar).addClass("char-selected");
                ShowUI('empty')
                $("#play-text").html(translate.register);
                $("#play").fadeIn(50)
                $("#delete").fadeOut(50)
            } else {
                $(selectedChar).addClass("char-selected");
                ShowUI($(this).data('cData'));
                $("#play-text").html(translate.play);
                $("#delete-text").html(translate.delete);
                $("#play").fadeIn(50)
                $("#delete").fadeIn(50)
                $.post('https://vms_multichars/loadSkin', JSON.stringify({cData: cDataPed}));
            }
        } else if ($(selectedChar).attr('id') !== $(this).attr('id')) {
            $(selectedChar).removeClass("char-selected");
            selectedChar = $(this);
            if ((selectedChar).data('cid') == "") {
                $(selectedChar).addClass("char-selected");
                ShowUI('empty')
                $("#play-text").html(translate.register);
                $("#play").fadeIn(50)
                $("#delete").fadeOut(50)
            } else {
                $(selectedChar).addClass("char-selected");
                ShowUI($(this).data('cData'))
                $("#play-text").html(translate.play);
                $("#delete-text").html(translate.delete);
                $("#play").fadeIn(50)
                $("#delete").fadeIn(50)
                $.post('https://vms_multichars/loadSkin', JSON.stringify({cData: cDataPed}));
            }
        }
    });

    function setCharactersList() {
        var htmlResult = `
            <div class="characters">
        `
        for (let i = 1; i <= slots; i++) {
            htmlResult += `
                <div class="character" id="char-${i}" data-cid="">
                    <span id="slot-name"><i id="slot-name" class="fa-solid fa-plus"></i><span id="cid"></span></span>
                </div>
            `
        }
        htmlResult += `
            </div>
            <div class="manage_buttons">
                <div class="character-btn" id="play">
                    <p id="play-text"></p>
                </div>
                <div class="character-btn" id="delete">
                    <p id="delete-text"></p>
                </div>
            </div>
        `
        $('.characters-list').html(htmlResult)
    }

    function setupCharacters(characters) {
        $.each(characters, function(index, char){
            if (char) {
                if (char.disabled == 1) {
                    $(`#char-${char.cid}`).html("");
                    setTimeout(function(){
                        $(`#char-${char.cid}`).html(`<p id="slot-name"><i class="fa-solid fa-lock"></i></p>`);
                        $(`#char-${char.cid}`).data('cData', char)
                        $(`#char-${char.cid}`).data('cid', char.cid)
                        $(`#char-${char.cid}`).data('disabled', true)
                    }, 100)
                } else {
                    $(`#char-${char.cid}`).html("");
                    setTimeout(function(){
                        $(`#char-${char.cid}`).html(`<p id="slot-name">${char.cid}</p>`);
                        $(`#char-${char.cid}`).data('cData', char)
                        $(`#char-${char.cid}`).data('cid', char.cid)
                        if (selectFirstChar && !firstCharacter) {
                            firstCharacter = char
                            setTimeout(function(){
                                var cDataPed = firstCharacter;
                                selectedChar = $(`#char-${cDataPed.cid}`);
                                selectedChar.addClass("char-selected");
                                ShowUI(cDataPed);
                                $("#play-text").html(translate.play);
                                $("#delete-text").html(translate.delete);
                                $("#play").fadeIn(50)
                                $("#delete").fadeIn(50)
                            }, 350)
                        }
                    }, 100)
                }
            }
        })
    }

    ShowUI = function(data) {
        $("body").fadeIn(2000);
        if (data == "empty") {
            $(".main-container").fadeOut(300)
        } else {
            $(".main-container").fadeIn(300)
            $('[data-charid=1]').html(`
                <div class="character-info">
                    <p class="character-info-name"> 
                        <span class="font_charname">${data.charinfo.firstname} ${data.charinfo.lastname}</span>
                    </p>
                    <p class="character-info-work">
                        <i class="fa-solid fa-suitcase"></i>
                        <span class="font_description">${data.job.label} - ${data.job.grade.name}</span>
                    </p>
                    <p class="character-info-money">
                        <i class="fa-solid fa-wallet"></i>
                        <span class="font_description">${money.format(data.money.cash)}</span>
                    </p>
                    <p class="character-info-bank">
                        <i class="fa-solid fa-building-columns"></i>
                        <span class="font_description">${money.format(data.money.bank)}</span>
                    </p>
                    <p class="character-info-dateofbirth">
                        <i class="fa-solid fa-calendar-days"></i>
                        <span class="font_description">${data.charinfo.birthdate}</span>
                    </p>
                    <p class="character-info-gender">
                        <i class="fa-solid fa-venus-mars"></i>
                        <span class="font_description">${translate.gender[data.charinfo.gender]}</span>
                    </p>
                </div>
            `).attr("data-ischar", "true");
        }
    };

    $(document).on('click', '#play', function(e) {
        e.preventDefault();
        var charData = $(selectedChar).data('cid');
        if (selectedChar !== null) {
            if (charData !== "") {
                $.post('https://vms_multichars/selectCharacter', JSON.stringify({
                    cData: $(selectedChar).data('cData')
                }));
            } else {
                $.post('https://vms_multichars/register', JSON.stringify({
                    slots: slots,
                }))
            }
        }
    });

    $(document).on('click', '#delete', function(e) {
        e.preventDefault();
        var charData = $(selectedChar).data('cid');
        if (selectedChar !== null) {
            if (charData !== "") {
                $(".character-delete").fadeIn(250)
            }
        }
    });

    $(document).on('click', '#accept-delete', function(e) {
        e.preventDefault();
        var charData = $(selectedChar).data('cid');
        if (selectedChar !== null) {
            if (charData !== "") {
                $.post('https://vms_multichars/delete', JSON.stringify({
                    cData: $(selectedChar).data('cData')
                }))
                $(".character-delete").fadeOut(250)
            }
        }
    });

    $(document).on('click', '#cancel-delete', function(e) {
        $(".character-delete").fadeOut(250)
    });

    window.onload = function(e) {
        $('#deleting-character').html(translate.deleting_character)
        $('#are-you-sure-delete').html(translate.are_you_sure)
        $('#accept-text').html(translate.yes)
        $('#cancel-text').html(translate.no)
        window.addEventListener('message', function(event) {
            switch(event.data.action) {
                case 'loadui':
                    $("body").fadeIn(2000);
                    break;
                case 'openui':
                    NChar = event.data.character
                    ShowUI(event.data.character);
                    break;
				case 'closeui':
                    $("body").fadeOut(750)
                    $(".main-container").fadeOut(750)
		            $('[data-charid=1]').html('<h3 class="character-fullname"></h3><div class="character-info"><p class="character-info-new"></p></div>');
                    selectedChar = null;
                    firstCharacter = null
					break;
                case 'closeuiimmediately':
                    $("body").fadeOut(50)
                    $(".main-container").fadeOut(50)
		            $('[data-charid=1]').html('<h3 class="character-fullname"></h3><div class="character-info"><p class="character-info-new"></p></div>');
                    selectedChar = null;
                    firstCharacter = null
                    break
                case 'setupCharacters':
                    slots = event.data.slots
                    selectFirstChar = event.data.selectFirstChar
                    setupCharacters(event.data.characters)
                    playerCanDelete = event.data.playerCanDelete
                    setCharactersList()
                    break
                case 'loaded':
                    $.post('https://vms_multichars/loaded', JSON.stringify({}))
                    break
            }
        })
        $.post('https://vms_multichars/loaded', JSON.stringify({}))
    }
})();
