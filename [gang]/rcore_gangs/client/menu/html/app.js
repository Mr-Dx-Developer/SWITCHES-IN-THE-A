localStorage.setItem('button', '0')
localStorage.setItem('buttons', '0')

localStorage.setItem('display', '8')

const AdjustFontSize = (selector) => {
    const element = document.querySelector(selector)

    if (!element) return

    element.style.removeProperty('font-size')

    const fontSize = window.getComputedStyle(element).fontSize

    const { width: elementWidth, height: elementHeight } = element.getBoundingClientRect()
    const { width: parentWidth, height: parentHeight } = element.parentElement.getBoundingClientRect()

    const fontSizeMultiplier = Math.min(parentWidth / elementWidth, parentHeight / elementHeight)

    element.style.setProperty('font-size', `min(${fontSize}, ${Math.floor(fontSizeMultiplier * parseFloat(fontSize))}px)`)
}

function OpenMenu() {
    $('body').show()
}

function CloseMenu() {
    $('body').hide()
}

function DisplayMenu(toggle, properties) {
    if (toggle) {
        localStorage.setItem('button', '0')

        if (properties.title) {
            $('.title').html(`<span>${properties.title}</span>`)

            AdjustFontSize('.title')
        } else {
            $('.title').empty()
        }

        if (properties.subtitle) {
            if (+localStorage.getItem('buttons') > +localStorage.getItem('display')) {
                $('#subtitle-left').html(`<span>${properties.subtitle}</span>`)
                $('#subtitle-right').html(`<span>${+localStorage.getItem('button') + 1}/${+localStorage.getItem('buttons')}</span>`)

                AdjustFontSize('.subtitle')
            } else {
                $('#subtitle-left').html(`<span>${properties.subtitle}</span>`)
                $('#subtitle-right').empty()

                AdjustFontSize('.subtitle')
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

function DisplayText(toggle, properties) {
    if (toggle) {
        if (properties.text) {
            $('.tooltip').html(`<span>${properties.text}</span>`)
            $('.tooltip-container').show()
        } else {
            $('.tooltip').empty()
            $('.tooltip-container').hide()
        }
    } else {
        $('.tooltip').empty()
        $('.tooltip-container').hide()
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
                const buttons = $('.button-container')

                for (let i = +localStorage.getItem('display'); i < +localStorage.getItem('buttons'); i++) {
                    $(buttons[i]).hide()
                }
            }

            if ($('#subtitle-left').text() && +localStorage.getItem('buttons') > +localStorage.getItem('display')) {
                $('#subtitle-right').html(`${+localStorage.getItem('button') + 1}/${+localStorage.getItem('buttons')}`)
            }
        } else {
            localStorage.setItem('button', '0')
            localStorage.setItem('buttons', +localStorage.getItem('buttons') + 1)

            $('.menu-container').children('.tooltip-container').before(`<div class="button-container button-container-selected"><div class="button button-selected" id="button-left">${button.title}</div><div class="button button-selected" id="button-right">${button.subtitle}</div></div>`)

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
                if ($('.button-container:visible').last().next().attr('class') === 'button-container') {
                    $('.button-container:visible').last().next().show()
                }
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
                case 'TEXT':
                    DisplayText(true, data)
                    break
                case 'STYLE':
                    DisplayMenuStyle(true, data.style)
                    break
                case 'CLEAR':
                    DisplayMenu(false)
                    DisplayText(false)
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

window.addEventListener('message', (event) => {
    if (Array.isArray(event.data)) {
        for (const data of event.data) {
            EventHandler(data.type, data.action, data)
        }
    } else {
        EventHandler(event.data.type, event.data.action, event.data)
    }
})