//ESX MENU LIST: https://github.com/esx-framework

$(function() {

	let MenuListTpl =
		'<div id="menu_{{_namespace}}_{{_name}}" class="menu-list">' +
			'<table>' +
				'<thead>' +
					'<tr>' +
						'{{#head}}<td>{{content}}</td>{{/head}}' +
					'</tr>' +
				'</thead>'+
				'<tbody>' +
					'{{#rows}}' +
						'<tr>' +
							'{{#cols}}<td>{{{content}}}</td>{{/cols}}' +
						'</tr>' +
					'{{/rows}}' +
				'</tbody>' +
			'</table>' +
		'</div>'
	;

    tgiCore.menulist = {}
	tgiCore.menulist.opened       = {};
	tgiCore.menulist.focus        = [];
	tgiCore.menulist.data         = {};

	tgiCore.menulist.open = function(namespace, name, data) {
		if (typeof tgiCore.menulist.opened[namespace] == 'undefined') {
			tgiCore.menulist.opened[namespace] = {};
		}

		if (typeof tgiCore.menulist.opened[namespace][name] != 'undefined') {
			tgiCore.menulist.close(namespace, name);
		}

		data._namespace = namespace;
		data._name      = name;

		tgiCore.menulist.opened[namespace][name] = data;

		tgiCore.menulist.focus.push({
			namespace: namespace,
			name     : name
		});
		
		tgiCore.menulist.render();
	};

	tgiCore.menulist.close = function(namespace, name) {
		delete tgiCore.menulist.opened[namespace][name];

		for (let i=0; i<tgiCore.menulist.focus.length; i++) {
			if (tgiCore.menulist.focus[i].namespace == namespace && tgiCore.menulist.focus[i].name == name) {
				tgiCore.menulist.focus.splice(i, 1);
				break;
			}
		}

		tgiCore.menulist.render();
	};

	tgiCore.menulist.render = function() {
		let menuContainer       = document.getElementById('menuslist');
		let focused             = tgiCore.menulist.getFocused();
		menuContainer.innerHTML = '';

		$(menuContainer).hide();

		for (let namespace in tgiCore.menulist.opened) {
			
			if (typeof tgiCore.menulist.data[namespace] == 'undefined') {
				tgiCore.menulist.data[namespace] = {};
			}

			for (let name in tgiCore.menulist.opened[namespace]) {

				tgiCore.menulist.data[namespace][name] = [];

				let menuData = tgiCore.menulist.opened[namespace][name];
				let view = {
					_namespace: menuData._namespace,
					_name     : menuData._name,
					head      : [],
					rows      : []
				};

				for (let i=0; i<menuData.head.length; i++) {
					let item = {content: menuData.head[i]};
					view.head.push(item);
				}

				for (let i=0; i<menuData.rows.length; i++) {
					let row  = menuData.rows[i];
					let data = row.data;

					tgiCore.menulist.data[namespace][name].push(data);

					view.rows.push({cols: []});

					for (let j=0; j<row.cols.length; j++) {

						let col     = menuData.rows[i].cols[j];
						let regex   = /\{\{(.*?)\|(.*?)\}\}/g;
						let matches = [];
						let match;

						while ((match = regex.exec(col)) != null) {
							matches.push(match);
						}

						for (let k=0; k<matches.length; k++) {
							col = col.replace('{{' + matches[k][1] + '|' + matches[k][2] + '}}', '<button data-id="' + i + '" data-namespace="' + namespace + '" data-name="' + name + '" data-value="' + matches[k][2] +'">' + matches[k][1] + '</button>');
						}

						view.rows[i].cols.push({data: data, content: col});
					}
				}

				let menu = $(Mustache.render(MenuListTpl, view));

				menu.find('button[data-namespace][data-name]').click(function() {
					tgiCore.menulist.submit($(this).data('namespace'), $(this).data('name'), {
						data : tgiCore.menulist.data[$(this).data('namespace')][$(this).data('name')][parseInt($(this).data('id'))],
						value: $(this).data('value')
					});
				});

				menu.hide();

				menuContainer.appendChild(menu[0]);
			}
		}

		if (typeof focused != 'undefined') {
			$('#menu_' + focused.namespace + '_' + focused.name).show();
		}

		$(menuContainer).show();
	};

	tgiCore.menulist.submit = function(namespace, name, data){
		$.post('https://' + tgiCore.ResourceName + '/menulist_submit', JSON.stringify({
			_namespace: namespace,
			_name     : name,
			data      : data.data,
			value     : data.value
		}));
	};

	tgiCore.menulist.cancel = function(namespace, name){
		$.post('https://' + tgiCore.ResourceName + '/menulist_cancel', JSON.stringify({
			_namespace: namespace,
			_name     : name
		}));
	};

	tgiCore.menulist.getFocused = function(){
		return tgiCore.menulist.focus[tgiCore.menulist.focus.length - 1];
	};

	document.onkeyup = function(data) {
		if(data.which == 27) {
			let focused = tgiCore.menulist.getFocused();
			if (typeof focused == 'undefined') return;
			tgiCore.menulist.cancel(focused.namespace, focused.name);
		}
	};

});