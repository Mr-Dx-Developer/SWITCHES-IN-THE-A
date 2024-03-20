localStorage.setItem('button', '0')
localStorage.setItem('buttons', '0')

localStorage.setItem('display', '8')

function OpenMenu() {
    $('.menu-container-visibility').show();
}

function CloseMenu() {
    $('.menu-container-visibility').hide();
}


function DisplayMenu(toggle, properties) {
    if (toggle) {
        localStorage.setItem('button', '0')

        if (properties.title) {
            $('.title').html(properties.title)
        } else {
            $('.title').empty()
        }

        if (properties.subtitle) {
            if (+localStorage.getItem('buttons') > +localStorage.getItem('display')) {
                $('#subtitle-left').html(properties.subtitle)
                $('#subtitle-right').html(`${+localStorage.getItem('button') + 1}/${+localStorage.getItem('buttons')}`)
            } else {
                $('#subtitle-left').html(properties.subtitle)
                $('#subtitle-right').empty()
            }
        } else {
            $('#subtitle-left').empty()
            $('#subtitle-right').empty()
        }

        if (+localStorage.getItem('buttons')) {
            const button = $('.button-container').first()

            if (!button.hasClass('button-container-selected')) {
                button.addClass('button-container-selected')

                button.children('#button-left').addClass('button-selected')
                button.children('#button-right').addClass('button-selected')
            }
        }
    } else {
        localStorage.setItem('button', '0')
        localStorage.setItem('buttons', '0')

        $('.title').empty()

        $('#subtitle-left').empty()
        $('#subtitle-right').empty()

        const buttons = $('.button-container')

        buttons.each((index) => {
            $(buttons[index]).remove()
        })
    }
}

function DisplayMenuStyle(toggle, properties) {
    if (toggle) {
        if (properties.titleColor) {
            $('.title').css('color', properties.titleColor)
        } else {
            $('.title').removeAttr('style')
        }

        if (properties.titleBackground) {
            $('.title-container').css('background', properties.titleBackground)
        } else {
            $('.title-container').removeAttr('style')
        }

        if (properties.subtitleColor) {
            $('.subtitle').css('color', properties.subtitleColor)
        } else {
            $('.subtitle').removeAttr('style')
        }

        if (properties.subtitleBackground) {
            $('.subtitle-container').css('background', properties.subtitleBackground)
        } else {
            $('.subtitle-container').removeAttr('style')
        }
    } else {
        $('.title').removeAttr('style')
        $('.title-container').removeAttr('style')
        $('.subtitle').removeAttr('style')
        $('.subtitle-container').removeAttr('style')
    }
}

function DisplayMenuButton(index, button, action) {
    if (action === 'CREATE') {
        if (+localStorage.getItem('buttons')) {
            localStorage.setItem('buttons', +localStorage.getItem('buttons') + 1)

            if (index) {
                $($('.button-container')[index - 1]).after(`<div class="button-container"><div class="button" id="button-left">${button.title}</div><div class="button" id="button-right">${button.subtitle}</div></div>`)
            } else {
                $($('.button-container')[index]).before(`<div class="button-container"><div class="button" id="button-left">${button.title}</div><div class="button" id="button-right">${button.subtitle}</div></div>`)
            }

            const currentButton = $($('.button-container')[index])

            if (button.subtitle) {
                currentButton.children('#button-right').html(button.subtitle)
            } else {
                currentButton.children('#button-right').empty()
            }

            if (button.available) {
                currentButton.children('#button-left').removeAttr('style')
                currentButton.children('#button-right').removeAttr('style')
            } else {
                currentButton.children('#button-left').css('color', 'rgb(155, 155, 155)')
                currentButton.children('#button-right').css('color', 'rgb(155, 155, 155)')
            }

            if (+localStorage.getItem('button') === index) {
                ScrollDown()
            } else if (+localStorage.getItem('button') > index) {
                if (+localStorage.getItem('button') < +localStorage.getItem('buttons') - 1) {
                    localStorage.setItem('button', +localStorage.getItem('button') + 1)
                } else {
                    localStorage.setItem('button', '0')
                }
            }

            if (+localStorage.getItem('buttons') > +localStorage.getItem('display')) {
                if ($('.button-container').index($('.button-container:visible').last()) === index) {
                    currentButton.hide()
                }
            }

            if ($('#subtitle-left').text() && +localStorage.getItem('buttons') > +localStorage.getItem('display')) {
                $('#subtitle-right').html(`${+localStorage.getItem('button') + 1}/${+localStorage.getItem('buttons')}`)
            }
        } else {
            localStorage.setItem('button', '0')
            localStorage.setItem('buttons', +localStorage.getItem('buttons') + 1)

            $('.menu-container').children().last().after(`<div class="button-container button-container-selected"><div class="button button-selected" id="button-left">${button.title}</div><div class="button button-selected" id="button-right">${button.subtitle}</div></div>`)

            const currentButton = $('.button-container')

            if (button.subtitle) {
                currentButton.children('#button-right').html(button.subtitle)
            } else {
                currentButton.children('#button-right').empty()
            }

            if (button.available) {
                currentButton.children('#button-left').removeAttr('style')
                currentButton.children('#button-right').removeAttr('style')
            } else {
                currentButton.children('#button-left').css('color', 'rgb(155, 155, 155)')
                currentButton.children('#button-right').css('color', 'rgb(155, 155, 155)')
            }
        }
    }

    if (action === 'UPDATE') {
        if (+localStorage.getItem('buttons')) {
            const currentButton = $($('.button-container')[index])

            if (button.title) {
                currentButton.children('#button-left').html(button.title)
            } else {
                currentButton.children('#button-left').empty()
            }

            if (button.subtitle) {
                currentButton.children('#button-right').html(button.subtitle)
            } else {
                currentButton.children('#button-right').empty()
            }

            if (button.available) {
                currentButton.children('#button-left').removeAttr('style')
                currentButton.children('#button-right').removeAttr('style')
            } else {
                currentButton.children('#button-left').css('color', 'rgb(155, 155, 155)')
                currentButton.children('#button-right').css('color', 'rgb(155, 155, 155)')
            }
        }
    }

    if (action === 'DELETE') {
        if (+localStorage.getItem('buttons')) {
            localStorage.setItem('buttons', +localStorage.getItem('buttons') - 1)

            $($('.button-container')[index]).remove()

            if (+localStorage.getItem('button') === index) {
                ScrollUp()
            } else if (+localStorage.getItem('button') > index) {
                if (+localStorage.getItem('button') > 0) {
                    localStorage.setItem('button', +localStorage.getItem('button') - 1)
                } else {
                    localStorage.setItem('button', +localStorage.getItem('buttons') - 1)
                }
            }

            if (+localStorage.getItem('buttons') >= +localStorage.getItem('display')) {
                $('.button-container:visible').last().next().show()
            }

            if (+localStorage.getItem('buttons') <= +localStorage.getItem('display')) {
                $('#subtitle-right').empty()
            }
        }
    }
}



function ScrollUp() {
    let currentButton = undefined
    let previousButton = undefined

    const buttons = $('.button-container')

    if (+localStorage.getItem('buttons')) {
        previousButton = $(buttons[+localStorage.getItem('button')])

        if (previousButton.hasClass('button-container-selected')) {
            previousButton.removeClass('button-container-selected')

            previousButton.children('#button-left').removeClass('button-selected')
            previousButton.children('#button-right').removeClass('button-selected')
        }
    }

    if (+localStorage.getItem('button') > 0) {
        localStorage.setItem('button', +localStorage.getItem('button') - 1)

        currentButton = $(buttons[+localStorage.getItem('button')])

        if (currentButton.css('display') === 'none') {
            currentButton.show()

            $(buttons[+localStorage.getItem('button') + +localStorage.getItem('display')]).hide()
        }
    } else {
        localStorage.setItem('button', +localStorage.getItem('buttons') - 1)

        currentButton = $(buttons[+localStorage.getItem('button')])

        for (let index = +localStorage.getItem('buttons') - 1; index > -1; index--) {
            if (+localStorage.getItem('buttons') - index - 1 < +localStorage.getItem('display')) {
                $(buttons[index]).show()
            } else {
                $(buttons[index]).hide()
            }
        }
    }

    if (+localStorage.getItem('buttons')) {
        currentButton = $(buttons[+localStorage.getItem('button')])

        if (!currentButton.hasClass('button-container-selected')) {
            currentButton.addClass('button-container-selected')

            currentButton.children('#button-left').addClass('button-selected')
            currentButton.children('#button-right').addClass('button-selected')
        }
    }

    if ($('#subtitle-left').text() && +localStorage.getItem('buttons') > +localStorage.getItem('display')) {
        $('#subtitle-right').html(`${+localStorage.getItem('button') + 1}/${+localStorage.getItem('buttons')}`)
    }
}

function ScrollDown() {
    let currentButton = undefined
    let previousButton = undefined

    const buttons = $('.button-container')

    if (+localStorage.getItem('buttons')) {
        previousButton = $(buttons[+localStorage.getItem('button')])

        if (previousButton.hasClass('button-container-selected')) {
            previousButton.removeClass('button-container-selected')

            previousButton.children('#button-left').removeClass('button-selected')
            previousButton.children('#button-right').removeClass('button-selected')
        }
    }

    if (+localStorage.getItem('button') < +localStorage.getItem('buttons') - 1) {
        localStorage.setItem('button', +localStorage.getItem('button') + 1)

        currentButton = $(buttons[+localStorage.getItem('button')])

        if (currentButton.css('display') === 'none') {
            currentButton.show()

            $(buttons[+localStorage.getItem('button') - +localStorage.getItem('display')]).hide()
        }
    } else {
        localStorage.setItem('button', '0')

        currentButton = $(buttons[+localStorage.getItem('button')])

        for (let index = 0; index < +localStorage.getItem('buttons'); index++) {
            if (index < +localStorage.getItem('display')) {
                $(buttons[index]).show()
            } else {
                $(buttons[index]).hide()
            }
        }
    }

    if (+localStorage.getItem('buttons')) {
        currentButton = $(buttons[+localStorage.getItem('button')])

        if (!currentButton.hasClass('button-container-selected')) {
            currentButton.addClass('button-container-selected')

            currentButton.children('#button-left').addClass('button-selected')
            currentButton.children('#button-right').addClass('button-selected')
        }
    }

    if ($('#subtitle-left').text() && +localStorage.getItem('buttons') > +localStorage.getItem('display')) {
        $('#subtitle-right').html(`${+localStorage.getItem('button') + 1}/${+localStorage.getItem('buttons')}`)
    }
}

function EventHandler(type, action, data) {
    switch (type) {
        case 'READ':
            switch (action) {
                case 'OPEN':
                    
                    OpenMenu()
                    break
                case 'CLOSE':
                    CloseMenu()
                    break
            }
            break
        case 'CREATE':
            switch (action) {
                case 'BUTTON':
                    DisplayMenuButton(data.index, data, 'CREATE')
                    break
            }
            break
        case 'UPDATE':
            switch (action) {
                case 'BUTTON':
                    DisplayMenuButton(data.index, data, 'UPDATE')
                    break
            }
            break
        case 'DELETE':
            switch (action) {
                case 'BUTTON':
                    DisplayMenuButton(data.index, data, 'DELETE')
                    break
            }
            break
        case 'DISPLAY':
            switch (action) {
                case 'INFO':
                    
                    DisplayMenu(true, data)
                    break
                case 'STYLE':
                    DisplayMenuStyle(true, data.style)
                    break
                case 'CLEAR':
                    DisplayMenu(false)
                    DisplayMenuStyle(false)
                    break
            }
            break
        case 'KEYPRESS':
            switch (action) {
                case 'UP':
                    ScrollUp()
                    break
                case 'DOWN':
                    ScrollDown()
                    break
            }
            break
    }
}

$(".top").slideUp(0);
$(".bottom").slideUp(0);

var previousTimer = null;

window.addEventListener('message', (event) => {
    var item = event.data;

    
    if (item.type === "hideSubtitles"){
        hideSubtitles()
    }

    if (item.type === "blackbars"){//default number 15% -- Default speed 0
        if(item.size == -1){
            $(".top").slideUp(item.timeShow);
            $(".bottom").slideUp(item.timeShow);
            return true;
        }
        $(".top").css("height",item.size + "%");
        $(".bottom").css("height",item.size + "%");

        $(".top").slideDown(item.timeShow);
        $(".bottom").slideDown(item.timeShow);
    }

    if(item.type === "subtitles"){
        $(".text-container").text("");
        item.text = parseText(item.text)

        $(".text-container").append("<h1>"+ item.text +"</h1>");
        $(".text-container").fadeOut(0);
        $(".text-container").fadeIn("slow");
        if(item.timer != -1){
            if(previousTimer) {
                clearInterval(previousTimer);
                prevNowPlaying = null;
            }

            previousTimer = setTimeout(hideSubtitles, item.timer);
        }
    }

    if (Array.isArray(event.data)) {
        for (const data of event.data) {
            EventHandler(data.type, data.action, data)
        }
    } else {
        EventHandler(event.data.type, event.data.action, event.data)
    }
})



function hideSubtitles(){
	$(".text-container").fadeOut("slow");
}

var colorArray = {
    "r": "red",
    "b": "blue",
    "g": "green",
    "y": "yellow",
    "p": "purple",
    "c": "grey",
    "m": "dark grey",
    "u": "black",
    "o": "orange",
    "n": "<br>",
    "s": "<font>",
    "w": "white",
};

function getChatColors(string){
    var splitted = string.split("~");
    var array = [];
    var index = 0;

    for(let i = 1;i< splitted.length;i += 2){
        array[index] = splitted[i];
        index ++;
    }

    return array;
}

function parseText(text){
    var result = getChatColors(text);
    for(var i = 0; i < result.length; i ++){
        var color = result[i];
        if(result[i].length == 1){
            text = text.replace("~"+ color +"~", "<font color = '"+colorArray[color]+"'>");
        }else{
            text = text.replace("~"+ color +"~", "<font class = '"+color+"' color='"+color+"'>");
        }
    }
    return text;
}