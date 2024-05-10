function setOptions(options) {
    const parent = document.getElementById('options');

    if (parent === null) return;

    parent.replaceChildren();
    parent.style.transition = 'margin-top 0.4s';

    let minWidth = 0;

    for (let i = 0; i < options.length; i++) {
        const option = options[i];

        const element = document.createElement('li');
        element.innerHTML =
            (option.icon && `<i class='${option.icon} fa-fw'>` || '') +
            `</i>${option.label}`;
        element.classList.add('option');

        parent.appendChild(element);

        // Temporarily disable transition
        let transition = element.style.transition;
        element.style.transition = 'none';

        // Temporarily add selected class
        element.classList.add('selected');

        const width = element.offsetWidth;
        minWidth = Math.max(minWidth, width);

        // Remove it after the width is measured
        element.classList.remove('selected');

        // Add back transition
        setTimeout(() => (element.style.transition = transition), 300);
    }

    const optionsList = document.getElementsByClassName('option');

    for (let i = 0; i < optionsList.length; i++) {
        optionsList[i].style.minWidth = `${minWidth + 20}px`;
    }

    optionsList[0].classList.add('selected');
}

function getOptions() {
    const options = document.getElementsByClassName('option');
    const filtered = [];

    for (let i = 0; i < options.length; i++) {
        if (options[i].style.display === 'block') {
            filtered.push(options[i]);
        }
    }

    return filtered;
}

function select(index) {
    // Magical calculation
    const offset = index * 39;
    const options = getOptions();

    for (let i = 0; i < options.length; i++) {
        if (options[i]?.classList)
            options[i].classList.remove('selected');
    }

    if (options[index]?.classList)
        options[index].classList.add('selected');
    document.getElementById('options').style.marginTop = `-${offset}px`;
}

function updateOptions(canInteract) {
    let elements = document.getElementsByClassName('option');

    for (let i = 0; i < canInteract.length; i++) {
        const display = canInteract[i] ? 'block' : 'none';

        if (elements[i] && elements[i].style.display != display) {
            elements[i].style.display = display;
        }
    }
}

window.addEventListener('message', ({ data }) => {
    if (data.action === 'set_options') {
        setOptions(data.options);
    } 
    else if (data.action === 'update_options') {
        updateOptions(data.canInteract);
    } 
    else if (data.action === 'set_index') {
        select(data.index);
    } 
    else if (data.action === 'show') {
        const prompt = document.getElementById('prompt');
        prompt.classList.remove('hidden');
    } 
    else if (data.action === 'hide') {
        const prompt = document.getElementById('prompt');

        if (prompt?.classList)
            prompt.classList.add('hidden');
        
        setTimeout(() => {
            const options = document.getElementById('options');

            options.style.transition = 'none';
            options.style.marginTop = null;
            options.replaceChildren();
        }, 100);
    }
});
