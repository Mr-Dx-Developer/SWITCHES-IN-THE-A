const resName = GetParentResourceName();

// Utils

function maxTwoDecimals() {
	if(isNaN(this.value)) {
		return
	}

	let number = parseFloat(this.value);

	if(number) {
		this.value = number.toFixed(2);
	}
}

$(".max-two-decimals").change(maxTwoDecimals)

function componentToHex(c) {
	var hex = c.toString(16);

	return hex.length == 1 ? "0" + hex : hex;
  }
  
function rgbToHex(r, g, b) {
	return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function hexToRgb(hex) {
	var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);

	return result ? {
	  r: parseInt(result[1], 16),
	  g: parseInt(result[2], 16),
	  b: parseInt(result[3], 16)
	} : null;
}

// Harvestable items
let harvestableItemsDatatable = $("#harvestable-items-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let harvestableItemId = parseInt(data[0]);

			editHarvestableItem(harvestableItemId);
		})
	},
} );

let harvestableItems = {};

function loadHarvestableItems() {
	$.post(`https://${resName}/getAllHarvestableItems`, {}, async function(rawHarvestableItems) {
		// Manually create the table to avoid incompatibilities due table indexing

		harvestableItems = {};

		for(const[k, itemData] of Object.entries(rawHarvestableItems)) {
			harvestableItems[itemData.id] = itemData;
		}

		harvestableItemsDatatable.clear();

		for(const[itemId, itemData] of Object.entries(harvestableItems)) {
			harvestableItemsDatatable.row.add([
				itemId,
				await getItemLabel(itemData.name),
				itemData.minQuantity,
				itemData.maxQuantity,
				itemData.coords.x,
				itemData.coords.y,
				itemData.coords.z,
			])
		}

		harvestableItemsDatatable.draw()
	})
}

// Harvestable items creation
$("#new-harvestable-item-btn").click(function() {
	let harvestableModal = $("#harvestable-item-modal");

	harvestableModal.data("action", "create");

	harvestableModal.find("input").val("");

	$("#harvestable-scale-x").val(1.5);
	$("#harvestable-scale-y").val(1.5);
	$("#harvestable-scale-z").val(1.5);

	$("#harvestable-icon-type").val(1);
	$("#harvestable-min-quantity").val(1);
	$("#harvestable-max-quantity").val(1);

	$("#harvestable-harvest-time").val(5);

	// Converts from edit modal to create modal
	$("#delete-harvestable-item-btn").hide();
	$("#save-harvestable-item-btn").text( getLocalizedText("menu:create") );

	$("#harvestable-item-map-blip").change();

    harvestableModal.modal("show");
})

$("#harvestable-choose-item-btn").click(async function() {
	const itemName = await itemsDialog();
    $("#harvestable-item-name").val(itemName);
})

$("#harvestable-current-coords-btn").click(async function() {
	let coords = await getCurrentCoords()
	
	$("#harvestable-coords-x").val(coords.x);
	$("#harvestable-coords-y").val(coords.y);
	$("#harvestable-coords-z").val(coords.z);
})

$("#harvestable-item-map-blip").change(function() {
	let enabled = $(this).prop("checked");

	$("#harvestable-item-map-blip-inputs").find("input").prop("disabled", !enabled);
})

$("#harvestable-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;
	
	let harvestableItem = {
		name: $("#harvestable-item-name").val(),

		iconType: parseInt( $("#harvestable-icon-type").val() ),

		coords: {
			x: parseFloat( $("#harvestable-coords-x").val() ),
			y: parseFloat( $("#harvestable-coords-y").val() ),
			z: parseFloat( $("#harvestable-coords-z").val() ),
		},

		scale: {
			x: parseFloat( $("#harvestable-scale-x").val() ),
			y: parseFloat( $("#harvestable-scale-y").val() ),
			z: parseFloat( $("#harvestable-scale-z").val() ),
		},

		bounce: $("#harvestable-bounce").prop("checked"),
		followCamera: $("#harvestable-follow-camera").prop("checked"),
		rotate: $("#harvestable-rotate").prop("checked"),

		color: hexToRgb(  $("#harvestable-color").val() ),
		opacity: parseInt( $("#harvestable-opacity").val() ),

		timeToHarvest: parseInt( $("#harvestable-harvest-time").val() ),

		minQuantity: parseInt( $("#harvestable-min-quantity").val() ),
		maxQuantity: parseInt( $("#harvestable-max-quantity").val() )
	}

	let isBlipEnabled = $("#harvestable-item-map-blip").prop("checked");
	if( isBlipEnabled ) {
		harvestableItem.blipName = $("#harvestable-item-blip-name").val();
		harvestableItem.blipSprite = parseInt( $("#harvestable-item-sprite-id").val() );
		harvestableItem.blipColor = parseInt( $("#harvestable-item-blip-color").val() );
		harvestableItem.blipScale = parseFloat( $("#harvestable-item-blip-scale").val() );
	}

	let harvestableItemModal = $("#harvestable-item-modal");
	let action = $(harvestableItemModal).data("action");

	let response = null;

	switch(action) {
		case "create": {
			response = await $.post(`https://${resName}/createNewHarvestableItem`, JSON.stringify(harvestableItem));
			break;
		}

		case "edit": {
			let itemId = harvestableItemModal.data("itemId");

			response = await $.post(`https://${resName}/updateHarvestableItem`, JSON.stringify({
				itemId: itemId,
				itemData: harvestableItem
			}));
			break;
		}
	}

	harvestableItemModal.modal("hide");
	loadHarvestableItems();

	showServerResponse(response);
}) 

// Harvestable items edit
function editHarvestableItem(harvestableItemId) {
	let itemData = harvestableItems[harvestableItemId];

	$("#harvestable-item-name").val(itemData.name);
	$("#harvestable-icon-type").val(itemData.iconType);

	$("#harvestable-coords-x").val(itemData.coords.x);
	$("#harvestable-coords-y").val(itemData.coords.y);
	$("#harvestable-coords-z").val(itemData.coords.z);

	$("#harvestable-scale-x").val(itemData.scale.x);
	$("#harvestable-scale-y").val(itemData.scale.y);
	$("#harvestable-scale-z").val(itemData.scale.z);

	$("#harvestable-bounce").prop("checked", itemData.bounce);
	$("#harvestable-follow-camera").prop("checked", itemData.followCamera);
	$("#harvestable-rotate").prop("checked", itemData.rotate);

	$("#harvestable-color").val( rgbToHex(itemData.color.r, itemData.color.g, itemData.color.b) );
	$("#harvestable-opacity").val(itemData.opacity);

	$("#harvestable-harvest-time").val(itemData.timeToHarvest);

	$("#harvestable-min-quantity").val(itemData.minQuantity);
	$("#harvestable-max-quantity").val(itemData.maxQuantity);

	let mapBlipCheckbox = $("#harvestable-item-map-blip");
	if(itemData.blipSprite) {
		$("#harvestable-item-blip-name").val(itemData.blipName);
		$("#harvestable-item-sprite-id").val(itemData.blipSprite);
		$("#harvestable-item-blip-color").val(itemData.blipColor);
		$("#harvestable-item-blip-scale").val(itemData.blipScale);

		mapBlipCheckbox.prop("checked", true);
	} else {
		mapBlipCheckbox.prop("checked", false);
	}
	mapBlipCheckbox.change();

	let harvestableModal = $("#harvestable-item-modal");

	harvestableModal.data("itemId", harvestableItemId);
	harvestableModal.data("action", "edit");

	$("#delete-harvestable-item-btn").show();
	$("#save-harvestable-item-btn").text( getLocalizedText("menu:save") );

	harvestableModal.modal("show");
}

// Harvestable item delete
$("#delete-harvestable-item-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let itemId = $("#harvestable-item-modal").data("itemId");

	const response = await $.post(`https://${resName}/deleteHarvestableItem`, JSON.stringify({
		itemId: itemId
	}));

	$("#harvestable-item-modal").modal("hide");
	loadHarvestableItems();
	showServerResponse(response);
})

// Drugs Fields
let drugsFieldsDatatable = $("#fields-container").DataTable({
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let fieldId = parseInt(data[0]);

			editDrugField(fieldId);
		})
	},
} );

let drugsFields = {};

function loadDrugsFields() {
	$.post(`https://${resName}/getAllDrugsFields`, {}, function(rawDrugsFields) {
		// Manually create the table to avoid incompatibilities due table indexing

		drugsFields = {};

		for(const[k, fieldData] of Object.entries(rawDrugsFields)) {
			drugsFields[fieldData.id] = fieldData;
		}

		drugsFieldsDatatable.clear();

		for(const[fieldId, fieldData] of Object.entries(drugsFields)) {
			drugsFieldsDatatable.row.add([
				fieldId,
				fieldData.label,
				fieldData.radius,
				fieldData.coords.x,
				fieldData.coords.y,
				fieldData.coords.z,
			])
		}

		drugsFieldsDatatable.draw()
	})
}

$("#new-field-btn").click(function() {
	let fieldModal = $("#field-modal");

	fieldModal.data("action", "create");

	fieldModal.find("input").val("");
	$("#field-map-blip").prop("checked", false).change();

	// Converts from edit modal to create modal
	$("#delete-field-btn").hide();
	$("#save-field-btn").text( getLocalizedText("menu:create") );

	$("#fields-items").empty();

	addItemToField();

    fieldModal.modal("show");
})

$("#field-current-coords-btn").click(async function() {
	let coords = await getCurrentCoords();

	$("#field-coords-x").val(coords.x);
	$("#field-coords-y").val(coords.y);
	$("#field-coords-z").val(coords.z);
});

async function addItemToField(itemData = {}) {
	let itemDiv = $(`
		<div class="item">
			<div class="row g-2 row-cols-auto my-1 align-items-center">
				<div class="form-floating">
					<input type="text" class="form-control field-item-label" placeholder="Label" value="${itemData.name ? await getItemLabel(itemData.name) : ""}" disabled>
					<label>${ getLocalizedText("menu:label") }</label>
				</div>

				<div class="form-floating">
					<input type="text" class="form-control field-item-name" placeholder="Item name" value="${itemData.name || ""}" required>
					<label>${ getLocalizedText("menu:item_name") }</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-item-btn me-3" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose_item") }"><i class="bi bi-list-ul"></i></button>	
			
				<div class="form-floating">
					<input type="number" class="form-control" id="field-item-chances" placeholder="Chances" value="${itemData.chances}" required>
					<label>${ getLocalizedText("menu:chances") }</label>
				</div>

				<button type="button" class="btn-close btn-close remove-btn ms-3"></button>
			</div>

			<div class="row g-2 row-cols-2 my-3">
				<div class="form-floating">
					<input type="number" class="form-control field-item-min-quantity" placeholder="Min quantity" value="${itemData.minQuantity}" required>
					<label>${ getLocalizedText("menu:minimum_quantity") }</label>
				</div>

				<div class="form-floating">
					<input type="number" class="form-control field-item-max-quantity" placeholder="Max quantity" value="${itemData.maxQuantity}" required>
					<label>${ getLocalizedText("menu:maximum_quantity") }</label>
				</div>
			</div>
		</div>

		<hr>
	`);

	itemDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		itemDiv.find(".field-item-name").val(itemName);

		let itemLabel = await getItemLabel(itemName);

		itemDiv.find(".field-item-label").val(itemLabel);
	}).tooltip();

	itemDiv.find(".remove-btn").click(function() {
		itemDiv.remove();
	})

	$("#fields-items").append(itemDiv);
}
$("#field-add-item").click(addItemToField);

function getItemFieldDataFromDiv(itemDiv) {
	let itemData = {
		name: itemDiv.find(".field-item-name").val(),
		chances: parseInt( itemDiv.find("#field-item-chances").val() ),
		minQuantity: parseInt( itemDiv.find(".field-item-min-quantity").val() ),
		maxQuantity: parseInt( itemDiv.find(".field-item-max-quantity").val() )
	}

	return itemData;
}

function getAllItemsFieldData() {
	let items = [];

	$("#fields-items").children(".item").each(function() {
		items.push(getItemFieldDataFromDiv( $(this) ))
	})

	return items;
}

function editDrugField(fieldId) {
	let fieldModal = $("#field-modal");

	fieldModal.data("action", "edit");
	fieldModal.data("fieldId", fieldId);

	let fieldData = drugsFields[fieldId];

	$("#field-label").val(fieldData.label);
	$("#field-radius").val(fieldData.radius);
	$("#field-coords-x").val(fieldData.coords.x);
	$("#field-coords-y").val(fieldData.coords.y);
	$("#field-coords-z").val(fieldData.coords.z);

	$("#field-object-model").val(fieldData.objectModel);
	$("#field-max-objects").val(fieldData.maxObjects);
	$("#field-seconds-to-harvest").val(fieldData.time);
	
	$("#delete-field-btn").show();
	$("#save-field-btn").text( getLocalizedText("menu:save") );

	let mapBlipCheckbox = $("#field-map-blip");
	if(fieldData.blipSprite) {
		$("#field-blip-name").val(fieldData.blipName);
		$("#field-sprite-id").val(fieldData.blipSprite);
		$("#field-blip-color").val(fieldData.blipColor);
		$("#field-blip-scale").val(fieldData.blipScale);

		mapBlipCheckbox.prop("checked", true);
	} else {
		mapBlipCheckbox.prop("checked", false);
	}
	mapBlipCheckbox.change();

	$("#fields-items").empty();

	if(fieldData.items) {
		for(const itemData of fieldData.items) {
			addItemToField(itemData);
		}
	}

	fieldModal.modal("show");
}

$("#field-map-blip").change(function() {
	let enabled = $(this).prop("checked");

	$("#field-map-blip-inputs").find("input").prop("disabled", !enabled);
})

$("#field-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let fieldData = {
		label: $("#field-label").val(),
		radius: parseInt( $("#field-radius").val() ),
		coords: {
			x: parseFloat( $("#field-coords-x").val() ),
			y: parseFloat( $("#field-coords-y").val() ),
			z: parseFloat( $("#field-coords-z").val() )
		},
		items: getAllItemsFieldData(),
		objectModel: $("#field-object-model").val(),
		maxObjects: parseInt( $("#field-max-objects").val() ),
		time: parseInt( $("#field-seconds-to-harvest").val() ),
	}

	let isBlipEnabled = $("#field-map-blip").prop("checked");
	if( isBlipEnabled ) {
		fieldData.blipName = $("#field-blip-name").val();
		fieldData.blipSprite = parseInt( $("#field-sprite-id").val() );
		fieldData.blipColor = parseInt( $("#field-blip-color").val() );
		fieldData.blipScale = parseFloat( $("#field-blip-scale").val() );
	}

	let fieldModal = $("#field-modal");
	let action = fieldModal.data("action");

	let response = null;

	switch(action) {
		case "create": {
			response = await $.post(`https://${resName}/createNewField`, JSON.stringify(fieldData))
			break;
		}

		case "edit": {
			const fieldId = fieldModal.data("fieldId");
			
			response = await $.post(`https://${resName}/updateField`, JSON.stringify({fieldId: fieldId, fieldData: fieldData}));
			break;
		}
	}

	showServerResponse(response);
	fieldModal.modal("hide");
	loadDrugsFields()
})

$("#delete-field-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let fieldId = $("#field-modal").data("fieldId");

	const response = await $.post(`https://${resName}/deleteField`, JSON.stringify({fieldId: fieldId}))
	showServerResponse(response);

	$("#field-modal").modal("hide");
	loadDrugsFields();
})

// Craftings creation
let craftingRecipesDatatable = $("#crafting-recipes-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let craftingId = parseInt(data[0]);

			editCraftingRecipe(craftingId);
		})
	},
} );

let craftingRecipes = {};
function loadCraftingRecipes() {
	$.post(`https://${resName}/getAllCraftingRecipes`, {}, function(rawCraftingRecipes) {
		// Manually create the table to avoid incompatibilities due table indexing
		craftingRecipes = {};

		for(const[k, craftingRecipe] of Object.entries(rawCraftingRecipes)) {
			craftingRecipes[craftingRecipe.id] = craftingRecipe;
		}

		craftingRecipesDatatable.clear();

		for(const[craftingId, craftingRecipe] of Object.entries(craftingRecipes)) {
			craftingRecipesDatatable.row.add([
				craftingId,
				craftingRecipe.name,
				craftingRecipe.resultItems.map(resultItem => `${resultItem.itemName}`).join(", "),
				craftingRecipe.time
			])
		}

		craftingRecipesDatatable.draw()
	})
}

$("#new-crafting-btn").click(function() {
	let craftingRecipeModal = $("#crafting-recipe-modal");

	craftingRecipeModal.data("action", "create");
	craftingRecipeModal.modal("show");

	$("#crafting-recipe-result-items-container").empty();
	$("#crafting-recipe-ingredients-container").empty();
	$("#crafting-recipe-perfect-recipe-reward-container").empty();

	// Adapts the modal to creation instead of edit
	$("#crafting-recipe-modal-confirm-btn").text( getLocalizedText("menu:create") );
	$("#delete-crafting-recipe-btn").hide();

	$("#crafting-recipe-modal").find("input").val("");

	// Adds one empty result item and ingredient
	addResultItemInCraftingRecipe();
	addIngredientInCraftingRecipe();
	addRewardItemInCraftingRecipe();
});

// Adds a result item in the crafting recipe
function addResultItemInCraftingRecipe(itemName = "", itemQuantity = 1) {
	let craftingRecipeContainer = $("#crafting-recipe-result-items-container");

	let resultItemDiv = $(`
		<div class="row g-2 mb-2 align-items-center result-item">
			<div class="col-md">
				<div class="form-floating">
					<input type="text" class="form-control result-item-name" placeholder="Item name" value="${itemName}" required>
					<label>${getLocalizedText("menu:item_name")}</label>
				</div>
			</div>

			<button type="button" class="btn btn-secondary col-2 choose-item-btn">${getLocalizedText("menu:choose_item")}</button>

			<div class="col-md ms-2">
				<div class="form-floating">
					<input type="number" class="form-control result-item-quantity" placeholder="Item quantity" value="${itemQuantity}" required>
					<label>${getLocalizedText("menu:quantity")}</label>
				</div>
			</div>

			<button type="button" class="btn-close remove-result-item-btn" aria-label="Close"></button>
		</div>
	`);

	resultItemDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		resultItemDiv.find(".result-item-name").val(itemName);
	})

	resultItemDiv.find(".remove-result-item-btn").click(function() {
		resultItemDiv.remove();
	})

	craftingRecipeContainer.append(resultItemDiv);
}
$("#crafting-recipe-add-result-item-btn").click(function() {
	addResultItemInCraftingRecipe();
})

function addIngredientInCraftingRecipe(ingredientName = "", ingredientMinQuantity = 1, ingredientMaxQuantity = 3, ingredientPerfectQuantity = 2, loseOnUse = true) {
	let ingredientsContainer = $("#crafting-recipe-ingredients-container");

	let ingredientDiv = $(`
		<div class="d-flex g-2 gap-2 align-items-center mb-3 ingredient">
			<div class="form-floating col">
				<input type="text" class="form-control ingredient-item-name" placeholder="Item name" value="${ingredientName}" required>
				<label>${getLocalizedText("menu:item_name")}</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose_item") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-check my-auto">
				<input class="form-check-input" type="checkbox" ${loseOnUse ? "checked" : null}>
				<label class="form-check-label">${ getLocalizedText("menu:lose_on_use") }</label>
			</div>

			<div class="form-floating col">
				<input type="number" class="form-control ingredient-min-quantity" placeholder="Item name" value="${ingredientMinQuantity}" required>
				<label>${getLocalizedText("menu:minimum_quantity")}</label>
			</div>

			<div class="form-floating col">
				<input type="number" class="form-control ingredient-max-quantity" placeholder="Item name" value="${ingredientMaxQuantity}" required>
				<label>${getLocalizedText("menu:maximum_quantity")}</label>
			</div>

			<div class="form-floating col">
				<input type="number" class="form-control ingredient-perfect-quantity" placeholder="Item name" value="${ingredientPerfectQuantity}" required>
				<label>${getLocalizedText("menu:perfect_quantity")}</label>
			</div>

			<button type="button" class="btn-close remove-ingredient-btn"></button>
		</div>

		<hr>
	`);

	ingredientDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		ingredientDiv.find(".ingredient-item-name").val(itemName);
	}).tooltip();

	ingredientDiv.find(".remove-ingredient-btn").click(function() {
		ingredientDiv.remove();
	})

	ingredientsContainer.append(ingredientDiv);
}
$("#crafting-recipe-add-ingredient-btn").click(function() {
	addIngredientInCraftingRecipe();
})

// Get the data from crafting recipe modal
function getCraftingRecipeData() {
	let resultItems = [];
	$("#crafting-recipe-result-items-container").children(".result-item").each(function() {
		let resultItem = {
			itemName: $(this).find(".result-item-name").val(),
			itemQuantity: parseInt( $(this).find(".result-item-quantity").val() )
		}

		resultItems.push(resultItem);
	});

	let ingredients = [];
	$("#crafting-recipe-ingredients-container").children(".ingredient").each(function() {
		let ingredient = {
			ingredientItemName: $(this).find(".ingredient-item-name").val(),
			ingredientMinQuantity: parseInt( $(this).find(".ingredient-min-quantity").val() ),
			ingredientMaxQuantity: parseInt( $(this).find(".ingredient-max-quantity").val() ),
			ingredientPerfectQuantity: parseInt( $(this).find(".ingredient-perfect-quantity").val() ),
			loseOnUse: $(this).find(".form-check-input").is(":checked")
		}

		ingredients.push(ingredient);
	});

	let perfectRecipeReward = [];
	$("#crafting-recipe-perfect-recipe-reward-container").children(".reward-item").each(function() {
		let perfectRecipeRewardItem = {
			itemName: $(this).find(".reward-item-name").val(),
			itemQuantity: parseInt( $(this).find(".reward-item-quantity").val() )
		}

		perfectRecipeReward.push(perfectRecipeRewardItem);
	});

	let timeToCraft = parseInt( $("#crafting-recipe-time-to-craft").val() );
	let craftName = $("#crafting-recipe-name").val();

	return {
		resultItems: resultItems,
		ingredients: ingredients,
		perfectRecipeReward: perfectRecipeReward,
		time: timeToCraft,
		name: craftName
	}
}

// Saves the new crafting recipe created
$("#crafting-recipe-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let craftingRecipeData = getCraftingRecipeData();

	let craftingRecipeModal = $("#crafting-recipe-modal");
	let action = craftingRecipeModal.data("action");

	let response = null;

	switch(action) {
		case "create": {
			response = await $.post(`https://${resName}/createNewCraftingRecipe`, JSON.stringify(craftingRecipeData))
			break;
		}

		case "edit": {
			let craftingId = craftingRecipeModal.data("craftingId");
			
			response = await $.post(`https://${resName}/updateCraftingRecipe`, JSON.stringify({craftingId: craftingId, craftingRecipe: craftingRecipeData}));
			break;
		}
	}

	showServerResponse(response);

	craftingRecipeModal.modal("hide");
	loadCraftingRecipes();
})

// To edit an existing crafting recipe
function editCraftingRecipe(craftingId) {

	// Adapts the modal to edit instead of create
	$("#delete-crafting-recipe-btn").show();
	$("#crafting-recipe-modal-confirm-btn").text(  getLocalizedText("menu:save") );

	let craftingData = craftingRecipes[craftingId];

	$("#crafting-recipe-time-to-craft").val(craftingData.time);
	$("#crafting-recipe-name").val(craftingData.name);

	$("#crafting-recipe-result-items-container").empty();
	$("#crafting-recipe-ingredients-container").empty();
	$("#crafting-recipe-perfect-recipe-reward-container").empty();

	for (let resultItem of craftingData.resultItems) {
		addResultItemInCraftingRecipe(resultItem.itemName, resultItem.itemQuantity);
	}

	for (let rewardItem of craftingData.perfectRecipeReward) {
		addRewardItemInCraftingRecipe(rewardItem.itemName, rewardItem.itemQuantity);
	}
	
	for (let ingredient of craftingData.ingredients) {
		addIngredientInCraftingRecipe(ingredient.ingredientItemName, ingredient.ingredientMinQuantity, ingredient.ingredientMaxQuantity, ingredient.ingredientPerfectQuantity, ingredient.loseOnUse);
	}

	let craftingRecipeModal = $("#crafting-recipe-modal");

	craftingRecipeModal.modal("show");
	craftingRecipeModal.data("action", "edit");
	craftingRecipeModal.data("craftingId", craftingId);
}

// Deletes crafting recipe
$("#delete-crafting-recipe-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let craftingId = $("#crafting-recipe-modal").data("craftingId");

	const response = await $.post(`https://${resName}/deleteCraftingRecipe`, JSON.stringify({craftingId: craftingId}));
	showServerResponse(response);

	$("#crafting-recipe-modal").modal("hide");
	loadCraftingRecipes();
})

// Adds a reward item in the crafting recipe for perfect crafting
function addRewardItemInCraftingRecipe(itemName = "", itemQuantity = 1) {
	let rewardsContainer = $("#crafting-recipe-perfect-recipe-reward-container");

	let rewardItemDiv = $(`
		<div class="row g-2 mb-2 align-items-center reward-item">
			<div class="col-md">
				<div class="form-floating">
					<input type="text" class="form-control reward-item-name" placeholder="Item name" value="${itemName}" required>
					<label>${getLocalizedText("menu:item_name")}</label>
				</div>
			</div>

			<button type="button" class="btn btn-secondary col-2 choose-item-btn">${getLocalizedText("menu:choose_item")}</button>

			<div class="col-md ms-2">
				<div class="form-floating">
					<input type="number" class="form-control reward-item-quantity" placeholder="Item quantity" value="${itemQuantity}" required>
					<label>${getLocalizedText("menu:quantity")}</label>
				</div>
			</div>

			<button type="button" class="btn-close remove-reward-item-btn" aria-label="Close"></button>
		</div>
	`);

	rewardItemDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		rewardItemDiv.find(".reward-item-name").val(itemName);
	})

	rewardItemDiv.find(".remove-reward-item-btn").click(function() {
		rewardItemDiv.remove();
	})

	rewardsContainer.append(rewardItemDiv);
}
$("#crafting-recipe-add-reward-item-btn").click(function() {
	addRewardItemInCraftingRecipe();
})

// Laboratories
let laboratoriesDatatable = $("#laboratories-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let laboratoryId = parseInt(data[0]);

			editLaboratory(laboratoryId);
		})
	},
} );

let laboratories = {};
function loadLaboratories() {
	$.post(`https://${resName}/getAllLaboratories`, {}, function(rawLaboratories) {
		// Manually create the table to avoid incompatibilities due table indexing
		laboratories = {};

		for(const[k, laboratoryData] of Object.entries(rawLaboratories)) {
			laboratories[laboratoryData.id] = laboratoryData;
		}

		laboratoriesDatatable.clear();

		for(const[laboratoryId, laboratoryData] of Object.entries(laboratories)) {
			laboratoriesDatatable.row.add([
				laboratoryId,
				laboratoryData.name,
				laboratoryData.coords.x,
				laboratoryData.coords.y,
				laboratoryData.coords.z,
			])
		}

		laboratoriesDatatable.draw()
	})
}

// Create new laboratory
$("#new-laboratory-btn").click(function() {
	let laboratoryModal = $("#laboratory-modal");

	laboratoryModal.modal("show");
	laboratoryModal.data("action", "create");

	$("#laboratory-name").val("");
	$("#laboratory-coords-x").val("");
	$("#laboratory-coords-y").val("");
	$("#laboratory-coords-z").val("");

	$("#laboratory-scale-x").val("1.5");
	$("#laboratory-scale-y").val("1.5");
	$("#laboratory-scale-z").val("0.5");

	$("#laboratory-icon-type").val("1");

	$("#laboratory-opacity").val("100");

	$("#laboratory-map-blip").prop("checked", false).change();

	// Resets stuff related to allowed jobs
	$("#laboratory-allowed-jobs").text(getLocalizedText("menu:no_job_allowed"));
	$("#laboratory-allowed-jobs").data("jobs", {});

	// Resets stuff related to allowed recipes
	$("#laboratory-allowed-crafting-recipes").text(getLocalizedText("menu:no_crafting_recipe_allowed"));
	$("#laboratory-allowed-crafting-recipes").data("craftingRecipes", {});

	// Adapts the modal from edit mode to create mode
	$("#delete-laboratory-btn").hide();
	$("#laboratory-modal-confirm-btn").text(  getLocalizedText("menu:create") );
})

function setLaboratoryAllowedJobsText(jobs) {
	if(jobs === false) {
		$("#laboratory-allowed-jobs").text(getLocalizedText("menu:all_jobs_allowed"));
	} else if(Object.keys(jobs).length == 0) {
		$("#laboratory-allowed-jobs").text(getLocalizedText("menu:no_job_allowed"));
	} else {
		$("#laboratory-allowed-jobs").text(  Object.keys(jobs).join(", ") );
	}
}

$("#laboratory-choose-jobs").click(async function() {
	const oldJobs = $("#laboratory-allowed-jobs").data("jobs");
	const jobs = await jobsDialog(oldJobs);
		
	setLaboratoryAllowedJobsText(jobs);

	$("#laboratory-allowed-jobs").data("jobs", jobs)
})

// Dialog that shows all crafting recipes and returns the selected ones
function craftingRecipesDialog(cb) {
	let inputCraftingRecipesModal = $("#input-crafting-recipes-dialog-modal")
	inputCraftingRecipesModal.modal("show");

	$("#input-crafting-recipes-search").val("");

	$.post(`https://${resName}/getAllCraftingRecipes`, JSON.stringify({}), function (craftingRecipes) {
		let craftingRecipesListDiv = $("#crafting-recipes-list");

		craftingRecipesListDiv.empty();
		
		for(const[k, craftingRecipeData] of Object.entries(craftingRecipes)) {
			let craftingRecipeDiv = $(`
			<div class="form-check fs-3">
				<input class="form-check-input" type="checkbox" value="${craftingRecipeData.id}">
				<label class="form-check-label">
					${craftingRecipeData.name}
				</label>
			</div>
		`);

		craftingRecipesListDiv.append(craftingRecipeDiv);
		}

		// Unbinds the button and rebinds it to callback the selected crafting recipes
		$("#input-crafting-recipes-confirm-btn").unbind().click(function() {
			let selectedCraftingRecipes = {};

			craftingRecipesListDiv.find("input:checked").each(function() {
				let recipeId = $(this).val();

				selectedCraftingRecipes[recipeId] = true;
			});

			inputCraftingRecipesModal.modal("hide");

			cb(selectedCraftingRecipes);
		})
	});
}
$("#input-crafting-recipe-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#crafting-recipes-list .form-check").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

// Choose crafting recipes for laboratory
$("#laboratory-choose-recipes").click(function() {
	craftingRecipesDialog((selectedRecipes) => {
		if(Object.keys(selectedRecipes).length == 0) {
			$("#laboratory-allowed-crafting-recipes").text(getLocalizedText("menu:no_crafting_recipe_allowed"));
		} else {
			$("#laboratory-allowed-crafting-recipes").text(Object.keys(selectedRecipes).map(recipeId => craftingRecipes[recipeId].name).join(", "));
		}

		$("#laboratory-allowed-crafting-recipes").data("recipes", selectedRecipes);
	})
})

// Sets current coords for laboratory
$("#laboratory-current-coords-btn").click(function() {
	getCurrentCoords().then(coords => {
		$("#laboratory-coords-x").val(coords.x);
		$("#laboratory-coords-y").val(coords.y);
		$("#laboratory-coords-z").val(coords.z);
	})
})

// To edit an existing laboratory
function editLaboratory(laboratoryId) {
	let laboratoryModal = $("#laboratory-modal");

	laboratoryModal.data("laboratoryId", laboratoryId);
	laboratoryModal.data("action", "edit");

	let laboratoryData = laboratories[laboratoryId];

	$("#laboratory-name").val(laboratoryData.name);

	$("#laboratory-coords-x").val(laboratoryData.coords.x);
	$("#laboratory-coords-y").val(laboratoryData.coords.y);
	$("#laboratory-coords-z").val(laboratoryData.coords.z);

	$("#laboratory-scale-x").val(laboratoryData.scale.x);
	$("#laboratory-scale-y").val(laboratoryData.scale.y);
	$("#laboratory-scale-z").val(laboratoryData.scale.z);
	
	$("#laboratory-bounce").prop("checked", laboratoryData.bounce);
	$("#laboratory-follow-camera").prop("checked", laboratoryData.followCamera);
	$("#laboratory-rotate").prop("checked", laboratoryData.rotate);
	
	$("#laboratory-icon-type").val(laboratoryData.iconType);
	
	$("#laboratory-color").val( rgbToHex(laboratoryData.color.r, laboratoryData.color.g, laboratoryData.color.b) );
	$("#laboratory-opacity").val(laboratoryData.opacity);

	let mapBlipCheckbox = $("#laboratory-map-blip");
	if(laboratoryData.blipSprite) {
		$("#laboratory-blip-name").val(laboratoryData.blipName);
		$("#laboratory-sprite-id").val(laboratoryData.blipSprite);
		$("#laboratory-blip-color").val(laboratoryData.blipColor);
		$("#laboratory-blip-scale").val(laboratoryData.blipScale);

		mapBlipCheckbox.prop("checked", true);
	} else {
		mapBlipCheckbox.prop("checked", false);
	}
	mapBlipCheckbox.change();


	setLaboratoryAllowedJobsText(laboratoryData.allowedJobs);
	$("#laboratory-allowed-jobs").data("jobs", laboratoryData.allowedJobs);

	let sanitizedAllowedRecipes = {};

	Object.keys(laboratoryData.allowedRecipes).forEach(recipeId => {
		if(recipeId == 0) {
			recipeId = 1;
		}

		sanitizedAllowedRecipes[recipeId] = true;
	});

	$("#laboratory-allowed-crafting-recipes").text( Object.keys(sanitizedAllowedRecipes).map(recipeId => craftingRecipes[recipeId] ? craftingRecipes[recipeId].name : null).join(", ") );
	$("#laboratory-allowed-crafting-recipes").data("recipes", sanitizedAllowedRecipes);

	// Adatps the modal from create mode to edit mode
	$("#delete-laboratory-btn").show();
	$("#laboratory-modal-confirm-btn").text(  getLocalizedText("menu:save") );

	laboratoryModal.modal("show");
}

// To delete an existing laboratory
$("#delete-laboratory-btn").click(async function() {
	if(!await confirmDeletion()) return;

	let laboratoryId = $("#laboratory-modal").data("laboratoryId");
	if(laboratoryId == null) return;

	const response = await $.post(`https://${resName}/deleteLaboratory`, JSON.stringify({
		laboratoryId: laboratoryId
	}));

	showServerResponse(response);

	$("#laboratory-modal").modal("hide");
	loadLaboratories();
})

$("#laboratory-map-blip").change(function() {
	let enabled = $(this).prop("checked");
	$("#laboratory-map-blip-inputs").find("input").prop("disabled", !enabled);
})

// Gets the laboratory data from its modal
function getLaboratoryData() {
	let laboratoryData = {
		name: $("#laboratory-name").val(),

		coords: {
			x: parseFloat( $("#laboratory-coords-x").val() ),
			y: parseFloat( $("#laboratory-coords-y").val() ),
			z: parseFloat( $("#laboratory-coords-z").val() )
		},

		iconType: parseInt( $("#laboratory-icon-type").val() ),

		scale: {
			x: parseFloat( $("#laboratory-scale-x").val() ),
			y: parseFloat( $("#laboratory-scale-y").val() ),
			z: parseFloat( $("#laboratory-scale-z").val() ),
		},

		bounce: $("#laboratory-bounce").prop("checked"),
		followCamera: $("#laboratory-follow-camera").prop("checked"),
		rotate: $("#laboratory-rotate").prop("checked"),

		color: hexToRgb(  $("#laboratory-color").val() ),
		opacity: parseInt( $("#laboratory-opacity").val() ),

		allowedJobs: $("#laboratory-allowed-jobs").data("jobs"),
		allowedRecipes: $("#laboratory-allowed-crafting-recipes").data("recipes") || {}
	}

	let isBlipEnabled = $("#laboratory-map-blip").prop("checked");
	if( isBlipEnabled ) {
		laboratoryData.blipName = $("#laboratory-blip-name").val();
		laboratoryData.blipSprite = parseInt( $("#laboratory-sprite-id").val() );
		laboratoryData.blipColor = parseInt( $("#laboratory-blip-color").val() );
		laboratoryData.blipScale = parseFloat( $("#laboratory-blip-scale").val() );
	}

	return laboratoryData;
}

// Saves laboratory data
$("#laboratory-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;
	
	let laboratoryModal = $("#laboratory-modal");
	let laboratoryData = getLaboratoryData();
	let action = laboratoryModal.data("action");

	let response = null;

	switch(action) {
		case "create": {
			response = await $.post(`https://${resName}/createNewLaboratory`, JSON.stringify(laboratoryData))
			break;
		}

		case "edit": {
			let laboratoryId = laboratoryModal.data("laboratoryId");

			response = await $.post(`https://${resName}/updateLaboratory`, JSON.stringify({laboratoryId: laboratoryId, laboratoryData: laboratoryData}))
			break;
		}
	}
	showServerResponse(response);
	
	laboratoryModal.modal("hide");
	loadLaboratories();
})

function addRequiredItemInPocketCrafting(pocketCraftingDiv, itemName = "", itemQuantity = 1, loseOnUse = true) {
	let requiredItemsContainer = pocketCraftingDiv.find(".pocket-crafting-required-items");

	let requiredItemDiv = $(`
		<div class="d-flex justify-content-center align-items-center gap-3 mb-2 required-item">
			<div class="form-floating col-3">
				<input type="text" class="form-control required-item-name" value="${itemName}" required>
				<label>${getLocalizedText("menu:item_name")}</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn me-3" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose_item") }"><i class="bi bi-list-ul"></i></button>

			<div class="form-check my-auto me-3">
				<input class="form-check-input" type="checkbox" ${loseOnUse ? "checked" : null}>
				<label class="form-check-label">${ getLocalizedText("menu:lose_on_use") }</label>
			</div>

			<div class="form-floating col-3">
				<input type="number" class="form-control required-item-quantity" value="${itemQuantity}" required>
				<label>${getLocalizedText("menu:quantity")}</label>
			</div>

			<button type="button" class="btn-close remove-required-item-btn"></button>
		</div>
	`);

	requiredItemDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		requiredItemDiv.find(".required-item-name").val(itemName);
	}).tooltip();

	requiredItemDiv.find(".remove-required-item-btn").click(function() {
		requiredItemDiv.remove();
	});

	requiredItemsContainer.append(requiredItemDiv);
}	

async function addPocketCrafting(itemName, pocketCraftingData, isNew = false) {
	const itemLabel = await getItemLabel(itemName) || "Unknown item - " + itemName;
	
	const div = $(`
		<div class="pocket-crafting mb-4" data-item-to-use="${itemName}">
			<h2 class="text-center title">${getLocalizedText("menu:you_have_to_use")} <span class="text-success">'${itemLabel}'</span> ${getLocalizedText("menu:to_start_the_crafting")} <span class="fs-5 fw-lighter fst-italic">(${itemName})</span></h2>

			<div class="d-flex justify-content-center align-items-center gap-3 mb-5">
				<h3 class="my-auto">${getLocalizedText("menu:to_receive")}</h3>
				
				<div class="form-floating col-3">
					<input type="text" class="form-control result-item-name" required>
					<label>${getLocalizedText("menu:pocket_craftings:result_item")}</label>
				</div>

				<button type="button" class="btn btn-secondary col-auto choose-item-btn me-5" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose_item") }"><i class="bi bi-list-ul"></i></button>	

				<div class="form-floating col-3">
					<input type="number" min="1" class="form-control time-to-craft" required>
					<label>${getLocalizedText("menu:crafting_recipe:time_to_craft")}</label>
				</div>

				<div class="form-floating col-3">
					<input type="number" min="1" class="form-control item-quantity" required>
					<label>${getLocalizedText("menu:quantity")}</label>
				</div>
			</div>

			<h3 class="text-center">${getLocalizedText("menu:pocket_craftings:required_items")}</h3>

			<div class="pocket-crafting-required-items">
			
			</div>

			<div class="d-inline-block col-12 my-2">
				<button type="button" class="btn float-start btn-danger delete-pocket-crafting">${getLocalizedText("menu:pocket_craftings:delete_pocket_crafting")}</button>
				<button type="button" class="btn float-end btn-secondary add-required-item-btn">${getLocalizedText("menu:pocket_craftings:add_required_item")}</button>
			</div>
		</div>

		<hr>
	`);

	div.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		div.find(".result-item-name").val(itemName);
	}).tooltip();

	div.find(".add-required-item-btn").click(function() {
		addRequiredItemInPocketCrafting(div);
	});

	div.find(".delete-pocket-crafting").click(function() {
		div.remove();
	});

	if(pocketCraftingData) {
		div.find(".result-item-name").val(pocketCraftingData.resultItem.name);
		div.find(".item-quantity").val(pocketCraftingData.resultItem.quantity);
		div.find(".time-to-craft").val(pocketCraftingData.timeToCraft);

		for(const requiredItem of pocketCraftingData.requiredItems) {
			addRequiredItemInPocketCrafting(div, requiredItem.name, requiredItem.quantity, requiredItem.loseOnUse);
		}
	}

	if(isNew) {
		div.find(".title").append(`<span class="fs-5 fw-lighter fst-italic text-danger"> - ${ getLocalizedText("menu:effects:may_need_restart") }</span>`)
	}

	$("#pocket-craftings-list").append(div);
}

// Pocket sellings
$("#create-new-pocket-crafting-btn").click(async function() {
	const itemName = await itemsDialog(getLocalizedText("menu:choose_the_item_that_will_start_pocket_crafting_on_use"));
	if(!itemName) return;

	addPocketCrafting(itemName, null, true);
});

function getAllPocketCraftings() {
	const pocketCraftings = {};

	$("#pocket-craftings-list").find(".pocket-crafting").each(function() {
		const itemName = $(this).data("itemToUse");

		const pocketCrafting = {
			resultItem: {
				name: $(this).find(".result-item-name").val(),
				quantity: parseInt($(this).find(".item-quantity").val())
			},
			timeToCraft: parseInt($(this).find(".time-to-craft").val()),
			requiredItems: []
		};

		$(this).find(".required-item").each(function() {
			const requiredItem = {
				name: $(this).find(".required-item-name").val(),
				quantity: parseInt($(this).find(".required-item-quantity").val()),
				loseOnUse: $(this).find(".form-check-input").prop("checked")
			};

			pocketCrafting.requiredItems.push(requiredItem);
		});

		pocketCraftings[itemName] = pocketCrafting;
	});

	return pocketCraftings;
}

$("#pocket-craftings").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let serverSettings = {
		pocketCraftings: getAllPocketCraftings(),
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: {},
		serverSettings: serverSettings,
		sharedSettings: {}
	}));
	showServerResponse(response);
});

// Plane selling
$("#plane-selling-current-coords-btn").click(function() {
	getCurrentCoords().then(function(coords) {
		$("#plane-selling-coords-x").val(coords.x);
		$("#plane-selling-coords-y").val(coords.y);
		$("#plane-selling-coords-z").val(coords.z);
	});
})

function togglePlaneWholeOcean() {
	let enabled = $("#plane-use-the-whole-ocean").prop("checked");

	$("#plane-selling-coords").find("input").prop("disabled", enabled);
}
$("#plane-use-the-whole-ocean").change(togglePlaneWholeOcean);

$("#plane-add-new-drug").click(function() {
	addAcceptableDrugToDiv("#plane-selling-acceptable-drugs");
})

// Enables/Disables all inputs for plane selling
function togglePlaneSelling() {
	let enable = $("#enable-plane-selling").prop("checked");

	$("#selling-plane").find("input, button").not("#enable-plane-selling").prop("disabled", !enable);
}
$("#enable-plane-selling").change(togglePlaneSelling);

// Boat selling
$("#boat-selling-current-coords-btn").click(function() {
	getCurrentCoords().then(function(coords) {
		$("#boat-selling-coords-x").val(coords.x);
		$("#boat-selling-coords-y").val(coords.y);
		$("#boat-selling-coords-z").val(coords.z);
	});
});

function toggleBoatWholeOcean() {
	let enabled = $("#boat-use-the-whole-ocean").prop("checked");

	$("#boat-selling-coords").find("input").prop("disabled", enabled);
}
$("#boat-use-the-whole-ocean").change(toggleBoatWholeOcean);

$("#boat-add-new-drug").click(function() {
	addAcceptableDrugToDiv("#boat-selling-acceptable-drugs");
})

function toggleBoatSelling() {
	let enable = $("#enable-boat-selling").prop("checked");

	$("#selling-boat").find("input, button").not("#enable-boat-selling").prop("disabled", !enable);
}
$("#enable-boat-selling").change(toggleBoatSelling);

// NPC Selling
function toggleNpcSelling() {
	let enable = $("#enable-npc-selling").prop("checked");

	$("#selling-npc").find("input, button").not("#enable-npc-selling").prop("disabled", !enable);
}
$("#enable-npc-selling").change(toggleNpcSelling);

function addAcceptableDrugToDiv(drugsListDiv, drugName = "", minPrice = 500, maxPrice = 1000) {
	let drugDiv = $(`
		<div class="d-flex gap-3 align-items-center justify-content-center mt-2 mb-3 drug">
			<div class="form-floating col-4">
				<input type="text" class="form-control drug-name" placeholder="Name" required value=${drugName}>
				<label>Drug name</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn me-5" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose_item") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" class="form-control drug-min-price" placeholder="Max quantity" required value=${minPrice}>
				<label>${ getLocalizedText("menu:min_price") }</label>
			</div>

			<div class="form-floating">
				<input type="number" class="form-control drug-max-price" placeholder="Max quantity" required value=${maxPrice}>
				<label>${ getLocalizedText("menu:max_price") }</label>
			</div>

			<button type="button" class="btn-close btn-close-white remove-btn ms-3"></button>
		</div>
	`)

	drugDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		drugDiv.find(".drug-name").val(itemName);
	}).tooltip();

	drugDiv.find(".remove-btn").click(function() {
		drugDiv.remove();
	});

	$(drugsListDiv).append(drugDiv);
}

function fillAcceptableDrugsForDiv(drugsListDiv, drugs) {
	$(drugsListDiv).empty();

	if(drugs) {
		for(drug of drugs) {
			addAcceptableDrugToDiv(drugsListDiv, drug.name, drug.minPrice, drug.maxPrice);
		}
	}
}

function getAcceptableDrugFromDiv(drugsListDiv) {
	let drugs = [];

	$(drugsListDiv).find(".drug").each(function() {
		let drug = {
			name: $(this).find(".drug-name").val(),
			minPrice: parseInt( $(this).find(".drug-min-price").val() ),
			maxPrice: parseInt( $(this).find(".drug-max-price").val() ),
		}

		drugs.push(drug);
	})

	return drugs;
}

$("#npc-add-new-drug").click(function() {
	addAcceptableDrugToDiv("#npc-selling-acceptable-drugs");
})

$("#npc-selling-command-is-enabled").change(function() {
	const enabled = $(this).prop("checked");

	$("#npc-selling-command").prop("disabled", !enabled);
	$("#npc-selling-command-has-to-spawn-npc").prop("disabled", !enabled);
});

// Save selling
$("#selling").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		// Boat and plane selling
		heightToSell: parseInt( $("#minimum-plane-height").val() ),

		sellUseWholeOcean:  {
			plane: $("#plane-use-the-whole-ocean").prop("checked"),
			boat: $("#boat-use-the-whole-ocean").prop("checked")
		},

		sellArea: {
			plane: {
				coords: {
					x: parseFloat( $("#plane-selling-coords-x").val() ),
					y: parseFloat( $("#plane-selling-coords-y").val() ),
					z: parseFloat( $("#plane-selling-coords-z").val() )
				},
	
				radius: parseFloat( $("#plane-selling-coords-radius").val() )
			},

			boat: {
				coords: {
					x: parseFloat( $("#boat-selling-coords-x").val() ),
					y: parseFloat( $("#boat-selling-coords-y").val() ),
					z: parseFloat( $("#boat-selling-coords-z").val() )
				},

				radius: parseFloat( $("#boat-selling-coords-radius").val() )
			}
		},

		sellShowRadius: {
			plane: $("#plane-show-radius-while-selling").prop("checked"),
			boat: $("#boat-show-radius-while-selling").prop("checked")
		},

		// Narcos selling
		narcosModel: $("#narcos-model").val(),

		showNarcosBlip: $("#enable-narcos-blip").prop("checked"),
		narcosBlip: {
			name: $("#narcos-selling-blip-name").val(),
			color: parseInt( $("#narcos-selling-blip-color").val() ),
			scale: parseFloat( $("#narcos-selling-blip-scale").val() ),
			sprite: parseInt( $("#narcos-selling-blip-sprite").val() )
		},

		// Pushers selling
		pusherModel: $("#pushers-model").val(),
		showPushersBlips: $("#enable-pushers-blip").prop("checked"),
		pusherBlip: {
			name: $("#pushers-selling-blip-name").val(),
			color: parseInt( $("#pushers-selling-blip-color").val() ),
			scale: parseFloat( $("#pushers-selling-blip-scale").val() ),
			sprite: parseInt( $("#pushers-selling-blip-sprite").val() )
		}
	}

	let serverSettings = {
		// Plane selling
		planeAcceptableDrugs: getAcceptableDrugFromDiv("#plane-selling-acceptable-drugs"),
		planeSellingAccount: $("#plane-selling-account").val(),
		planeSellingMinimumPolice: parseInt( $("#plane-minimum-police").val() ),

		// Boat selling
		boatAcceptableDrugs: getAcceptableDrugFromDiv("#boat-selling-acceptable-drugs"),
		boatSellingAccount: $("#boat-selling-account").val(),
		boatSellingMinimumPolice: parseInt( $("#boat-minimum-police").val() ),

		// NPC selling
		minNPCSellQuantity: parseInt( $("#npc-selling-min-quantity").val() ),
		maxNPCSellQuantity: parseInt( $("#npc-selling-max-quantity").val() ),

		accountFromNPCSell: $("#npc-money-account").val(),

		sellToNPCChancesToAccept: parseInt( $("#npc-accept-chances").val() ),

		maxNPCsSellableDrugQuantity: parseInt( $("#npc-max-drug-quantity").val() ),

		npcAcceptableDrugs: getAcceptableDrugFromDiv("#npc-selling-acceptable-drugs"),

		npcSellingMinimumPolice: parseInt( $("#npc-minimum-police").val() ),

		npcAlertPoliceChances: parseInt( $("#npc-alert-police-chances").val() ),

		// Narcos selling
		narcosBuyerLocations: getNarcosBuyerLocations(),
		narcosLocationChangeTime: parseInt( $("#narcos-location-change").val() ),
		narcosRewardAccount: $("#narcos-reward-account").val(),
		narcosCallPoliceChances: parseInt( $("#narcos-police-alert-chances").val() ),
		narcosAcceptsOnlyOneBuyerPerLocation: $("#narcos-accepts-only-one-buyer-per-location").prop("checked"),
		
		narcosNeededDrugs: getNarcosDrugs(),

		narcosSellingMinimumPolice: parseInt( $("#narcos-minimum-police").val() ),

		// Pushers selling
		pushersCallPoliceChances: parseInt( $("#pushers-alert-police-chances").val() ),
		pushers: getPushers(),
		pushersSellingAccount: $("#pushers-selling-account").val(),
		pushersSellingMinimumPolice: parseInt( $("#pushers-minimum-police").val() ),
	}

	let sharedSettings = {
		enableAirplaneSell: $("#enable-plane-selling").prop("checked"),
		enableBoatSell: $("#enable-boat-selling").prop("checked"),

		timeToSellInPlane: parseInt( $("#time-to-sell-in-plane").val() ),
		timeToSellInBoat: parseInt( $("#time-to-sell-in-boat").val() ),

		alarmPoliceInPlane: $("#enable-plane-police-alert").prop("checked"),
		alarmPoliceInBoat: $("#enable-boat-police-alert").prop("checked"),

		// NPC selling
		npcSecondsToSell: parseInt( $("#npc-seconds-to-sell").val() ),

		// Pushers selling
		arePushersEnabled: $("#enable-pushers-selling").prop("checked"),

		// Narcos selling
		enableNarcosSelling: $("#enable-narcos-selling").prop("checked"),

		enableNPCSell: $("#enable-npc-selling").prop("checked"),
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: clientSettings,
		serverSettings: serverSettings,
		sharedSettings: sharedSettings
	}));
	showServerResponse(response);
})

// Narcos selling
function toggleNarcosSelling() {
	let narcosSelling = $("#enable-narcos-selling").prop("checked");
	
	$("#selling-narcos").find("input, button").not("#enable-narcos-selling").prop("disabled", !narcosSelling);
}
$("#enable-narcos-selling").change(toggleNarcosSelling);

function toggleNarcosBlip() {
	let narcosBlip = $("#enable-narcos-blip").prop("checked");

	$("#narcos-selling-blip-name").prop("disabled", !narcosBlip);
	$("#narcos-selling-blip-color").prop("disabled", !narcosBlip);
	$("#narcos-selling-blip-scale").prop("disabled", !narcosBlip);
	$("#narcos-selling-blip-sprite").prop("disabled", !narcosBlip);
}
$("#enable-narcos-blip").change(toggleNarcosBlip);

function addNarcosSpawnLocation(coords = {}, heading = 0.0) {
	let newSpawnDiv = $(`
		<div class="mb-5 spawn-location">
			<div class="row g-2 row-cols-auto align-items-center text-body my-2">
				<div class="form-floating col-3">
					<input type="number" step="0.01" class="form-control max-two-decimals coord-x" placeholder="X" required value=${coords.x || ""}>
					<label>${ getLocalizedText("menu:x") }</label>
				</div>

				<div class="form-floating col-3">
					<input type="number" step="0.01" class="form-control max-two-decimals coord-y" placeholder="Y" required value=${coords.y || ""}>
					<label>${ getLocalizedText("menu:y") }</label>
				</div>

				<div class="form-floating col-3">
					<input type="number" step="0.01" class="form-control max-two-decimals coord-z" placeholder="Z" required value=${coords.z || ""}>
					<label>${ getLocalizedText("menu:z") }</label>
				</div>

				<div class="form-floating col-2">
					<input type="number" step="0.01" class="form-control max-two-decimals heading" placeholder="Heading" required value=${heading}>
					<label>${ getLocalizedText("menu:heading") }</label>
				</div>

				<button type="button" class="btn-close btn-close-white ms-3 remove-btn"></button>
			</div>

			<button type="button" class="btn btn-secondary current-coords-btn">${ getLocalizedText("menu:current_coords_heading") }</button>
		</div>
	`)

	newSpawnDiv.find(".max-two-decimals").on("change", maxTwoDecimals);

	newSpawnDiv.find(".current-coords-btn").click(function() {
		getCurrentCoordsAndHeading().then(data => {
			newSpawnDiv.find(".coord-x").val(data.coords.x);
			newSpawnDiv.find(".coord-y").val(data.coords.y);
			newSpawnDiv.find(".coord-z").val(data.coords.z);
			newSpawnDiv.find(".heading").val(data.heading);
		})
	});

	newSpawnDiv.find(".remove-btn").click(function() {
		newSpawnDiv.remove();
	});

	$("#narcos-spawn-locations").append(newSpawnDiv);
}
$("#narcos-add-spawn-btn").click(function() {
	addNarcosSpawnLocation();
})

function getNarcosBuyerLocations() {
	let buyerLocations = [];

	$("#narcos-spawn-locations").find(".spawn-location").each(function() {
		let spawnDiv = $(this);

		let coords = {
			x: parseFloat( spawnDiv.find(".coord-x").val() ),
			y: parseFloat( spawnDiv.find(".coord-y").val() ),
			z: parseFloat( spawnDiv.find(".coord-z").val() )
		};

		let heading = parseFloat( spawnDiv.find(".heading").val() );

		buyerLocations.push({
			coords: coords,
			heading: heading
		});
	})

	return buyerLocations;
}

function addNarcosDrug(drugName = "", minQuantity = 1, maxQuantity = 2, minPrice = 500, maxPrice = 1000) {
	let drugDiv = $(`
		<div class="d-flex gap-3 justify-content-center align-items-center mt-2 mb-3 drug">
			<div class="form-floating">
				<input type="text" class="form-control drug-name" placeholder="Name" required value=${drugName}>
				<label>Drug name</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose_item") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating col-2">
				<input type="number" class="form-control drug-min-quantity" placeholder="Min quantity" required value=${minQuantity}>
				<label>Min quantity</label>
			</div>

			<div class="form-floating col-2">
				<input type="number" class="form-control drug-max-quantity" placeholder="Max quantity" required value=${maxQuantity}>
				<label>Max quantity</label>
			</div>

			<div class="form-floating col-2">
				<input type="number" class="form-control drug-min-price" placeholder="Max quantity" required value=${minPrice}>
				<label>${ getLocalizedText("menu:min_price") }</label>
			</div>

			<div class="form-floating col-2">
				<input type="number" class="form-control drug-max-price" placeholder="Max quantity" required value=${maxPrice}>
				<label>${ getLocalizedText("menu:max_price") }</label>
			</div>

			<button type="button" class="btn-close btn-close-white remove-btn ms-2"></button>
		</div>
	`)

	drugDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		drugDiv.find(".drug-name").val(itemName);
	}).tooltip();

	drugDiv.find(".remove-btn").click(function() {
		drugDiv.remove();
	});

	$("#narcos-selling-acceptable-drugs").append(drugDiv);
}

$("#narcos-add-new-drug").click(function() {
	addNarcosDrug();
})

function getNarcosDrugs() {
	let drugs = [];

	$("#narcos-selling-acceptable-drugs").find(".drug").each(function() {
		let drug = {
			name: $(this).find(".drug-name").val(),
			minPrice: parseInt( $(this).find(".drug-min-price").val() ),
			maxPrice: parseInt( $(this).find(".drug-max-price").val() ),
			minQuantity: parseInt( $(this).find(".drug-min-quantity").val() ),
			maxQuantity: parseInt( $(this).find(".drug-max-quantity").val() )
		}

		drugs.push(drug);
	})

	return drugs;
}

// Pushers
function togglePushersSelling() {
	let enabled = $("#enable-pushers-selling").prop("checked");

	$("#selling-pushers").find("input, button").not("#enable-pushers-selling").prop("disabled", !enabled);
}
$("#enable-pushers-selling").change(togglePushersSelling);

function addPusherDrug(pusherDiv, drugData = {}) {
	let drugDiv = $(`
		<div class="d-flex justify-content-center align-items-center gap-3 mb-6 pusher-drug">
			<div class="form-floating col-3">
				<input type="text" class="form-control drug-name" placeholder="Name" required value=${drugData.name || ""}>
				<label>${ getLocalizedText("menu:item_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose_item") }"><i class="bi bi-list-ul"></i></button>

			<div class="form-floating col-auto">
				<input type="number" class="form-control drug-min-price" placeholder="Min price" required value=${drugData.minPrice || 0}>
				<label>${ getLocalizedText("menu:min_price") }</label>
			</div>

			<div class="form-floating col-auto">
				<input type="number" class="form-control drug-max-price" placeholder="Max price" required value=${drugData.maxPrice || 1000}>
				<label>${ getLocalizedText("menu:max_price") }</label>
			</div>

			<div class="form-floating col-auto">
				<input type="number" class="form-control drug-max-quantity" placeholder="Max quantity" required value=${drugData.maxQuantity || 100} data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:pushers:max_quantity_description") }">
				<label>${ getLocalizedText("menu:maximum_quantity") }</label>
			</div>

			<button type="button" class="btn-close btn-close-white remove-result-item-btn ms-4"></button>
		</div>
	`);

	drugDiv.find(".btn-close").click(function() {
		drugDiv.remove();
	});

	// Initialize tooltip so player knows what the field is for
	drugDiv.find(".drug-max-quantity").tooltip();
	drugDiv.find(".choose-item-btn").tooltip();

	drugDiv.find(".choose-item-btn").click(async function() {
		const itemName = await itemsDialog();
		drugDiv.find(".drug-name").val(itemName);
	})

	pusherDiv.find(".pusher-drugs-list").append(drugDiv);
}

function addPusher(pusherData = {}) {
	let pusherDiv = $(`
		<div class="pusher mb-4">
			<div class="mb-6 pusher-spawn-location">
				<p class="text-center fs-5">${ getLocalizedText("menu:pushers:location") }</p>

				<div class="row g-2 row-cols-4 text-body my-2">
					<div class="form-floating">
						<input type="number" step="0.01" class="form-control max-two-decimals coord-x" placeholder="X" required>
						<label>${ getLocalizedText("menu:x") }</label>
					</div>

					<div class="form-floating">
						<input type="number" step="0.01" class="form-control max-two-decimals coord-y" placeholder="Y" required>
						<label>${ getLocalizedText("menu:y") }</label>
					</div>

					<div class="form-floating">
						<input type="number" step="0.01" class="form-control max-two-decimals coord-z" placeholder="Z" required>
						<label>${ getLocalizedText("menu:z") }</label>
					</div>

					<div class="form-floating">
						<input type="number" step="0.01" class="form-control max-two-decimals heading" placeholder="Heading" required>
						<label>${ getLocalizedText("menu:heading") }</label>
					</div>
				</div>

				<button type="button" class="btn btn-secondary mx-1 current-coords-btn">${ getLocalizedText("menu:current_coords_heading") }</button>
			</div>
			
			<p class="text-center fs-3 mb-1">${ getLocalizedText("menu:pushers:work_time") }</p>
			<p class="text-center fs-5">${ getLocalizedText("menu:pushers:work_time:subtitle") } - <span class="text-warning server-clock"></span></p>

			<div class="d-flex justify-content-center gap-3 mb-6">
				<div class="form-check form-check-inline my-auto">
					<input class="form-check-input is-always-active" type="checkbox" checked>
					<label class="form-check-label">${getLocalizedText("menu:is_always_active")}</label>
				</div>
			
				<div class="form-floating col">
					<input type="number" min="0" max="23" value="0" class="form-control start-hour" placeholder="Start hour" disabled required>
					<label>${ getLocalizedText("menu:start_hour") }</label>
					<p class="invalid-feedback">${getLocalizedText("menu:invalid_hours")}</p>
				</div>

				<div class="form-floating col">
					<input type="number" min="0" max="23" value="23" class="form-control finish-hour" placeholder="Finish hour" disabled required>
					<label>${ getLocalizedText("menu:finish_hour") }</label>
					<p class="invalid-feedback">${getLocalizedText("menu:invalid_hours")}</p>
				</div>
			</div>

			<div class="my-4">
				<p class="text-center fs-3">${ getLocalizedText("menu:pushers:acceptable_drugs") }</p>

				<div class="pusher-drugs-list">

				</div>

				<div class="d-flex justify-content-between align-items-center mt-3">
					<div class="form-check form-switch fs-4 my-auto">
						<input class="form-check-input pusher-one-drug-only" type="checkbox" role="switch">
						<label class="form-check-label">${ getLocalizedText("menu:pushers:accepts_only_one_random_drug") }</label>
					</div>

					<button type="button" class="btn btn-secondary add-drug">${ getLocalizedText("menu:pushers:add_drug") }</button>
				</div>
			</div>

			<button type="button" class="btn btn-danger mx-1 remove-btn">${ getLocalizedText("menu:remove") }</button>
		</div>

		<hr>
	`);

	pusherDiv.find(".is-always-active").change(function() {
		let isAlwaysActive = $(this).prop("checked");
		pusherDiv.find(".start-hour").prop("disabled", isAlwaysActive);
		pusherDiv.find(".finish-hour").prop("disabled", isAlwaysActive);

		if(isAlwaysActive) {
			pusherDiv.find(".start-hour").val(0);
			pusherDiv.find(".finish-hour").val(23);
		}
	});

	pusherDiv.find(".remove-btn").click(function() {
		pusherDiv.remove();
	});

	pusherDiv.find(".current-coords-btn").click(function() {
		getCurrentCoordsAndHeading().then(data => {
			pusherDiv.find(".coord-x").val(data.coords.x);
			pusherDiv.find(".coord-y").val(data.coords.y);
			pusherDiv.find(".coord-z").val(data.coords.z);
			pusherDiv.find(".heading").val(data.heading);
		})
	});

	pusherDiv.find(".add-drug").click(function() {
		addPusherDrug(pusherDiv);
	});

	if (pusherData.coords) {
		pusherDiv.find(".coord-x").val(pusherData.coords.x);
		pusherDiv.find(".coord-y").val(pusherData.coords.y);
		pusherDiv.find(".coord-z").val(pusherData.coords.z);
	}

	if(pusherData.heading) {
		pusherDiv.find(".heading").val(pusherData.heading);
	}

	if (pusherData.workTime) {
		pusherDiv.find(".start-hour").val(pusherData.workTime.startHour);
		pusherDiv.find(".finish-hour").val(pusherData.workTime.finishHour);

		const isAlwaysActive = pusherData.workTime.startHour == 0 && pusherData.workTime.finishHour == 23;
		pusherDiv.find(".is-always-active").prop("checked", isAlwaysActive).change();			
	}

	if(pusherData.drugsNeeded) {
		pusherData.drugsNeeded.forEach(drug => {
			addPusherDrug(pusherDiv, drug);
		});
	}

	$.post(`https://${resName}/getServerClock`, {}, function(time) {
		pusherDiv.find(".server-clock").text(time);
	});

	pusherDiv.find(".pusher-one-drug-only").prop("checked", pusherData.acceptsOnlyOneRandomDrug);

	$("#pushers-list").append(pusherDiv);

	return pusherDiv;
}

$("#add-pusher-btn").click(function() {
	let pusherDiv = addPusher();

	addPusherDrug(pusherDiv);
});

function getPusherDrugs(pusherDiv) {
	let drugs = [];

	pusherDiv.find(".pusher-drug").each(function() {
		let drug = {
			name: $(this).find(".drug-name").val(),
			minPrice: parseInt( $(this).find(".drug-min-price").val() ),
			maxPrice: parseInt( $(this).find(".drug-max-price").val() ),
			maxQuantity: parseInt( $(this).find(".drug-max-quantity").val() ),
		};

		drugs.push(drug);
	});

	return drugs;
}

function getPushers() {
	let pushers = {};
	let pushersCount = 1;

	$("#pushers-list").find(".pusher").each(function() {
		pushers[pushersCount] = {
			coords: {
				x: parseFloat( $(this).find(".coord-x").val() ),
				y: parseFloat( $(this).find(".coord-y").val() ),
				z: parseFloat( $(this).find(".coord-z").val() )
			},

			heading: parseFloat( $(this).find(".heading").val() ),

			workTime: {
				startHour: parseInt( $(this).find(".start-hour").val() ),
				finishHour: parseInt( $(this).find(".finish-hour").val() )
			},

			drugsNeeded: getPusherDrugs($(this)),

			acceptsOnlyOneRandomDrug: $(this).find(".pusher-one-drug-only").prop("checked"),
		};

		pushersCount++;
	})

	return pushers;
}

$("#enable-explosion-on-error").change(function() {
	let enabled = $(this).prop("checked");

	$("#seconds-before-explosion").prop("disabled", !enabled);
})

// Load settings
function loadSettings(fullConfig) {
	// Plane selling
	$("#enable-plane-selling").prop("checked", fullConfig.enableAirplaneSell);
	$("#enable-plane-selling").change();

	$("#minimum-plane-height").val(fullConfig.heightToSell);

	$("#time-to-sell-in-plane").val(fullConfig.timeToSellInPlane);

	$("#enable-plane-police-alert").prop("checked", fullConfig.alarmPoliceInPlane);

	$("#plane-use-the-whole-ocean").prop("checked", fullConfig.sellUseWholeOcean.plane);
	$("#plane-use-the-whole-ocean").change();

	$("#plane-selling-coords-x").val(fullConfig.sellArea.plane.coords.x);
	$("#plane-selling-coords-y").val(fullConfig.sellArea.plane.coords.y);
	$("#plane-selling-coords-z").val(fullConfig.sellArea.plane.coords.z);
	$("#plane-selling-coords-radius").val(fullConfig.sellArea.plane.radius);

	fillAcceptableDrugsForDiv("#plane-selling-acceptable-drugs", fullConfig.planeAcceptableDrugs);

	$("#plane-selling-account").val(fullConfig.planeSellingAccount);

	$("#plane-minimum-police").val(fullConfig.planeSellingMinimumPolice);

	// Boat selling
	$("#enable-boat-selling").prop("checked", fullConfig.enableBoatSell);
	$("#enable-boat-selling").change();

	$("#time-to-sell-in-boat").val(fullConfig.timeToSellInBoat);

	$("#enable-boat-police-alert").prop("checked", fullConfig.alarmPoliceInBoat);

	$("#boat-use-the-whole-ocean").prop("checked", fullConfig.sellUseWholeOcean.boat);
	$("#boat-use-the-whole-ocean").change();
	$("#boat-selling-coords-x").val(fullConfig.sellArea.boat.coords.x);
	$("#boat-selling-coords-y").val(fullConfig.sellArea.boat.coords.y);
	$("#boat-selling-coords-z").val(fullConfig.sellArea.boat.coords.z);
	$("#boat-selling-coords-radius").val(fullConfig.sellArea.boat.radius);

	fillAcceptableDrugsForDiv("#boat-selling-acceptable-drugs", fullConfig.boatAcceptableDrugs);

	$("#boat-selling-account").val(fullConfig.boatSellingAccount);

	$("#boat-minimum-police").val(fullConfig.boatSellingMinimumPolice);

	// NPC Selling
	$("#enable-npc-selling").prop("checked", fullConfig.enableNPCSell);
	$("#enable-npc-selling").change();

	$("#npc-selling-min-quantity").val(fullConfig.minNPCSellQuantity);
	$("#npc-selling-max-quantity").val(fullConfig.maxNPCSellQuantity);

	$("#npc-money-account").val(fullConfig.accountFromNPCSell);

	$("#npc-accept-chances").val(fullConfig.sellToNPCChancesToAccept);

	$("#npc-max-drug-quantity").val(fullConfig.maxNPCsSellableDrugQuantity);

	fillAcceptableDrugsForDiv("#npc-selling-acceptable-drugs", fullConfig.npcAcceptableDrugs);

	$("#npc-minimum-police").val(fullConfig.npcSellingMinimumPolice);

	$("#npc-seconds-to-sell").val(fullConfig.npcSecondsToSell);

	$("#npc-alert-police-chances").val(fullConfig.npcAlertPoliceChances);

	// NPC Selling command
	$("#npc-selling-command-is-enabled").prop("checked", fullConfig.npcSellingCommand.enabled).change();
	$("#npc-selling-command").val(fullConfig.npcSellingCommand.command);
	$("#npc-selling-command-has-to-spawn-npc").prop("checked", fullConfig.npcSellingCommand.hasToSpawnPed);

	// Narcos selling
	$("#enable-narcos-selling").prop("checked", fullConfig.enableNarcosSelling);
	$("#enable-narcos-selling").change();

	$("#narcos-model").val(fullConfig.narcosModel),

	$("#enable-narcos-blip").prop("checked", fullConfig.showNarcosBlip),
	$("#enable-narcos-blip").change();

	$("#narcos-selling-blip-name").val(fullConfig.narcosBlip.name);
	$("#narcos-selling-blip-color").val(fullConfig.narcosBlip.color);
	$("#narcos-selling-blip-scale").val(fullConfig.narcosBlip.scale);
	$("#narcos-selling-blip-sprite").val(fullConfig.narcosBlip.sprite);
	
	$("#narcos-location-change").val(fullConfig.narcosLocationChangeTime);
	$("#narcos-reward-account").val(fullConfig.narcosRewardAccount);
	$("#narcos-police-alert-chances").val(fullConfig.narcosCallPoliceChances);
	$("#narcos-accepts-only-one-buyer-per-location").prop("checked", fullConfig.narcosAcceptsOnlyOneBuyerPerLocation);

	$("#narcos-spawn-locations").empty();
	if(fullConfig.narcosBuyerLocations) {
		fullConfig.narcosBuyerLocations.forEach(location => {
			addNarcosSpawnLocation(location.coords, location.heading);
		});
	}

	$("#narcos-selling-acceptable-drugs").empty();
	if(fullConfig.narcosNeededDrugs) {
		fullConfig.narcosNeededDrugs.forEach(drug => {
			addNarcosDrug(drug.name, drug.minQuantity, drug.maxQuantity, drug.minPrice, drug.maxPrice);	
		});
	}

	$("#narcos-minimum-police").val(fullConfig.narcosSellingMinimumPolice);

	// Pushers
	$("#enable-pushers-selling").prop("checked", fullConfig.arePushersEnabled);
	$("#enable-pushers-selling").change();

	$("#pushers-model").val(fullConfig.pusherModel),

	$("#enable-pushers-blip").prop("checked", fullConfig.showPushersBlips);
	$("#pushers-selling-blip-name").val(fullConfig.pusherBlip.name);
	$("#pushers-selling-blip-color").val(fullConfig.pusherBlip.color);
	$("#pushers-selling-blip-scale").val(fullConfig.pusherBlip.scale);
	$("#pushers-selling-blip-sprite").val(fullConfig.pusherBlip.sprite);

	$("#pushers-alert-police-chances").val(fullConfig.pushersCallPoliceChances);
	
	$("#pushers-list").empty();
	if(fullConfig.pushers) {
		for(const[pusherId, pusherData] of Object.entries(fullConfig.pushers)) {
			addPusher(pusherData);
		}
	}

	$("#pushers-minimum-police").val(fullConfig.pushersSellingMinimumPolice);
	$("#pushers-selling-account").val(fullConfig.pushersSellingAccount);

	// Pocket craftings
	$("#pocket-craftings-list").empty();
	if(fullConfig.pocketCraftings) {
		for(const[itemName, itemData] of Object.entries(fullConfig.pocketCraftings)) {
			addPocketCrafting(itemName, itemData);
		}
	}

	// Effects
	$("#drugs-effects").empty();
	if(fullConfig.drugsEffects) {
		for(const[itemName, effectData] of Object.entries(fullConfig.drugsEffects)) {
			addItemEffect(itemName, effectData);
		}
	}

	// Settings
	setTomSelectValue("#settings_locale", fullConfig.locale)
	setTomSelectValue("#settings_menuPosition", fullConfig.menuPosition)
	setTomSelectValue("#settings-targeting-script", fullConfig.targetingScript)
	setTomSelectValue("#settings-help-notification-script", fullConfig.helpNotification)

	$("#enable-fire-on-error").prop("checked", fullConfig.enableFireOnError);
	$("#enable-explosion-on-error").prop("checked", fullConfig.enableExplosionOnError).change();
	$("#seconds-before-explosion").val(fullConfig.secondsBeforeExplosion);

	$("#enable-discord-logs").prop("checked", fullConfig.areDiscordLogsActive).change()

	$("#main-discord-webhook").val(fullConfig.mainDiscordWebhook);

	if(fullConfig.specificWebhooks) {
		for(const[webhookType, webhookUrl] of Object.entries(fullConfig.specificWebhooks)) {
			$("#discord-specific-webhooks").find(`[data-webhook-type="${webhookType}"]`).val(webhookUrl);
		}
	}

	// Key to sell to NPCs
	$("#key-to-sell-to-npcs").val(fullConfig.keyToSellToNPCs);

	// Minimum police
	$("#harvestable-items-minimum-police").val(fullConfig.harvestingItemsMinimumPolice);
	$("#laboratory-minimum-police").val(fullConfig.useLaboratoryMinimumPolice);
	$("#fields-minimum-police").val(fullConfig.harvestFieldMinimumPolice);

	// Automatic farm
	$("#allow-afk-farming-for-harvest").prop("checked", fullConfig.allowAfkFarmingForHarvest);

	// Price reduction
	$("#minimum-cops-for-base-price").val(fullConfig.priceReduction.minimumPolice);
	$("#price-reduction-percentage").val(fullConfig.priceReduction.reductionPercentage);
	$("#price-reduction-interval").val(fullConfig.priceReduction.reductionInterval);
}

// Settings
function getSpecificWebhooks() {
	let webhooks = {};

	$("#discord-specific-webhooks").find(".webhook").each(function() {
		let webhookType = $(this).data("webhookType");
		let webhook = $(this).val();

		if(webhook) {
			webhooks[webhookType] = webhook;
		}
	})

	return webhooks;
}

$("#settings").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		secondsBeforeExplosion: parseInt( $("#seconds-before-explosion").val() ),
		menuPosition: $("#settings_menuPosition").val(),

		// Key to sell to NPCs
		keyToSellToNPCs: parseInt( $("#key-to-sell-to-npcs").val() ),

		// Targeting
		targetingScript: $("#settings-targeting-script").val(),

		// Help notification
		helpNotification: $("#settings-help-notification-script").val(),
	}

	let sharedSettings = {
		locale: $("#settings_locale").val(),
		
		// NPC selling command
		npcSellingCommand: {
			enabled: $("#npc-selling-command-is-enabled").prop("checked"),
			command: $("#npc-selling-command").val(),
			hasToSpawnPed: $("#npc-selling-command-has-to-spawn-npc").prop("checked")
		}
	}

	let serverSettings = {
		enableFireOnError: $("#enable-fire-on-error").prop("checked"),
		enableExplosionOnError: $("#enable-explosion-on-error").prop("checked"),

		areDiscordLogsActive: $("#enable-discord-logs").prop("checked"),
		mainDiscordWebhook: $("#main-discord-webhook").val(),

		specificWebhooks: getSpecificWebhooks(),

		harvestingItemsMinimumPolice: parseInt( $("#harvestable-items-minimum-police").val() ),
		useLaboratoryMinimumPolice: parseInt( $("#laboratory-minimum-police").val() ),
		harvestFieldMinimumPolice: parseInt( $("#fields-minimum-police").val() ),

		allowAfkFarmingForHarvest: $("#allow-afk-farming-for-harvest").prop("checked"),

		priceReduction: {
			minimumPolice: parseInt( $("#minimum-cops-for-base-price").val()),
			reductionPercentage: parseInt( $("#price-reduction-percentage").val()),
			reductionInterval: parseInt( $("#price-reduction-interval").val())
		}
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: clientSettings,
		serverSettings: serverSettings,
		sharedSettings: sharedSettings
	}));
	showServerResponse(response);

	refreshTranslations(sharedSettings.locale);
})

$("#enable-discord-logs").change(function() {
	let enabled = $(this).prop("checked");

	$("#main-discord-webhook").prop("disabled", !enabled);
	$("#main-discord-webhook").prop("required", enabled);

	$("#discord-specific-webhooks").find(".webhook").each(function() {
		$(this).prop("disabled", !enabled);
	});
})

// Restore to default config
$(".restore-to-default-config").click(async function() {
	if(!await confirmDeletion( getLocalizedText("menu:are_you_sure_to_restore_settings") )) return;

	const defaultConfig = await $.post(`https://${resName}/getDefaultConfiguration`);
	loadSettings(defaultConfig)
})

// Drugs effects
async function getItemLabel(itemName) {
	return new Promise(resolve => {
		$.post(`https://${resName}/getItemLabel`, JSON.stringify({itemName: itemName}), function(itemLabel) {
			resolve(itemLabel);
		});
	})
}

async function addItemEffect(itemName, itemData={}, isNew = false) {
	let itemLabel = await getItemLabel(itemName);

	let itemEffectDiv = $(`
		<div class="drug-effect mb-4">
			<p class="text-center fs-2 fw-bold title">${itemLabel} <span class="fs-5 fw-lighter fst-italic">(${itemName})</span></p>

			<div class="effects mt-3">
				<p class="text-start fs-3 fw-bold mb-2">${ getLocalizedText("menu:effects:taking_method") }</p>

				<div class="d-flex mb-4">
					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input" type="radio" name="drug-assume-type-${itemName}" value="pill" required checked>
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:pill") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input" type="radio" name="drug-assume-type-${itemName}" value="drink">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:drink") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input" type="radio" name="drug-assume-type-${itemName}" value="smoke">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:smoke") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input" type="radio" name="drug-assume-type-${itemName}" value="needle">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:needle") }
						</label>
					</div>
				</div>

				<p class="text-start fs-3 fw-bold mb-2">${ getLocalizedText("menu:effects:drunk_effects") }</p>

				<div class="d-flex mb-4">
					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input stackable-effect" type="checkbox" value="visual_shaking">
						<label class="form-check-label">${ getLocalizedText("menu:effects:visual_shaking") }</label>
					</div>

					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input stackable-effect" type="checkbox" value="drunk_walk">
						<label class="form-check-label">${ getLocalizedText("menu:effects:drunk_walk") }</label>
					</div>

					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input stackable-effect" type="checkbox" value="fall">
						<label class="form-check-label">${ getLocalizedText("menu:effects:fall") }</label>
					</div>
				</div>

				<p class="text-start fs-3 fw-bold mb-2">${ getLocalizedText("menu:effects:visual_color_effects") }</p>

				<div class="d-flex row-cols-3 flex-wrap mb-4 mb-4">
					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="none" required checked>
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:none") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="pink_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:pink_visual") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="green_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:green_visual") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="confused_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:confused_visual") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="yellow_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:yellow_visual") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="blurred_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:blurred_visual") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="red_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:red_visual") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="foggy_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:foggy_visual") }
						</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input" type="radio" name="camera-color-effects-${itemName}" value="blue_visual">
						<label class="form-check-label">
							${ getLocalizedText("menu:effects:blue_visual") }
						</label>
					</div>
				</div>

				<p class="text-start fs-3 fw-bold mb-2">${ getLocalizedText("menu:effects:perks") }</p>

				<div class="d-flex row-cols-3 flex-wrap mb-4 mb-4">
					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="armor50">
						<label class="form-check-label">${ getLocalizedText("menu:effects:50_percent_armor") }</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="armor100">
						<label class="form-check-label">${ getLocalizedText("menu:effects:100_percent_armor") }</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="health50">
						<label class="form-check-label">${ getLocalizedText("menu:effects:50_percent_health") }</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="health100">
						<label class="form-check-label">${ getLocalizedText("menu:effects:100_percent_health") }</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="sprint_faster">
						<label class="form-check-label">${ getLocalizedText("menu:effects:faster_sprint") }</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="swim_faster">
						<label class="form-check-label">${ getLocalizedText("menu:effects:faster_swim") }</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="infinite_stamina">
						<label class="form-check-label">${ getLocalizedText("menu:effects:infinite_stamina") }</label>
					</div>

					<div class="form-check form-check-inline fs-4 m-0">
						<input class="form-check-input stackable-effect" type="checkbox" value="remove_old_effects">
						<label class="form-check-label">${ getLocalizedText("menu:effects:remove_old_effects") }</label>
					</div>
				</div>

				<p class="text-start fs-3 fw-bold mb-2">${ getLocalizedText("menu:effects:special_effect") }</p>

				<div class="d-flex mb-4">
					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input" type="radio" name="drug-special-effect-${itemName}" value="none" checked>
						<label class="form-check-label">${ getLocalizedText("menu:effects:none") }</label>
					</div>
					
					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input" type="radio" name="drug-special-effect-${itemName}" value="vehicle_stalker">
						<label class="form-check-label">${ getLocalizedText("menu:effects:vehicle_stalker") }</label>
					</div>

					<div class="form-check form-check-inline fs-4">
						<input class="form-check-input" type="radio" name="drug-special-effect-${itemName}" value="ghost">
						<label class="form-check-label">${ getLocalizedText("menu:effects:ghost") }</label>
					</div>
				</div>

				<div class="form-floating mb-3 text-body">
					<input type="number" min=1 class="form-control effect-duration" placeholder="Effects duration" required value="120">
					<label>${ getLocalizedText("menu:effects:duration") }</label>
				</div>
			</div>

			<div class="d-inline-block col-12">
				<button type="button" class="btn btn-danger float-end remove-effect-btn">${ getLocalizedText("menu:effects:remove_this_effect") }</button>
			</div>
		</div>

		<hr>
	`);

	if(itemData.takingMethod) {
		itemEffectDiv.find(`input[name=drug-assume-type-${itemName}][value=${itemData.takingMethod}]`).prop("checked", true);
	}

	if(itemData.effectsDuration) {
		itemEffectDiv.find(".effect-duration").val(itemData.effectsDuration);
	}

	if(itemData.effects) {
		for(let effect of itemData.effects) {
			itemEffectDiv.find(`input[value=${effect}]`).prop("checked", true);
		}
	}

	if(isNew) {
		itemEffectDiv.find(".title").append(`<span class="fs-5 fw-lighter fst-italic text-danger"> - ${ getLocalizedText("menu:effects:may_need_restart") }</span>`)
	}

	itemEffectDiv.data("itemName", itemName);

	itemEffectDiv.find(".remove-effect-btn").click(function() {
		itemEffectDiv.remove();
	})

	$("#drugs-effects").append(itemEffectDiv);
}

function getEffectsDataFromDiv(effectDiv, itemName) {
	let effectData = {
		takingMethod: $(`input[name=drug-assume-type-${itemName}]:checked`).val(),
		effects: [],
		effectsDuration: parseInt( effectDiv.find(".effect-duration").val() ),
	};

	let visualColorEffect = $(`input[name=camera-color-effects-${itemName}]:checked`).val();

	if(visualColorEffect != "none") {
		effectData.effects.push(visualColorEffect)
	}

	const specialEffect = $(`input[name=drug-special-effect-${itemName}]:checked`).val();
	if(specialEffect != "none") {
		effectData.effects.push(specialEffect)
	}

	effectDiv.find(".stackable-effect:checked").each(function() {
		effectData.effects.push( $(this).val() );
	});

	return effectData;
}

function getAllEffectsData() {
	let effectsData = {};

	$("#drugs-effects").find(".drug-effect").each(function() {
		let itemName = $(this).data("itemName");

		effectsData[itemName] = getEffectsDataFromDiv($(this), itemName);
	});

	return effectsData;
}

$("#create-new-item-effect-btn").click(async function() {
	const itemName = await itemsDialog();
	addItemEffect(itemName, {}, true);
});

// Saves the new effects
$("#effects").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let serverSettings = {
		drugsEffects: getAllEffectsData(),
	}

	let clientSettings = {}
	let sharedSettings = {}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: clientSettings,
		serverSettings: serverSettings,
		sharedSettings: sharedSettings
	}));
	showServerResponse(response);
});

// [[ NEXUS ]]
const voteInstanceRater = raterJs({
	starSize: 35,
	element: document.querySelector("#vote-instance-rater"),
	rateCallback: async function rateCallback(rating, done) {
		const instanceId = $("#nexus-modal").data("instance").id;
		const success = await $.post(`https://${resName}/nexus/rateInstance`, JSON.stringify({rating, instanceId}));
		if(success) voteInstanceRater.setRating(rating);

		done();
	}
});

const averageInstanceVotes = raterJs({
	starSize: 20,
	readOnly: true,
	element: document.querySelector("#nexus-modal-instance-average-rating"),
});

$("#nexus-import-instance-btn").click(async function() {
	const instance = $("#nexus-modal").data("instance");
	const id = instance.id;

	const mappedItemsNames = await itemsMapperDialog(instance.requiredItemsNames);
	if(!mappedItemsNames) return;

	const response = await $.post(`https://${resName}/nexus/importInstance`, JSON.stringify({id, mappedItemsNames}));
	$("#nexus-modal").modal("hide");

	if(response === true) reloadAllData();

	showServerResponse(response);
});

let nexusDataTable = $("#nexus-table").DataTable({
	"lengthMenu": [5, 10, 15, 20],
	"pageLength": 10,
	"order": [[4, 'desc'], [5, 'desc']],
	"createdRow": function (row, data, index) {
		$(row).addClass("clickable");
		$(row).click(function () {
			const instance = $(this).data("instance");
			showInstance(instance);
			$("#nexus-modal").modal("show");
		});
	},
	"columnDefs": [{ "defaultContent": "???", "targets": "_all" }]
});
  
function showInstance(instance) {
	$("#nexus-modal").data("instance", instance);

	$("#nexus-modal-instance-listing-label").text(instance.label);
	$("#nexus-instance-content-type").text(instance.type);
	$("#nexus-instance-content-amount").text(instance.content.length);
	$("#nexus-modal-instance-description").text(instance.description || getLocalizedText("menu:nexus:no_description"));
	$("#nexus-modal-instance-author").text(instance.author);

	// Content names and labels

	$("#nexus-modal-instance-content").empty();
	instance.content.forEach(content => {
		$("#nexus-modal-instance-content").append(`
			<li class="list-group-item">${content.label || content.name}</li>
		`);
	});

	// Votes
	if(instance?.votes?.total > 0) {
		averageInstanceVotes.setRating(instance?.votes.averageRating);
	} else {
		averageInstanceVotes.setRating(0);
	}

	$("#nexus-modal-instance-total-votes").text(instance.votes?.total || 0);

	// This server vote
	voteInstanceRater.setRating(0);
}

$("#upload-to-nexus-btn").click(async function() {
	const type = await listDialog(getLocalizedText("menu:nexus:data_to_share"), getLocalizedText("menu:search"), [
		{value: "harvestable_item", label: getLocalizedText("menu:harvestable_item")},	
		{value: "drug_field", label: getLocalizedText("menu:drug_field")},
		{value: "crafting_recipe", label: getLocalizedText("menu:crafting_recipe")},
		{value: "laboratory", label: getLocalizedText("menu:laboratory")},
	]);
	if(!type) return;

	let dataToChooseFrom = [];

	// Depending on the type, we retrieve the possible data and create a multiSelectDialog
	switch(type) {
		case "harvestable_item":
			dataToChooseFrom = await $.post(`https://${resName}/getAllHarvestableItems`);
			break;
		case "drug_field":
			dataToChooseFrom = await $.post(`https://${resName}/getAllDrugsFields`);
			break;
		case "crafting_recipe":
			dataToChooseFrom = await $.post(`https://${resName}/getAllCraftingRecipes`);
			break;
		case "laboratory":
			dataToChooseFrom = await $.post(`https://${resName}/getAllLaboratories`);
			break;
	}
	if(!dataToChooseFrom) return;

	let elements = [];

	Object.values(dataToChooseFrom).forEach(data => {
		elements.push({
			value: data.id,
			label: data.id + " - " + (data.label || data.name)
		});
	})

	const selectedData = await multiSelectDialog(getLocalizedText("menu:nexus:data_to_share"), getLocalizedText("menu:search"), elements);
	if(!selectedData) return;

	$("#nexus-modal-upload").data("selectedData", selectedData);
	$("#nexus-modal-upload").data("dataType", type);

	$("#nexus-upload-label").val("");
	$("#nexus-upload-description").val("");

	$("#nexus-upload-accept-tos").prop("checked", false);
	
	$("#nexus-modal-upload").modal("show");
});

$("#nexus-upload-form").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	const dataToUpload = {
		type: $("#nexus-modal-upload").data("dataType"),
		ids: $("#nexus-modal-upload").data("selectedData"),
		label: $("#nexus-upload-label").val(),
		description: $("#nexus-upload-description").val(),
	}

	const result = await $.post(`https://${resName}/nexus/uploadData`, JSON.stringify(dataToUpload));

	if(result == true) {
		swal("Success", getLocalizedText("menu:nexus:upload_success"), "success");
		resetNexus();
	} else {
		swal("Error", result, "error");
	}

	$("#nexus-modal-upload").modal("hide");
});

$("#enter-in-nexus-btn").click(async function() {
	$("#nexus-login").find(".spinner-border").show();
	$("#enter-in-nexus-label").text("...");

	const sharedData = await $.get(`https://${resName}/nexus/getSharedData`);
	if(!sharedData) {
		swal("Error", getLocalizedText("menu:nexus:not_available"), "error");
		resetNexus();
		return;
	} 
	
	nexusDataTable.clear()

	Object.values(sharedData).forEach(instance => {
		const roundedAverageRating = instance?.votes?.averageRating ? Math.round(instance.votes.averageRating) : 0;
		const ratingStars = instance?.votes?.total ? "⭐".repeat(roundedAverageRating) : getLocalizedText("menu:nexus:not_rated");
		const limitedDescription = instance.description?.length > 30 ? instance.description.substring(0, 30) + "..." : instance.description;
		const amount = instance.content.length;

		const rawRow = nexusDataTable.row.add( [instance.label, limitedDescription, instance.type, amount, ratingStars, instance.votes?.total || 0, instance.author] );

		const rowDiv = $(rawRow.node());
		$(rowDiv).data("instance", instance);
	})

	nexusDataTable.draw();

	$("#nexus-login").hide();
	$("#nexus-container").show();
})

function resetNexus() {
	$("#nexus-login").show();
	$("#nexus-login").find(".spinner-border").hide();
	$("#enter-in-nexus-label").text("Enter in Nexus");

	$("#nexus-container").hide();
}

function reloadAllData() {
	resetNexus();

	loadHarvestableItems();
	loadDrugsFields();
	loadCraftingRecipes();
	loadLaboratories();
}

// Open/Close menu
function openMenu(version, fullConfig) {
	$("#advanced-drugs-creator-version").text(version);

    $("#drugs_creator").show();

	reloadAllData();

	loadSettings(fullConfig);
}

function closeMenu() {
    $("#drugs_creator").hide();

    $.post(`https://${resName}/close`, {})
}
$("#close-main-btn").click(closeMenu);

function playSound(name, speed = 1.0, volume = 1.0) {
    // Create an AudioContext
    var audioCtx = new (window.AudioContext || window.webkitAudioContext)();

    // Create the audio element
    var audio = new Audio(`./assets/audio/${name}.mp3`);
    audio.playbackRate = speed;

    // Create a media element source
    var source = audioCtx.createMediaElementSource(audio);

    // Create a gain node
    var gainNode = audioCtx.createGain();
    gainNode.gain.value = volume; // Set the volume

    // Connect the source to the gain node and the gain node to the destination
    source.connect(gainNode);
    gainNode.connect(audioCtx.destination);

    // Play the audio
    audio.play();
}

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	if (action == 'openMenu') {
		openMenu(data.version, data.fullConfig);
	} else if (action == "playSound") {
		playSound(data.name, data.speed, data.volume);
	}
})