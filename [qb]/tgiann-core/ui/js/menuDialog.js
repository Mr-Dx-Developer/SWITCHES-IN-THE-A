$(function() {
	let MenuDialogTpl = ""

	tgiCore.menudialog = {}
	tgiCore.menudialog.opened       = {};
	tgiCore.menudialog.focus        = [];
	tgiCore.menudialog.pos          = {};

	tgiCore.menudialog.MenuDialogTpl = function() {
		MenuDialogTpl =
			'<div id="menu_{{_namespace}}_{{_name}}" class="dialog {{#isBig}}big{{/isBig}}">' +
				'{{#isDefault}}<input type="text" name="value" placeholder="{{title}}" id="inputText"/>{{/isDefault}}' +
					'{{#isBig}}<textarea name="value"/>{{/isBig}}' +
					'<button type="button" name="submit">'+tgiCore.lang.accept+'</button>' +
					'<button type="button" name="cancel">'+tgiCore.lang.cancel+'</button>'
				'</div>' +
			'</div>'
		;
	}

	tgiCore.menudialog.open = function (namespace, name, data) {

		if (typeof tgiCore.menudialog.opened[namespace] == 'undefined') {
			tgiCore.menudialog.opened[namespace] = {};
		}

		if (typeof tgiCore.menudialog.opened[namespace][name] != 'undefined') {
			tgiCore.menudialog.close(namespace, name);
		}

		if (typeof tgiCore.menudialog.pos[namespace] == 'undefined') {
			tgiCore.menudialog.pos[namespace] = {};
		}

		if (typeof data.type == 'undefined') {
			data.type = 'default';
		}

		if (typeof data.align == 'undefined') {
			data.align = 'top-left';
		}

		data._index = tgiCore.menudialog.focus.length;
		data._namespace = namespace;
		data._name = name;

		tgiCore.menudialog.opened[namespace][name] = data;
		tgiCore.menudialog.pos[namespace][name] = 0;

		tgiCore.menudialog.focus.push({
			namespace: namespace,
			name: name
		});

		document.onkeyup = function (key) {
			if (key.which == 27) { // Escape key
				let focused = tgiCore.menudialog.getFocused();
				if (typeof focused == 'undefined') return;
				$.post('https://' + tgiCore.ResourceName + '/menu_dialog_cancel', JSON.stringify(data));
			} else if (key.which == 13) { // Enter key
				let focused = tgiCore.menudialog.getFocused();
				if (typeof focused == 'undefined') return;
				$.post('https://' + tgiCore.ResourceName + '/menu_dialog_submit', JSON.stringify(data));
			}
		};

		tgiCore.menudialog.render();

	};

	tgiCore.menudialog.close = function (namespace, name) {

		delete tgiCore.menudialog.opened[namespace][name];

		for (let i = 0; i < tgiCore.menudialog.focus.length; i++) {
			if (tgiCore.menudialog.focus[i].namespace == namespace && tgiCore.menudialog.focus[i].name == name) {
				tgiCore.menudialog.focus.splice(i, 1);
				break;
			}
		}

		tgiCore.menudialog.render();

	};

	tgiCore.menudialog.render = function () {

		let menuContainer = $('#menusdialog')[0];

		$(menuContainer).find('button[name="submit"]').unbind('click');
		$(menuContainer).find('button[name="cancel"]').unbind('click');
		$(menuContainer).find('[name="value"]').unbind('input propertychange');

		menuContainer.innerHTML = '';

		$(menuContainer).hide();

		for (let namespace in tgiCore.menudialog.opened) {
			for (let name in tgiCore.menudialog.opened[namespace]) {

				let menuData = tgiCore.menudialog.opened[namespace][name];
				let view = JSON.parse(JSON.stringify(menuData));

				switch (menuData.type) {
					case 'default': {
						view.isDefault = true;
						break;
					}

					case 'big': {
						view.isBig = true;
						break;
					}

					default: break;
				}

				let menu = $(Mustache.render(MenuDialogTpl, view))[0];

				$(menu).css('z-index', 1000 + view._index);

				$(menu).find('button[name="submit"]').click(function () {
					tgiCore.menudialog.submit(this.namespace, this.name, this.data);
				}.bind({ namespace: namespace, name: name, data: menuData }));

				$(menu).find('button[name="cancel"]').click(function () {
					tgiCore.menudialog.cancel(this.namespace, this.name, this.data);
				}.bind({ namespace: namespace, name: name, data: menuData }));

				$(menu).find('[name="value"]').bind('input propertychange', function () {
					this.data.value = $(menu).find('[name="value"]').val();
					tgiCore.menudialog.change(this.namespace, this.name, this.data);
				}.bind({ namespace: namespace, name: name, data: menuData }));

				if (typeof menuData.value != 'undefined')
					$(menu).find('[name="value"]').val(menuData.value);

				menuContainer.appendChild(menu);
			}
		}

		$(menuContainer).show();
		$("#inputText").focus();
	};

	tgiCore.menudialog.submit = function (namespace, name, data) {
		$.post('https://' + tgiCore.ResourceName + '/menu_dialog_submit', JSON.stringify(data));
	};

	tgiCore.menudialog.cancel = function (namespace, name, data) {
		$.post('https://' + tgiCore.ResourceName + '/menu_dialog_cancel', JSON.stringify(data));
	};

	tgiCore.menudialog.change = function (namespace, name, data) {
		$.post('https://' + tgiCore.ResourceName + '/menu_dialog_change', JSON.stringify(data));
	};

	tgiCore.menudialog.getFocused = function () {
		return tgiCore.menudialog.focus[tgiCore.menudialog.focus.length - 1];
	};

});