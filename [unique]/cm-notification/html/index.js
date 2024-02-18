let Notifications = []
let StackedText = []
let resource_name = 'test-notification'
let volume = 0.17
let enableSound = true
let open = false
let position = 'top-right'
let translation = {}

window.addEventListener("message", function (event) {
    const data = event.data
    switch (data.action) {
        case "CHECK_NUI_READY":
            resource_name = data.payload.name
            volume = data.payload.volume
            $.post(`https://${resource_name}/Ready`, JSON.stringify({}));
            break;
        case "CREATE":
            var payload = data.payload
            CreateNotification(payload.text, payload.type, payload.header, payload.time, payload.themeData)
            break
        case "ENABLE_NOTIFY_SETTINGS":
            open = true
            $('.notification-settings').fadeIn(300)
            break
        case "TOGGLE_NOTIFICATIONS":
            const show = data.payload
            if (show) {
                $('.toggle-visibility').text(translation["HIDE_NOTIFY"])
            } else {
                $('.toggle-visibility').text(translation["SHOW_NOTIFY"])
            }
            break
        case "TOGGLE_SOUND":
            const sound = data.payload
            enableSound = sound
            if (sound) {
                $('.toggle-sound').text(translation["DISABLE_SOUND"])
            } else {
                $('.toggle-sound').text(translation["ENABLE_SOUND"])
            }
            break
        case "NOTIFICATION_POSITION_CHANGE":
            position = data.payload

            $('.notification-container').css(GetContainerPosition())
            $('.notification-box').removeClass('selected-notification-box')
            $(`.notification-box[data-type=${position}]`).addClass('selected-notification-box')
            break
        case "SET_TRANSLATION":
            translation = data.payload
            $('.settings-text').text(translation["SETTINGS_TEXT"])
            break
        default:
            break;
    }
})


$(document).on('click', '.toggle-sound', () => {
    $.post(`https://${resource_name}/ToggleSound`, JSON.stringify({}));
})
$(document).keyup(function (e) {
    if (open) {
        if (e.key === "Escape") {
            $.post(`https://${resource_name}/Close`, JSON.stringify({}));
            $('.notification-settings').fadeOut(300)
            open = false
        }
    }
});

$(document).on('click', '.toggle-visibility', () => {
    $.post(`https://${resource_name}/ToggleNotificationsVisible`, JSON.stringify({}));
})

$(document).on('click', '.notification-box', function () {
    let type = $(this).attr('data-type')
    $.post(`https://${resource_name}/SelectPosition`, JSON.stringify({ position: type }));
})


$(document).on('click', '.settings-close', () => {
    open = false
    $.post(`https://${resource_name}/Close`, JSON.stringify({}));
    $('.notification-settings').fadeOut(300)
})

const GetNotificationStartPoint = () => {
    if (position == 'top-left' || position == 'bottom-left') {
        return 'translateX(-26.25rem)';
    }
    if (position == 'top-right' || position == 'bottom-right') {
        return 'translateX(26.25rem)';
    }
    if (position == 'top-center') {
        return 'translateY(-36.25rem)';
    }

    if (position == 'bottom-center') {
        return 'translateY(36.25rem)';
    }
}

const GetContainerPosition = () => {
    if (position == 'top-left') {
        return {
            position: 'absolute',
            left: '2rem',
            top: '2rem',
            right: 'unset',
            bottom: 'unset',
            transform: '',

            transition: 'all .2s ease',
        }
    }

    if (position == 'bottom-left') {
        return {
            position: 'absolute',
            left: '2rem',
            bottom: '2rem',
            transform: '',
            right: 'unset',
            top: 'unset',
            transition: 'all .2s ease',
        }
    }
    if (position == 'bottom-right') {
        return {
            position: 'absolute',
            right: '2rem',
            bottom: '2rem',
            transform: '',
            left: 'unset',
            top: 'unset',
            transition: 'all .2s ease',
        }
    }
    if (position == 'top-right') {
        return {
            position: 'absolute',
            right: '2rem',
            top: '2rem',
            transform: '',
            left: 'unset',
            bottom: 'unset',
            transition: 'all .2s ease',
        }
    }
    if (position == 'top-center') {
        return {
            position: 'absolute',
            left: '50%',
            transform: 'translateX(-50%)',
            top: '2rem',
            right: 'unset',
            bottom: 'unset',
            transition: 'all .2s ease',
        }
    }

    if (position == 'bottom-center') {
        return {
            position: 'absolute',
            left: '50%',
            transform: 'translateX(-50%)',
            bottom: '2rem',
            right: 'unset',
            top: 'unset',
            transition: 'all .2s ease',
        }
    }

}

const GetNotificationEnterPoint = (id) => {
    let data = {}
    if (position == 'top-right' || position == 'bottom-right' || position == 'top-left' || position == 'bottom-left') {
        data = {
            targets: `#notification-${id}`,
            translateX: 0,
            duration: 750,
            easing: "spring(1, 70, 100, 10)",
        }
    }
    if (position == 'top-center' || position == 'bottom-center') {
        data = {
            targets: `#notification-${id}`,
            translateY: 0,
            duration: 750,
            easing: "spring(1, 70, 100, 10)",
        }
    }
    return data
}

const GetNotificationExitPoint = (id) => {
    let data = {}
    if (position == 'top-left' || position == 'bottom-left') {
        data = {
            targets: `#notification-${id}`,
            translateX: "-26.25rem",
            height: '0',
            margin: '0',
            scale: 0,
            duration: 1500,
            easing: "spring(1, 70, 100, 10)",
        }
    }
    if (position == 'top-right' || position == 'bottom-right') {
        data = {
            targets: `#notification-${id}`,
            translateX: "26.25rem",
            height: '0',
            margin: '0',
            scale: 0,
            duration: 1500,
            easing: "spring(1, 70, 100, 10)",
        }
    }
    if (position == 'top-center') {
        data = {
            targets: `#notification-${id}`,
            translateY: "-36.25rem",
            height: '0',
            margin: '0',
            scale: 0,
            duration: 1500,
            easing: "spring(1, 70, 100, 10)",
        }
    }

    if (position == 'bottom-center') {
        data = {
            targets: `#notification-${id}`,
            translateY: "36.25rem",
            height: '0',
            margin: '0',
            scale: 0,
            duration: 1500,
            easing: "spring(1, 70, 100, 10)",
        }
    }
    return data
}


const CreateNotification = (text, type, header, time, themeData) => {
    let id = Notifications.length + 1
    let textExist = StackedText.find((el) => el.text == text && el.type == type)
    if (textExist) {
        textExist.count += 1
        $('#notification-'+textExist.id+' .stacked').show()
        $('#notification-'+textExist.id+' .stacked').css('color', themeData.title.color)
        $('#notification-'+textExist.id+' .stacked').css('display', 'flex')
        $('#notification-'+textExist.id+' .stacked').css('background', themeData.background.color)
        $('#notification-'+textExist.id+' .stacked').text(textExist.count)
    } else {
        let html = `
        <div class="notification ${type}" id="notification-${id}" style="transform: ${GetNotificationStartPoint()};  background: ${themeData.background.color}">
            <div class="stacked"></div>
            <div class="notification-top">
                <div class="notification-wrapper">
                    <div class="notification-icon-box" style="box-shadow: 0px 0px 14px ${themeData.iconBox.shadow};">
                        <img src="./assets/icons/${themeData.icon}.png">
                        <div class="notification-overlay-bottom-left" style="box-shadow: 3px 0px 3px ${themeData.iconBox.overlayColor};">
                        </div>
                        <div class="notification-overlay-top-right" style="box-shadow: 0 0px 6px ${themeData.iconBox.overlayColor};">
                        </div>
                    </div>
                    <p class="notification-title" style="text-shadow: 0px 0px 12px ${themeData.title.textShadow};  color: ${themeData.title.color};">${header || themeData.defaultHeader}</p>
                </div>
                <div class="notification-progress">
                </div>
            </div>
            <div class="notification-divider">
            </div>
            <p class="notification-text">
                ${text}
            </p>
        </div>
        `

        $('.notification-container').append(html)
        if (enableSound) {
            let audio = new Audio(`./assets/sound/notification_sound.mp3`);
            audio.play();
            audio.volume = volume;
        }
        setTimeout(() => {
            anime(GetNotificationEnterPoint(id));
            let progressBar = new ProgressBar.Circle(`#notification-${id} .notification-progress`, {
                strokeWidth: 12,
                easing: 'easeInOut',
                duration: Number(time),
                color: themeData.timerBar.color,
                trailColor: themeData.timerBar.trailColor,
                trailWidth: 12,
                svgStyle: {
                    filter: `drop-shadow(${themeData.timerBar.shadow})`,
                }
            })
            progressBar.set(0.0);
            progressBar.animate(1.0);  // Number from 0.0 to 1.0
        }, 200)
        StackedText.push({
            id,
            text,
            count:1,
            type : type,
        })
        Notifications[id] = setTimeout(() => {
            anime(GetNotificationExitPoint(id));
            setTimeout(() => {
                $("#notification-" + id).remove();
                Notifications[id] = null;
            }, 1600);
            StackedText = StackedText.filter((el) => el.id != id)
        }, time + 150)
    }

}
