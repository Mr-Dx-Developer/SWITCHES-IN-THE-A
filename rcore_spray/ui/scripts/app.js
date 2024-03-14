$(document).ready(function(){

    let fontData = [];
    let resourceName = 'rcore_spray';
    let wordBlacklist = [];

    let isPreviewing = false;
    let defaultGraffiti = 'GRAFFITI';
    let pickr;
    let isInitialized = false;
    let disableText = false;

    
    $.post("https://rcore_spray/initialize", JSON.stringify({}));

    function syncGraffitiColor() {
        let hexaArray = pickr.getColor().toHEXA();
        let strColor = hexaArray[0] + hexaArray[1] + hexaArray[2];
        $('.graffiti-example').css({color: `#${strColor}`})
    }

    $('#nav-text').click(function() {
        syncGraffitiColor();
        $(this).addClass('active');
        $('#nav-image').removeClass('active');
        RecomputeBlacklist()
        $('.graffiti-images').hide();
        
        $('.graffiti-container').show();
        $('.graffiti-input-text').show();

        $('.graffiti-images img').removeClass('selected');

        $('.spray-button').hide();
        $('#click-to-select-font').show();
    });

    $('.input input').keyup(function() {
        let text = $(this).val().trim();

        if(!text || text.length == 0) {
            $('.graffiti-example').text(defaultGraffiti);
        } else {
            $('.graffiti-example').each(function() {
                $(this).text(formatGraffitiText($(this).data('font-name'), text));
                RecomputeBlacklist()
            });
        }
    });

    function RecomputeBlacklist() {
        if(wordBlacklist.indexOf($('.input input').val().toLowerCase()) >= 0) {
            $('.input-error').removeClass('hidden');
            $('.bl-hide').hide();
        } else {
            $('.input-error').addClass('hidden');
            $('.bl-hide').show();
        }
    }

    $('body').on('click', '.graffiti-example', function() {
        $('.graffiti-example').removeClass('selected');
        $(this).addClass('selected');

        $('.spray-button').hide();
        $('#select-color').show();
    });

    $('body').on('click', '.graffiti-images img', function() {
        $('.graffiti-images img').removeClass('selected');
        $(this).addClass('selected');

        $('.spray-button').hide();
        $('#select-color').show();
    });

    // Advance to next stage
    $('#select-color').click(function() {
        let inputData = GetInputData();

        if(wordBlacklist.indexOf(inputData.text) == -1) {
            if(inputData) {
                $.post("https://" + resourceName + "/previewSpray", JSON.stringify({
                    text: inputData.text,
                    image: inputData.image,
                    imageDict: inputData.imageDict,
                    hexColor: inputData.hexColor,
                    rgbColor: inputData.rgbColor,
                    font: inputData.fontName
                }));

                isPreviewing = true;

                $('.first-part').hide();
                $('.container-keybind').show();
            }
        }
    });

    function formatGraffitiText(fontName, text) {
        let cfg = null;

        for(let graffitiCfg of fontData) {
            if(graffitiCfg.font == fontName) {
                cfg = graffitiCfg;
            }
        }

        if(!cfg) {
            return defaultGraffiti;
        }

        if(cfg.forceUppercase) {
            text = text.toUpperCase();
        }

        return text.replace(new RegExp(cfg.allowedInverse, 'gi'), '');
    }

    $('#nav-image').click(function() {
        $(this).addClass('active');
        $('#nav-text').removeClass('active');

        $('.graffiti-images').show();
        
        $('.graffiti-container').hide();
        $('.graffiti-input-text').hide();
        
        $('.graffiti-example').removeClass('selected');
        
        $('.spray-button').hide();
        $('#click-to-select-font').show();
        $('.bl-hide').show();
    });

    window.back = function(data) {
        $('.first-part').show();
        $('.container-keybind').hide();
        setTimeout(function() { isPreviewing = false; }, 500);
    }

    window.setData = function(data) {
        if(isInitialized) {
            return;
        }
        isInitialized = true;

        $('.graffiti-container').empty();
        $('.graffiti-images').empty();
        $('.font-cfg').empty();

        fontData = data.fonts;
        resourceName = data.resourceName;
        wordBlacklist = data.wordBlacklist;
        disableText = data.disableText;

        for(let graffiti of data.fonts) {
            $('.font-cfg').append(`@font-face { font-family: ${graffiti.font}; src: url(/ui/fonts/${graffiti.font}.ttf); }`);
            $('.graffiti-container').append(
                `<div class='graffiti-example' data-font-name="${graffiti.font}" style="font-family: ${graffiti.font}; font-size: ${graffiti.sizeMult*100}%">GRAFFITI</div>`
            );
        }
        
        for(var idx in data.images) {
            let img = data.images[idx];

            $('.graffiti-images').append(
                `<img src="graffiti/${img.name}.png" data-image-name="${img.name}" data-image-dict="${img.dict}">`,
            );

            if(idx < (data.images.length-1)) {
                $('.graffiti-images').append(
                    `<div class="img-sep"></div>`,
                );  
            }
        }

        $('.input input').attr('maxlength', data.sprayCharLimit)

        /// translation stuff
        for(let idx in data.translation) {
            let value = data.translation[idx];

            $(`span[data-translate='${idx}']`).text(value);
        }
        $('.input input').attr('placeholder', data.translation['input-placeholder']);
        defaultGraffiti = data.translation['default-graffiti'];
        $('.graffiti-example').text(defaultGraffiti);

        pickr = Pickr.create({
            el: '.color-picker',
            theme: 'nano', // or 'monolith', or 'nano'
            default: '#ffffff',
            swatches: [
                'rgba(255, 255, 255, 1)',
                'rgba(200, 25, 18, 1)',
                'rgba(246, 75, 60, 1)',
                'rgba(247, 106, 140, 1)',
                'rgba(253, 226, 226, 1)',
                'rgba(0, 8, 57, 1)',
                'rgba(0, 80, 130, 1)',
                'rgba(0, 168, 204, 1)',
                'rgba(255, 211, 29, 1)',
                'rgba(245, 252, 193, 1)',
                'rgba(43, 88, 12, 1)',
                'rgba(99, 154, 103, 1)',
                'rgba(234, 98, 39, 1)',
                'rgba(255, 164, 27, 1)',
                'rgba(68, 39, 39, 1)',
                'rgba(156, 85, 24, 1)',
                'rgba(132, 70, 133, 1)',
                'rgba(190, 121, 223, 1)',
                'rgba(204, 204, 204, 1)',
                'rgba(50, 50, 50, 1)',
                'rgba(0, 0, 0, 1)',
            ],
            lockOpacity: true,
            components: {
                preview: true,
                opacity: false,
                hue: true,
        
                interaction: {
                    hex: true,
                    input: true,
                    save: true,
                    close: true,
                }
            },
            i18n: {
                'btn:save': data.translation['save-color'],
            }
        });
        pickr.on('save', function(color) {
            syncGraffitiColor();
            pickr.hide();
        })
    };

    window.open = function() {
        let realOpen = function() {
            if(disableText) {
                $('#nav-image').click();
                $('#nav-image').hide();
                $('#nav-text').hide();
                $('.graffiti-input-text').remove();
                $('.graffiti-container').remove();
            } else {
                $('#nav-text').click();
            }
            $('.first-part').hide();
            $('.first-part').fadeIn();

            $('.graffiti-example').removeClass('selected');
            $('.graffiti-images img').removeClass('selected');
        };

        if(isInitialized) {
            realOpen();
        } else {
            $.post("https://" + resourceName + "/initialize", function(data) {
                window.setData(data);
                realOpen();
            });
        }
    }

    window.hide = function() {
        pickr.hide();
        $('.container').fadeOut();
    }

    window.close = function() {
        pickr.hide();
        $('.container').fadeOut();
        $.post("https://" + resourceName + "/disableFocus");
    }

    window.setError = function(data) {
        $('.container-keybind').addClass('has-error');
        $('.container-keybind .error').show();
        $('.container-keybind .error').text(data.message);
    }
    
    window.clearError = function(data) {
        $('.container-keybind').removeClass('has-error');
        $('.container-keybind .error').hide();
    }

    $('.cancel-button').click(window.close);

    $(document).on('keydown', function(e) {
        let backspace = e.key == "Backspace";

        if($('.search-text input').is(':focus')) {
            backspace = false;
        }

        if (e.key == "Escape" || backspace) {
            if(isPreviewing === false) {
                window.close();
            }
        }
    });
      

    window.addEventListener("message", function(event) {
        if (window[event.data.type]) {
            window[event.data.type](event.data.data);
        } else {
            console.log("Unsupported type: " + event.data.type);
        }
    });

    function GetInputData() {
        let hexaArray = pickr.getColor().toHEXA();
        let rgbaArray = pickr.getColor().toRGBA();

        let hexColor = hexaArray[0] + hexaArray[1] + hexaArray[2];
        let rgbColor = [Math.round(rgbaArray[0]), Math.round(rgbaArray[1]), Math.round(rgbaArray[2])];

        let mode = $('.top-button.active').data('mode');
        
        if(mode === 'text') {
            let selectedGraffiti = $('.graffiti-example.selected');

            if(selectedGraffiti.length > 0) {
                let text = selectedGraffiti.text();
                let fontName = selectedGraffiti.data('font-name');
                
                return {
                    text: text,
                    fontName: fontName,
                    hexColor: hexColor,
                    rgbColor: rgbColor,
                }
            } else {
                return null;
            }
        } else if(mode === 'image') {
            let selectedImage = $('.graffiti-images img.selected');

            if(selectedImage.length > 0) {
                let dict = selectedImage.data('image-dict');
                let image = selectedImage.data('image-name');

                return {
                    imageDict: dict,
                    image: image,
                }
            } else {
                return null;
            }
        }
    }
    
});
