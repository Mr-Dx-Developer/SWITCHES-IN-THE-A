$(function () {
  let selectedItems = [];
  let amounts = [];
  let allItems = [];
  let banka = null;
  let currentcategory = null;
  let currentShop = null;
  let locales = null
  let playerBank = 0
  let playerCash = 0
  let playerName = "UNKOWN"

  const CalculateTotalPriceByName = (name) => {
    let selectedItem = GetSelectedItemByName(name);
    let totalPrice = 0;
    if (selectedItem) {
      totalPrice = Number(selectedItem.amount) * Number(selectedItem.price);
    }
    return totalPrice;
  };

  const CalculateTotalPrice = () => {
    let totalPrice = 0;
    selectedItems.forEach((item) => {
      totalPrice += Number(CalculateTotalPriceByName(item.name));
    });
    return totalPrice;
  };

  const CalculateTotalAmounts = () => {
    let totalAmounts = 0;
    selectedItems.forEach((item) => {
      totalAmounts += Number(item.amount);
    });
    return totalAmounts;
  };

  $(document).on("click", ".add-button", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let price = $(e.currentTarget).attr("data-price");
    let itemCode = $(e.currentTarget).attr("data-item");
    let dataExist = GetSelectedItemByName(name);
    let amountData = GetAmountDataByName(name);
    if (amountData) {
      if (dataExist) {
        dataExist.amount += Number(amountData.amount);
      } else {
        selectedItems.push({
          name,
          price,
          itemCode,
          amount: amountData.amount,
        });
      }
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshBasket();
  });
  $(document).on("click", ".add-buttonfoods", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let price = $(e.currentTarget).attr("data-price");
    let itemCode = $(e.currentTarget).attr("data-item");
    let dataExist = GetSelectedItemByName(name);
    let amountData = GetAmountDataByName(name);
    if (amountData) {
      if (dataExist) {
        dataExist.amount += Number(amountData.amount);
      } else {
        selectedItems.push({
          name,
          price,
          itemCode,
          amount: amountData.amount,
        });
      }
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshBasket();
  });
  $(document).on("click", ".add-buttontools", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let price = $(e.currentTarget).attr("data-price");
    let itemCode = $(e.currentTarget).attr("data-item");
    let dataExist = GetSelectedItemByName(name);
    let amountData = GetAmountDataByName(name);
    if (amountData) {
      if (dataExist) {
        dataExist.amount += Number(amountData.amount);
      } else {
        selectedItems.push({
          name,
          price,
          itemCode,
          amount: amountData.amount,
        });
      }
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshBasket();
  });

  const GetSelectedItemByName = (name) => {
    let data = selectedItems.filter((item) => item.name === name);
    return data[0] ? data[0] : false;
  };

  const GetAmountDataByName = (name) => {
    let data = amounts.filter((amount) => amount.name === name);
    return data[0] ? data[0] : false;
  };

  $(document).on("click", ".addtolist", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let amountData = GetAmountDataByName(name);

    if (amountData) {
      amountData.amount += 1;
    } else {
      amounts.push({
        name,
        amount: 1,
      });
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshList();
  });

  $(document).on("click", ".addtolistfoods", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let amountData = GetAmountDataByName(name);

    if (amountData) {
      amountData.amount += 1;
    } else {
      amounts.push({
        name,
        amount: 1,
      });
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshList();
  });
  $(document).on("click", ".addtolisttools", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let amountData = GetAmountDataByName(name);

    if (amountData) {
      amountData.amount += 1;
    } else {
      amounts.push({
        name,
        amount: 1,
      });
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshList();
  });

  $(document).on("click", ".removefromlist", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let amountData = GetAmountDataByName(name);

    if (amountData) {
      if (amountData.amount > 1) {
        amountData.amount -= 1;
      }
    } else {
      amounts.push({
        name,
        amount: 1,
      });
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshList();
  });
  $(document).on("click", ".removefromlistfoods", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let amountData = GetAmountDataByName(name);

    if (amountData) {
      if (amountData.amount > 1) {
        amountData.amount -= 1;
      }
    } else {
      amounts.push({
        name,
        amount: 1,
      });
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshList();
  });
  $(document).on("click", ".removefromlisttools", (e) => {
    let name = $(e.currentTarget).attr("data-name");
    let amountData = GetAmountDataByName(name);

    if (amountData) {
      if (amountData.amount > 1) {
        amountData.amount -= 1;
      }
    } else {
      amounts.push({
        name,
        amount: 1,
      });
    }
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshList();
  });

  const RefreshBasket = () => {
    let totaltext = $(".totaltext");
    let totaltextfoods = $(".totaltextfoods");
    let totaltexttools = $(".totaltexttools");
    let html = ``;
    if (currentcategory == "drinks") {
      selectedItems.forEach((item) => {
        html += `
              <span  class="seciliitem">
                  ${item.name}
                  <div class="deletehover" item-name=${item.name}></div> 
                  <span class="secilimiktar" >
                      ${item.amount}x
                      <span class="secilifiyat">${CalculateTotalPriceByName(item.name)}$</span>
                  </span>
              </span>`;
      });
      $(".totaltext4").html(CalculateTotalPrice() + ""+locales["CURRENCY"].text);
      $(".totaltext3").html(CalculateTotalAmounts() + "x");

      totaltext.html(html);
      $(".seciliitem").hover(
        function () {
          $(this).find(".deletehover").fadeIn();
        },
        function () {
          $(this).find(".deletehover").fadeOut();
        }
      );
    } else if (currentcategory == "foods") {
      selectedItems.forEach((item) => {
        html += `
          <span  class="seciliitemfoods">
              ${item.name}
              <div class="deletehoverfoods" item-name=${item.name}></div> 
              <span class="secilimiktarfoods" >
                  ${item.amount}x
                  <span class="secilifiyatfoods">${CalculateTotalPriceByName(item.name)}$</span>
              </span>
          </span>`;
      });
      $(".totaltext4foods").html(CalculateTotalPrice() + ""+locales["CURRENCY"].text);
      $(".totaltext3foods").html(CalculateTotalAmounts() + "x");

      totaltextfoods.html(html);
      $(".seciliitemfoods").hover(
        function () {
          $(this).find(".deletehoverfoods").fadeIn();
        },
        function () {
          $(this).find(".deletehoverfoods").fadeOut();
        }
      );
    }else if (currentcategory == "tools") {
      selectedItems.forEach((item) => {
        html += `
          <span  class="seciliitemtools">
              ${item.name}
              <div class="deletehovertools" item-name=${item.name}></div> 
              <span class="secilimiktartools" >
                  ${item.amount}x
                  <span class="secilifiyattools">${CalculateTotalPriceByName(item.name)}$</span>
              </span>
          </span>`;
      });
      $(".totaltext4tools").html(CalculateTotalPrice() + ""+locales["CURRENCY"].text);
      $(".totaltext3tools").html(CalculateTotalAmounts() + "x");

      totaltexttools.html(html);
      $(".seciliitemtools").hover(
        function () {
          $(this).find(".deletehovertools").fadeIn();
        },
        function () {
          $(this).find(".deletehovertools").fadeOut();
        }
      );
    }

    ChangeTheme()
  };

  $(document).on("click", ".deletehover", (e) => {
    let itemname = $(e.currentTarget).attr("item-name");
    selectedItems = selectedItems.filter((item) => item.name != itemname);
    RefreshBasket();
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
  });
  $(document).on("click", ".deletehoverfoods", (e) => {
    let itemname = $(e.currentTarget).attr("item-name");
    selectedItems = selectedItems.filter((item) => item.name != itemname);
    RefreshBasket();
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
  });

  $(document).on("click", ".deletehovertools", (e) => {
    let itemname = $(e.currentTarget).attr("item-name");
    selectedItems = selectedItems.filter((item) => item.name != itemname);
    RefreshBasket();
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
  });
  $(document).on("click", ".paytext2", (e) => {
    if (selectedItems) {
      banka = true;
      $.post(
        "https://codem-market/itemsend",
        JSON.stringify({
          item: selectedItems,
          bank: banka,
        })
      );
      selectedItems = [];
      RefreshBasket();
      $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    }
  });
  $(document).on("click", ".paytext2foods", (e) => {
    if (selectedItems) {
      banka = true;
      $.post(
        "https://codem-market/itemsend",
        JSON.stringify({
          item: selectedItems,
          bank: banka,
        })
      );
      selectedItems = [];
      RefreshBasket();
      $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    }
  });
  $(document).on("click", ".paytext2tools", (e) => {
    if (selectedItems) {
      banka = true;
      $.post(
        "https://codem-market/itemsend",
        JSON.stringify({
          item: selectedItems,
          bank: banka,
        })
      );
      selectedItems = [];
      RefreshBasket();
      $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    }
  });

  $(document).on("click", ".paytext", (e) => {
    if (selectedItems) {
      banka = false;
     
      $.post(
        "https://codem-market/itemsend",
        JSON.stringify({
          item: selectedItems,
          bank: banka,
        })
      );
    }
    selectedItems = [];
    RefreshBasket();
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
  });
  $(document).on("click", ".paytextfoods", (e) => {
    if (selectedItems) {
      banka = false;
    
      $.post(
        "https://codem-market/itemsend",
        JSON.stringify({
          item: selectedItems,
          bank: banka,
        })
      );
    }
    selectedItems = [];
    RefreshBasket();
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
  });
  $(document).on("click", ".paytexttools", (e) => {
    if (selectedItems) {
      banka = false;
   
      $.post(
        "https://codem-market/itemsend",
        JSON.stringify({
          item: selectedItems,
          bank: banka,
        })
      );
    }
    selectedItems = [];
    RefreshBasket();
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
  });

  $(document).on("click", ".backbutton", () => {
    $(".drinkspage").css("display", "none");
    $(".generalpage").css("display", "block");
    selectedItems = [];
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshBasket();
  });

  $(document).on("click", ".backbuttonfoods", () => {
    $(".foodspage").fadeOut(100);
    $(".generalpage").fadeIn(100);
    selectedItems = [];
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshBasket();
  });
  $(document).on("click", ".backbuttontools", () => {
    $(".toolspage").css("display", "none");
    $(".generalpage").fadeIn(100);
    selectedItems = [];
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshBasket();
  });
  $(document).on("click", ".close", () => {
    $(".generalpage").hide();
    $.post("https://codem-market/closepage");
    $('.background').css("display", "none");
    selectedItems = [];
    $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
    RefreshBasket();

  });

  const GetAmount = (name) => {
    let data = amounts.filter((amount) => amount.name === name);
    return data[0] ? data[0].amount : 0;
  };


  const ChangeTheme = () =>{
    if(currentShop === "24/7"){
      $('.marketbackgroud').attr("src", "../html/img/Main-Container.png")
      $('.marketlogo').css("display", "block")
      $('.background').css("background-image", "url(./img/Main-Container.png)")
      $('.bottomtop').css("background", "linear-gradient(93deg, rgba(0,0,0,1) 0%, rgba(61,53,53,1) 53%, rgba(255,255,255,1) 100%)")
      $('.bottomtopfoods').css("background", "linear-gradient(93deg, rgba(0,0,0,1) 0%, rgba(61,53,53,1) 53%, rgba(255,255,255,1) 100%)")
      $('.bottomtoptools').css("background", "linear-gradient(93deg, rgba(0,0,0,1) 0%, rgba(61,53,53,1) 53%, rgba(255,255,255,1) 100%)")
      $('.bottomline').css("background", "linear-gradient(93deg, rgba(0,0,0,1) 0%, rgba(61,53,53,1) 53%, rgba(255,255,255,1) 100%)")
      $('.bottomlinefoods').css("background", "linear-gradient(93deg, rgba(0,0,0,1) 0%, rgba(61,53,53,1) 53%, rgba(255,255,255,1) 100%)")
      $('.bottomlinetools').css("background", "linear-gradient(93deg, rgba(0,0,0,1) 0%, rgba(61,53,53,1) 53%, rgba(255,255,255,1) 100%)")
      $('.text1').css("color", "black")
      $('.text2').css("color", "black")
      $('.drinksmain').attr("src", "../html/img/drinksimage/Container.png")
      $('.foodsmain').attr("src", "../html/img/foodsimage/Container.png")
      $('.toolsmain').attr("src", "../html/img/foodsimage/Container.png")
      $('.totalpagetools').attr("src", "../html/img/foodsimage/BasketContainer.png")
      $('.totalpagefoods').attr("src", "../html/img/foodsimage/BasketContainer.png")
      $('.totalpage').attr("src", "../html/img/foodsimage/BasketContainer.png")
      $('.foodsbackground').attr("src", "../html/img/foodsimage/FoodsMainContainer.png")
      $('#toolsbackground').attr("src", "../html/img/toolsimage/ToolsContainer.png")
      $('.drinksbackground').attr("src", "../html/img/drinksimage/DrinksTabContainer.png")
      $('.market-item').css("background-color", "white")
      $('.market-itemfoods').css("background-color", "white")
      $('.market-itemtools').css("background-color", "white")
      $('.cashbuttontools').attr("src", "../html/img/drinksimage/PayWithCashButton.png")
      $('.walleticontools').attr("src", "../html/img/drinksimage/CC_Container.png")
      $('.bankicontools').attr("src", "../html/img/drinksimage/Wallet_Container.png")
      
      $('.cashbuttonfoods').attr("src", "../html/img/drinksimage/PayWithCashButton.png")
      $('.walleticonfoods').attr("src", "../html/img/drinksimage/CC_Container.png")
      $('.bankiconfoods').attr("src", "../html/img/drinksimage/Wallet_Container.png")
      
      $('.bankbuttontools').attr("src", "../html/img/drinksimage/PayWithCreditCardButton.png")
      $('.bankbuttonfoods').attr("src", "../html/img/drinksimage/PayWithCreditCardButton.png")
      $('.bankbutton').attr("src", "../html/img/drinksimage/PayWithCreditCardButton.png")
      $('.cashbutton').attr("src", "../html/img/drinksimage/PayWithCashButton.png")
      $('.walleticon').attr("src", "../html/img/drinksimage/CC_Container.png")
      $('.bankicon').attr("src", "../html/img/drinksimage/Wallet_Container.png")
      $('.bottom-buttons').css("background-color", "white")
      $('.bottom-buttonsfoods').css("background-color", "#ff7e00")
      $('.bottom-buttonstools').css("background-color", "#de1c23")
      $('.bottom-buttonstools').css("color", "white")
      $('.bottom-buttonsfoods').css("color", "white")
      $('.bottom-buttons').css("color", "#6cba89")

      $('.price-container').css("background-color", "white")
      $('.price-containerfoods').css("background-color", "white")
      $('.price-containertools').css("background-color", "#de1c23")

      $('.add-button').css("background-color", "white")
      $('.add-buttonfoods').css("background-color", "#ff7e00")
      $('.add-buttontools').css("background-color", "#de1c23")

      $('.add-button').css("color", "#6cba89")
      $('.add-buttonfoods').css("color", "white")
      $('.add-buttonfoods i').css("color", "white")
      $('.add-buttontools i').css("color", "white")

      $('.add-buttontools').css("color", "#6cba89")
      $('.item-name').css("color", "#16676e")
      $('.item-namefoods').css("color", "#ff7e00")
      $('.item-nametools').css("color", "#de1c23")
      
      $('.maintext').css("color", "rgb(82, 213, 87)")
      $('.maintextfoods').css("color", "#ff7e00")
      $('.maintexttools').css("color", "rgb(206, 44, 44)")
      $('.add-buttontools').css("color", "#6cba89")
      $('.add-buttonfoods').css("color", "#6cba89")
      $('.add-button').css("color", "#6cba89")


      $('.totaltext1').css("color", "black")
      $('.totaltext2').css("color", "black")
      $('.totaltext3').css("color", "black")
      $('.totaltext4').css("color", "black")

      $('.totaltext1foods').css("color", "black")
      $('.totaltext2foods').css("color", "black")
      $('.totaltext3foods').css("color", "black")
      $('.totaltext4foods').css("color", "black")

      
      $('.totaltext1tools').css("color", "black")
      $('.totaltext2tools').css("color", "black")
      $('.totaltext3tools').css("color", "black")
      $('.totaltext4tools').css("color", "black")

      $('.seciliitem').css("color", "black")
      $('.seciliitemfoods').css("color", "black")
      $('.seciliitemtools').css("color", "black")
      $('.price-container').css("color", "white")
      $('.price-containerfoods').css("color", "white")
      $('.price-containertools').css("color", "white")
      $('.close').attr("src", "../html/img/Close-Button.png")
      $('.backbutton').attr("src", "../html/img/Back_Button.png")
      $('.backbuttontools').attr("src", "../html/img/Back_Button.png")
      $('.backbuttonfoods').attr("src", "../html/img/Back_Button.png")
      
      $('.drinkstab').attr("src", "../html/img/Drinks-Tab.png")
      $('.foodstab').attr("src", "../html/img/Foods-Tab.png")
      $('.toolstab').attr("src", "../html/img/Tools-Tab.png")

      $('.shopnowdrinks').attr("src", "../html/img/shop-now-drinks.png")
      $('.shopnowfoods').attr("src", "../html/img/shop-now-foods.png")
      $('.shopnowtools').attr("src", "../html/img/shop-now-tools.png")


      $('.drinkstext').css("color", "rgb(82, 213, 87)")
      $('.foodstext').css("color", "rgb(223, 120, 23)")
      $('.toolstext').css("color", "rgb(206, 44, 44)")
      $('.shopnowdrinks').css("display", "block")
      $('.shopnowfoods').css("display", "block")
      $('.shopnowtools').css("display", "block")
    }else if(currentShop === "liquorshop"){
      $('.bottomtop').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(66,0,0,1) 100%)")
      $('.bottomtopfoods').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(66,0,0,1) 100%)")
      $('.bottomtoptools').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(66,0,0,1) 100%)")
      $('.bottomline').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(66,0,0,1) 100%)")
      $('.bottomlinefoods').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(66,0,0,1) 100%)")
      $('.bottomlinetools').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(66,0,0,1) 100%)")
      $('.marketlogo').css("display", "none")
      $('.marketbackgroud').attr("src", "./img/liquor/Main-Container.png")
      $('.background').css("background-image", "url(./img/liquor/Main-Container.png)")
      $('.text1').css("color", "white")
      $('.text2').css("color", "white")
      $('.drinksmain').attr("src", "./img/liquor/Main-Container.png")
      $('.foodsmain').attr("src", "./img/liquor/Main-Container.png")
      $('.toolsmain').attr("src", "./img/liquor/Main-Container.png")
      $('.totalpagetools').attr("src", "./img/liquor/Basket-Container.png")
      $('.totalpagefoods').attr("src", "./img/liquor/Basket-Container.png")
      $('.totalpage').attr("src", "./img/liquor/Basket-Container.png")
      $('.foodsbackground').attr("src", "./img/liquor/DrinksFoodTools-Container.png")
      $('.drinksbackground').attr("src", "./img/liquor/DrinksFoodTools-Container.png")
      $('#toolsbackground').attr("src", "./img/liquor/DrinksFoodTools-Container.png")
      $('.market-item').css("background-color", "#5b0000")
      $('.market-itemfoods').css("background-color", "#5b0000")
      $('.market-itemtools').css("background-color", "#5b0000")
      $('.cashbuttontools').attr("src", "./img/liquor/Pay-With-Cash.png")
      $('.bankbuttontools').attr("src", "./img/liquor/Pay_With_credit.png")
      $('.walleticontools').attr("src", "./img/liquor/CC-Container.png")
      $('.bankicontools').attr("src", "./img/liquor/Wallet-Container.png")
      $('.cashbuttonfoods').attr("src", "./img/liquor/Pay-With-Cash.png")
      $('.bankbuttonfoods').attr("src", "./img/liquor/Pay_With_credit.png")
      $('.walleticonfoods').attr("src", "./img/liquor/CC-Container.png")
      $('.bankiconfoods').attr("src", "./img/liquor/Wallet-Container.png")
      $('.cashbutton').attr("src", "./img/liquor/Pay-With-Cash.png")
      $('.bankbutton').attr("src", "./img/liquor/Pay_With_credit.png")
      $('.walleticon').attr("src", "./img/liquor/CC-Container.png")
      $('.bankicon').attr("src", "./img/liquor/Wallet-Container.png")

      $('.backbutton').attr("src", "./img/liquor/Back-Button.png")
      $('.backbuttontools').attr("src", "./img/liquor/Back-Button.png")
      $('.backbuttonfoods').attr("src", "./img/liquor/Back-Button.png")


      $('.bottom-buttonstools').css("color", "black")
      $('.bottom-buttonsfoods').css("color", "black")
      $('.bottom-buttons').css("color", "black")
      $('.bottom-buttons').css("background-color", "white")
      $('.bottom-buttonsfoods').css("background-color", "white")
      $('.bottom-buttonstools').css("background-color", "white")
      $('.price-container').css("background-color", "white")
      $('.price-containerfoods').css("background-color", "white")
      $('.price-containertools').css("background-color", "white")
      $('.price-container').css("color", "black")
      $('.price-containerfoods').css("color", "black")
      $('.price-containertools').css("color", "black")
      $('.add-button').css("background-color", "white")
      $('.add-buttonfoods').css("background-color", "white")
      $('.add-buttontools').css("background-color", "white")

      $('.add-button').css("color", "black")
      $('.add-buttonfoods').css("color", "black")
      $('.add-buttontools').css("color", "black")
      $('.item-name').css("color", "white")
      $('.item-namefoods').css("color", "white")
      $('.item-nametools').css("color", "white")
      $('.maintext').css("color", "white")
      $('.maintextfoods').css("color", "white")
      $('.maintexttools').css("color", "white")

      $('.totaltext1').css("color", "white")
      $('.totaltext2').css("color", "white")
      $('.totaltext3').css("color", "white")
      $('.totaltext4').css("color", "white")

      $('.totaltext1foods').css("color", "white")
      $('.totaltext2foods').css("color", "white")
      $('.totaltext3foods').css("color", "white")
      $('.totaltext4foods').css("color", "white")

      
      $('.totaltext1tools').css("color", "white")
      $('.totaltext2tools').css("color", "white")
      $('.totaltext3tools').css("color", "white")
      $('.totaltext4tools').css("color", "white")

      $('.seciliitem').css("color", "white")
      $('.seciliitemfoods').css("color", "white")
      $('.seciliitemtools').css("color", "white")

      
      $('.add-buttontools').css("color", "black")
      $('.add-buttonfoods').css("color", "black")
      $('.add-button').css("color", "black")

      $('.close').attr("src", "./img/liquor/Exit-Button.png")

      $('.drinkstab').attr("src", "./img/liquor/Drinks-Container.png")
      $('.foodstab').attr("src", "./img/liquor/Foods-Container.png")
      $('.toolstab').attr("src", "./img/liquor/Tools-Container.png")

      $('.shopnowdrinks').attr("src", "./img/liquor/DrinksShopNow-Button.png")
      $('.shopnowfoods').attr("src", "./img/liquor/FoodsShopNow-Button.png")
      $('.shopnowtools').attr("src", "./img/liquor/ToolsShopNow-Button.png")

      $('.drinkstext').css("color", "#dfcaca")
      $('.foodstext').css("color", "#db4545")
      $('.toolstext').css("color", "#3d3d3d")
      $('.shopnowdrinks').css("display", "block")
      $('.shopnowfoods').css("display", "block")
      $('.shopnowtools').css("display", "block")
    }else if(currentShop === "ltd"){
      $('.marketlogo').css("display", "none")
      $('.marketbackgroud').attr("src", "./img/ltdmarket/Main-Container.png")
      $('.background').css("background-image", "url(./img/ltdmarket/Main-Container.png)")
      $('.text1').css("color", "white")
      $('.text2').css("color", "white")
      $('.backbutton').attr("src", "./img/ltdmarket/Back-Button.png")
      $('.backbuttontools').attr("src", "./img/ltdmarket/Back-Button.png")
      $('.backbuttonfoods').attr("src", "./img/ltdmarket/Back-Button.png")
      $('.bottomtop').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(35,41,89,1) 100%)")
      $('.bottomtopfoods').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(35,41,89,1) 100%)")
      $('.bottomtoptools').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(35,41,89,1) 100%)")
      $('.bottomline').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(35,41,89,1) 100%)")
      $('.bottomlinefoods').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(35,41,89,1) 100%)")
      $('.bottomlinetools').css("background", "linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(35,41,89,1) 100%)")
      $('.drinksmain').attr("src", "./img/ltdmarket/Main-Container.png")
      $('.foodsmain').attr("src", "./img/ltdmarket/Main-Container.png")
      $('.toolsmain').attr("src", "./img/ltdmarket/Main-Container.png")
      $('.totalpagetools').attr("src", "./img/ltdmarket/Basket-Container.png")
      $('.totalpagefoods').attr("src", "./img/ltdmarket/Basket-Container.png")
      $('.totalpage').attr("src", "./img/ltdmarket/Basket-Container.png")
      $('.foodsbackground').attr("src", "./img/ltdmarket/Drinks-Foods-Tools-Container.png")
      $('#toolsbackground').attr("src", "./img/ltdmarket/Drinks-Foods-Tools-Container.png")
      $('.drinksbackground').attr("src", "./img/ltdmarket/Drinks-Foods-Tools-Container.png")
      $('.market-item').css("background-color", "#230855")
      $('.market-itemfoods').css("background-color", "#230855")
      $('.market-itemtools').css("background-color", "#230855")
      $('.cashbuttontools').attr("src", "./img/ltdmarket/Pay-With-Cash.png")
      $('.bankbuttontools').attr("src", "./img/ltdmarket/Pay_With_Credit_Card.png")
      $('.walleticontools').attr("src", "./img/ltdmarket/CC-Container.png")
      $('.bankicontools').attr("src", "./img/ltdmarket/Wallet-Container.png")
      $('.cashbuttonfoods').attr("src", "./img/ltdmarket/Pay-With-Cash.png")
      $('.bankbuttonfoods').attr("src", "./img/ltdmarket/Pay_With_Credit_Card.png")
      $('.walleticonfoods').attr("src", "./img/ltdmarket/CC-Container.png")
      $('.bankiconfoods').attr("src", "./img/ltdmarket/Wallet-Container.png")
      $('.cashbutton').attr("src", "./img/ltdmarket/Pay-With-Cash.png")
      $('.bankbutton').attr("src", "./img/ltdmarket/Pay_With_Credit_Card.png")
      $('.walleticon').attr("src", "./img/ltdmarket/Wallet-Container.png")
      $('.bankicon').attr("src", "./img/ltdmarket/CC-Container.png")
      $('.price-container').css("color", "white")
      $('.price-containerfoods').css("color", "white")
      $('.price-containertools').css("color", "white")
     
     
      $('.bottom-buttonstools').css("color", "white")
      $('.bottom-buttonsfoods').css("color", "white")
      $('.bottom-buttons').css("color", "white")
      $('.bottom-buttons').css("background-color", "red")
      $('.bottom-buttonsfoods').css("background-color", "red")
      $('.bottom-buttonstools').css("background-color", "red")
      $('.price-container').css("background-color", "red")
      $('.price-containerfoods').css("background-color", "red")
      $('.price-containertools').css("background-color", "red")

      $('.add-button').css("background-color", "red")
      $('.add-buttonfoods').css("background-color", "red")
      $('.add-buttontools').css("background-color", "red")

      $('.add-button').css("color", "white")
      $('.add-buttonfoods').css("color", "white")
      $('.add-buttontools').css("color", "white")
      $('.item-name').css("color", "white")
      $('.item-namefoods').css("color", "white")
      $('.item-nametools').css("color", "white")
      $('.maintext').css("color", "white")
      $('.maintextfoods').css("color", "white")
      $('.maintexttools').css("color", "white")

      $('.totaltext1').css("color", "white")
      $('.totaltext2').css("color", "white")
      $('.totaltext3').css("color", "white")
      $('.totaltext4').css("color", "white")

      $('.totaltext1foods').css("color", "white")
      $('.totaltext2foods').css("color", "white")
      $('.totaltext3foods').css("color", "white")
      $('.totaltext4foods').css("color", "white")

      
      $('.totaltext1tools').css("color", "white")
      $('.totaltext2tools').css("color", "white")
      $('.totaltext3tools').css("color", "white")
      $('.totaltext4tools').css("color", "white")
      $('.seciliitem').css("color", "white")
      $('.seciliitemfoods').css("color", "white")
      $('.seciliitemtools').css("color", "white")
      $('.add-buttontools').css("color", "white")
      $('.add-buttonfoods').css("color", "white")
      $('.add-button').css("color", "white")


      $('.drinkstab').attr("src", "./img/ltdmarket/DrinksContainer.png")
      $('.foodstab').attr("src", "./img/ltdmarket/FoodContainer.png")
      $('.toolstab').attr("src", "./img/ltdmarket/ToolsContainer.png")

      $('.shopnowdrinks').attr("src", "./img/ltdmarket/DrinksShopNowButton.png")
      $('.shopnowfoods').attr("src", "./img/ltdmarket/FoodsShopNowButton.png")
      $('.shopnowtools').attr("src", "./img/ltdmarket/ToolsShopNowButton.png")

      $('.drinkstext').css("color", "#4c5ff3")
      $('.foodstext').css("color", "#db4444")
      $('.toolstext').css("color", "#cca9a9")
      $('.shopnowdrinks').css("display", "block")
      $('.shopnowfoods').css("display", "block")
      $('.shopnowtools').css("display", "block")
      $('.close').attr("src", "./img/ltdmarket/Exit-Button.png")

    }
  }

  const RefreshList = () => {
    let text = "";

    if (currentcategory == "drinks") {
      for (i = 0; i < allItems.length; i++) {
        if (allItems[i].category == currentcategory) {
        if(allItems[i].shop == currentShop){
          text += `
          <div class="market-item">
            <div class="price-container">${allItems[i].price} $</div>
            <div class="add-button" data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}">
              <i class="fa-solid fa-plus"></i>
            </div>
            <img class="item-image" src="./item_images/${allItems[i].itemscode}.png" />
            <div class="item-name">${allItems[i].name}</div>
            <div class="bottom-buttons">
               <div class="bottom-buttons-wrapper">
                  <i data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}" class="fa-solid fa-minus removefromlist"></i>
                  <p class="amount-text">${GetAmount(allItems[i].name)}</p>
                  <i  data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}" class="fa-solid fa-plus addtolist"></i>
               </div>
            </div>
          </div>`;
        }
        }
       
      }
    } else if (currentcategory == "foods") {
      for (i = 0; i < allItems.length; i++) {
        if (allItems[i].category == "foods") {
          if(allItems[i].shop == currentShop){
          text += `
            <div class="market-itemfoods">
              <div class="price-containerfoods">${allItems[i].price} $</div>
              <div class="add-buttonfoods" data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}">
                <i class="fa-solid fa-plus"></i>
              </div>
              <img class="item-imagefoods" src="./item_images/${allItems[i].itemscode}.png" />
              <div class="item-namefoods">${allItems[i].name}</div>
              <div class="bottom-buttonsfoods">
                <div class="bottom-buttons-wrapperfoods">
                  <i  data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}" class="fa-solid fa-minus removefromlistfoods"></i>
                  <p class="amount-textfoods">${GetAmount(allItems[i].name)}</p>
                  <i  data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}" class="fa-solid fa-plus addtolistfoods"></i>
                </div>
              </div>
          </div>`;
        }
      }
      }
    } else {
      for (i = 0; i < allItems.length; i++) {
        if (allItems[i].category == "tools") {
          if(allItems[i].shop == currentShop){
          text += `
          <div class="market-itemtools">
            <div class="price-containertools">${allItems[i].price} $</div>
            <div class="add-buttontools" data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}">
               <i class="fa-solid fa-plus"></i>
            </div>
            <img class="item-imagetools" src="./item_images/${allItems[i].itemscode}.png" />
            <div class="item-nametools">${allItems[i].name}</div>
            <div class="bottom-buttonstools">
               <div class="bottom-buttons-wrappertools">
                  <i  data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}" class="fa-solid fa-minus removefromlisttools"></i>
                  <p class="amount-texttools">${GetAmount(allItems[i].name)}</p>
                  <i  data-name="${allItems[i].name}" data-item="${allItems[i].itemscode}" data-price="${allItems[i].price}" class="fa-solid fa-plus addtolisttools"></i>
               </div>
            </div>
          </div>`;
        }
      }
      }
    }

    $(".additem").html(text);
    $(".additemfoods").html(text);
    $(".additemtools").html(text);
    ChangeTheme()
  };


  const SetLocale = () =>{
    $(".mycash").text(playerCash + " " + locales["CURRENCY"].text);
    $(".mycashtools").text(playerCash + " " + locales["CURRENCY"].text);
    $(".mycashfoods").text(playerCash + " " + locales["CURRENCY"].text);
    $(".text1").text(locales["HELLO"].text+ " " +playerName)
    $(".mybank").text(playerBank + " " + locales["CURRENCY"].text);
    $(".mybanktools").text(playerBank + " " + locales["CURRENCY"].text);
    $(".mybankfoods").text(playerBank + " " + locales["CURRENCY"].text);  

    if(secilimarkets == 'liquorshop'){
      secilimarkets = 'Liquor Shop'
      $(".text2").text(locales["WELCOME"].text + " "+ secilimarkets)
    } else if (secilimarkets == 'ltd'){
      secilimarkets = 'LTD GASOLINE'
      $(".text2").text(locales["WELCOME"].text + " "+ secilimarkets)
    }else{
      $(".text2").text(locales["WELCOME"].text + " 24/7 Supermarket")
    }
    
    $('.maintextfoods').text(locales["FOODS"].text)
    $('.maintext').text(locales["DRINKS"].text)
    $('.maintexttools').text(locales["TOOLS"].text)

    $('.drinkstext').text(locales["DRINKS"].text)
    $('.foodstext').text(locales["FOODS"].text)
    $('.toolstext').text(locales["TOOLS"].text)
    $('.shopnow').text(locales["SHOP_NOW"].text)
    $('.shopnow1').text(locales["SHOP_NOW"].text)
    $('.shopnow2').text(locales["SHOP_NOW"].text)
    $('.totaltext1').text(locales["MY_CART"].text)
    $('.totaltext1tools').text(locales["MY_CART"].text)
    $('.totaltext1foods').text(locales["MY_CART"].text)

    $('.totaltext2').text(locales["TOTAL"].text)
    $('.paytext').text(locales["PAY_WITH_CASH"].text)
    $('.paytext2').text(locales["PAY_WITH_CREDIT_CARD"].text)
    $('.paytextfoods').text(locales["PAY_WITH_CASH"].text)
    $('.paytext2foods').text(locales["PAY_WITH_CREDIT_CARD"].text)
    $('.paytexttools').text(locales["PAY_WITH_CASH"].text)
    $('.paytext2tools').text(locales["PAY_WITH_CREDIT_CARD"].text)
  }
  let secilimarkets = null;
  window.addEventListener("message", function (event) {
    var item = event.data;
    switch (item.type) {
      case "SET_CURRENT_SHOP":
        currentShop = item.shop;
        secilimarkets = item.shop;
        if(secilimarkets == 'liquorshop'){
          secilimarkets = 'Liquor Shop'
          $(".text2").text('Welcome to '+ secilimarkets)
        } else if (secilimarkets == 'ltd'){
          secilimarkets = 'LTD GASOLINE'
          $(".text2").text('Welcome to '+ secilimarkets)
        }else{
          $(".text2").text('Welcome to 24/7 Supermarket')
        }
        ChangeTheme()
        break;
      case "SET_DATA":
        $(".generalpage").css("display", "block");
        $(".drinkspage").css("display", "none");
        $(".foodspage").css("display", "none");
        $(".toolspage").css("display", "none");
        $('.background').css("display", "block");
        $(".shopnow").on("click", function () {
          $(".generalpage").css("display", "none");
          $(".drinkspage").css("display", "block");
          currentcategory = "drinks";
          $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
          RefreshList();
          
        });
        $(".shopnow1").on("click", function () {
          $(".generalpage").css("display", "none");
          $(".drinkspage").css("display", "none");
          $(".foodspage").css("display", "block");

          currentcategory = "foods";
          $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
          RefreshList();
        });
        $(".shopnow2").on("click", function () {
          $(".generalpage").css("display", "none");
          $(".drinkspage").css("display", "none");
          $(".foodspage").css("display", "none");
          $(".toolspage").css("display", "block");

          currentcategory = "tools";
          $.post("https://codem-market/PlayDropSound", JSON.stringify({}));
          RefreshList();
        });

        allItems = event.data.item;
        locales = event.data.locales
        SetLocale()
        break;
      case "SET_MONEY":      
        playerBank = event.data.bank;
        playerCash = event.data.money;
        playerName = event.data.name;
        SetLocale()
        break;  
      default:
        break;
    }
  });
});