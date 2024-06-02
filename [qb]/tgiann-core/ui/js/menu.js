//ESX MENU: https://github.com/esx-framework
$(function() {
	let MenuTpl = ""

	tgiCore.menu = {}
	tgiCore.menu.opened       = {};
	tgiCore.menu.focus        = [];
	tgiCore.menu.pos          = {};

	tgiCore.menu.menuTpl = function() {
		MenuTpl =
			'<div id="menu_{{_namespace}}_{{_name}}" class="menu">' +
				'<div class="head"><div class="head__title">{{{title}}}</div><div class="head__description">'+tgiCore.lang.chooseAnAction+'</div></div>' +
					'<div class="menu-items">' +
						'{{#elements}}' +
							'<div class="menu-item menu_{{index}} {{#selected}}selected{{/selected}}" onclick="tgiCore.menu.menuonclick({{index}})" onmousemove="tgiCore.menu.menuonmouseover({{index}})">' +
								'{{{label}}}{{#isSlider}} : &lt;{{{sliderLabel}}}&gt;{{/isSlider}}' +
							'</div>' +
						'{{/elements}}' +

						'<div class="menu-item menu-return" onclick="tgiCore.menu.menuonclickclose()">'+tgiCore.lang.returnText+'</div>' +
					'</div>' +
				'</div>' +
			'</div>'
		;
	}

	tgiCore.menu.setElements = function(newElements, menunamespace, menuname) {
		tgiCore.menu.opened[menunamespace][menuname].elements = newElements;
		tgiCore.menu.render();
	}

	tgiCore.menu.menuonmouseover = function(index) {
		let focused = tgiCore.menu.getFocused();
		if (typeof focused == 'undefined') return;
		if(tgiCore.menu.pos[focused.namespace][focused.name] == index) return;

		let menu = tgiCore.menu.opened[focused.namespace][focused.name];

		tgiCore.menu.pos[focused.namespace][focused.name] = index;

		let elem2 = menu.elements[tgiCore.menu.pos[focused.namespace][focused.name]];

		for (let i=0; i<menu.elements.length; i++) {
			if (i == tgiCore.menu.pos[focused.namespace][focused.name]) {
				menu.elements[i].selected = true;
			} else {
				menu.elements[i].selected = false;
			}
		}
		$("#menu_" + focused.namespace + "_" + focused.name+" .selected").removeClass("selected")
		$("#menu_" + focused.namespace + "_" + focused.name+" .menu_"+index).addClass("selected")
		tgiCore.menu.change(focused.namespace, focused.name, elem2);
	}

	tgiCore.menu.menuonclick = function(index) {
		let focused = tgiCore.menu.getFocused();
		if (typeof focused == 'undefined') return;
		let menu = tgiCore.menu.opened[focused.namespace][focused.name];
		let elem6 = menu.elements[index];
		if (menu.elements.length > 0) {
			tgiCore.menu.submit(focused.namespace, focused.name, elem6);
		}
	}

	tgiCore.menu.menuonclickclose = function() {
		let focused = tgiCore.menu.getFocused();
		if (typeof focused == 'undefined') return
		tgiCore.menu.cancel(focused.namespace, focused.name);
	}

	tgiCore.menu.open = function(namespace, name, data) {

		if (typeof tgiCore.menu.opened[namespace] == 'undefined') {
			tgiCore.menu.opened[namespace] = {};
		}

		if (typeof tgiCore.menu.opened[namespace][name] != 'undefined') {
			tgiCore.menu.close(namespace, name);
		}

		if (typeof tgiCore.menu.pos[namespace] == 'undefined') {
			tgiCore.menu.pos[namespace] = {};
		}

		for (let i=0; i<data.elements.length; i++) {
			if (typeof data.elements[i].type == 'undefined') {
				data.elements[i].type = 'default';
			}
		}

		data._index     = tgiCore.menu.focus.length;
		data._namespace = namespace;
		data._name      = name;

		for (let i=0; i<data.elements.length; i++) {
			data.elements[i]._namespace = namespace;
			data.elements[i]._name      = name;
		}

		tgiCore.menu.opened[namespace][name] = data;
		tgiCore.menu.pos   [namespace][name] = 0;

		for (let i=0; i<data.elements.length; i++) {
			if (data.elements[i].selected) {
				tgiCore.menu.pos[namespace][name] = i;
			} else {
				data.elements[i].selected = false;
			}
		}

		tgiCore.menu.focus.push({
			namespace: namespace,
			name     : name
		});

		tgiCore.menu.render();
		$('#menu_' + namespace + '_' + name).find('.menu-item.selected')[0].scrollIntoView();
	};

	tgiCore.menu.close = function(namespace, name) {

		delete tgiCore.menu.opened[namespace][name];

		for (let i=0; i<tgiCore.menu.focus.length; i++) {
			if (tgiCore.menu.focus[i].namespace == namespace && tgiCore.menu.focus[i].name == name) {
				tgiCore.menu.focus.splice(i, 1);
				break;
			}
		}

		tgiCore.menu.render();

	};

	tgiCore.menu.render = function() {

		let menuContainer       = document.getElementById('menus');
		let focused             = tgiCore.menu.getFocused();
		menuContainer.innerHTML = '';

		$(menuContainer).hide();

		for (let namespace in tgiCore.menu.opened) {
			for (let name in tgiCore.menu.opened[namespace]) {

				let menuData = tgiCore.menu.opened[namespace][name];
				let view     = JSON.parse(JSON.stringify(menuData));

				for (let i=0; i<menuData.elements.length; i++) {
					let element = view.elements[i];
					element.index = i
					switch (element.type) {
						case 'default' : break;

						case 'slider' : {
							element.isSlider    = true;
							element.sliderLabel = (typeof element.options == 'undefined') ? element.value : element.options[element.value];

							break;
						}

						default : break;
					}

					if (i == tgiCore.menu.pos[namespace][name]) {
						element.selected = true;
					}
				}

				let menu = $(Mustache.render(MenuTpl, view))[0];
				$(menu).hide();
				menuContainer.appendChild(menu);
			}
		}

		if (typeof focused != 'undefined') {
			$('#menu_' + focused.namespace + '_' + focused.name).show();
		}

		$(menuContainer).show();

	};

	tgiCore.menu.submit = function(namespace, name, data) {
		$.post('https://' + tgiCore.ResourceName + '/menu_submit', JSON.stringify({
			_namespace: namespace,
			_name     : name,
			current   : data,
			elements  : tgiCore.menu.opened[namespace][name].elements
		}));
	};

	tgiCore.menu.cancel = function(namespace, name) {
		$.post('https://' + tgiCore.ResourceName + '/menu_cancel', JSON.stringify({
			_namespace: namespace,
			_name     : name
		}));
	};

	tgiCore.menu.change = function(namespace, name, data) {
		$.post('https://' + tgiCore.ResourceName + '/menu_change', JSON.stringify({
			_namespace: namespace,
			_name     : name,
			current   : data,
			elements  : tgiCore.menu.opened[namespace][name].elements
		}));
	};

	tgiCore.menu.getFocused = function() {
		return tgiCore.menu.focus[tgiCore.menu.focus.length - 1];
	};

	window.addEventListener("keyup", (event) => {
		let focused = tgiCore.menu.getFocused();
		if (typeof focused == 'undefined') return
		let menu    = tgiCore.menu.opened[focused.namespace][focused.name];
		let pos     = tgiCore.menu.pos[focused.namespace][focused.name];

		switch (event.keyCode) {
			case 40: //Arrow Down
				let length = menu.elements.length;

				if (pos < length - 1) {
					tgiCore.menu.pos[focused.namespace][focused.name]++;
				} else {
					tgiCore.menu.pos[focused.namespace][focused.name] = 0;
				}

				let elem2 = menu.elements[tgiCore.menu.pos[focused.namespace][focused.name]];

				for (let i=0; i<menu.elements.length; i++) {
					if (i == tgiCore.menu.pos[focused.namespace][focused.name]) {
						menu.elements[i].selected = true;
					} else {
						menu.elements[i].selected = false;
					}
				}

				tgiCore.menu.change(focused.namespace, focused.name, elem2);
				tgiCore.menu.render();

				$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
				break;
			case 38: //Arrow Up
				if (pos > 0) {
					tgiCore.menu.pos[focused.namespace][focused.name]--;
				} else {
					tgiCore.menu.pos[focused.namespace][focused.name] = menu.elements.length - 1;
				}

				let elem3 = menu.elements[tgiCore.menu.pos[focused.namespace][focused.name]];

				for (let i=0; i<menu.elements.length; i++) {
					if (i == tgiCore.menu.pos[focused.namespace][focused.name]) {
						menu.elements[i].selected = true;
					} else {
						menu.elements[i].selected = false;
					}
				}

				tgiCore.menu.change(focused.namespace, focused.name, elem3);
				tgiCore.menu.render();

				$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();

				break;

			case 37: //Arrow Left
				let elem4 = menu.elements[pos];
				switch(elem4.type) {
					case 'default': break;

					case 'slider': {
						let min = (typeof elem4.min == 'undefined') ? 0 : elem4.min;

						if (elem4.value > min) {
							elem4.value--;
							tgiCore.menu.change(focused.namespace, focused.name, elem4);
						}

						tgiCore.menu.render();
						break;
					}

					default: break;
				}

				$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
				break;

			case 39: //Arrow Right
				let elem5 = menu.elements[pos];
				switch(elem5.type) {
					case 'default': break;

					case 'slider': {
						if (typeof elem5.options != 'undefined' && elem5.value < elem5.options.length - 1) {
							elem5.value++;
							tgiCore.menu.change(focused.namespace, focused.name, elem5);
						}

						if (typeof elem5.max != 'undefined' && elem5.value < elem5.max) {
							elem5.value++;
							tgiCore.menu.change(focused.namespace, focused.name, elem5);
						}

						tgiCore.menu.render();
						break;
					}

					default: break;
				}

				$('#menu_' + focused.namespace + '_' + focused.name).find('.menu-item.selected')[0].scrollIntoView();
				break;
			case 8: //Back Space
				tgiCore.menu.cancel(focused.namespace, focused.name);
				break;

			case 27: //Back Space
				tgiCore.menu.cancel(focused.namespace, focused.name);
				break;

			case 13: //Enter
				let elem6 = menu.elements[pos];
				if (menu.elements.length > 0) {
					tgiCore.menu.submit(focused.namespace, focused.name, elem6);
				}
				break;
		}

	});

	window.oncontextmenu = function () {
		tgiCore.menu.menuonclickclose()
	}

});