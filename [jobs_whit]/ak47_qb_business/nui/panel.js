var cnf = 0
let products = [];
let lastShop = null;
localStorage.setItem("cart", JSON.stringify([]));
window.addEventListener("message", function(event) {
	var item = event.data;
	if (item.showmenu) {
		hideCart()
		if (lastShop != item.currentShop) {
			lastShop = item.currentShop
			clearCartItems()
		}
		var config = item.dados.config;
		cnf = config;
		var store_business = item.dados.store_business;
		var isProcess = item.process;
		var manage = item.manage;
		$("#nav-bar").empty();
		$("#nav-bar").append(`
			` + getPagination(config.market_types.pagination) + `
			<li onclick="closeUI()">
				<i class="fas fa-times"></i>
				<span class="tooltip">Close</span>
			</li>
		`);
		if (item.update != true) {
			$(".pages").css("display", "none");
			$("body").css("display", "");
			$(".sidebar-navigation ul li").removeClass("active");
			openPage(5);
		} else {
			$(".sidebar-" + openedPage).addClass("active");
		}
		$(".main-title").html(item.currentShop);
		$("#market-products0").empty();
		$("#market-products1").empty();
		$("#market-products2").empty();
		$("#market-products3").empty();
		$("#market-products4").empty();
		$("#market-products5").empty();
		$("#market-products6").empty();
		$("#market-products7").empty();
		$("#market-products8").empty();
		$("#market-products9").empty();
		$("#form_product").empty();
		$("#form_product").append(`
			<option value="" selected disabled>Select the product</option>
		`);
		var arr_stock = store_business.stock;
		var player_inv = {};
		if (store_business.player_inv) {
			player_inv = store_business.player_inv;
		}
		products = [];
		for (const key in config.market_types.market_items) {
			var item = config.market_types.market_items[key];
			var stock_value = 0;
			if (arr_stock[key] == undefined) {
				stock_value = "Full";
			} else {
				stock_value = arr_stock[key].stock;
			}
			products.push({
				id: key,
				name: item.name,
				price: arr_stock[key].price,
				stock: parseInt(stock_value),
			})
			var fkey = key;
			if (isProcess) {
				if (item.process) {
					$("#market-products" + item.page).append(`
						<div class="col-2 p-2">
							<div class="card card-custom w-auto m-0 bg-light">
								<div class="card-content">
									<div class="card-body cleartfix">
										<div class="media flex-column">
											<div class="media-div-custom">
												<img src=img/` + key + `.png/><p class="stock-location mb-0">` + stock_value + `</p>
											</div>
											<div class="media-body">
												<h4>` + (item.name.length > 15 ? item.name.substring(0, 14) + ".." : item.name) + `</h4>
												<button onclick="makeItem('` + fkey + `')" class="btn btn-outline-secondary deposit-money-btn col-12">Make Item</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					`);
				}
			} else if (manage) {
				$("#market-products" + item.page).append(`
					<div class="col-2 p-2">
						<div class="card card-custom w-auto m-0 bg-light">
							<div class="card-content">
								<div class="card-body card-custom-height cleartfix">
									<div class="media flex-column">
										<div class="media-div-custom">
											<img src=img/` + key + `.png/>
											<p class="price-location">` + new Intl.NumberFormat(config.format.location, {
					style: "currency",
					currency: config.format.currency,
					maximumFractionDigits: 0,
					minimumFractionDigits: 0,
				}).format(arr_stock[key].price) + `</p>
											<p class="stock-location mb-0">` + stock_value + `</p>
										</div>
										<div class="media-body">
											<h4>` + (item.name.length > 15 ? item.name.substring(0, 14) + ".." : item.name) + `</h4>
											<div class="row mr-0 ml-0">
												<button onclick="putIn('` + fkey + `')" class="btn btn-outline-secondary deposit-money-btn btn-left-radius col-3 p-0">IN</button>
												<div class="col-6 pl-1 pr-1">
													<input id="input-` + fkey + `" class="deposit-money w-100 h-100 m-0 p-1" type="number" min="1" placeholder="0" name="amount" required="required" ` + (isWeapon(fkey) ? `disabled value = 1` : ``) + `>
												</div>
												<button onclick="putOut('` + fkey + `')" class="btn btn-outline-secondary deposit-money-btn btn-right-radius col-3 p-0">OUT</button>
											</div>
											<div class="row mr-0 ml-0 mt-1">
												<div class="col-6 pl-0 pr-1">
													<input id="input-p-` + fkey + `" class="manage-money input-left-radius w-100 h-100 m-0 p-1" type="number" min="1" placeholder="Price" name="amount" required="required">
												</div>
												<button onclick="cPrice('` + fkey + `')" class="btn btn-outline-secondary deposit-money-btn btn-right-radius col-6 p-0">UPDATE</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				`);
			} else {
				$("#market-products" + item.page).append(`
					<div class="col-2 p-2">
						<div class="card card-custom w-auto m-0 bg-light">
							<div class="card-content">
								<div class="card-body cleartfix">
									<div class="media flex-column">
										<div class="media-div-custom">
											<img src=img/` + key + `.png/>
											<p class="price-location">` + new Intl.NumberFormat(config.format.location, {
					style: "currency",
					currency: config.format.currency,
					maximumFractionDigits: 0,
					minimumFractionDigits: 0,
				}).format(arr_stock[key].price) + `</p><p class="stock-location mb-0">` + stock_value + `</p></div><div class="media-body"><h4>` + (item.name.length > 15 ? item.name.substring(0, 14) + ".." : item.name) + `</h4>
											<button class="add-to-cart-btn btn btn-outline-secondary deposit-money-btn col-12" onclick="addToCart('` + fkey + `')"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				`);
			}
		}
	}
	if (item.hidemenu) {
		$("body").css("display", "none");
	}
});

function isWeapon(item) {
	if (item.match(/WEAPON_/g) || item.match(/weapon_/g)) {
		return true
	}
	return false
}

function openPage(pageN) {
	openedPage = pageN
	if ($(".sidebarClass").hasClass("active")) {
		$(".sidebarClass").removeClass("active");
	}
	if (pageN == 5) {
		$(".pages").css("display", "none");
		$(".market-page0").css("display", "block");
	}
	if (pageN == 6) {
		$(".pages").css("display", "none");
		$(".market-page1").css("display", "block");
	}
	if (pageN == 7) {
		$(".pages").css("display", "none");
		$(".market-page2").css("display", "block");
	}
	if (pageN == 8) {
		$(".pages").css("display", "none");
		$(".market-page3").css("display", "block");
	}
	if (pageN == 9) {
		$(".pages").css("display", "none");
		$(".market-page4").css("display", "block");
	}
	if (pageN == 10) {
		$(".pages").css("display", "none");
		$(".market-page5").css("display", "block");
	}
	if (pageN == 11) {
		$(".pages").css("display", "none");
		$(".market-page6").css("display", "block");
	}
	if (pageN == 12) {
		$(".pages").css("display", "none");
		$(".market-page7").css("display", "block");
	}
	if (pageN == 13) {
		$(".pages").css("display", "none");
		$(".market-page8").css("display", "block");
	}
	if (pageN == 14) {
		$(".pages").css("display", "none");
		$(".market-page9").css("display", "block");
	}
	$(".sidebar-" + pageN).addClass("active");
	$(".main-sub-title").html(cnf.market_types.pagination[pageN - 5].name);
}

function getPagination(pagination) {
	var html = "";
	for (var i = 0; i <= 9; i++) {
		if (pagination[i] == undefined) {
			return html;
		}
		html += `
		<li class="sidebarClass sidebar-` + (5 + i) + `" onclick="openPage(` + (5 + i) + `)">
			<i class="fas ` + pagination[i].icon + `"></i>
			<span class="tooltip">a</span>
		</li>`;
	}
	return html;
}
document.onkeyup = function(data) {
	if (data.which == 27) {
		if ($("body").is(":visible")) {
			post("close", "");
		}
	}
};

function closeUI() {
	post("close", "");
}

function putIn(item_id) {
	var amount = $("#input-" + item_id).val();
	amount = Math.ceil(amount);
	var item_id = item_id.replace("-x-", "|");
	if (amount > 0) {
		post("putIn", {
			item_id: item_id,
			amount: amount,
		});
	}
}

function putOut(item_id) {
	var amount = $("#input-" + item_id).val();
	amount = Math.ceil(amount);
	var item_id = item_id.replace("-x-", "|");
	if (amount > 0) {
		post("putOut", {
			item_id: item_id,
			amount: amount,
		});
	}
}

function cPrice(item_id) {
	var price = $("#input-p-" + item_id).val();
	price = Math.ceil(price);
	var item_id = item_id.replace("-x-", "|");
	if (price >= 0) {
		post("cPrice", {
			item_id: item_id,
			price: price,
		});
	}
}

function makeItem(item_id) {
	var item_id = item_id;
	post("makeItem", {
		item_id: item_id,
	});
	closeUI();
}

function post(name, data) {
	$.post("https://ak47_qb_business/" + name, JSON.stringify(data), function(datab) {});
}

function addToCart(productId) {
	const cart = getCartItems();
	const itemIndex = cart.findIndex((item) => item.id === productId);
	const product = products.find((p) => p.id === productId);
	if (itemIndex !== -1) {
		if (cart[itemIndex].quantity < product.stock){
			cart[itemIndex].quantity++;
		}
	} else {
		if (product.stock > 0) {
			cart.push({
				name: product.name,
				price: product.price,
				id: productId,
				quantity: 1,
				stock: product.stock,
			});
		}
	}
	localStorage.setItem("cart", JSON.stringify(cart));
	renderCartItems();
	updateCartIcon();
}

function removeFromCart(productId) {
	const cart = getCartItems();
	const itemIndex = cart.findIndex((item) => item.id === productId);
	if (itemIndex !== -1) {
		cart[itemIndex].quantity--;
		if (cart[itemIndex].quantity === 0) {
			cart.splice(itemIndex, 1);
		}
	}
	localStorage.setItem("cart", JSON.stringify(cart));
	renderCartItems();
	updateCartIcon();
}

function getCartItems() {
	const cart = JSON.parse(localStorage.getItem("cart")) || [];
	return cart;
}

function clearCartItems() {
	localStorage.setItem("cart", JSON.stringify([]));
	renderCartItems();
	updateCartIcon();
}

function renderCartItems() {
	const cartItemsDiv = document.getElementById("cart-items");
	const cartItems = getCartItems();
	// If there are no items in the cart, display a message
	if (cartItems.length === 0) {
		document.getElementById("empty-cart-message").style.display = "block";
		document.getElementById("cart-total").style.display = "none";
		document.getElementById("checkout-button").style.display = "none";
		cartItemsDiv.innerHTML = "";
		const totalPriceDiv = document.getElementById("total-price");
		totalPriceDiv.innerHTML = "$0";
		return;
	}
	document.getElementById("empty-cart-message").style.display = "none";
	document.getElementById("cart-total").style.display = "flex";
	document.getElementById("checkout-button").style.display = "block";
	cartItemsDiv.innerHTML = cartItems.map(
		(item) =>`
	    <div class="cart-item">
	    	<div class="cart-item-remove" data-product-id="${item.id}"><i class="fa-solid fa-xmark"></i></div>
	      <img src=img/` + item.id + `.png/>
	      <div class="cart-item-name">${item.name}</div>
	      <div class="cart-item-quantity">
	        <button class="quantity-btn minus-btn" data-product-id="${item.id}">-</button>
	        <input type="number" class="item-quantity" value="${item.quantity}" min="1" max="${parseInt(item.stock)}" data-product-id="${item.id}" />
	        <button class="quantity-btn plus-btn" data-product-id="${item.id}">+</button>
	      </div>
	      <div class="cart-item-price">$${item.price}</div>
	    </div>`).join("");
	// Attach event listeners to quantity input fields
	const quantityInputs = document.getElementsByClassName("item-quantity");
	for (let i = 0; i < quantityInputs.length; i++) {
		quantityInputs[i].addEventListener("change", (event) => {
			const productId = event.target.getAttribute("data-product-id");
			const product = products.find((p) => p.id === productId);
			const quantity = parseInt(event.target.value);
			if (quantity > 0 && quantity <= product.stock){
				updateCartItemQuantity(productId, quantity);
			}else if(quantity < 1){
				updateCartItemQuantity(productId, 1);
			}else if(quantity > product.stock){
				updateCartItemQuantity(productId, product.stock);
			}
			renderCartItems();
		});
	}
	// Attach event listeners to remove buttons
	const removeButtons = document.getElementsByClassName("cart-item-remove");
	for (let i = 0; i < removeButtons.length; i++) {
		removeButtons[i].addEventListener("click", (event) => {
			const productId = event.target.getAttribute("data-product-id");
			const product = products.find((p) => p.id === productId);
			removeCartItem(productId);
			renderCartItems();
		});
	}
	// Attach event listeners to minus buttons
	const minusButtons = document.querySelectorAll(".minus-btn");
	minusButtons.forEach((button) => {
		button.addEventListener("click", (event) => {
			const productId = event.target.getAttribute("data-product-id");
			const product = products.find((p) => p.id === productId);
			const quantityInput = document.querySelector(`.item-quantity[data-product-id="${productId}"]`);
			let quantity = parseInt(quantityInput.value);
			if (quantity > 1) {
				quantity--;
				quantityInput.value = quantity;
				updateCartItemQuantity(productId, quantity);
				renderCartItems();
			}
		});
	});
	// Attach event listeners to plus buttons
	const plusButtons = document.querySelectorAll(".plus-btn");
	plusButtons.forEach((button) => {
		button.addEventListener("click", (event) => {
			const productId = event.target.getAttribute("data-product-id");
			const product = products.find((p) => p.id === productId);
			const quantityInput = document.querySelector(`.item-quantity[data-product-id="${productId}"]`);
			let quantity = parseInt(quantityInput.value);
			if (quantity < product.stock){
				quantity++;
				quantityInput.value = quantity;
				updateCartItemQuantity(productId, quantity);
				renderCartItems();
			}
		});
	});
	const checkoutButton = document.getElementById("checkout-button");
	checkoutButton.addEventListener("click", () => {
		const cartItems = getCartItems();
		const paymentMethodSelect = document.getElementById("payment-method");
		const selectedValue = paymentMethodSelect.value;
		if (cartItems.length > 0) {
			$.post("https://ak47_qb_business/buyItems", JSON.stringify({
				cart : cartItems,
				payment : selectedValue,
			}), function(datab) {});
			clearCartItems();
		}
	});
	const totalPriceDiv = document.getElementById("total-price");
	totalPriceDiv.innerHTML = "$" + getTotalPrice();
}

function removeCartItem(productId) {
	let cart = getCartItems()
	const index = cart.findIndex((item) => item.id === productId);
	// If the product is in the cart, remove it and update the cart count and total price
	if (index !== -1) {
		cart.splice(index, 1);
		localStorage.setItem("cart", JSON.stringify(cart));
		renderCartItems();
		updateCartIcon();
	}
}

function updateCartItemQuantity(productId, quantity) {
	const cart = getCartItems()
	const itemIndex = cart.findIndex((item) => item.id === productId);
	cart[itemIndex].quantity = quantity;
	localStorage.setItem("cart", JSON.stringify(cart));
	renderCartItems();
	const totalPriceDiv = document.getElementById("total-price");
	totalPriceDiv.innerHTML = "$" + getTotalPrice();
}

function getTotalPrice() {
	let cartItems = getCartItems()
	let totalPrice = 0;
	for (let i = 0; i < cartItems.length; i++) {
		totalPrice += cartItems[i].price * cartItems[i].quantity;
	}
	return totalPrice.toFixed(2);
}

function updateCartIcon() {
	const cartIcon = document.getElementById("cart-count");
	const cartItems = getCartItems();
	cartIcon.innerText = cartItems.length;
}

document.addEventListener("DOMContentLoaded", () => {
	const addToCartBtns = document.querySelectorAll(".add-to-cart-btn");
	addToCartBtns.forEach((btn) => {
		btn.addEventListener("click", () => {
			const productId = btn.getAttribute("data-product-id");
			addToCart(productId);
		});
	});
	const cartIcon = document.getElementById("cart-count");
	cartIcon.addEventListener("click", () => {
		renderCartItems();
	});
	updateCartIcon();
});

const cartIcon = document.getElementById("cart-icon");
cartIcon.addEventListener("click", () => {
	toggleCart();
});

function toggleCart() {
	const cart = document.getElementById("cart");
	if (cart.style.display === "block") {
		cart.style.display = "none";
	} else {
		cart.style.display = "block";
	}
}

function hideCart() {
	const cart = document.getElementById("cart");
	cart.style.display = "none";
}