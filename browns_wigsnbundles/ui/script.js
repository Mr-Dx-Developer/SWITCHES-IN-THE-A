$(document).ready(() => {
    $("#phone").hide()
    $('#shop').hide()
    let shopLoaded = false
    const names = {
        'wig_cap': "Wig Cap",
        'wig_sewin': "Wig Sewin Kit",
        'hair_bundles': "Hair Bundles",
        'wig_table': "Wig Table",
    }
    $('#closer').click( () => {
        $('#shop').hide()
        $.post('http://browns_wigsnbundles/Close')
    })
    function openShop(data) {
        if (!shopLoaded) {
            for (let i in data) {
                let parent = document.getElementById('shop-cont')
                let cont = document.createElement('div')
                cont.className = 'item-cont'
                let label = document.createElement('h4')
                label.innerHTML = names[i]
                let img = document.createElement('img')
                img.src = `./assets/${i}.png`
                let price = document.createElement('h4')
                price.innerHTML = `$${data[i]}`
                let btnCont = document.createElement('div')
                btnCont.className = 'input-group mb-3'
                let input = document.createElement('input')
                input.className = 'form-control'
                input.setAttribute('type', 'number')
                input.setAttribute('placeholder', 'Amount')
                let btn = document.createElement('button')
                btn.className = 'btn btn-outline-primary'
                btn.setAttribute('type', 'button')
                btn.id = 'button-addon2'
                btn.innerHTML = 'Buy'
                btn.addEventListener('click', () => {
                    if (input.value > 0) {
                        $.post('http://browns_wigsnbundles/shopPurchase', JSON.stringify({
                            item: i,
                            amount: input.value
                        }))
                        input.value = ''
                    }
                })
                parent.appendChild(cont)
                cont.appendChild(label)
                cont.appendChild(img)
                cont.appendChild(price)
                cont.appendChild(btnCont)
                btnCont.appendChild(input)
                btnCont.appendChild(btn)
            }
            shopLoaded = true 
            $('#shop').show()
        } else {
            $('#shop').show()
        }
    }
    window.addEventListener('message', (e) => {
        if (e.data.action === 'call') {
            $("#phone").show()
            var ring = new Howl({
                src: ['./assets/ring.mp3'],
                loop: false,
                volume: 1.0,
            })
            var call = new Howl({
                src: ['./assets/becky_voice.mp3'],
                loop: false,
                volume: 1.0,
            })
            ring.play()
            setTimeout(() => {
                ring.stop()
                $('#call-status').text('In Call')
                call.play()
                setTimeout(() => {
                    $("#phone").hide()
                    $.post('http://browns_wigsnbundles/createMission')
                    $('#call-status').text('Ringing...')
                }, 8000);
            }, 3000);
        }
    })
    window.addEventListener('message', (e) => {
        if (e.data.action === 'shop') {
            openShop(e.data.data)
        }
    })
})