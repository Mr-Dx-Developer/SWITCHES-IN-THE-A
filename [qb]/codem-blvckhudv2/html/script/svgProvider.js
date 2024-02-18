let loaded = false
function onLoad(hudColors, currentHud) {
    app.AddSvg('textHudHealthInner', `
    <svg class="textHudInner" id="radialHealth" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_223" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].health}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].health}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="healthBorder" transform="translate(125,125)" />
        <path fill="url('#paint0_radial_172_223')" id="healthLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudHealthInner2', `
    <svg class="textHudInner" id="radialHealth2" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_2277" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].health}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].health}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="healthBorder2" transform="translate(125,125)" />
        <path fill="url('#paint0_radial_172_2277')" id="healthLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)
    app.AddSvg('textHudHealthInner3', `
    <svg class="textHudInner" id="radialHealth3" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_2278" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].health}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].health}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="healthBorder3" transform="translate(125,125)" />
        <path fill="url('#paint0_radial_172_2278')" id="healthLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)
    app.AddSvg('textHudOxyInner', `
    <svg class="textHudInner" id="radialOxy" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_2256" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].oxy}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].oxy}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="oxyBorder" transform="translate(125,125)" />
        <path fill="url('#paint0_radial_172_2256')" id="oxyLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)
    app.AddSvg('textHudOxyRadial', `

        <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            class="textHudRadial">
            <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
                stroke-linecap="butt" stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
            <path id="oxyText" fill-rule="evenodd" stroke="${hudColors[currentHud].oxy}" stroke-width="30.07px" stroke-linecap="butt"
                stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        </svg>
`)
    app.AddSvg('textHudOxyInner2', `
    <svg class="textHudInner" id="radialOxy2" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_22242424256" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].oxy}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].oxy}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="oxyBorder2" transform="translate(125,125)" />
        <path fill="url('#paint0_radial_172_22242424256')" id="oxyLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)
    app.AddSvg('textHudOxyRadial2', `

        <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            class="textHudRadial">
            <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
                stroke-linecap="butt" stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
            <path id="oxyText2" fill-rule="evenodd" stroke="${hudColors[currentHud].oxy}" stroke-width="30.07px" stroke-linecap="butt"
                stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        </svg>
`)

    app.AddSvg('textHudOxyInner3', `
    <svg class="textHudInner" id="radialOxy3" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_222424244353256" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].oxy}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].oxy}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="oxyBorder3" transform="translate(125,125)" />
        <path fill="url('#paint0_radial_172_222424244353256')" id="oxyLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudOxyRadial3', `

        <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            class="textHudRadial">
            <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
                stroke-linecap="butt" stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
            <path id="oxyText3" fill-rule="evenodd" stroke="${hudColors[currentHud].oxy}" stroke-width="30.07px" stroke-linecap="butt"
                stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        </svg>
`)


    app.AddSvg('oxyIcon', `

    <img class="textHudIcon" src = "./assets/images/lungs-white.png">

`)



    app.AddSvg('textHudHealthRadial', `

        <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            class="textHudRadial">
            <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
                stroke-linecap="butt" stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
            <path id="healthText" fill-rule="evenodd" stroke="${hudColors[currentHud].health}" stroke-width="30.07px" stroke-linecap="butt"
                stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        </svg>
`)

    app.AddSvg('colorPickerIcon', `
<svg class=" colorpickerIcon" width="7" height="7" viewBox="0 0 7 7" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_1182_122)">
<path d="M6.72709 0.273255C6.36283 -0.0910122 5.77224 -0.0911176 5.40775 0.273134L5.15595 0.524931C5.02069 0.389687 4.80161 0.389687 4.66637 0.524931C4.53109 0.66007 4.53109 0.879393 4.66637 1.01453L4.74794 1.09615L2.02787 3.81642H2.02763L1.08345 4.76069C1.00841 4.83574 0.964169 4.93611 0.95941 5.04212L0.95715 5.09249C0.95715 5.09273 0.95715 5.09294 0.95715 5.09318L0.919058 5.94727C0.917491 5.98693 0.932358 6.02537 0.960313 6.05343C0.986687 6.07993 1.02275 6.09467 1.06018 6.09467C1.06221 6.09467 1.06423 6.09467 1.0665 6.09455L1.51934 6.07451H1.51958L1.79549 6.06223L1.92078 6.05672C2.0594 6.05051 2.19106 5.99257 2.28934 5.89441L5.91782 2.26603L5.98569 2.33388C6.05332 2.40148 6.14192 2.4353 6.23048 2.4353C6.31906 2.4353 6.40768 2.40148 6.47529 2.33388C6.61055 2.19873 6.61055 1.97941 6.47529 1.84428L6.72707 1.59247C7.09135 1.22822 7.09135 0.637627 6.72709 0.273255ZM4.10686 3.4241L2.83259 3.66449L4.91116 1.58583L5.42828 2.10271L4.10686 3.4241Z" fill="white"/>
<path d="M0.971519 6.38477C0.435045 6.38477 0 6.52251 0 6.69256C0 6.86253 0.435045 7.00026 0.971519 7.00026C1.50799 7.00026 1.94283 6.86254 1.94283 6.69256C1.94283 6.5225 1.50799 6.38477 0.971519 6.38477Z" fill="white"/>
</g>
<defs>
<clipPath id="clip0_1182_122">
<rect width="7" height="7" fill="white"/>
</clipPath>
</defs>
</svg>

`)

    app.AddSvg('textHudHealthRadial2', `

        <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            class="textHudRadial">
            <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
                stroke-linecap="butt" stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
            <path id="healthText2" fill-rule="evenodd" stroke="${hudColors[currentHud].health}" stroke-width="30.07px" stroke-linecap="butt"
                stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        </svg>
`)


    app.AddSvg('textHudHealthRadial3', `

        <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
            class="textHudRadial">
            <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
                stroke-linecap="butt" stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
            <path id="healthText3" fill-rule="evenodd" stroke="${hudColors[currentHud].health}" stroke-width="30.07px" stroke-linecap="butt"
                stroke-linejoin="miter" fill="none"
                d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        </svg>
`)
    app.AddSvg('ammo-hud', `
<svg width = "52" height = "38" viewBox = "0 0 52 38" fill = "none" xmlns = "http://www.w3.org/2000/svg" xmlns: xlink = "http://www.w3.org/1999/xlink" >
<g filter="url(#filter0_d_343_248)">
<rect x="13" y="9" width="12" height="12" fill="url(#pattern0)"/>
<rect x="20" y="9" width="12" height="12" fill="url(#pattern1)"/>
<rect x="27" y="9" width="12" height="12" fill="url(#pattern2)"/>
</g>
<defs>
<filter id="filter0_d_343_248" x="0" y="0" width="52" height="38" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="4"/>
<feGaussianBlur stdDeviation="6.5"/>
<feComposite in2="hardAlpha" operator="out"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.6 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_343_248"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_343_248" result="shape"/>
</filter>
<pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_343_248" transform="scale(0.01)"/>
</pattern>
<pattern id="pattern1" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_343_248" transform="scale(0.01)"/>
</pattern>
<pattern id="pattern2" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_343_248" transform="scale(0.01)"/>
</pattern>
<image id="image0_343_248" width="100" height="100" xlink:href="data:image/png;base64,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"/>
</defs>
</svg>

`)




    app.AddSvg('textHudHeartIcon', `
    <svg class="textHudIcon" width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M10.9914 0.875427C9.54396 0.875555 8.20906 1.6688 7.5 2.95043C6.79094 1.6688 5.45604 0.875555 4.00862 0.875427C1.79481 0.875427 0 2.96095 0 5.20934C0 10.8566 7.5 14.7965 7.5 14.7965C7.5 14.7965 15 10.8566 15 5.20934C15 2.96095 13.2052 0.875427 10.9914 0.875427Z" fill="white"/>
    </svg>
`)

    app.AddSvg('textHudHeartIcon2', `
    <svg class="textHudIcon" width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M10.9914 0.875427C9.54396 0.875555 8.20906 1.6688 7.5 2.95043C6.79094 1.6688 5.45604 0.875555 4.00862 0.875427C1.79481 0.875427 0 2.96095 0 5.20934C0 10.8566 7.5 14.7965 7.5 14.7965C7.5 14.7965 15 10.8566 15 5.20934C15 2.96095 13.2052 0.875427 10.9914 0.875427Z" fill="white"/>
    </svg>
`)
    app.AddSvg('textHudHeartIconText', `
    <svg class="textHudIcon" width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M10.9914 0.875427C9.54396 0.875555 8.20906 1.6688 7.5 2.95043C6.79094 1.6688 5.45604 0.875555 4.00862 0.875427C1.79481 0.875427 0 2.96095 0 5.20934C0 10.8566 7.5 14.7965 7.5 14.7965C7.5 14.7965 15 10.8566 15 5.20934C15 2.96095 13.2052 0.875427 10.9914 0.875427Z" fill="${hudColors[currentHud].health}"/>
    </svg>
`)

    app.AddSvg('textHudWaterInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_224" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].thirst}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].thirst}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="waterBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_224')" id="waterLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudWaterInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_22777" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].thirst}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].thirst}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="waterBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_22777')" id="waterLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudWaterInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_22773553537" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].thirst}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].thirst}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="waterBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_22773553537')" id="waterLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)


    app.AddSvg('textHudWaterhRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
        class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="waterText" fill-rule="evenodd" stroke="${hudColors[currentHud].thirst}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudWaterRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
        class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="waterText2" fill-rule="evenodd" stroke="${hudColors[currentHud].thirst}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudWaterRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
        class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="waterText3" fill-rule="evenodd" stroke="${hudColors[currentHud].thirst}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudWaterIcon', `
    <svg class="textHudIcon" width="13" height="15" viewBox="0 0 13 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M7.44429 1.28143C7.10811 0.902064 6.78794 0.553045 6.49978 0.234375C6.21163 0.56822 5.89146 0.917239 5.55528 1.28143C3.5222 3.49695 0.720703 6.57742 0.720703 8.97504C0.720703 10.4925 1.36104 11.8582 2.41761 12.8446C3.45816 13.831 4.89893 14.4531 6.49978 14.4531C8.10064 14.4531 9.54141 13.8461 10.582 12.8446C11.6225 11.8582 12.2789 10.4773 12.2789 8.97504C12.2789 6.57742 9.47737 3.51212 7.44429 1.28143Z" fill="white"/>
    </svg>
`)

    app.AddSvg('textHudWaterIconText', `
    <svg class="textHudIcon" width="13" height="15" viewBox="0 0 13 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M7.44429 1.28143C7.10811 0.902064 6.78794 0.553045 6.49978 0.234375C6.21163 0.56822 5.89146 0.917239 5.55528 1.28143C3.5222 3.49695 0.720703 6.57742 0.720703 8.97504C0.720703 10.4925 1.36104 11.8582 2.41761 12.8446C3.45816 13.831 4.89893 14.4531 6.49978 14.4531C8.10064 14.4531 9.54141 13.8461 10.582 12.8446C11.6225 11.8582 12.2789 10.4773 12.2789 8.97504C12.2789 6.57742 9.47737 3.51212 7.44429 1.28143Z" fill="${hudColors[currentHud].thirst}"/>
    </svg>
`)



    app.AddSvg('textHudMicrophonelow', `
<svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="48" height="48" rx="6" fill="url(#paint0_linear_54_1636)"/>
<g clip-path="url(#clip0_54_1636)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_54_1636" x1="38" y1="48" x2="38" y2="32" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_54_1636">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>

`)

    app.AddSvg('textHudMicrophonemid', `
<svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<g opacity="0.6">
<rect width="48" height="48" rx="6" fill="url(#paint0_linear_54_1751)"/>
<rect width="48" height="48" rx="6" fill="url(#paint1_linear_54_1751)"/>
<rect width="48" height="48" rx="6" fill="url(#paint2_linear_54_1751)"/>
</g>
<g clip-path="url(#clip0_54_1751)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_54_1751" x1="38" y1="48" x2="38" y2="19" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<linearGradient id="paint1_linear_54_1751" x1="38" y1="48" x2="38" y2="19" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<linearGradient id="paint2_linear_54_1751" x1="38" y1="48" x2="38" y2="19" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_54_1751">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>


`)

    app.AddSvg('textHudMicrophonehigh', `
<svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="48" height="48" rx="6" fill="url(#paint0_linear_54_1761)"/>
<g clip-path="url(#clip0_54_1761)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_54_1761" x1="38" y1="48" x2="38" y2="-6" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_54_1761">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>
`)
    app.AddSvg('textHudMicrophone2', `
<svg class="textHudMicIcon" width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">

<rect  opacity="0.6" width="48" height="48" rx="6" fill="#141B1F"/>
<g clip-path="url(#clip0_54_1771)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<clipPath id="clip0_54_1771">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>

`)
    app.AddSvg('textHudTextMicrophonelow', `
<svg  class="textHudMicIcon" width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="48" height="48" rx="6" fill="url(#paint0_linear_54_1637)"/>
<g clip-path="url(#clip0_54_1637)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_54_1637" x1="38" y1="48" x2="38" y2="32" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_54_1637">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>

`)

    app.AddSvg('textHudTextMicrophonemid', `
<svg  class="textHudMicIcon" width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<g opacity="0.6">
<rect width="48" height="48" rx="6" fill="url(#paint0_linear_54_1752)"/>
<rect width="48" height="48" rx="6" fill="url(#paint1_linear_54_1752)"/>
<rect width="48" height="48" rx="6" fill="url(#paint2_linear_54_1752)"/>
</g>
<g clip-path="url(#clip0_54_1752)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_54_1752" x1="38" y1="48" x2="38" y2="19" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<linearGradient id="paint1_linear_54_1752" x1="38" y1="48" x2="38" y2="19" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<linearGradient id="paint2_linear_54_1752" x1="38" y1="48" x2="38" y2="19" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_54_1752">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>


`)
    app.AddSvg('textHudMicrophone', `
<svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">

<rect opacity="0.6" width="48" height="48" rx="6" fill="#141B1F"/>
<g clip-path="url(#clip0_54_17723)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<clipPath id="clip0_54_17723">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>
`)
    app.AddSvg('bank-icon', `

<svg width="13" height="10" viewBox="0 0 13 10" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 1.66667C0 1.22464 0.171205 0.800716 0.475951 0.488155C0.780698 0.175595 1.19402 0 1.625 0H11.375C11.806 0 12.2193 0.175595 12.524 0.488155C12.8288 0.800716 13 1.22464 13 1.66667V5.83333H0V1.66667ZM9.34375 2.5C9.23601 2.5 9.13267 2.5439 9.05649 2.62204C8.9803 2.70018 8.9375 2.80616 8.9375 2.91667V3.75C8.9375 3.86051 8.9803 3.96649 9.05649 4.04463C9.13267 4.12277 9.23601 4.16667 9.34375 4.16667H10.9688C11.0765 4.16667 11.1798 4.12277 11.256 4.04463C11.3322 3.96649 11.375 3.86051 11.375 3.75V2.91667C11.375 2.80616 11.3322 2.70018 11.256 2.62204C11.1798 2.5439 11.0765 2.5 10.9688 2.5H9.34375ZM0 7.5V8.33333C0 8.77536 0.171205 9.19928 0.475951 9.51184C0.780698 9.8244 1.19402 10 1.625 10H11.375C11.806 10 12.2193 9.8244 12.524 9.51184C12.8288 9.19928 13 8.77536 13 8.33333V7.5H0Z" fill="black"/>
</svg>
`)

    app.AddSvg('money-icon', `
<svg width="16" height="12" viewBox="0 0 16 12" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M2 0C1.46957 0 0.960859 0.210714 0.585786 0.585786C0.210714 0.960859 0 1.46957 0 2V6C0 6.53043 0.210714 7.03914 0.585786 7.41421C0.960859 7.78929 1.46957 8 2 8V2H12C12 1.46957 11.7893 0.960859 11.4142 0.585786C11.0391 0.210714 10.5304 0 10 0H2ZM4 6C4 5.46957 4.21071 4.96086 4.58579 4.58579C4.96086 4.21071 5.46957 4 6 4H14C14.5304 4 15.0391 4.21071 15.4142 4.58579C15.7893 4.96086 16 5.46957 16 6V10C16 10.5304 15.7893 11.0391 15.4142 11.4142C15.0391 11.7893 14.5304 12 14 12H6C5.46957 12 4.96086 11.7893 4.58579 11.4142C4.21071 11.0391 4 10.5304 4 10V6ZM10 10C10.5304 10 11.0391 9.78929 11.4142 9.41421C11.7893 9.03914 12 8.53043 12 8C12 7.46957 11.7893 6.96086 11.4142 6.58579C11.0391 6.21071 10.5304 6 10 6C9.46957 6 8.96086 6.21071 8.58579 6.58579C8.21071 6.96086 8 7.46957 8 8C8 8.53043 8.21071 9.03914 8.58579 9.41421C8.96086 9.78929 9.46957 10 10 10Z" fill="black"/>
</svg>

`)


    app.AddSvg('mic-muted', `
<svg class="textHudMicIcon" width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="48" height="48" rx="6" fill="#141B1F"/>
<path d="M31.5 23.9116C31.5 23.4116 31.1176 23.0293 30.6176 23.0293C30.1176 23.0293 29.7353 23.4116 29.7353 23.9116C29.7353 27.3528 26.9412 30.1469 23.5 30.1469C20.0588 30.1469 17.2647 27.3528 17.2647 23.9116C17.2647 23.4116 16.8824 23.0293 16.3824 23.0293C15.8824 23.0293 15.5 23.4116 15.5 23.9116C15.5 27.9999 18.5588 31.4411 22.6176 31.8822V34.2352H19.4118C18.9118 34.2352 18.5294 34.6175 18.5294 35.1175C18.5294 35.6175 18.9118 35.9999 19.4118 35.9999H27.5882C28.0882 35.9999 28.4706 35.6175 28.4706 35.1175C28.4706 34.6175 28.0882 34.2352 27.5882 34.2352H24.3824V31.8822C28.4412 31.4411 31.5 27.9999 31.5 23.9116Z" fill="#FF4848"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M18.5881 15.9118C18.5881 13.2059 20.794 11 23.4999 11C25.8944 11 27.8973 12.7274 28.3266 15L19.063 26C18.7586 25.3601 18.5881 24.6428 18.5881 23.8824V15.9118ZM21.6563 28.4511L28.4117 20.1091V23.9118C28.4117 26.6176 26.2058 28.8235 23.4999 28.8235C22.8484 28.8164 22.226 28.6849 21.6563 28.4511Z" fill="#FF4848"/>
<path d="M34 11L23.5 23.5L13 36" stroke="white" stroke-width="2"/>
</svg>


`)

    app.AddSvg('textHudTextMicrophonehigh', `
<svg class="textHudMicIcon" width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="48" height="48" rx="6" fill="url(#paint0_linear_54_1763)"/>
<g clip-path="url(#clip0_54_1763)">
<path d="M31.5 23.9118C31.5 23.4118 31.1176 23.0294 30.6176 23.0294C30.1176 23.0294 29.7353 23.4118 29.7353 23.9118C29.7353 27.3529 26.9412 30.1471 23.5 30.1471C20.0588 30.1471 17.2647 27.3529 17.2647 23.9118C17.2647 23.4118 16.8824 23.0294 16.3824 23.0294C15.8824 23.0294 15.5 23.4118 15.5 23.9118C15.5 28 18.5588 31.4412 22.6176 31.8824V34.2353H19.4118C18.9118 34.2353 18.5294 34.6177 18.5294 35.1177C18.5294 35.6177 18.9118 36 19.4118 36H27.5882C28.0882 36 28.4706 35.6177 28.4706 35.1177C28.4706 34.6177 28.0882 34.2353 27.5882 34.2353H24.3824V31.8824C28.4412 31.4412 31.5 28 31.5 23.9118Z" fill="#AFFF48"/>
<path d="M23.4997 11C20.7938 11 18.5879 13.2059 18.5879 15.9118V23.8824C18.5879 26.6176 20.7938 28.7941 23.4997 28.8235C26.2055 28.8235 28.4114 26.6176 28.4114 23.9118V15.9118C28.4114 13.2059 26.2055 11 23.4997 11Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_54_1763" x1="38" y1="48" x2="38" y2="-6" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_54_1763">
<rect width="25" height="25" fill="white" transform="translate(11 11)"/>
</clipPath>
</defs>
</svg>
`)



    app.AddSvg('textHudArmorInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_225" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].armor}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].armor}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="armorBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_225')" id="armorLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudArmorRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
        class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.15" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="armorText" fill-rule="evenodd" stroke="${hudColors[currentHud].armor}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudArmorInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_222242424225" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].armor}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].armor}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="armorBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_222242424225')" id="armorLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudArmorRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
        class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.15" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="armorText2" fill-rule="evenodd" stroke="${hudColors[currentHud].armor}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudArmorInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_22222224242424225" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].armor}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].armor}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="armorBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_22222224242424225')" id="armorLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudArmorRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
        class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.15" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="armorText3" fill-rule="evenodd" stroke="${hudColors[currentHud].armor}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudArmorIcon', `
    <svg class="textHudIcon" width="13" height="15" viewBox="0 0 13 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M8.07427 11.0602H12.0133C12.1169 11.0602 12.2009 10.9749 12.2009 10.8697V10.4755C12.2009 10.3703 12.1169 10.285 12.0133 10.285H8.07424C7.84803 10.285 7.65338 10.1084 7.64276 9.87892C7.63138 9.6339 7.82363 9.43164 8.06239 9.43164H12.0133C12.1169 9.43164 12.2009 9.34633 12.2009 9.2411V8.88261C12.2009 8.77738 12.1169 8.69207 12.0133 8.69207H8.07424C7.84803 8.69207 7.65338 8.51553 7.64276 8.28604C7.63138 8.04102 7.82363 7.83876 8.06239 7.83876H12.0133C12.1169 7.83876 12.2009 7.75345 12.2009 7.64822V6.36352L12.1559 6.27293C11.7505 5.45612 11.5314 4.54095 11.5221 3.62635C11.5129 2.71174 11.7135 1.79214 12.1022 0.967212C12.1794 0.803668 12.1664 0.613752 12.0669 0.462132C11.9714 0.316502 11.8058 0.234375 11.6336 0.234375H10.9391C10.8499 0.234375 10.7729 0.298333 10.7552 0.387216C10.6799 0.76543 10.6702 0.812923 10.6684 0.821496C10.4514 1.83012 9.95774 2.77042 9.27839 3.46913C8.48099 4.28929 7.48355 4.72278 6.3939 4.72278C5.29726 4.72278 4.2907 4.28966 3.48313 3.47024C2.78508 2.76199 2.2857 1.78964 2.11299 0.802561C2.11053 0.788537 2.10709 0.764777 2.057 0.398884C2.04415 0.304692 1.96485 0.234375 1.87118 0.234375H1.07857C0.936576 0.234375 0.797686 0.289391 0.700611 0.394625C0.561805 0.545082 0.526083 0.759014 0.602222 0.943792L0.728003 1.24893C1.35422 2.76786 1.33698 4.50263 0.68071 6.00841L0.521024 6.37479V7.66607C0.521024 7.77131 0.605018 7.85661 0.708633 7.85661H4.63967C4.86588 7.85661 5.06054 8.03316 5.07116 8.26265C5.08253 8.50766 4.89029 8.70993 4.65153 8.70993H0.708605C0.60499 8.70993 0.520996 8.79524 0.520996 8.90047V9.25895C0.520996 9.36419 0.60499 9.44949 0.708605 9.44949H4.63965C4.86586 9.44949 5.06051 9.62604 5.07113 9.85553C5.08251 10.1005 4.89026 10.3028 4.6515 10.3028H0.708605C0.60499 10.3028 0.520996 10.3881 0.520996 10.4934V10.8875C0.520996 10.9928 0.60499 11.0781 0.708605 11.0781H4.63965C4.86586 11.0781 5.06051 11.2546 5.07113 11.4841C5.08251 11.7291 4.89026 11.9314 4.6515 11.9314H0.708605C0.60499 11.9314 0.520996 12.0167 0.520996 12.1219V12.9198C0.520996 13.4159 0.84238 13.8529 1.31079 13.9936L1.51097 14.0538C3.09757 14.5307 4.72892 14.769 6.36091 14.769C7.99246 14.769 9.62462 14.5306 11.2108 14.0538L11.4111 13.9936C11.8795 13.8528 12.2009 13.4159 12.2009 12.9198V12.1041C12.2009 11.9988 12.1169 11.9135 12.0133 11.9135H8.06239V11.9135C7.82363 11.9135 7.63141 11.7112 7.64276 11.4662C7.65341 11.2368 7.84806 11.0602 8.07427 11.0602Z" fill="white"/>
    </svg>
`)
    app.AddSvg('textHudArmorIconText', `
    <svg class="textHudIcon" width="13" height="15" viewBox="0 0 13 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M8.07427 11.0602H12.0133C12.1169 11.0602 12.2009 10.9749 12.2009 10.8697V10.4755C12.2009 10.3703 12.1169 10.285 12.0133 10.285H8.07424C7.84803 10.285 7.65338 10.1084 7.64276 9.87892C7.63138 9.6339 7.82363 9.43164 8.06239 9.43164H12.0133C12.1169 9.43164 12.2009 9.34633 12.2009 9.2411V8.88261C12.2009 8.77738 12.1169 8.69207 12.0133 8.69207H8.07424C7.84803 8.69207 7.65338 8.51553 7.64276 8.28604C7.63138 8.04102 7.82363 7.83876 8.06239 7.83876H12.0133C12.1169 7.83876 12.2009 7.75345 12.2009 7.64822V6.36352L12.1559 6.27293C11.7505 5.45612 11.5314 4.54095 11.5221 3.62635C11.5129 2.71174 11.7135 1.79214 12.1022 0.967212C12.1794 0.803668 12.1664 0.613752 12.0669 0.462132C11.9714 0.316502 11.8058 0.234375 11.6336 0.234375H10.9391C10.8499 0.234375 10.7729 0.298333 10.7552 0.387216C10.6799 0.76543 10.6702 0.812923 10.6684 0.821496C10.4514 1.83012 9.95774 2.77042 9.27839 3.46913C8.48099 4.28929 7.48355 4.72278 6.3939 4.72278C5.29726 4.72278 4.2907 4.28966 3.48313 3.47024C2.78508 2.76199 2.2857 1.78964 2.11299 0.802561C2.11053 0.788537 2.10709 0.764777 2.057 0.398884C2.04415 0.304692 1.96485 0.234375 1.87118 0.234375H1.07857C0.936576 0.234375 0.797686 0.289391 0.700611 0.394625C0.561805 0.545082 0.526083 0.759014 0.602222 0.943792L0.728003 1.24893C1.35422 2.76786 1.33698 4.50263 0.68071 6.00841L0.521024 6.37479V7.66607C0.521024 7.77131 0.605018 7.85661 0.708633 7.85661H4.63967C4.86588 7.85661 5.06054 8.03316 5.07116 8.26265C5.08253 8.50766 4.89029 8.70993 4.65153 8.70993H0.708605C0.60499 8.70993 0.520996 8.79524 0.520996 8.90047V9.25895C0.520996 9.36419 0.60499 9.44949 0.708605 9.44949H4.63965C4.86586 9.44949 5.06051 9.62604 5.07113 9.85553C5.08251 10.1005 4.89026 10.3028 4.6515 10.3028H0.708605C0.60499 10.3028 0.520996 10.3881 0.520996 10.4934V10.8875C0.520996 10.9928 0.60499 11.0781 0.708605 11.0781H4.63965C4.86586 11.0781 5.06051 11.2546 5.07113 11.4841C5.08251 11.7291 4.89026 11.9314 4.6515 11.9314H0.708605C0.60499 11.9314 0.520996 12.0167 0.520996 12.1219V12.9198C0.520996 13.4159 0.84238 13.8529 1.31079 13.9936L1.51097 14.0538C3.09757 14.5307 4.72892 14.769 6.36091 14.769C7.99246 14.769 9.62462 14.5306 11.2108 14.0538L11.4111 13.9936C11.8795 13.8528 12.2009 13.4159 12.2009 12.9198V12.1041C12.2009 11.9988 12.1169 11.9135 12.0133 11.9135H8.06239V11.9135C7.82363 11.9135 7.63141 11.7112 7.64276 11.4662C7.65341 11.2368 7.84806 11.0602 8.07427 11.0602Z" fill="${hudColors[currentHud].armor}"/>
    </svg>
`)


    app.AddSvg('textHudHungerInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_226" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].hunger}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].hunger}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="hungerBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_226')" id="hungerLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudHungerRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.15" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="hungerText" fill-rule="evenodd" stroke="${hudColors[currentHud].hunger}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)


    app.AddSvg('textHudHungerInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_17224242425225_226" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].hunger}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].hunger}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="hungerBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_17224242425225_226')" id="hungerLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudHungerRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.15" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="hungerText2" fill-rule="evenodd" stroke="${hudColors[currentHud].hunger}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudHungerInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_1722424242242425225_226" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].hunger}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].hunger}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="hungerBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_1722424242242425225_226')" id="hungerLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudHungerRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.15" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="hungerText3" fill-rule="evenodd" stroke="${hudColors[currentHud].hunger}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)


    app.AddSvg('textHudHungerIcon', `
<svg class="textHudIcon"  width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_172_191)">
<path d="M14.6097 12.3238L8.72796 6.74834L1.85609 0.234375H1.31905L1.20939 0.498505C0.919963 1.19567 0.796301 1.90872 0.851819 2.56047C0.9151 3.3034 1.21284 3.94661 1.71291 4.42063L7.07746 9.50578L7.78504 8.83505L12.7446 14.0919C13.2379 14.5596 14.0871 14.5873 14.6097 14.0919C15.124 13.6044 15.124 12.8113 14.6097 12.3238Z" fill="white"/>
<path d="M4.59155 8.328L0.390059 12.3107C-0.12416 12.7981 -0.12416 13.5913 0.390059 14.0787C0.878555 14.5418 1.72362 14.5826 2.25524 14.0787L6.45677 10.096L4.59155 8.328Z" fill="white"/>
<path d="M14.3628 2.60181L11.9794 4.86098L11.3577 4.27162L13.741 2.01243L13.1193 1.42307L10.736 3.68224L10.1142 3.09288L12.4975 0.833713L11.8758 0.244385L8.76715 3.19116C8.38685 3.55166 8.15977 4.03032 8.12766 4.53903C8.11954 4.66792 8.08872 4.79469 8.0376 4.91527L10.057 6.8295C10.1842 6.78098 10.318 6.7518 10.4539 6.7441C10.9906 6.71375 11.4955 6.49844 11.8758 6.13795L14.9845 3.19119L14.3628 2.60181Z" fill="white"/>
</g>
<defs>
<clipPath id="clip0_172_191">
<rect width="15" height="14.2188" fill="white" transform="translate(0 0.234375)"/>
</clipPath>
</defs>
</svg>

`)

    app.AddSvg('textHudHungerIconText', `


<svg class="textHudIcon"  width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_172_192)">
<path d="M14.6097 12.3238L8.72796 6.74834L1.85609 0.234375H1.31905L1.20939 0.498505C0.919963 1.19567 0.796301 1.90872 0.851819 2.56047C0.9151 3.3034 1.21284 3.94661 1.71291 4.42063L7.07746 9.50578L7.78504 8.83505L12.7446 14.0919C13.2379 14.5596 14.0871 14.5873 14.6097 14.0919C15.124 13.6044 15.124 12.8113 14.6097 12.3238Z" fill="${hudColors[currentHud].hunger}"/>
<path d="M4.59155 8.328L0.390059 12.3107C-0.12416 12.7981 -0.12416 13.5913 0.390059 14.0787C0.878555 14.5418 1.72362 14.5826 2.25524 14.0787L6.45677 10.096L4.59155 8.328Z" fill="${hudColors[currentHud].hunger}"/>
<path d="M14.3628 2.60181L11.9794 4.86098L11.3577 4.27162L13.741 2.01243L13.1193 1.42307L10.736 3.68224L10.1142 3.09288L12.4975 0.833713L11.8758 0.244385L8.76715 3.19116C8.38685 3.55166 8.15977 4.03032 8.12766 4.53903C8.11954 4.66792 8.08872 4.79469 8.0376 4.91527L10.057 6.8295C10.1842 6.78098 10.318 6.7518 10.4539 6.7441C10.9906 6.71375 11.4955 6.49844 11.8758 6.13795L14.9845 3.19119L14.3628 2.60181Z" fill="${hudColors[currentHud].hunger}"/>
</g>
<defs>
<clipPath id="clip0_172_192">
<rect width="15" height="14.2188" fill="${hudColors[currentHud].hunger}" transform="translate(0 0.234375)"/>
</clipPath>
</defs>
</svg>
`)

    app.AddSvg('textHudStaminaInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_227" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].stamina}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].stamina}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="staminaBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_227')" id="staminaLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudStaminaRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="staminaText" fill-rule="evenodd" stroke="${hudColors[currentHud].stamina}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudStaminaInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172242452525252_227" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].stamina}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].stamina}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="staminaBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172242452525252_227')" id="staminaLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudStaminaRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="staminaText2" fill-rule="evenodd" stroke="${hudColors[currentHud].stamina}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudStaminaInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172242452525252_227" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].stamina}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].stamina}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="staminaBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172242452525252_227')" id="staminaLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudStaminaRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="staminaText3" fill-rule="evenodd" stroke="${hudColors[currentHud].stamina}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)


    app.AddSvg('textHudStaminaIcon', `
<svg class="textHudIcon" width="15" height="16" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path 
        fill-rule="evenodd" 
        clip-rule="evenodd" 
        d="M9.94285 0.234957C9.18142 0.364707 8.59227 1.07772 8.59412 1.86718C8.59514 2.3047 8.7559 2.68791 9.07436 3.01197C9.73282 3.68197 10.7712 3.65839 11.392 2.95934C11.9753 2.30249 11.9513 1.33309 11.3364 0.707507C11.2233 0.592433 11.0624 0.46101 10.9789 0.415429C10.6948 0.260333 10.2493 0.18274 9.94285 0.234957ZM13.8556 2.15014C13.6638 2.22006 13.4805 2.36858 13.3916 2.52612C13.353 2.59442 13.1543 3.12107 12.9499 3.69644C12.7455 4.27181 12.5684 4.75296 12.5563 4.76567C12.5442 4.77834 12.2059 4.66667 11.8044 4.51747L11.0745 4.24619L10.8387 4.31425C10.6419 4.37101 10.5346 4.38198 10.1922 4.38039C9.83439 4.37875 9.74831 4.36823 9.52323 4.29865C8.94977 4.12134 8.47357 3.77289 8.15854 3.30016C8.04022 3.12259 8.03676 3.12023 7.73718 3.01212C7.09069 2.77884 6.74433 2.76542 5.38225 2.92093C4.356 3.0381 4.24575 3.06565 3.96761 3.27428C3.68343 3.48748 3.61609 3.61938 3.19424 4.7891C2.77194 5.9601 2.74323 6.08558 2.82887 6.3857C2.89343 6.61205 3.13822 6.87358 3.35617 6.94911C3.51798 7.00518 3.74582 7.0137 3.90191 6.96953C4.05264 6.92684 4.2622 6.78278 4.35617 6.65724C4.4048 6.59226 4.56072 6.20762 4.74163 5.70628C4.90869 5.2433 5.05513 4.85584 5.06707 4.84532C5.09013 4.82497 6.80411 4.65615 6.81748 4.67289C6.82182 4.67833 6.34732 6.02108 5.76307 7.65677L4.70074 10.6308L3.45759 10.6457L2.21441 10.6606L2.0499 10.743C1.26843 11.1341 1.27401 12.2667 2.05923 12.6362L2.24374 12.723L3.78139 12.7315C4.81656 12.7372 5.36979 12.7293 5.47432 12.7072C5.81657 12.6347 6.16888 12.3785 6.34169 12.0764C6.38273 12.0046 6.53193 11.6205 6.67324 11.2229L6.93014 10.4999L7.10932 10.5683C7.20787 10.6059 7.57557 10.7426 7.92642 10.872C8.27726 11.0014 8.56435 11.1215 8.56435 11.1388C8.56435 11.1561 8.32443 11.8357 8.03122 12.649L7.49806 14.1278L7.49594 14.4118C7.49401 14.6666 7.50225 14.7125 7.5764 14.8601C7.8687 15.4419 8.56517 15.6308 9.08146 15.2684C9.34649 15.0823 9.36951 15.0307 10.1066 12.9716C10.4846 11.9156 10.8082 10.9675 10.8258 10.8647C10.9084 10.3814 10.6592 9.81624 10.244 9.545C10.1671 9.49475 9.93259 9.39041 9.72288 9.31309C9.51317 9.23573 9.33103 9.16298 9.3181 9.15135C9.29733 9.1327 10.3924 6.00007 10.4382 5.94698C10.4482 5.93539 10.9074 6.09302 11.4587 6.29726C12.0099 6.50149 12.5448 6.68223 12.6472 6.69891C13.1758 6.78496 13.74 6.48738 13.9858 5.99295C14.0199 5.92445 14.2617 5.27211 14.5233 4.54332C14.9775 3.27781 14.999 3.20814 15 2.99404C15.0013 2.72211 14.9338 2.55066 14.753 2.36636C14.5189 2.12785 14.1564 2.04048 13.8556 2.15014ZM0.22763 6.85161C0.103799 6.91824 0 7.09458 0 7.23832C0 7.3817 0.0976687 7.54483 0.228275 7.61965C0.338174 7.68259 0.379412 7.68666 0.907058 7.68666C1.55906 7.68666 1.65327 7.66033 1.75942 7.44832C1.83421 7.29894 1.83421 7.1777 1.75942 7.02832C1.65292 6.8156 1.55959 6.78977 0.903069 6.7913C0.39789 6.79249 0.325562 6.79895 0.22763 6.85161ZM0.22763 8.64497C0.103799 8.71159 0 8.88794 0 9.03168C0 9.17506 0.0976687 9.33819 0.228275 9.41301C0.344598 9.47963 0.353015 9.48002 1.64031 9.48002C2.88035 9.48002 2.94024 9.47745 3.05108 9.41985C3.18121 9.35218 3.28495 9.17999 3.28495 9.03168C3.28495 8.88337 3.18121 8.71117 3.05108 8.64351C2.94012 8.58582 2.88173 8.5834 1.63632 8.58465C0.400941 8.58591 0.331927 8.58887 0.22763 8.64497Z" 
    fill="white"/>
</svg>
`)
    app.AddSvg('textHudStaminaIconText', `
<svg class="textHudIcon" width="15" height="16" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path 
        fill-rule="evenodd" 
        clip-rule="evenodd" 
        d="M9.94285 0.234957C9.18142 0.364707 8.59227 1.07772 8.59412 1.86718C8.59514 2.3047 8.7559 2.68791 9.07436 3.01197C9.73282 3.68197 10.7712 3.65839 11.392 2.95934C11.9753 2.30249 11.9513 1.33309 11.3364 0.707507C11.2233 0.592433 11.0624 0.46101 10.9789 0.415429C10.6948 0.260333 10.2493 0.18274 9.94285 0.234957ZM13.8556 2.15014C13.6638 2.22006 13.4805 2.36858 13.3916 2.52612C13.353 2.59442 13.1543 3.12107 12.9499 3.69644C12.7455 4.27181 12.5684 4.75296 12.5563 4.76567C12.5442 4.77834 12.2059 4.66667 11.8044 4.51747L11.0745 4.24619L10.8387 4.31425C10.6419 4.37101 10.5346 4.38198 10.1922 4.38039C9.83439 4.37875 9.74831 4.36823 9.52323 4.29865C8.94977 4.12134 8.47357 3.77289 8.15854 3.30016C8.04022 3.12259 8.03676 3.12023 7.73718 3.01212C7.09069 2.77884 6.74433 2.76542 5.38225 2.92093C4.356 3.0381 4.24575 3.06565 3.96761 3.27428C3.68343 3.48748 3.61609 3.61938 3.19424 4.7891C2.77194 5.9601 2.74323 6.08558 2.82887 6.3857C2.89343 6.61205 3.13822 6.87358 3.35617 6.94911C3.51798 7.00518 3.74582 7.0137 3.90191 6.96953C4.05264 6.92684 4.2622 6.78278 4.35617 6.65724C4.4048 6.59226 4.56072 6.20762 4.74163 5.70628C4.90869 5.2433 5.05513 4.85584 5.06707 4.84532C5.09013 4.82497 6.80411 4.65615 6.81748 4.67289C6.82182 4.67833 6.34732 6.02108 5.76307 7.65677L4.70074 10.6308L3.45759 10.6457L2.21441 10.6606L2.0499 10.743C1.26843 11.1341 1.27401 12.2667 2.05923 12.6362L2.24374 12.723L3.78139 12.7315C4.81656 12.7372 5.36979 12.7293 5.47432 12.7072C5.81657 12.6347 6.16888 12.3785 6.34169 12.0764C6.38273 12.0046 6.53193 11.6205 6.67324 11.2229L6.93014 10.4999L7.10932 10.5683C7.20787 10.6059 7.57557 10.7426 7.92642 10.872C8.27726 11.0014 8.56435 11.1215 8.56435 11.1388C8.56435 11.1561 8.32443 11.8357 8.03122 12.649L7.49806 14.1278L7.49594 14.4118C7.49401 14.6666 7.50225 14.7125 7.5764 14.8601C7.8687 15.4419 8.56517 15.6308 9.08146 15.2684C9.34649 15.0823 9.36951 15.0307 10.1066 12.9716C10.4846 11.9156 10.8082 10.9675 10.8258 10.8647C10.9084 10.3814 10.6592 9.81624 10.244 9.545C10.1671 9.49475 9.93259 9.39041 9.72288 9.31309C9.51317 9.23573 9.33103 9.16298 9.3181 9.15135C9.29733 9.1327 10.3924 6.00007 10.4382 5.94698C10.4482 5.93539 10.9074 6.09302 11.4587 6.29726C12.0099 6.50149 12.5448 6.68223 12.6472 6.69891C13.1758 6.78496 13.74 6.48738 13.9858 5.99295C14.0199 5.92445 14.2617 5.27211 14.5233 4.54332C14.9775 3.27781 14.999 3.20814 15 2.99404C15.0013 2.72211 14.9338 2.55066 14.753 2.36636C14.5189 2.12785 14.1564 2.04048 13.8556 2.15014ZM0.22763 6.85161C0.103799 6.91824 0 7.09458 0 7.23832C0 7.3817 0.0976687 7.54483 0.228275 7.61965C0.338174 7.68259 0.379412 7.68666 0.907058 7.68666C1.55906 7.68666 1.65327 7.66033 1.75942 7.44832C1.83421 7.29894 1.83421 7.1777 1.75942 7.02832C1.65292 6.8156 1.55959 6.78977 0.903069 6.7913C0.39789 6.79249 0.325562 6.79895 0.22763 6.85161ZM0.22763 8.64497C0.103799 8.71159 0 8.88794 0 9.03168C0 9.17506 0.0976687 9.33819 0.228275 9.41301C0.344598 9.47963 0.353015 9.48002 1.64031 9.48002C2.88035 9.48002 2.94024 9.47745 3.05108 9.41985C3.18121 9.35218 3.28495 9.17999 3.28495 9.03168C3.28495 8.88337 3.18121 8.71117 3.05108 8.64351C2.94012 8.58582 2.88173 8.5834 1.63632 8.58465C0.400941 8.58591 0.331927 8.58887 0.22763 8.64497Z" 
    fill="${hudColors[currentHud].stamina}"/>
</svg>
`)



    app.AddSvg('textHudStressInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_228" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].stress}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].stress}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="stressBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_228')" id="stressLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudStressInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_2287777" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].stress}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].stress}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="stressBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_2287777')" id="stressLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudStressInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_2277778" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].stress}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].stress}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="stressBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_2277778')" id="stressLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudNitroInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_333" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].nitro}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].nitro}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="nitroBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_333')" id="nitroLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudNitroRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="nitroText" fill-rule="evenodd" stroke="${hudColors[currentHud].nitro}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudNitroInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_242424242333" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].nitro}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].nitro}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="nitroBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_242424242333')" id="nitroLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudNitroRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="nitroText2" fill-rule="evenodd" stroke="${hudColors[currentHud].nitro}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudNitroInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_24242424354352333" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].nitro}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].nitro}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="nitroBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_24242424354352333')" id="nitroLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudNitroRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="nitroText3" fill-rule="evenodd" stroke="${hudColors[currentHud].nitro}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)


    app.AddSvg('textHudAltitudeInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_334" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].nitro}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].nitro}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="altitudeBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_334')" id="altitudeLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudAltitudeRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="altitudeText" fill-rule="evenodd" stroke="${hudColors[currentHud].altitude}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudAltitudeInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_335353636334" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].altitude}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].altitude}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="altitudeBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_335353636334')" id="altitudeLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudAltitudeRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="altitudeText2" fill-rule="evenodd" stroke="${hudColors[currentHud].altitude}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudAltitudeInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_33523535353636334" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].altitude}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].altitude}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="altitudeBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_33523535353636334')" id="altitudeLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudAltitudeRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="altitudeText3" fill-rule="evenodd" stroke="${hudColors[currentHud].altitude}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudParachuteInner', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_335" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].parachute}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].parachute}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="parachuteBorder" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_335')" id="parachuteLoader" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudParachuteRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="parachuteText" fill-rule="evenodd" stroke="${hudColors[currentHud].parachute}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudParachuteInner2', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_355535353335" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].parachute}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].parachute}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="parachuteBorder2" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_355535353335')" id="parachuteLoader2" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudParachuteRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="parachuteText2" fill-rule="evenodd" stroke="${hudColors[currentHud].parachute}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudParachuteInner3', `
    <svg class="textHudInner" viewbox="0 0 250 250">
        <defs>
            <radialGradient id="paint0_radial_172_35553535353353335" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                gradientTransform="translate(15.5 15.3438) rotate(-90) scale(31.2305 31.775)">
                <stop stop-color="${hudColors[currentHud].parachute}" stop-opacity="1" />
                <stop offset="1" stop-color="${hudColors[currentHud].parachute}" />
            </radialGradient>
        </defs>
        <path class="fillNone" id="parachuteBorder3" transform="translate(125,125)" />
        <path  fill="url('#paint0_radial_172_35553535353353335')" id="parachuteLoader3" transform="translate(125,125) scale(.84)" />
    </svg>
`)

    app.AddSvg('textHudParachuteRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="parachuteText3" fill-rule="evenodd" stroke="${hudColors[currentHud].parachute}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudStressRadial', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="stressText" fill-rule="evenodd" stroke="${hudColors[currentHud].stress}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)

    app.AddSvg('textHudStressRadial2', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="stressText2" fill-rule="evenodd" stroke="${hudColors[currentHud].stress}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudStressRadial3', `

    <svg viewbox="0 0 400 400" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="textHudRadial">
        <path fill-rule="evenodd" stroke="#fff" stroke-opacity="0.25" stroke-width="30.07px"
            stroke-linecap="butt" stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
        <path id="stressText3" fill-rule="evenodd" stroke="${hudColors[currentHud].stress}" stroke-width="30.07px" stroke-linecap="butt"
            stroke-linejoin="miter" fill="none"
            d="M200.34,15.33 C302.208,15.33 385.36,97.861 385.36,200.35 C385.36,302.208 302.208,385.36 200.34,385.36 C97.861,385.36 15.33,302.208 15.33,200.35 C15.33,97.861 97.861,15.33 200.34,15.33 Z" />
    </svg>
`)
    app.AddSvg('textHudStressIcon', `
<svg class="textHudIcon" width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.98487 0.0146948C8.2668 0.062028 7.47469 0.206503 6.745 0.423198C6.55619 0.479279 6.40173 0.528308 6.40173 0.532173C6.40177 0.536038 6.51932 0.656542 6.66304 0.799931C6.97074 1.10702 7.18237 1.48423 7.26813 1.87849C7.39727 2.47219 7.21536 2.82363 6.76306 2.85411C6.59382 2.8655 6.54003 2.85462 6.43884 2.78837C6.26246 2.67292 6.19511 2.5381 6.17296 2.25624C6.14268 1.87032 5.98014 1.61541 5.60645 1.36783C5.17063 1.07905 4.78058 1.04568 4.17175 1.24509C3.41185 1.49393 2.75392 1.8848 2.24405 2.39027C1.76394 2.86622 1.43304 3.40122 1.36421 3.81278C1.22782 4.62836 1.88565 5.60103 2.82947 5.97946C3.01008 6.05185 3.21938 6.1023 3.47157 6.13417C3.86285 6.18364 3.95594 6.22359 4.09352 6.40108C4.19531 6.53237 4.19531 6.85401 4.09352 6.98529C3.93545 7.1892 3.85588 7.21914 3.48544 7.21406C2.34098 7.19836 1.09998 6.40305 0.542909 5.32829L0.385501 5.02459L0.327128 5.15533C-0.236106 6.41689 -0.0725363 7.60418 0.82178 8.74615C0.94356 8.90164 1.11818 9.13651 1.20983 9.26807C1.54376 9.7474 2.05352 10.1214 2.58183 10.2746C2.89354 10.3651 3.53923 10.358 3.95044 10.2596C4.91348 10.0292 5.45095 9.40027 5.64881 8.27234C5.70327 7.962 5.70334 7.91968 5.64979 7.67969C5.56738 7.31032 5.64705 7.09308 5.91282 6.96247C6.19733 6.82271 6.52549 6.92606 6.67268 7.20178C6.79334 7.42777 6.84344 7.8696 6.79482 8.27939C6.68768 9.1831 6.32583 9.96718 5.7426 10.5596L5.45317 10.8536L5.60177 10.9559C5.82456 11.1094 6.15385 11.2601 6.44296 11.3411C6.81752 11.4459 7.57274 11.468 8.10946 11.3899L8.51307 11.3311L8.69843 11.4927C9.0292 11.781 9.53829 11.9564 10.1836 12.0041L10.4883 12.0267L11.3666 12.9666C11.9404 13.5807 12.2847 13.9227 12.3598 13.9532C12.445 13.9879 12.6624 14 13.1966 14C13.855 14 13.9288 13.9941 14.0379 13.9322C14.3296 13.7667 14.3851 13.5644 14.2674 13.0963C14.2206 12.9103 14.1824 12.7455 14.1824 12.7301C14.1824 12.7147 14.2396 12.6918 14.3096 12.6792C14.5462 12.6364 15.0771 12.4549 15.4105 12.3029C16.0525 12.0099 16.6962 11.5211 17.0936 11.0245C17.3176 10.7446 17.546 10.3127 17.6342 10.0023C17.6973 9.78009 17.7077 9.66999 17.6951 9.35809C17.6781 8.93813 17.609 8.71611 17.4041 8.42282L17.2865 8.25464L17.4814 7.97424C17.869 7.41665 18 7.01147 18 6.37108C18 6.01415 17.9848 5.87883 17.9198 5.65966C17.7621 5.12763 17.4669 4.63552 17.0127 4.14777C16.8986 4.02524 16.6655 3.76168 16.4946 3.56214C16.3237 3.3626 16.0147 3.03002 15.8079 2.82312L15.4319 2.44693L15.3184 2.71371C15.0265 3.39966 14.5372 3.94888 13.9897 4.20494C13.4239 4.46961 12.9235 4.25058 12.9601 3.75426C12.9791 3.49796 13.0961 3.36644 13.4068 3.25207C13.6097 3.17741 13.6878 3.12496 13.8448 2.9579C14.203 2.57672 14.3921 2.12485 14.3215 1.81916C14.2661 1.57957 14.1602 1.45317 13.8479 1.25384C13.3832 0.957189 13.2315 0.895208 12.9704 0.895208C12.7691 0.895208 12.7056 0.913145 12.4388 1.04535C11.8436 1.3403 11.4862 1.67617 11.2384 2.17337C10.9912 2.66936 10.9049 3.04046 10.8773 3.72639C10.858 4.20436 10.843 4.31863 10.7895 4.39542C10.5685 4.71231 10.0882 4.70268 9.83761 4.37644C9.76899 4.28706 9.76403 4.23725 9.76473 3.64745C9.76544 3.06338 9.77325 2.98546 9.86553 2.64138C10.113 1.71832 10.4851 1.08769 11.1236 0.508811L11.4388 0.223049L11.1842 0.167307C10.5629 0.0312073 9.67204 -0.0306041 8.98487 0.0146948ZM8.18315 3.169C8.53074 3.3759 8.57528 4.07986 8.27363 4.59859L8.18051 4.75876L8.35594 4.9303C8.56426 5.13397 8.74096 5.20012 8.91495 5.13953C9.19696 5.04131 9.46146 5.12577 9.63109 5.3682C9.76741 5.56295 9.7208 5.87001 9.52917 6.03995C9.39806 6.15621 9.06518 6.25241 8.79398 6.25241C8.31968 6.25241 7.85217 6.03402 7.48106 5.63904L7.29137 5.43716L7.1265 5.50521C6.52073 5.75531 5.78122 5.76921 5.28949 5.53976C5.01393 5.41119 4.72467 5.13587 4.67376 4.95373C4.59814 4.68336 4.72259 4.42414 4.98076 4.31415C5.21858 4.21284 5.40546 4.24878 5.62719 4.43842C5.75703 4.5495 5.84051 4.59222 5.96183 4.60975C6.28453 4.65637 6.79453 4.5025 7.08988 4.26943C7.29771 4.10542 7.35062 3.98014 7.32742 3.70726C7.31323 3.54034 7.32277 3.45815 7.36558 3.37844C7.42677 3.26445 7.6071 3.11746 7.72198 3.0879C7.8489 3.05524 8.05208 3.09098 8.18315 3.169ZM11.8959 4.85167C12.3476 5.0664 12.7363 5.58435 12.8655 6.1435C12.9618 6.56017 12.8931 7.33422 12.7234 7.74557C12.7083 7.78219 12.7678 7.84441 12.9228 7.9542C13.4065 8.29665 13.8242 8.80175 13.9778 9.22972C14.0894 9.54098 14.0953 10.1094 13.9887 10.2837C13.7574 10.662 13.2341 10.6631 13.0047 10.2859C12.9529 10.2007 12.9353 10.1057 12.9331 9.89951C12.9309 9.68861 12.9121 9.58994 12.8506 9.46801C12.68 9.1298 12.2996 8.81457 11.7574 8.56204C11.3675 8.38043 11.0224 8.30852 10.6325 8.32754C10.2771 8.3449 10.0942 8.41902 9.93633 8.60968C9.71566 8.87611 9.61556 8.95969 9.47269 8.99675C9.21129 9.06453 8.95143 8.95023 8.83349 8.7156C8.73663 8.52291 8.74153 8.40468 8.85553 8.18442C9.06184 7.78572 9.57613 7.41929 10.116 7.28645C10.399 7.2168 11.0134 7.21731 11.3707 7.2875C11.5262 7.31805 11.6604 7.33636 11.6688 7.32819C11.7033 7.29499 11.7871 6.83437 11.7877 6.67515C11.7885 6.45228 11.7142 6.18208 11.6128 6.03961C11.5682 5.97698 11.4489 5.87001 11.3477 5.80186C11.1395 5.66176 11.049 5.51115 11.049 5.30469C11.049 5.07508 11.1946 4.87683 11.4187 4.80142C11.5891 4.74405 11.6923 4.75493 11.8959 4.85167ZM15.4866 5.77758C15.7532 5.84889 15.9443 6.17205 15.8711 6.42757C15.828 6.57781 15.7208 6.71312 15.5954 6.77558C15.479 6.83353 14.5978 6.99834 14.4043 6.99834C14.2466 6.99834 14.0742 6.90266 13.9568 6.75005C13.8497 6.61086 13.8539 6.30876 13.9651 6.15866C14.083 5.99953 14.1999 5.95332 14.7585 5.84516C15.3381 5.73293 15.3244 5.73422 15.4866 5.77758Z" fill="white"/>
</svg>
`)


    app.AddSvg('textHudParachuteIcon', `
    <img class="textHudIcon" src="./assets/images/parachute.png">

`)
    app.AddSvg('textHudParachuteIconText', `
<svg class="textHudIcon"  width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.65385 0C5.19231 0 0 2.15385 0 7L9 14L18 7C18 4.57692 16.062 0 8.65385 0ZM5.53846 6.73077C4.70769 4.14615 1.38462 5.11538 1.38462 6.73077L7.61538 11.5769L5.53846 6.73077ZM6.92308 7C6.57692 5.65385 10.3846 4.30769 11.0769 7L9 11.8462L6.92308 7ZM16.9615 6.73077C15.0231 3.93077 12.4615 5.65385 12.4615 7L10.3846 11.5769L16.9615 6.73077Z" fill="${hudColors[currentHud].parachute}"/>
</svg>


`)
    app.AddSvg('textHudNitroIconText', `
<svg class="textHudIcon" width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M6.44552 5.03446L2.19208 8.32309L7.39072 12.3425L11.6442 9.0539L6.44552 5.03446Z" fill="${hudColors[currentHud].nitro}"/>
<path d="M12.5894 8.32309L7.39072 4.30366C8.57223 3.57285 11.4079 2.54972 13.2983 4.30366C15.1887 6.05759 13.6133 7.71409 12.5894 8.32309Z" fill="${hudColors[currentHud].nitro}"/>
<path d="M11.4079 1.92856C11.975 2.22088 12.4318 1.92856 12.5894 1.74585L13.2983 2.29376L12.5894 2.84187C13.5346 2.98803 14.5585 3.99898 14.9524 4.48618L15.6613 3.93808C15.8976 4.30348 16.4175 5.21699 16.6065 5.9478C16.9846 7.55557 14.5585 9.54093 13.2983 10.3326C10.699 9.60183 10.2263 12.7078 12.3531 12.7078C14.2435 12.5616 14.2435 11.4289 14.0072 10.8807C14.7949 10.3326 16.512 9.09027 17.0791 8.50562C19.2058 6.3132 17.0791 4.12078 16.3702 3.38997C16.5592 1.63604 15.0312 1.56316 14.2435 1.74596L13.2983 1.01516L13.7709 0.649644C14.4798 -0.0810532 13.2983 -0.0813033 13.062 0.101539L11.8348 1.03674C11.4461 1.22562 10.9533 1.57709 11.4079 1.92856Z" fill="${hudColors[currentHud].nitro}"/>
<path d="M6.6818 13.0733L1.24685 8.8712C-0.17096 9.78471 -0.643564 11.9771 1.24685 13.4387C2.75918 14.608 5.50029 13.6823 6.6818 13.0733Z" fill="${hudColors[currentHud].nitro}"/>
</svg>


`)

    app.AddSvg('textHudAltitudeIconText', `
<svg class="textHudIcon" width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M17.5 7C17.5 10.4802 13.8186 13.5 9 13.5C4.18136 13.5 0.5 10.4802 0.5 7C0.5 3.51981 4.18136 0.5 9 0.5C13.8186 0.5 17.5 3.51981 17.5 7Z" stroke="${hudColors[currentHud].altitude}"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M4.2353 6.58823L2.64706 5.7647C2.64706 5.35294 4.76471 2.05882 9.00001 2.05882C12.3882 2.05882 14.6471 4.52941 15.3529 5.7647L13.7647 6.58823H10.5882L9.00001 5.7647L7.41177 6.58823H4.2353ZM7.41177 4.11765V3.70588H10.5882V4.11765H7.41177ZM10.5882 4.94118V4.52941H7.41177V4.94118H10.5882Z" fill="${hudColors[currentHud].altitude}"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M2.64706 8.2353L4.2353 7.41177H6.88236C5.61177 7.41177 6.35295 8.2353 6.88236 8.2353H10.5882C11.4353 8.2353 11.6471 7.68628 11.6471 7.41177H13.7647C14.1177 7.54902 14.9294 7.90588 15.3529 8.2353C15.3529 8.64706 12.7059 11.9412 9.00001 11.9412C5.16214 11.9412 3.78766 9.9125 2.90696 8.61261C2.81577 8.478 2.72986 8.35121 2.64706 8.2353ZM10.5882 9.05882V9.47059H7.41177V9.05882H10.5882ZM10.5882 10.2941V9.88235H7.41177V10.2941H10.5882Z" fill="${hudColors[currentHud].altitude}"/>
<path d="M3.17648 7L2.64706 6.58824V7.41177L3.17648 7Z" fill="${hudColors[currentHud].altitude}"/>
<path d="M15.3529 6.58824L14.8235 7L15.3529 7.41177V6.58824Z" fill="${hudColors[currentHud].altitude}"/>
<path d="M7.41177 7.41177L9.00001 6.58824L10.5882 7.41177H7.41177Z" fill="${hudColors[currentHud].altitude}"/>
</svg>


`)
    app.AddSvg('textHudAltitudeIcon', `
    <img class="textHudIcon" src="./assets/images/altitude.png">

`)


    app.AddSvg('textHudNitroIcon', `
    <img class="textHudIcon" src="./assets/images/nitro.png">

`)
    app.AddSvg('textHudStressIconText', `
<svg class="textHudIcon" width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.98487 0.0146948C8.2668 0.062028 7.47469 0.206503 6.745 0.423198C6.55619 0.479279 6.40173 0.528308 6.40173 0.532173C6.40177 0.536038 6.51932 0.656542 6.66304 0.799931C6.97074 1.10702 7.18237 1.48423 7.26813 1.87849C7.39727 2.47219 7.21536 2.82363 6.76306 2.85411C6.59382 2.8655 6.54003 2.85462 6.43884 2.78837C6.26246 2.67292 6.19511 2.5381 6.17296 2.25624C6.14268 1.87032 5.98014 1.61541 5.60645 1.36783C5.17063 1.07905 4.78058 1.04568 4.17175 1.24509C3.41185 1.49393 2.75392 1.8848 2.24405 2.39027C1.76394 2.86622 1.43304 3.40122 1.36421 3.81278C1.22782 4.62836 1.88565 5.60103 2.82947 5.97946C3.01008 6.05185 3.21938 6.1023 3.47157 6.13417C3.86285 6.18364 3.95594 6.22359 4.09352 6.40108C4.19531 6.53237 4.19531 6.85401 4.09352 6.98529C3.93545 7.1892 3.85588 7.21914 3.48544 7.21406C2.34098 7.19836 1.09998 6.40305 0.542909 5.32829L0.385501 5.02459L0.327128 5.15533C-0.236106 6.41689 -0.0725363 7.60418 0.82178 8.74615C0.94356 8.90164 1.11818 9.13651 1.20983 9.26807C1.54376 9.7474 2.05352 10.1214 2.58183 10.2746C2.89354 10.3651 3.53923 10.358 3.95044 10.2596C4.91348 10.0292 5.45095 9.40027 5.64881 8.27234C5.70327 7.962 5.70334 7.91968 5.64979 7.67969C5.56738 7.31032 5.64705 7.09308 5.91282 6.96247C6.19733 6.82271 6.52549 6.92606 6.67268 7.20178C6.79334 7.42777 6.84344 7.8696 6.79482 8.27939C6.68768 9.1831 6.32583 9.96718 5.7426 10.5596L5.45317 10.8536L5.60177 10.9559C5.82456 11.1094 6.15385 11.2601 6.44296 11.3411C6.81752 11.4459 7.57274 11.468 8.10946 11.3899L8.51307 11.3311L8.69843 11.4927C9.0292 11.781 9.53829 11.9564 10.1836 12.0041L10.4883 12.0267L11.3666 12.9666C11.9404 13.5807 12.2847 13.9227 12.3598 13.9532C12.445 13.9879 12.6624 14 13.1966 14C13.855 14 13.9288 13.9941 14.0379 13.9322C14.3296 13.7667 14.3851 13.5644 14.2674 13.0963C14.2206 12.9103 14.1824 12.7455 14.1824 12.7301C14.1824 12.7147 14.2396 12.6918 14.3096 12.6792C14.5462 12.6364 15.0771 12.4549 15.4105 12.3029C16.0525 12.0099 16.6962 11.5211 17.0936 11.0245C17.3176 10.7446 17.546 10.3127 17.6342 10.0023C17.6973 9.78009 17.7077 9.66999 17.6951 9.35809C17.6781 8.93813 17.609 8.71611 17.4041 8.42282L17.2865 8.25464L17.4814 7.97424C17.869 7.41665 18 7.01147 18 6.37108C18 6.01415 17.9848 5.87883 17.9198 5.65966C17.7621 5.12763 17.4669 4.63552 17.0127 4.14777C16.8986 4.02524 16.6655 3.76168 16.4946 3.56214C16.3237 3.3626 16.0147 3.03002 15.8079 2.82312L15.4319 2.44693L15.3184 2.71371C15.0265 3.39966 14.5372 3.94888 13.9897 4.20494C13.4239 4.46961 12.9235 4.25058 12.9601 3.75426C12.9791 3.49796 13.0961 3.36644 13.4068 3.25207C13.6097 3.17741 13.6878 3.12496 13.8448 2.9579C14.203 2.57672 14.3921 2.12485 14.3215 1.81916C14.2661 1.57957 14.1602 1.45317 13.8479 1.25384C13.3832 0.957189 13.2315 0.895208 12.9704 0.895208C12.7691 0.895208 12.7056 0.913145 12.4388 1.04535C11.8436 1.3403 11.4862 1.67617 11.2384 2.17337C10.9912 2.66936 10.9049 3.04046 10.8773 3.72639C10.858 4.20436 10.843 4.31863 10.7895 4.39542C10.5685 4.71231 10.0882 4.70268 9.83761 4.37644C9.76899 4.28706 9.76403 4.23725 9.76473 3.64745C9.76544 3.06338 9.77325 2.98546 9.86553 2.64138C10.113 1.71832 10.4851 1.08769 11.1236 0.508811L11.4388 0.223049L11.1842 0.167307C10.5629 0.0312073 9.67204 -0.0306041 8.98487 0.0146948ZM8.18315 3.169C8.53074 3.3759 8.57528 4.07986 8.27363 4.59859L8.18051 4.75876L8.35594 4.9303C8.56426 5.13397 8.74096 5.20012 8.91495 5.13953C9.19696 5.04131 9.46146 5.12577 9.63109 5.3682C9.76741 5.56295 9.7208 5.87001 9.52917 6.03995C9.39806 6.15621 9.06518 6.25241 8.79398 6.25241C8.31968 6.25241 7.85217 6.03402 7.48106 5.63904L7.29137 5.43716L7.1265 5.50521C6.52073 5.75531 5.78122 5.76921 5.28949 5.53976C5.01393 5.41119 4.72467 5.13587 4.67376 4.95373C4.59814 4.68336 4.72259 4.42414 4.98076 4.31415C5.21858 4.21284 5.40546 4.24878 5.62719 4.43842C5.75703 4.5495 5.84051 4.59222 5.96183 4.60975C6.28453 4.65637 6.79453 4.5025 7.08988 4.26943C7.29771 4.10542 7.35062 3.98014 7.32742 3.70726C7.31323 3.54034 7.32277 3.45815 7.36558 3.37844C7.42677 3.26445 7.6071 3.11746 7.72198 3.0879C7.8489 3.05524 8.05208 3.09098 8.18315 3.169ZM11.8959 4.85167C12.3476 5.0664 12.7363 5.58435 12.8655 6.1435C12.9618 6.56017 12.8931 7.33422 12.7234 7.74557C12.7083 7.78219 12.7678 7.84441 12.9228 7.9542C13.4065 8.29665 13.8242 8.80175 13.9778 9.22972C14.0894 9.54098 14.0953 10.1094 13.9887 10.2837C13.7574 10.662 13.2341 10.6631 13.0047 10.2859C12.9529 10.2007 12.9353 10.1057 12.9331 9.89951C12.9309 9.68861 12.9121 9.58994 12.8506 9.46801C12.68 9.1298 12.2996 8.81457 11.7574 8.56204C11.3675 8.38043 11.0224 8.30852 10.6325 8.32754C10.2771 8.3449 10.0942 8.41902 9.93633 8.60968C9.71566 8.87611 9.61556 8.95969 9.47269 8.99675C9.21129 9.06453 8.95143 8.95023 8.83349 8.7156C8.73663 8.52291 8.74153 8.40468 8.85553 8.18442C9.06184 7.78572 9.57613 7.41929 10.116 7.28645C10.399 7.2168 11.0134 7.21731 11.3707 7.2875C11.5262 7.31805 11.6604 7.33636 11.6688 7.32819C11.7033 7.29499 11.7871 6.83437 11.7877 6.67515C11.7885 6.45228 11.7142 6.18208 11.6128 6.03961C11.5682 5.97698 11.4489 5.87001 11.3477 5.80186C11.1395 5.66176 11.049 5.51115 11.049 5.30469C11.049 5.07508 11.1946 4.87683 11.4187 4.80142C11.5891 4.74405 11.6923 4.75493 11.8959 4.85167ZM15.4866 5.77758C15.7532 5.84889 15.9443 6.17205 15.8711 6.42757C15.828 6.57781 15.7208 6.71312 15.5954 6.77558C15.479 6.83353 14.5978 6.99834 14.4043 6.99834C14.2466 6.99834 14.0742 6.90266 13.9568 6.75005C13.8497 6.61086 13.8539 6.30876 13.9651 6.15866C14.083 5.99953 14.1999 5.95332 14.7585 5.84516C15.3381 5.73293 15.3244 5.73422 15.4866 5.77758Z" fill="${hudColors[currentHud].stress}"/>
</svg>

`)

    app.AddSvg('textHudOxyIconText', `
<svg class="textHudIcon" width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 13.0912C0.184615 5.77446 3.76923 3.82573 5.53846 3.76595C6.69231 3.76595 6.69231 6.99391 6.92308 8.24923C7.84615 7.81883 8.23077 7.11347 8.30769 6.81458V4.66261C8.30769 4.37568 8.76923 4.30395 9 4.30395C9.18462 4.16048 9.53846 4.48328 9.69231 4.66261V6.81458C9.69231 7.5319 10.7692 8.0699 11.3077 8.24923C11.4615 6.93413 11.9077 4.19635 12.4615 3.76595C16.8462 4.66261 18 12.3738 18 13.0912C17.7692 13.6292 15 13.9878 14.5385 13.9878C12.6923 14.1313 11.4615 12.9716 11.0769 12.3738V9.50455C10.6154 9.50455 9.23077 8.60789 9 8.24923C9 8.53616 7.61538 9.20566 6.92308 9.50455V12.3738C6 13.9878 3.46154 13.9878 3.23077 13.9878C1.38462 13.9878 0.461538 13.2705 0 13.0912Z" fill="${hudColors[currentHud].oxy}"/>
<path d="M9.69231 2.68997C9.69231 2.98709 9.38235 3.22796 9 3.22796C8.61765 3.22796 8.30769 2.98709 8.30769 2.68997C8.30769 2.39284 8.61765 2.15197 9 2.15197C9.38235 2.15197 9.69231 2.39284 9.69231 2.68997Z" fill="${hudColors[currentHud].oxy}"/>
<path d="M9.69231 0.537993C9.69231 0.835119 9.38235 1.07599 9 1.07599C8.61765 1.07599 8.30769 0.835119 8.30769 0.537993C8.30769 0.240868 8.61765 0 9 0C9.38235 0 9.69231 0.240868 9.69231 0.537993Z" fill="${hudColors[currentHud].oxy}"/>
</svg>


`)

app.AddSvg('muted-classic', `

<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="25" height="25" rx="3" fill="#141B1F"/>
<path d="M16 12.4762C16 12.2063 15.8088 12 15.5588 12C15.3088 12 15.1176 12.2063 15.1176 12.4762C15.1176 14.3333 13.7206 15.8413 12 15.8413C10.2794 15.8413 8.88235 14.3333 8.88235 12.4762C8.88235 12.2063 8.69118 12 8.44118 12C8.19118 12 8 12.2063 8 12.4762C8 14.6825 9.52941 16.5397 11.5588 16.7778V18.0476H9.95588C9.70588 18.0476 9.51471 18.254 9.51471 18.5238C9.51471 18.7937 9.70588 19 9.95588 19H14.0441C14.2941 19 14.4853 18.7937 14.4853 18.5238C14.4853 18.254 14.2941 18.0476 14.0441 18.0476H12.4412V16.7778C14.4706 16.5397 16 14.6825 16 12.4762Z" fill="#FF4848"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M9.68164 8.78673C9.68164 7.37741 10.8305 6.22852 12.2399 6.22852C13.487 6.22852 14.5302 7.12818 14.7538 8.31185L9.92895 14.041C9.77044 13.7077 9.68164 13.3341 9.68164 12.9381V8.78673ZM11.2796 15.3176L14.7981 10.9728V12.9534C14.7981 14.3627 13.6492 15.5116 12.2399 15.5116C11.9006 15.5079 11.5763 15.4394 11.2796 15.3176Z" fill="#FF4848"/>
<path d="M17.709 6.22852L12.2402 12.7389L6.77149 19.2493" stroke="white"/>
</svg>

`)

    app.AddSvg('clock', `
<svg width="13" height="13" viewBox="0 0 13 13" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M5.88339 0.0157837C4.66736 0.142249 3.56086 0.576469 2.57285 1.31498C2.25173 1.55504 1.55997 2.24652 1.32369 2.56366C0.697834 3.40376 0.292059 4.31771 0.113565 5.28934C-0.224838 7.13126 0.197232 8.92739 1.32369 10.4395C1.55997 10.7566 2.25173 11.4481 2.57285 11.6881C3.49933 12.3806 4.52598 12.8002 5.70515 12.9682C6.00592 13.011 7.00548 13.0105 7.3195 12.9673C8.7909 12.765 10.1087 12.1124 11.1109 11.0896C11.4302 10.7637 11.5063 10.6771 11.7105 10.4067C12.37 9.53352 12.8029 8.46511 12.9681 7.30294C13.0106 7.0036 13.0106 5.99936 12.9681 5.70018C12.8219 4.67235 12.4592 3.69856 11.9257 2.90171C10.8807 1.34063 9.27401 0.326286 7.40848 0.0498741C7.09662 0.00364856 6.194 -0.0165004 5.88339 0.0157837ZM6.74362 2.38962C6.7982 2.41954 6.86845 2.48935 6.90251 2.5475L6.96358 2.65179V4.46206V6.27236L8.08135 7.16724C8.92089 7.83935 9.21002 8.08478 9.24297 8.15316C9.26709 8.20325 9.2871 8.30395 9.28741 8.37691C9.28842 8.62127 9.08804 8.81665 8.83641 8.81665C8.76837 8.81665 8.67667 8.79907 8.63262 8.77757C8.51923 8.72227 6.17644 6.83473 6.11326 6.74775C6.0618 6.67694 6.06097 6.64733 6.05425 4.66589L6.04744 2.65586L6.10413 2.55491C6.19367 2.3955 6.39556 2.29513 6.56952 2.32353C6.61147 2.33039 6.68983 2.36013 6.74362 2.38962Z" fill="white"/>
</svg>

`)
    app.AddSvg('fuel', `
<svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0.423185 2.08791L6.02253 3.73743C6.19632 3.78836 6.35778 3.8747 6.49666 3.99083L8.19919 5.4092L9.63214 3.87198L7.27913 1.96009C7.21986 1.91188 7.15147 1.87584 7.07826 1.85437L1.01745 0.0696713C0.870723 0.0264233 0.712787 0.043242 0.578397 0.116443C0.444008 0.189645 0.344217 0.313142 0.300969 0.460025L0.0333114 1.37224C-0.0563883 1.67738 0.118046 1.99773 0.423185 2.08791Z" fill="white"/>
<path d="M8.89375 5.9872C8.96023 6.04263 9.00556 6.11935 9.0219 6.20425L11.6272 19.7455C11.715 20.2025 12.0062 20.5945 12.4185 20.8104C12.8306 21.0263 13.3187 21.0425 13.7443 20.8546L17.64 19.1333C17.7325 19.0925 17.8379 19.0907 17.9318 19.1287C18.0257 19.1667 18.1003 19.2408 18.1386 19.3347C18.1887 19.4575 18.2858 19.5556 18.4082 19.6068C18.5307 19.6582 18.6685 19.6587 18.7913 19.6084L20.6894 18.8296C20.9451 18.725 21.0674 18.4329 20.9627 18.1774L17.4196 9.53163C17.3659 9.40076 17.3906 9.25083 17.4833 9.14399L17.8903 8.67387C18.0982 8.43312 18.0721 8.06952 17.8318 7.86097L13.8782 4.4354C13.7622 4.33545 13.6113 4.28563 13.4587 4.297C13.306 4.30838 13.1641 4.37982 13.0641 4.49579L12.184 5.51404C12.0501 5.66941 11.8162 5.68847 11.6591 5.55681L10.2112 4.35034L8.7749 5.89046L8.89375 5.9872ZM13.6925 19.6515C13.4502 19.7582 13.1719 19.746 12.9399 19.6185C12.7078 19.491 12.5482 19.2628 12.5082 19.001L11.6309 13.205C11.5638 12.7655 11.6624 12.3166 11.908 11.946L12.8854 12.7184C13.2685 13.0173 13.5545 13.4233 13.7068 13.8849L15.3939 18.9001L13.6925 19.6515ZM13.0927 11.1618L13.655 11.0608C14.5331 10.9084 15.3917 11.4171 15.6795 12.2606L17.4791 17.6072C17.5413 17.7911 17.4527 17.9918 17.2752 18.0701L16.0848 18.5961L14.4188 13.6492C14.2205 13.0475 13.8477 12.5186 13.348 12.1294L12.4444 11.4136C12.6429 11.2883 12.8638 11.2028 13.0949 11.1618H13.0927ZM11.0491 8.53356L11.5803 10.7831C11.6272 10.9843 11.5023 11.1856 11.3011 11.2329C11.2727 11.2398 11.2439 11.2431 11.2147 11.243C11.0409 11.243 10.8899 11.1235 10.85 10.9543L10.3187 8.70495C10.2879 8.5744 10.3291 8.43745 10.4267 8.34551C10.5242 8.25372 10.6634 8.22073 10.7919 8.25933C10.9202 8.29793 11.0182 8.40205 11.0491 8.53243V8.53356ZM9.9993 6.28818C10.1998 6.23708 10.4039 6.35802 10.4552 6.55856L10.6427 7.29298C10.6938 7.49368 10.5726 7.69775 10.372 7.74884C10.3416 7.75685 10.3104 7.7607 10.279 7.76054C10.1079 7.76038 9.95846 7.64441 9.91617 7.47862L9.7294 6.74533C9.70442 6.64874 9.71899 6.54639 9.76977 6.46053C9.8207 6.37484 9.90352 6.31285 10.0001 6.28818H9.9993Z" fill="white"/>
<path d="M1.87566 11.4316C2.37782 11.4489 2.86476 11.257 3.22019 10.9016C3.57563 10.5463 3.76752 10.0594 3.75006 9.55708C3.75006 8.68955 2.53655 6.75845 1.87566 5.99536C1.21508 6.75797 0.00109459 8.68907 0.00109459 9.55708C-0.0163648 10.0594 0.175689 10.5463 0.530963 10.9016C0.886398 11.257 1.37334 11.4489 1.87566 11.4316Z" fill="white"/>
</svg>
`)
    app.AddSvg('indicator', `
<svg class="indicator" width="8" height="89" viewBox="0 0 8 89" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M8 81.0447C8 85.4383 6.20914 89 4 89C1.79086 89 0 85.4383 0 81.0447C0 76.6511 1.79086 0 4 0C6.20914 0 8 76.6511 8 81.0447Z" fill="url(#paint0_linear_172_804)"/>
<defs>
<linearGradient id="paint0_linear_172_804" x1="4" y1="0" x2="4" y2="52" gradientUnits="userSpaceOnUse">
<stop stop-color="white"/>
<stop offset="1" stop-opacity="0"/>
</linearGradient>
</defs>
</svg>
`)


    app.AddSvg('gps', `
<svg width="39" height="39" viewBox="0 0 39 39" fill="none" xmlns="http://www.w3.org/2000/svg">
<g filter="url(#filter0_d_81_3236)">
<path fill-rule="evenodd" clip-rule="evenodd" d="M19.3388 11.3457C12.7846 13.8662 13.0892 13.7393 13.0175 13.9785C12.9569 14.1804 13.0582 14.4115 13.2511 14.5111C13.2932 14.5329 14.6311 14.848 16.2241 15.2114C17.8171 15.5748 19.1224 15.874 19.1247 15.8763C19.127 15.8787 19.4326 17.1965 19.8037 18.8047C20.5379 21.986 20.5047 21.8729 20.7318 21.9677C20.9488 22.0583 21.2265 21.9508 21.3259 21.7377C21.3505 21.6848 22.4086 18.9378 23.6771 15.6333C25.0822 11.9728 25.989 9.57217 25.9976 9.48968C26.025 9.22922 25.8133 8.9989 25.5477 9C25.4721 9.00029 23.5159 9.73938 19.3388 11.3457Z" fill="white"/>
</g>
<defs>
<filter id="filter0_d_81_3236" x="0" y="0" width="39" height="39" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="4"/>
<feGaussianBlur stdDeviation="6.5"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.6 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_81_3236"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_81_3236" result="shape"/>
</filter>
</defs>
</svg>

`)
    app.AddSvg('gps2', `
<svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
<g filter="url(#filter0_d_111_716)">
<path fill-rule="evenodd" clip-rule="evenodd" d="M22.7521 12.6087C12.6686 16.4864 13.1372 16.2912 13.0269 16.6592C12.9338 16.9699 13.0896 17.3254 13.3863 17.4787C13.4511 17.5122 15.5093 17.997 17.9601 18.556C20.411 19.115 22.4191 19.5754 22.4226 19.579C22.4262 19.5826 22.8963 21.6099 23.4673 24.0842C24.5967 28.9784 24.5457 28.8044 24.8951 28.9503C25.2289 29.0897 25.6561 28.9243 25.809 28.5965C25.847 28.5151 27.4747 24.2889 29.4263 19.2051C31.588 13.5735 32.983 9.88026 32.9963 9.75335C33.0384 9.35264 32.7128 8.99831 32.3041 9.00001C32.1878 9.00045 29.1782 10.1375 22.7521 12.6087Z" fill="white"/>
</g>
<defs>
<filter id="filter0_d_111_716" x="0" y="0" width="46" height="46" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="4"/>
<feGaussianBlur stdDeviation="6.5"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.6 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_111_716"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_111_716" result="shape"/>
</filter>
</defs>
</svg>
`)

    app.AddSvg('belt-unactive', `
<svg class="icon" width="20" class="icon" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<g opacity="0.55" clip-path="url(#clip0_172_807)">
<path d="M7.71792 3.44916L4.55695 0.288181C4.40285 0.134083 4.15233 0.134083 3.99823 0.288181C3.84413 0.442279 3.84413 0.6928 3.99823 0.846898L6.88027 3.72813L4.27798 6.33042L1.39597 3.44916C1.24187 3.29506 0.991351 3.29506 0.837253 3.44916C0.683155 3.60325 0.683155 3.85377 0.837253 4.00787L3.99823 7.16885C4.07568 7.24549 4.17681 7.28424 4.27798 7.28424C4.37914 7.28424 4.48027 7.24553 4.55695 7.16885L7.71792 4.00787C7.87202 3.85377 7.87202 3.60325 7.71792 3.44916Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M10.321 4.46994L9.06766 3.21659C8.60537 2.7543 7.85384 2.7543 7.39155 3.21659L3.78962 6.81853C3.56517 7.04375 3.44189 7.34168 3.44189 7.65855C3.44189 7.97463 3.56517 8.27179 3.78802 8.49383C4.1626 8.86763 4.6486 9.36626 5.01844 9.74795C5.24129 9.97791 5.53922 10.1059 5.85846 10.1083C5.86242 10.1083 5.86557 10.1083 5.86872 10.1083C6.18562 10.1083 6.48274 9.98502 6.70718 9.7598L10.321 6.14601C10.7833 5.68376 10.7833 4.93223 10.321 4.46994ZM9.7631 5.58811L6.14932 9.2019C6.07345 9.27776 5.96044 9.31492 5.86642 9.31807C5.76052 9.31729 5.66176 9.27539 5.58745 9.19875C5.21447 8.81391 4.72528 8.31209 4.34755 7.93515C4.27328 7.86088 4.23217 7.76286 4.23217 7.65855C4.23217 7.55264 4.27325 7.45307 4.34833 7.37802L7.95027 3.77609C8.02772 3.69863 8.12885 3.6607 8.23001 3.6607C8.33118 3.6607 8.4323 3.69863 8.50976 3.77609L9.7631 5.02862C9.83738 5.1037 9.87849 5.20246 9.87849 5.30837C9.87846 5.41427 9.83738 5.51306 9.7631 5.58811Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M12.067 8.58567L9.69621 6.21494C9.54211 6.06084 9.29159 6.06084 9.13749 6.21494C8.98339 6.36904 8.98339 6.61956 9.13749 6.77365L11.2285 8.86464L9.41646 10.6767L7.32468 8.58567C7.17058 8.43158 6.92006 8.43158 6.76596 8.58567C6.61187 8.73977 6.61187 8.99029 6.76596 9.14439L9.13671 11.5151C9.21417 11.5918 9.3153 11.6305 9.41646 11.6305C9.51762 11.6305 9.61875 11.5918 9.69621 11.5151L12.067 9.14439C12.2211 8.99025 12.2211 8.73977 12.067 8.58567Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M8.50842 5.02939C8.35432 4.87529 8.1038 4.87529 7.9497 5.02939L5.57895 7.40014C5.42485 7.55424 5.42485 7.80476 5.57895 7.95886C5.65641 8.0355 5.75754 8.07424 5.8587 8.07424C5.95987 8.07424 6.06099 8.03553 6.13767 7.95886L8.50842 5.58811C8.66252 5.43397 8.66252 5.18349 8.50842 5.02939Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M19.5727 15.3027L17.202 12.932C17.0479 12.7779 16.7973 12.7779 16.6432 12.932L13.4823 16.093C13.3282 16.2471 13.3282 16.4976 13.4823 16.6517L15.853 19.0224C15.9305 19.0991 16.0316 19.1378 16.1328 19.1378C16.2339 19.1378 16.335 19.0991 16.4117 19.0216C16.5658 18.8675 16.5658 18.617 16.4117 18.4629L14.3207 16.3719L16.923 13.7696L19.014 15.8614C19.1681 16.0155 19.4186 16.0155 19.5727 15.8614C19.7268 15.7073 19.7268 15.4568 19.5727 15.3027Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M17.2891 13.064C17.2662 13.0055 17.2306 12.9549 17.1856 12.9154C17.0505 12.7408 16.4167 11.7632 15.0132 9.4984C14.8228 9.19098 14.5075 8.99028 14.1487 8.94839C13.786 8.90649 13.4303 9.03137 13.1712 9.29055L9.83237 12.6293C9.5771 12.8854 9.45305 13.237 9.49257 13.5966C9.5321 13.9562 9.72965 14.2739 10.0347 14.4683L13.5497 16.7055C13.6153 16.7474 13.6888 16.7671 13.7623 16.7671C13.8643 16.7671 13.9654 16.7276 14.0405 16.6502L17.2015 13.4892C17.3128 13.3777 17.3476 13.211 17.2891 13.064ZM13.7077 15.8686L10.4598 13.8021C10.3579 13.7373 10.2923 13.6314 10.2788 13.5113C10.2654 13.3911 10.3073 13.2734 10.3919 13.1888L13.7306 9.85005C13.8073 9.77419 13.9077 9.73229 14.0128 9.73229C14.0278 9.73229 14.0428 9.73307 14.0602 9.73466C14.1289 9.74255 14.2577 9.77656 14.3439 9.91562C15.5143 11.8051 16.0856 12.7249 16.4025 13.1738L13.7077 15.8686Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M14.8312 11.3514C14.6771 11.1973 14.4266 11.1973 14.2725 11.3514L11.9017 13.7222C11.7476 13.8763 11.7476 14.1268 11.9017 14.2809C11.9792 14.3575 12.0803 14.3963 12.1815 14.3963C12.2826 14.3963 12.3837 14.3576 12.4604 14.2809L14.8312 11.9101C14.9853 11.756 14.9853 11.5055 14.8312 11.3514Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M12.1813 4.12305C11.9632 4.12305 11.7861 4.30007 11.7861 4.51818V5.30842C11.7861 5.52653 11.9632 5.70355 12.1813 5.70355C12.3994 5.70355 12.5764 5.52653 12.5764 5.30842V4.51818C12.5764 4.30007 12.3994 4.12305 12.1813 4.12305Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M15.3431 7.28394H14.5529C14.3347 7.28394 14.1577 7.46096 14.1577 7.67907C14.1577 7.89718 14.3347 8.07421 14.5529 8.07421H15.3431C15.5612 8.07421 15.7382 7.89718 15.7382 7.67907C15.7382 7.46096 15.5612 7.28394 15.3431 7.28394Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M14.8312 5.02939C14.6771 4.87529 14.4266 4.87529 14.2725 5.02939L13.4823 5.81963C13.3282 5.97373 13.3282 6.22425 13.4823 6.37835C13.5597 6.45499 13.6609 6.49374 13.762 6.49374C13.8632 6.49374 13.9643 6.45503 14.041 6.37835L14.8312 5.58811C14.9853 5.43397 14.9853 5.18349 14.8312 5.02939Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M8.23107 13.606C8.01296 13.606 7.83594 13.783 7.83594 14.0011V14.7913C7.83594 15.0094 8.01296 15.1865 8.23107 15.1865C8.44918 15.1865 8.62621 15.0094 8.62621 14.7913V14.0011C8.62621 13.783 8.44918 13.606 8.23107 13.606Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M5.85969 11.2354H5.06945C4.85134 11.2354 4.67432 11.4124 4.67432 11.6305C4.67432 11.8486 4.85134 12.0256 5.06945 12.0256H5.85969C6.07779 12.0256 6.25482 11.8486 6.25482 11.6305C6.25482 11.4124 6.07779 11.2354 5.85969 11.2354Z" fill="rgba(255, 255, 255, 0.35)"/>
<path d="M6.92791 12.932C6.77381 12.7779 6.52329 12.7779 6.36919 12.932L5.57895 13.7222C5.42485 13.8763 5.42485 14.1268 5.57895 14.2809C5.65641 14.3576 5.75754 14.3963 5.8587 14.3963C5.95987 14.3963 6.06099 14.3576 6.13767 14.2809L6.92791 13.4907C7.08201 13.3366 7.08201 13.0861 6.92791 12.932Z" fill="rgba(255, 255, 255, 0.35)"/>
</g>
<defs>
<clipPath id="clip0_172_807">
<rect width="18.9655" height="18.9655" fill="rgba(255, 255, 255, 0.35)" transform="translate(0.723145 0.172363)"/>
</clipPath>
</defs>
</svg>

`)

    app.AddSvg('belt-active', `
<svg class="icon" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<g opacity="1" clip-path="url(#clip0_172_807)">
<path d="M7.71792 3.44916L4.55695 0.288181C4.40285 0.134083 4.15233 0.134083 3.99823 0.288181C3.84413 0.442279 3.84413 0.6928 3.99823 0.846898L6.88027 3.72813L4.27798 6.33042L1.39597 3.44916C1.24187 3.29506 0.991351 3.29506 0.837253 3.44916C0.683155 3.60325 0.683155 3.85377 0.837253 4.00787L3.99823 7.16885C4.07568 7.24549 4.17681 7.28424 4.27798 7.28424C4.37914 7.28424 4.48027 7.24553 4.55695 7.16885L7.71792 4.00787C7.87202 3.85377 7.87202 3.60325 7.71792 3.44916Z" fill="white"/>
<path d="M10.321 4.46994L9.06766 3.21659C8.60537 2.7543 7.85384 2.7543 7.39155 3.21659L3.78962 6.81853C3.56517 7.04375 3.44189 7.34168 3.44189 7.65855C3.44189 7.97463 3.56517 8.27179 3.78802 8.49383C4.1626 8.86763 4.6486 9.36626 5.01844 9.74795C5.24129 9.97791 5.53922 10.1059 5.85846 10.1083C5.86242 10.1083 5.86557 10.1083 5.86872 10.1083C6.18562 10.1083 6.48274 9.98502 6.70718 9.7598L10.321 6.14601C10.7833 5.68376 10.7833 4.93223 10.321 4.46994ZM9.7631 5.58811L6.14932 9.2019C6.07345 9.27776 5.96044 9.31492 5.86642 9.31807C5.76052 9.31729 5.66176 9.27539 5.58745 9.19875C5.21447 8.81391 4.72528 8.31209 4.34755 7.93515C4.27328 7.86088 4.23217 7.76286 4.23217 7.65855C4.23217 7.55264 4.27325 7.45307 4.34833 7.37802L7.95027 3.77609C8.02772 3.69863 8.12885 3.6607 8.23001 3.6607C8.33118 3.6607 8.4323 3.69863 8.50976 3.77609L9.7631 5.02862C9.83738 5.1037 9.87849 5.20246 9.87849 5.30837C9.87846 5.41427 9.83738 5.51306 9.7631 5.58811Z" fill="white"/>
<path d="M12.067 8.58567L9.69621 6.21494C9.54211 6.06084 9.29159 6.06084 9.13749 6.21494C8.98339 6.36904 8.98339 6.61956 9.13749 6.77365L11.2285 8.86464L9.41646 10.6767L7.32468 8.58567C7.17058 8.43158 6.92006 8.43158 6.76596 8.58567C6.61187 8.73977 6.61187 8.99029 6.76596 9.14439L9.13671 11.5151C9.21417 11.5918 9.3153 11.6305 9.41646 11.6305C9.51762 11.6305 9.61875 11.5918 9.69621 11.5151L12.067 9.14439C12.2211 8.99025 12.2211 8.73977 12.067 8.58567Z" fill="white"/>
<path d="M8.50842 5.02939C8.35432 4.87529 8.1038 4.87529 7.9497 5.02939L5.57895 7.40014C5.42485 7.55424 5.42485 7.80476 5.57895 7.95886C5.65641 8.0355 5.75754 8.07424 5.8587 8.07424C5.95987 8.07424 6.06099 8.03553 6.13767 7.95886L8.50842 5.58811C8.66252 5.43397 8.66252 5.18349 8.50842 5.02939Z" fill="white"/>
<path d="M19.5727 15.3027L17.202 12.932C17.0479 12.7779 16.7973 12.7779 16.6432 12.932L13.4823 16.093C13.3282 16.2471 13.3282 16.4976 13.4823 16.6517L15.853 19.0224C15.9305 19.0991 16.0316 19.1378 16.1328 19.1378C16.2339 19.1378 16.335 19.0991 16.4117 19.0216C16.5658 18.8675 16.5658 18.617 16.4117 18.4629L14.3207 16.3719L16.923 13.7696L19.014 15.8614C19.1681 16.0155 19.4186 16.0155 19.5727 15.8614C19.7268 15.7073 19.7268 15.4568 19.5727 15.3027Z" fill="white"/>
<path d="M17.2891 13.064C17.2662 13.0055 17.2306 12.9549 17.1856 12.9154C17.0505 12.7408 16.4167 11.7632 15.0132 9.4984C14.8228 9.19098 14.5075 8.99028 14.1487 8.94839C13.786 8.90649 13.4303 9.03137 13.1712 9.29055L9.83237 12.6293C9.5771 12.8854 9.45305 13.237 9.49257 13.5966C9.5321 13.9562 9.72965 14.2739 10.0347 14.4683L13.5497 16.7055C13.6153 16.7474 13.6888 16.7671 13.7623 16.7671C13.8643 16.7671 13.9654 16.7276 14.0405 16.6502L17.2015 13.4892C17.3128 13.3777 17.3476 13.211 17.2891 13.064ZM13.7077 15.8686L10.4598 13.8021C10.3579 13.7373 10.2923 13.6314 10.2788 13.5113C10.2654 13.3911 10.3073 13.2734 10.3919 13.1888L13.7306 9.85005C13.8073 9.77419 13.9077 9.73229 14.0128 9.73229C14.0278 9.73229 14.0428 9.73307 14.0602 9.73466C14.1289 9.74255 14.2577 9.77656 14.3439 9.91562C15.5143 11.8051 16.0856 12.7249 16.4025 13.1738L13.7077 15.8686Z" fill="white"/>
<path d="M14.8312 11.3514C14.6771 11.1973 14.4266 11.1973 14.2725 11.3514L11.9017 13.7222C11.7476 13.8763 11.7476 14.1268 11.9017 14.2809C11.9792 14.3575 12.0803 14.3963 12.1815 14.3963C12.2826 14.3963 12.3837 14.3576 12.4604 14.2809L14.8312 11.9101C14.9853 11.756 14.9853 11.5055 14.8312 11.3514Z" fill="white"/>
<path d="M12.1813 4.12305C11.9632 4.12305 11.7861 4.30007 11.7861 4.51818V5.30842C11.7861 5.52653 11.9632 5.70355 12.1813 5.70355C12.3994 5.70355 12.5764 5.52653 12.5764 5.30842V4.51818C12.5764 4.30007 12.3994 4.12305 12.1813 4.12305Z" fill="white"/>
<path d="M15.3431 7.28394H14.5529C14.3347 7.28394 14.1577 7.46096 14.1577 7.67907C14.1577 7.89718 14.3347 8.07421 14.5529 8.07421H15.3431C15.5612 8.07421 15.7382 7.89718 15.7382 7.67907C15.7382 7.46096 15.5612 7.28394 15.3431 7.28394Z" fill="white"/>
<path d="M14.8312 5.02939C14.6771 4.87529 14.4266 4.87529 14.2725 5.02939L13.4823 5.81963C13.3282 5.97373 13.3282 6.22425 13.4823 6.37835C13.5597 6.45499 13.6609 6.49374 13.762 6.49374C13.8632 6.49374 13.9643 6.45503 14.041 6.37835L14.8312 5.58811C14.9853 5.43397 14.9853 5.18349 14.8312 5.02939Z" fill="white"/>
<path d="M8.23107 13.606C8.01296 13.606 7.83594 13.783 7.83594 14.0011V14.7913C7.83594 15.0094 8.01296 15.1865 8.23107 15.1865C8.44918 15.1865 8.62621 15.0094 8.62621 14.7913V14.0011C8.62621 13.783 8.44918 13.606 8.23107 13.606Z" fill="white"/>
<path d="M5.85969 11.2354H5.06945C4.85134 11.2354 4.67432 11.4124 4.67432 11.6305C4.67432 11.8486 4.85134 12.0256 5.06945 12.0256H5.85969C6.07779 12.0256 6.25482 11.8486 6.25482 11.6305C6.25482 11.4124 6.07779 11.2354 5.85969 11.2354Z" fill="white"/>
<path d="M6.92791 12.932C6.77381 12.7779 6.52329 12.7779 6.36919 12.932L5.57895 13.7222C5.42485 13.8763 5.42485 14.1268 5.57895 14.2809C5.65641 14.3576 5.75754 14.3963 5.8587 14.3963C5.95987 14.3963 6.06099 14.3576 6.13767 14.2809L6.92791 13.4907C7.08201 13.3366 7.08201 13.0861 6.92791 12.932Z" fill="white"/>
</g>
<defs>
<clipPath id="clip0_172_807">
<rect width="18.9655" height="18.9655" fill="white" transform="translate(0.723145 0.172363)"/>
</clipPath>
</defs>
</svg>

`)

    app.AddSvg('lights-unactive', `
<svg class="icon" width="19" height="15" viewBox="0 0 19 15" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12.1498 10.3311H18.9655V11.8128H11.9165C12.0022 11.3576 12.0826 10.8609 12.1498 10.3311ZM12.335 7.47889C12.335 7.72907 12.3304 7.97606 12.322 8.21973H18.9655V6.73805H12.322C12.3304 6.98157 12.335 7.22871 12.335 7.47889ZM11.8954 3.03384C11.9828 3.48732 12.0657 3.9842 12.1355 4.51552H18.9655V3.03384H11.8954ZM9.78401 14.2081C9.82771 14.0847 10.8533 11.1421 10.8533 7.47889C10.8533 3.81563 9.82771 0.872963 9.78401 0.749537L9.59765 0.222412L9.0397 0.257139C8.94941 0.262782 6.80329 0.405018 4.62664 1.31819C1.5999 2.58775 0 4.7181 0 7.47889C0 10.2395 1.5999 12.3699 4.62664 13.6396C6.80329 14.5526 8.94927 14.695 9.03956 14.7006L9.59765 14.7354L9.78401 14.2081ZM9.37163 7.47889C9.37163 9.98689 8.8406 12.1743 8.55859 13.1592C7.82296 13.0599 6.48481 12.8173 5.16852 12.2602C2.72215 11.2245 1.48168 9.61589 1.48168 7.47889C1.48168 5.34188 2.72215 3.73316 5.16852 2.69757C6.48525 2.14021 7.82397 1.89755 8.55917 1.79843C8.84147 2.78121 9.37163 4.96263 9.37163 7.47889Z" fill="rgba(255, 255, 255, 0.35)"/>
</svg>

`)


    app.AddSvg('lights-active', `
<svg class="icon" width="19" height="15" viewBox="0 0 19 15" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12.1498 10.3311H18.9655V11.8128H11.9165C12.0022 11.3576 12.0826 10.8609 12.1498 10.3311ZM12.335 7.47889C12.335 7.72907 12.3304 7.97606 12.322 8.21973H18.9655V6.73805H12.322C12.3304 6.98157 12.335 7.22871 12.335 7.47889ZM11.8954 3.03384C11.9828 3.48732 12.0657 3.9842 12.1355 4.51552H18.9655V3.03384H11.8954ZM9.78401 14.2081C9.82771 14.0847 10.8533 11.1421 10.8533 7.47889C10.8533 3.81563 9.82771 0.872963 9.78401 0.749537L9.59765 0.222412L9.0397 0.257139C8.94941 0.262782 6.80329 0.405018 4.62664 1.31819C1.5999 2.58775 0 4.7181 0 7.47889C0 10.2395 1.5999 12.3699 4.62664 13.6396C6.80329 14.5526 8.94927 14.695 9.03956 14.7006L9.59765 14.7354L9.78401 14.2081ZM9.37163 7.47889C9.37163 9.98689 8.8406 12.1743 8.55859 13.1592C7.82296 13.0599 6.48481 12.8173 5.16852 12.2602C2.72215 11.2245 1.48168 9.61589 1.48168 7.47889C1.48168 5.34188 2.72215 3.73316 5.16852 2.69757C6.48525 2.14021 7.82397 1.89755 8.55917 1.79843C8.84147 2.78121 9.37163 4.96263 9.37163 7.47889Z" fill="white"/>
</svg>

`)

    app.AddSvg('door-active', `
<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="22" height="22" fill="url(#pattern333)" fill-opacity="1"/>
<defs>
<pattern id="pattern333" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_71_496" transform="scale(0.00195312)"/>
</pattern>
<image id="image0_71_496" width="512" height="512" xlink:href="data:image/png;base64,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0jmSruYhvxHKcysExiBAATAGdG6JQBsB26tJOlDSoZK2ljSsv6+PSvpi82T/b9r0jWsQQGD6BYb1D8r0yzACBCZIwHa+E7BA0m7Nrw0Lune/pPxM//rm101tjhQuuB+hCCAwgQIUABM4KXQJgfkEbL9M0o6S1pW0dvMr9xfI368l6QlJDzfHA+d/713yQz8iHpgvP3+OAAKzL0ABMPtzzAgRQAABBBB4mgAFAIsCAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggMB/ANkzTOvlUfSgAAAAAElFTkSuQmCC"/>
</defs>
</svg>



`)
    app.AddSvg('door-unactive', `
<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="22" height="22" fill="url(#pattern222)" fill-opacity="0.35"/>
<defs>
<pattern id="pattern222" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_71_4996" transform="scale(0.00195312)"/>
</pattern>
<image id="image0_71_4996" width="512" height="512" xlink:href="data:image/png;base64,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0jmSruYhvxHKcysExiBAATAGdG6JQBsB26tJOlDSoZK2ljSsv6+PSvpi82T/b9r0jWsQQGD6BYb1D8r0yzACBCZIwHa+E7BA0m7Nrw0Lune/pPxM//rm101tjhQuuB+hCCAwgQIUABM4KXQJgfkEbL9M0o6S1pW0dvMr9xfI368l6QlJDzfHA+d/713yQz8iHpgvP3+OAAKzL0ABMPtzzAgRQAABBBB4mgAFAIsCAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggAAFAGsAAQQQQACBCgUoACqcdIaMAAIIIIAABQBrAAEEEEAAgQoFKAAqnHSGjAACCCCAAAUAawABBBBAAIEKBSgAKpx0howAAggggMB/ANkzTOvlUfSgAAAAAElFTkSuQmCC"/>
</defs>
</svg>



`)
    app.AddSvg('engine-active', `
<svg class="icon" width="20" height="13" viewBox="0 0 20 13" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M16.6356 3.60112C16.3288 3.60112 16.08 3.84989 16.08 4.15675V4.71238H14.9687V4.15675C14.9687 3.84989 14.7199 3.60112 14.4131 3.60112H13.532L12.5834 2.65258C12.4792 2.54838 12.338 2.48986 12.1906 2.48986H11.6349V1.37859H12.1906C12.4974 1.37859 12.7462 1.12982 12.7462 0.822964C12.7462 0.516108 12.4974 0.267334 12.1906 0.267334H6.56018C6.25332 0.267334 6.00455 0.516108 6.00455 0.822964C6.00455 1.12982 6.25332 1.37859 6.56018 1.37859H7.11581V2.48986H6.56018C6.41279 2.48986 6.27151 2.54838 6.16731 2.65258L5.21877 3.60112H3.22639C2.91954 3.60112 2.67076 3.84989 2.67076 4.15675V6.37927H1.5595V4.15675C1.5595 3.84989 1.31073 3.60112 1.00387 3.60112C0.697016 3.60112 0.448242 3.84989 0.448242 4.15675V9.71305C0.448242 10.0199 0.697016 10.2687 1.00387 10.2687C1.31073 10.2687 1.5595 10.0199 1.5595 9.71305V7.49053H2.67076V9.71305C2.67076 10.0199 2.91954 10.2687 3.22639 10.2687H5.21877L7.27857 12.3285C7.38277 12.4327 7.52405 12.4912 7.67144 12.4912H13.3018C13.5123 12.4912 13.7047 12.3723 13.7988 12.1841L14.7565 10.2687H16.08V10.8243C16.08 11.1312 16.3288 11.3799 16.6356 11.3799C18.1675 11.3799 19.4138 10.1337 19.4138 8.60179V6.37927C19.4138 4.8474 18.1675 3.60112 16.6356 3.60112ZM4.89329 9.15742H3.78202V4.71238H4.89329V9.15742ZM8.22707 1.37859H10.5237V2.48986H8.22707V1.37859ZM13.8575 9.58189L12.9584 11.3799H7.90158L6.00455 9.48291V4.38689L6.79032 3.60112C7.01631 3.60112 11.7611 3.60112 11.9604 3.60112L12.9089 4.54965C13.0132 4.65385 13.1544 4.71238 13.3018 4.71238H13.8575C13.8575 4.93956 13.8575 9.40105 13.8575 9.58189ZM16.08 9.15742H14.9687V5.82364H16.08V9.15742ZM18.3025 8.60179C18.3025 9.32618 17.838 9.94416 17.1912 10.1735C17.1912 9.78328 17.1912 4.95471 17.1912 4.80761C17.838 5.03694 18.3025 5.65487 18.3025 6.37931V8.60179Z" fill="white"/>
</svg>


`)

    app.AddSvg('engine-middamaged', `
<svg class="icon" width="20" height="13" viewBox="0 0 20 13" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M16.6356 3.60112C16.3288 3.60112 16.08 3.84989 16.08 4.15675V4.71238H14.9687V4.15675C14.9687 3.84989 14.7199 3.60112 14.4131 3.60112H13.532L12.5834 2.65258C12.4792 2.54838 12.338 2.48986 12.1906 2.48986H11.6349V1.37859H12.1906C12.4974 1.37859 12.7462 1.12982 12.7462 0.822964C12.7462 0.516108 12.4974 0.267334 12.1906 0.267334H6.56018C6.25332 0.267334 6.00455 0.516108 6.00455 0.822964C6.00455 1.12982 6.25332 1.37859 6.56018 1.37859H7.11581V2.48986H6.56018C6.41279 2.48986 6.27151 2.54838 6.16731 2.65258L5.21877 3.60112H3.22639C2.91954 3.60112 2.67076 3.84989 2.67076 4.15675V6.37927H1.5595V4.15675C1.5595 3.84989 1.31073 3.60112 1.00387 3.60112C0.697016 3.60112 0.448242 3.84989 0.448242 4.15675V9.71305C0.448242 10.0199 0.697016 10.2687 1.00387 10.2687C1.31073 10.2687 1.5595 10.0199 1.5595 9.71305V7.49053H2.67076V9.71305C2.67076 10.0199 2.91954 10.2687 3.22639 10.2687H5.21877L7.27857 12.3285C7.38277 12.4327 7.52405 12.4912 7.67144 12.4912H13.3018C13.5123 12.4912 13.7047 12.3723 13.7988 12.1841L14.7565 10.2687H16.08V10.8243C16.08 11.1312 16.3288 11.3799 16.6356 11.3799C18.1675 11.3799 19.4138 10.1337 19.4138 8.60179V6.37927C19.4138 4.8474 18.1675 3.60112 16.6356 3.60112ZM4.89329 9.15742H3.78202V4.71238H4.89329V9.15742ZM8.22707 1.37859H10.5237V2.48986H8.22707V1.37859ZM13.8575 9.58189L12.9584 11.3799H7.90158L6.00455 9.48291V4.38689L6.79032 3.60112C7.01631 3.60112 11.7611 3.60112 11.9604 3.60112L12.9089 4.54965C13.0132 4.65385 13.1544 4.71238 13.3018 4.71238H13.8575C13.8575 4.93956 13.8575 9.40105 13.8575 9.58189ZM16.08 9.15742H14.9687V5.82364H16.08V9.15742ZM18.3025 8.60179C18.3025 9.32618 17.838 9.94416 17.1912 10.1735C17.1912 9.78328 17.1912 4.95471 17.1912 4.80761C17.838 5.03694 18.3025 5.65487 18.3025 6.37931V8.60179Z" fill="#FFB800"/>
</svg>
`)

    app.AddSvg('engine-damaged', `
<svg class="icon" width="20" height="13" viewBox="0 0 20 13" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M16.6356 3.60112C16.3288 3.60112 16.08 3.84989 16.08 4.15675V4.71238H14.9687V4.15675C14.9687 3.84989 14.7199 3.60112 14.4131 3.60112H13.532L12.5834 2.65258C12.4792 2.54838 12.338 2.48986 12.1906 2.48986H11.6349V1.37859H12.1906C12.4974 1.37859 12.7462 1.12982 12.7462 0.822964C12.7462 0.516108 12.4974 0.267334 12.1906 0.267334H6.56018C6.25332 0.267334 6.00455 0.516108 6.00455 0.822964C6.00455 1.12982 6.25332 1.37859 6.56018 1.37859H7.11581V2.48986H6.56018C6.41279 2.48986 6.27151 2.54838 6.16731 2.65258L5.21877 3.60112H3.22639C2.91954 3.60112 2.67076 3.84989 2.67076 4.15675V6.37927H1.5595V4.15675C1.5595 3.84989 1.31073 3.60112 1.00387 3.60112C0.697016 3.60112 0.448242 3.84989 0.448242 4.15675V9.71305C0.448242 10.0199 0.697016 10.2687 1.00387 10.2687C1.31073 10.2687 1.5595 10.0199 1.5595 9.71305V7.49053H2.67076V9.71305C2.67076 10.0199 2.91954 10.2687 3.22639 10.2687H5.21877L7.27857 12.3285C7.38277 12.4327 7.52405 12.4912 7.67144 12.4912H13.3018C13.5123 12.4912 13.7047 12.3723 13.7988 12.1841L14.7565 10.2687H16.08V10.8243C16.08 11.1312 16.3288 11.3799 16.6356 11.3799C18.1675 11.3799 19.4138 10.1337 19.4138 8.60179V6.37927C19.4138 4.8474 18.1675 3.60112 16.6356 3.60112ZM4.89329 9.15742H3.78202V4.71238H4.89329V9.15742ZM8.22707 1.37859H10.5237V2.48986H8.22707V1.37859ZM13.8575 9.58189L12.9584 11.3799H7.90158L6.00455 9.48291V4.38689L6.79032 3.60112C7.01631 3.60112 11.7611 3.60112 11.9604 3.60112L12.9089 4.54965C13.0132 4.65385 13.1544 4.71238 13.3018 4.71238H13.8575C13.8575 4.93956 13.8575 9.40105 13.8575 9.58189ZM16.08 9.15742H14.9687V5.82364H16.08V9.15742ZM18.3025 8.60179C18.3025 9.32618 17.838 9.94416 17.1912 10.1735C17.1912 9.78328 17.1912 4.95471 17.1912 4.80761C17.838 5.03694 18.3025 5.65487 18.3025 6.37931V8.60179Z" fill="#FF0000"/>
</svg>
`)

    app.AddSvg('engine-unactive', `
<svg  class="icon" width="20" height="13" viewBox="0 0 20 13" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M16.6356 3.60112C16.3288 3.60112 16.08 3.84989 16.08 4.15675V4.71238H14.9687V4.15675C14.9687 3.84989 14.7199 3.60112 14.4131 3.60112H13.532L12.5834 2.65258C12.4792 2.54838 12.338 2.48986 12.1906 2.48986H11.6349V1.37859H12.1906C12.4974 1.37859 12.7462 1.12982 12.7462 0.822964C12.7462 0.516108 12.4974 0.267334 12.1906 0.267334H6.56018C6.25332 0.267334 6.00455 0.516108 6.00455 0.822964C6.00455 1.12982 6.25332 1.37859 6.56018 1.37859H7.11581V2.48986H6.56018C6.41279 2.48986 6.27151 2.54838 6.16731 2.65258L5.21877 3.60112H3.22639C2.91954 3.60112 2.67076 3.84989 2.67076 4.15675V6.37927H1.5595V4.15675C1.5595 3.84989 1.31073 3.60112 1.00387 3.60112C0.697016 3.60112 0.448242 3.84989 0.448242 4.15675V9.71305C0.448242 10.0199 0.697016 10.2687 1.00387 10.2687C1.31073 10.2687 1.5595 10.0199 1.5595 9.71305V7.49053H2.67076V9.71305C2.67076 10.0199 2.91954 10.2687 3.22639 10.2687H5.21877L7.27857 12.3285C7.38277 12.4327 7.52405 12.4912 7.67144 12.4912H13.3018C13.5123 12.4912 13.7047 12.3723 13.7988 12.1841L14.7565 10.2687H16.08V10.8243C16.08 11.1312 16.3288 11.3799 16.6356 11.3799C18.1675 11.3799 19.4138 10.1337 19.4138 8.60179V6.37927C19.4138 4.8474 18.1675 3.60112 16.6356 3.60112ZM4.89329 9.15742H3.78202V4.71238H4.89329V9.15742ZM8.22707 1.37859H10.5237V2.48986H8.22707V1.37859ZM13.8575 9.58189L12.9584 11.3799H7.90158L6.00455 9.48291V4.38689L6.79032 3.60112C7.01631 3.60112 11.7611 3.60112 11.9604 3.60112L12.9089 4.54965C13.0132 4.65385 13.1544 4.71238 13.3018 4.71238H13.8575C13.8575 4.93956 13.8575 9.40105 13.8575 9.58189ZM16.08 9.15742H14.9687V5.82364H16.08V9.15742ZM18.3025 8.60179C18.3025 9.32618 17.838 9.94416 17.1912 10.1735C17.1912 9.78328 17.1912 4.95471 17.1912 4.80761C17.838 5.03694 18.3025 5.65487 18.3025 6.37931V8.60179Z" fill="rgba(255, 255, 255, 0.35)"/>
</svg>

`)

    app.AddSvg('classichud-health', `
<svg class="classicHudIcon" width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="15" height="15" fill="url(#pattern0)"/>
<defs>
<pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_1_27" transform="scale(0.0666667)"/>
</pattern>
<image id="image0_1_27" width="15" height="15" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAChSURBVHgBnZILDYRADER7p+AkcA7OweEEKUhAAhLAARIWB+AAHAwtLJ9Ay2df0s1mZzuZJiXaAOAjRQr8HqmaFyqsNFyx1+Kd5uT/trGBTmK8d6MBHznCyF/iwgHUOS/opRkUyJurpTBqaS4pjFpi//ji6Dnf8WSDDM/IFgtMm+VuNh5T4nxZZkSP1CG8gZWggrH3e5MU1ox38CkKrr/1ZwBdcIZwLFMN2AAAAABJRU5ErkJggg=="/>
</defs>
</svg>

`)
    app.AddSvg('classichud-armor', `
<svg class="classicHudIcon" width="13" height="15" viewBox="0 0 13 15" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="13" height="15" fill="url(#pattern1)"/>
<defs>
<pattern id="pattern1" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_1_32" transform="scale(0.0769231 0.0666667)"/>
</pattern>
<image id="image0_1_32" width="13" height="15" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAPCAYAAAA/I0V3AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAADISURBVHgBlZLhEYIwDIVbj/92Ax2BDWQEN0AncATchBEcQZ1AnIAygW5Q38Pg5XKC+O6+a2nymtDWpZQKcAbBTQjx/JMnJqr4YapBqxce3GXCsKYBnPRiK9WOXwwB3CRe2UqDmFCCLTioDalal56r/p8WoHTzxQJ5hkkHog3K+BS0lp7tqSSK91XLGMHemJpMDBs3rpX5jpnsWJhAUOPOxO5j7Q2XeLHtee8jj7xK/2nDI7+6+Yqg85yl9wvnYeRCMIkNQWt9gReSIfyNskVDkQAAAABJRU5ErkJggg=="/>
</defs>
</svg>
`)

    app.AddSvg('classichud-thirsty', `
<svg class="classicHudIconSmall" width="13" height="15" viewBox="0 0 13 15" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="13" height="15" fill="url(#pattern2)"/>
<defs>
<pattern id="pattern2" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_1_47" transform="scale(0.0769231 0.0666667)"/>
</pattern>
<image id="image0_1_47" width="13" height="15" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAPCAYAAAA/I0V3AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAACTSURBVHgBlZGBDUAwEEXvugA26AaMYCNGMIIN2EBMxAZscO7iKkiq7iU/Ee3rPwoQgYhasMBCTyfDX6GjJ51VCLQxoaJv6reQc5aEJOu57HfqSb2Hb2S9uTelWgKbtDmdNdUSkPG8AzsZ6sdtBqlwiLjzw/hTGHW/6Zf7xxHygjNEhCnckYDvfj2t5FSclTNfIykHdsgUNzvcIRQAAAAASUVORK5CYII="/>
</defs>
</svg>
`)

    app.AddSvg('classichud-hunger', `
<svg class="classicHudIconSmall"  width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="15" height="15" fill="url(#pattern3)"/>
<defs>
<pattern id="pattern3" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_1_42" transform="scale(0.0666667)"/>
</pattern>
<image id="image0_1_42" width="15" height="15" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAADCSURBVHgBjZINEcMgDIUjoRKQUClzsDloHTAHlcAcTEIlIKESkJAlLGwp5e/d5a6FvI+QAEBCREcxQ0eUs57y6GfCr0ILQHtPCs85vzz6MPgXA24VoxPjBRDwrHtmZG3KGGEpYS4AVtnzas1RvChsXhoDjgzAJzyyNVtrimkAdooFOuMoAmBEckq6QhgGSDNQdZWrsAqw9Ywop5rKntOmSZpRNFYAb/bBiFEBdO6uX5dvGVWV6dEcaTRLLGNAAogT+QCGkeDhc8cqTwAAAABJRU5ErkJggg=="/>
</defs>
</svg>
`)

    app.AddSvg('classichud-stress', `
<svg class="classicHudIconSmall" width="18" height="14" viewBox="0 0 18 14" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="18" height="14" fill="url(#pattern4)"/>
<defs>
<pattern id="pattern4" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_1_52" transform="scale(0.0555556 0.0714286)"/>
</pattern>
<image id="image0_1_52" width="18" height="14" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAOCAYAAAAi2ky3AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAD6SURBVHgBnZIBEYMwDEV7U4AEJOAAHIADcLA5AAdsCpCABOagc9A5qIQsuf0eaa9wt/27XGkaXpMmxhyIiBq2jc3TV5atEDNnQtDE5tgW+AJE1APuEVMdQSzFapXPIc6p81LAKWikvMS/oMRS+Wu1nzRoVkGSxQBfAZCUc6c9w5XisjuB3PCDg9PjPQasBb5DOaOKC2BrdHq8VuqmsG7qewXMI74LKRlF9UnqDe2SMmuK30ZruzD4gaeS+QgtfatevBAzsHXwTUnjn7muedy6UF42M2Or7lxN++NWdK4x2ffmZNJbgK8UD2Kq2fwilKuB0pDa/KME1uqzD2THfdl1zeFnAAAAAElFTkSuQmCC"/>
</defs>
</svg>
`)

    app.AddSvg('classichud-oxy', `

<img class="textHudIcon" src="./assets/images/lungs-white.png">

`)

    app.AddSvg('classichud-stamina', `
<svg class="classicHudIconSmall" width="15" height="16" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="15" height="16" fill="url(#pattern5)"/>
<defs>
<pattern id="pattern5" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_1_56" transform="scale(0.0666667 0.0625)"/>
</pattern>
<image id="image0_1_56" width="15" height="16" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAQCAYAAADJViUEAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAADzSURBVHgBlVLbEYIwELw4/ksHUoJWoB1IB9IBJYAd2AFYgVABdKAdiBWIFcQ9PcYjAyg7sxMuucduAtEfsNYmYAn6NAUoCOwXZ302Hyjw5bMRkorfSrDsjFO0wlKCntoOQc5bgCdjTIO8BzdyJ8dSeJWYm2VgBdYco/AuObme6omvi8SRHYc/F6mtN+5+VHI1tjIxYGWQX/OElKe43p0pN+rBDCzAJxJCli77kZOXDxUvFT0lsSNZ7HVgRGbrhaRJQh//tWrEPtduAy6Oe24zlbNUxxrtOxeOVL75g2MhoynAtO2v2x7DRtaKpkL+ur16wg5e0pjWVifDeQ4AAAAASUVORK5CYII="/>
</defs>
</svg>
`)

    app.AddSvg('classichud-parachute', `
<img class="textHudIcon" src="./assets/images/parachute.png">
`)

    app.AddSvg('classichud-nitro', `
<img class="textHudIcon" src="./assets/images/nitro.png">
`)

    app.AddSvg('classichud-altitude', `
<img class="textHudIcon" src="./assets/images/altitude.png">
`)

    app.AddSvg('classichud-mic', `
<svg   width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<rect width="25" height="25" fill="url(#pattern6)"/>
<defs>
<pattern id="pattern6" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_1_37" transform="scale(0.0208333)"/>
</pattern>
<image id="image0_1_37" width="48" height="48" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAANkSURBVHgB7ZpdSFNRHMD/Z/O6te0u2V3WnKYV3b7WB0FWhhlZQqBBEkW9BOVD+pCJTz30UNCjGEGSUPbmS9RD9tKHYimMgkhyZY4ibXPDjw1tbt7duXvbX1NERIx7dF7a72G799x74P87955z/udwCfzFZrMZYkRfDETiAQgPqxFZ9koE3gQH+p0zRQR/7PbtnAhCrQzAgQpIxBkQQV8XGvgW0GKB3my6qZbgkUSrG7QwuS/DtMapzbTnHpaBFIDKQAmJaGIaSYYToFrINg0Qkg2qhfAaUDkpgWSTEkg2aUCZtZmMrvyG1bGn2MibLGnseFAKeb5M+J/eGf7Y7xJCQBlitec1AiVyHXr2evPGUpNFw86/hiJ3L/56QVuC6itU+dBeslDwCJZfvmcrAspQE9hVZLRy2cyi+VQWr8vKLzfbgCLUBDbv11uWct/6XIYFiqSG0WSTEkg2KYFk838LlNVa+frP/IUch870L/Uw5Wj4vu0S1geFKBLg7Gkspgh8/pol72hExuLRDVvTWUZPdFgfFKJIIOCJTSVm1o3pbNfrsH8pddwfJgJ5e6dnbY9LGAGFKBJ41zzah/87jxrzEsGEfn6a6Fvs/q+d4V6PKzp+qDxjN56jDChEkcDYYFzEoDFJO38703G/wtse8MYWDMrnjvqaqn1OvA9fuxkZUIjWYM4oAwX0dQuDBWcz+K0HDJuEiDzacGWgM7GHGWK5NJ0oyOLgD3Goo3m0q7HS5yy5ym05VcUVhoKToaZqf/vvobgICqGyoHEUGbmqR9ml2DF7OsLuVw+C3a634dkncfCMOevIubX8jkIjHxOkaEOFt8XVHgkCBaityHAorWnOKWMt0yNLTJCj0Uhc1Bm06SiGZVMtf833klbwCNUlJVJWw/G7j5vyrLkMhzLY4t6eqP/9szF36+PpTk8T6gIzoMjp2nXHntcNt7fUB9ywTKg+laD2BDA9mLtoN1uZqVk6OBAbEcLS7Gjz5NaQc24HVwq1faE9J402nA/ml1vsjHXu+ab9eo6mwLL1gZUitR5INimBZJMSSDYJAXnZpvnlhoDsSQhoekGlxAFaNYwktBGQqM2MK4WciBk/+tD4/f5IOsTr1CSBwYuJmPGYzL0w/d0EFMtAcmBVIvdin2WkWBs2PJb8ATNuRGYmGVezAAAAAElFTkSuQmCC"/>
</defs>
</svg>
`)
    app.AddSvg('classichud-mic-low', `
<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="25" height="25" rx="3" fill="url(#paint0_linear_83_435)"/>
<g clip-path="url(#clip0_83_435)">
<path d="M16.4056 12.454C16.4056 12.1936 16.2065 11.9944 15.946 11.9944C15.6856 11.9944 15.4865 12.1936 15.4865 12.454C15.4865 14.2463 14.0312 15.7016 12.2389 15.7016C10.4467 15.7016 8.99138 14.2463 8.99138 12.454C8.99138 12.1936 8.79224 11.9944 8.53182 11.9944C8.27141 11.9944 8.07227 12.1936 8.07227 12.454C8.07227 14.5833 9.6654 16.3756 11.7794 16.6054V17.8308H10.1096C9.84923 17.8308 9.65008 18.03 9.65008 18.2904C9.65008 18.5508 9.84923 18.75 10.1096 18.75H14.3682C14.6286 18.75 14.8278 18.5508 14.8278 18.2904C14.8278 18.03 14.6286 17.8308 14.3682 17.8308H12.6985V16.6054C14.8125 16.3756 16.4056 14.5833 16.4056 12.454Z" fill="#AFFF48"/>
<path d="M12.2389 5.72913C10.8296 5.72913 9.68066 6.87802 9.68066 8.28734V12.4387C9.68066 13.8633 10.8296 14.9969 12.2389 15.0122C13.6482 15.0122 14.7971 13.8633 14.7971 12.454V8.28734C14.7971 6.87802 13.6482 5.72913 12.2389 5.72913Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_83_435" x1="19.7917" y1="25" x2="19.7917" y2="16.6667" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_83_435">
<rect width="13.0208" height="13.0208" fill="white" transform="translate(5.72852 5.72913)"/>
</clipPath>
</defs>
</svg>
`)

    app.AddSvg('classichud-mic-mid', `
<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
<g opacity="0.6">
<rect width="25" height="25" rx="3" fill="url(#paint0_linear_83_445)"/>
<rect width="25" height="25" rx="3" fill="url(#paint1_linear_83_445)"/>
<rect width="25" height="25" rx="3" fill="url(#paint2_linear_83_445)"/>
</g>
<g clip-path="url(#clip0_83_445)">
<path d="M16.4056 12.454C16.4056 12.1936 16.2065 11.9944 15.946 11.9944C15.6856 11.9944 15.4865 12.1936 15.4865 12.454C15.4865 14.2463 14.0312 15.7016 12.2389 15.7016C10.4467 15.7016 8.99138 14.2463 8.99138 12.454C8.99138 12.1936 8.79224 11.9944 8.53182 11.9944C8.27141 11.9944 8.07227 12.1936 8.07227 12.454C8.07227 14.5833 9.6654 16.3756 11.7794 16.6054V17.8308H10.1096C9.84923 17.8308 9.65008 18.03 9.65008 18.2904C9.65008 18.5508 9.84923 18.75 10.1096 18.75H14.3682C14.6286 18.75 14.8278 18.5508 14.8278 18.2904C14.8278 18.03 14.6286 17.8308 14.3682 17.8308H12.6985V16.6054C14.8125 16.3756 16.4056 14.5833 16.4056 12.454Z" fill="#AFFF48"/>
<path d="M12.2389 5.72913C10.8296 5.72913 9.68066 6.87802 9.68066 8.28734V12.4387C9.68066 13.8633 10.8296 14.9969 12.2389 15.0122C13.6482 15.0122 14.7971 13.8633 14.7971 12.454V8.28734C14.7971 6.87802 13.6482 5.72913 12.2389 5.72913Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_83_445" x1="19.7917" y1="25" x2="19.7917" y2="9.89583" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<linearGradient id="paint1_linear_83_445" x1="19.7917" y1="25" x2="19.7917" y2="9.89583" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<linearGradient id="paint2_linear_83_445" x1="19.7917" y1="25" x2="19.7917" y2="9.89583" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_83_445">
<rect width="13.0208" height="13.0208" fill="white" transform="translate(5.72852 5.72913)"/>
</clipPath>
</defs>
</svg>

`)

    app.AddSvg('classichud-mic-high', `
<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect opacity="0.6" width="25" height="25" rx="3" fill="url(#paint0_linear_83_455)"/>
<g clip-path="url(#clip0_83_455)">
<path d="M16.4056 12.454C16.4056 12.1936 16.2065 11.9944 15.946 11.9944C15.6856 11.9944 15.4865 12.1936 15.4865 12.454C15.4865 14.2463 14.0312 15.7016 12.2389 15.7016C10.4467 15.7016 8.99138 14.2463 8.99138 12.454C8.99138 12.1936 8.79224 11.9944 8.53182 11.9944C8.27141 11.9944 8.07227 12.1936 8.07227 12.454C8.07227 14.5833 9.6654 16.3756 11.7794 16.6054V17.8308H10.1096C9.84923 17.8308 9.65008 18.03 9.65008 18.2904C9.65008 18.5508 9.84923 18.75 10.1096 18.75H14.3682C14.6286 18.75 14.8278 18.5508 14.8278 18.2904C14.8278 18.03 14.6286 17.8308 14.3682 17.8308H12.6985V16.6054C14.8125 16.3756 16.4056 14.5833 16.4056 12.454Z" fill="#AFFF48"/>
<path d="M12.2389 5.72913C10.8296 5.72913 9.68066 6.87802 9.68066 8.28734V12.4387C9.68066 13.8633 10.8296 14.9969 12.2389 15.0122C13.6482 15.0122 14.7971 13.8633 14.7971 12.454V8.28734C14.7971 6.87802 13.6482 5.72913 12.2389 5.72913Z" fill="#AFFF48"/>
</g>
<defs>
<linearGradient id="paint0_linear_83_455" x1="19.7917" y1="25" x2="19.7917" y2="-3.125" gradientUnits="userSpaceOnUse">
<stop stop-color="#6DFB3C"/>
<stop offset="1" stop-color="#141B1F"/>
</linearGradient>
<clipPath id="clip0_83_455">
<rect width="13.0208" height="13.0208" fill="white" transform="translate(5.72852 5.72913)"/>
</clipPath>
</defs>
</svg>


`)

    app.AddSvg('job-briefcase', `
<svg width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g filter="url(#filter0_d_54_1750)">
<rect x="4" width="15" height="15" fill="url(#pattern0)" shape-rendering="crispEdges"/>
</g>
<defs>
<filter id="filter0_d_54_1750" x="0" y="0" width="23" height="23" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="4"/>
<feGaussianBlur stdDeviation="2"/>
<feComposite in2="hardAlpha" operator="out"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_54_1750"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_54_1750" result="shape"/>
</filter>
<pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
<use xlink:href="#image0_54_1750" transform="scale(0.00195312)"/>
</pattern>
<image id="image0_54_1750" width="512" height="512" xlink:href="data:image/png;base64,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"/>
</defs>
</svg>

`)



}
