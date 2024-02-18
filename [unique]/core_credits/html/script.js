var od;

var odds = {
  'import': 0.998,
  'common': 0.50,
  'supercommon': 0.2,
  'rare': 0.92,
  'superrare': 0.97
};

var credits = 0;
var shopCategories;
var shopItems;
var tasks;
var defaultCategory;
var caseItems;
var betAmount;
var winnings;
var taskProgress;
var name;

var animation;

var citizenid;

var description;
var header;

var lowestExchange = 0;
var highestExchange = 0;

var removableItem;

let isActionInProgress = false;


function closeMenu() {
  $.post('https://core_credits/close', JSON.stringify({}));


  $("#main_container").fadeOut(400);
  timeout = setTimeout(function () {
    $("#main_container").html("");
    $("#main_container").fadeIn();
  }, 400);


}

function cancelAreYouSure() {
  $("#sure_gradient").fadeOut();

  setTimeout(function () {

    $("#sure_gradient").remove();
    $("#sure_gradient").fadeIn(1);


  }, 500);
}

function buyItem(item) {
  $("#sure_gradient").fadeOut();

  setTimeout(function () {

    $("#sure_gradient").remove();
    $("#sure_gradient").fadeIn(1);


  }, 500);
  $.post('https://core_credits/buyItem', JSON.stringify({
    item: item
  }));
}

function openAreYouSure(item) {


  var base = '<div id="sure_gradient" class="slide-right">' +
    '   <div class="clearfix colelem" id="u138-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>ARE YOU SURE?</p>' +
    '   </div>' +
    '<div id="sure_confirm" onclick="buyItem(\'' + item + '\')" class="ripple">CONFIRM</div>' +
    '<div id="sure_cancel" onclick="cancelAreYouSure()" class="ripple">CANCEL</div>' +
    '<div>';

  $('#entry').append(base)

}

function redeem(item) {

  $.post('https://core_credits/redeem', JSON.stringify({
    item: item
  }));
  $(removableItem).fadeOut();
  cancelAreYouSure();

}

function exchange(item) {
  $.post('https://core_credits/exchange', JSON.stringify({
    item: item
  }));
  $(removableItem).fadeOut();
  cancelAreYouSure();
}


function winningChoose(item, t) {


  var base = '<div id="sure_gradient" class="slide-right">' +
    '   <div class="clearfix colelem" id="u138-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>CHOOSE</p>' +
    '   </div>' +
    '<div id="sure_redeem" onclick="redeem(\'' + item + '\')" class="ripple">REDEEM</div>' +
    '<div id="sure_exchange" onclick="exchange(\'' + item + '\')" class="ripple">EXCHANGE</div>' +
    '<div id="sure_close" onclick="cancelAreYouSure()" class="ripple">CLOSE</div>' +
    '<div>';

  removableItem = t;

  $('#entry').append(base)

}


function openShopCategory(category) {

  playClickSound();
  $("#entry").html('');

  var base = '';
  for (const [key, value] of Object.entries(shopItems)) {

    if (value.category == category) {
      base = base + '<div id="shop_item" onclick="openAreYouSure(\'' + key + '\')" class="scale-up-center item">' +
        '<div id="shop_gradient"></div>' +
        '     <img class="block" id="u124_img" src="img/creditcoin.png" alt="" width="35" height="35"/>' +
        '<div id="shop_img" style=" background:transparent url(img/' + key + '.png) no-repeat center center;background-size:contain;"></div>' +
        '   <div class="clearfix colelem" id="u135-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
        '    <p>' + value.price + '</p>' +
        '   </div>' +
        '</div>';
    }


  }

  $("#entry").append(base);

}

function openShopMenu() {

  $("#main_container").html("");
  playClickSound();

  var base = '<div class="clearfix borderbox slide-right" id="creditmenu"><!-- column -->' +
    '   <div class="clearfix colelem" id="pu104"><!-- group -->' +


    '   <div class="clearfix colelem" id="u131-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>' + name + '</p>' +
    '   </div>' +


    '    <div class="clip_frame grpelem" id="u104" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- image -->' +
    '     <img class="block" id="u104_img" src="img/creditcoin.png" alt="" width="42" height="42"/>' +
    '    <div class="odometer" id="u114-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- content -->' +
    '     <p>' + credits + '</p>' +
    '    </div>' +
    '    </div>' +


    '   </div>' +
    '<div id="categories">';

  for (const [key, value] of Object.entries(shopCategories)) {

    base = base + '<div id="category" class="ripple" onclick="openShopCategory(\'' + key + '\')">' + value + '</div>';


  }

  base = base + '</div>' +
    '<div id="entry">';

  for (const [key, value] of Object.entries(shopItems)) {

    if (value.category == defaultCategory) {
      base = base + '<div id="shop_item" onclick="openAreYouSure(\'' + key + '\')" class="item">' +
        '<div id="shop_gradient"></div>' +
        '     <img class="block" id="u124_img" src="img/creditcoin.png" alt="" width="35" height="35"/>' +
        '<div id="shop_img" style=" background:transparent url(img/' + key + '.png) no-repeat center center;background-size:contain;"></div>' +
        '   <div class="clearfix colelem" id="u135-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
        '    <p>' + value.price + '</p>' +
        '   </div>' +
        '</div>';
    }


  }


  base = base + '</div>' +
    '  </div>';

  $('#main_container').append(base)


  var el = document.querySelector('.odometer');

  od = new Odometer({
    el: el,
    value: credits,
    format: '',
    theme: ''
  });

  $(".item").mouseover(function () {
    playClickSound();
  });


}


function openTasks() {

  $("#main_container").html("");
  playClickSound();

  $.post('https://core_credits/openedTasks', JSON.stringify({}));

  var base = '<div class="clearfix borderbox slide-right" id="creditmenu"><!-- column -->' +
    '   <div class="clearfix colelem" id="pu104"><!-- group -->' +


    '   <div class="clearfix colelem" id="u131-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>' + name + '</p>' +
    '   </div>' +


    '    <div class="clip_frame grpelem" id="u104" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- image -->' +
    '     <img class="block" id="u104_img" src="img/creditcoin.png" alt="" width="42" height="42"/>' +
    '    <div class="odometer" id="u114-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- content -->' +
    '     ' + credits + '' +
    '    </div>' +
    '    </div>' +


    '   </div>' +

    '<div id="entry2">';

  for (i = 0; i < Object.keys(tasks).length; i++) {


    if (taskProgress[tasks[i].type] == null) {
      taskProgress[tasks[i].type] = 0;
    }

    var percent = 860 * (taskProgress[tasks[i].type] / tasks[i].value);

    if (percent > 860) {
      percent = 860;
    }

    base = base + '<div id="task_box">' +
      '<div id="task_box_progress" style="width: ' + percent + 'px;"></div>' +
      '     <img class="" id="u125_img" src="img/creditcoin.png" alt="" width="35" height="35"/>' +
      '   <div class="clearfix colelem" id="u137-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
      '    <p>' + tasks[i].reward + ' - ' + tasks[i].description + '</p>' +
      '   </div>' +

      '   <div class="clearfix colelem" id="u136-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
      '    <p>' + Math.round(taskProgress[tasks[i].type] * 10) / 10 + '/' + tasks[i].value + '</p>' +
      '   </div>' +
      '</div>';

  }


  base = base + '</div>' +
    '  </div>';

  $('#main_container').append(base)

  var el = document.querySelector('.odometer');
  od = new Odometer({
    el: el,
    value: credits,
    format: '',
    theme: ''
  });

  $(".item").mouseover(function () {
    playClickSound();
  });


}

function openCreditMenu() {


  var base = '<div class="clearfix borderbox slide-right" id="creditmenu"><!-- column -->' +

    '   <div class="clearfix colelem" id="pu104"><!-- group -->' +


    '   <div class="clearfix colelem" id="u131-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>' + name + '</p>' +
    '   </div>' +


    '    <div class="clip_frame grpelem" id="u104" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- image -->' +
    '     <img class="block" id="u104_img" src="img/creditcoin.png" alt="" width="42" height="42"/>' +
    '    <div class="odometer" id="u114-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- content -->' +
    '     <p>0</p>' +
    '    </div>' +
    '    </div>' +


    '   </div>' +


    '   <div class="clearfix colelem " id="pu118"><!-- group -->' +
    '    <div class="clearfix grpelem box" onclick="openTasks()" id="u122"><!-- group -->' +
    '     <div class="gradient clearfix grpelem" id="u184"><!-- group -->' +
    '      <div class="clearfix grpelem" id="u185-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '       <p>TASKS</p>' +
    '      </div>' +
    '     </div>' +
    '    </div>' +
    '    <div class="grpelem box" onclick="openCaseOpening()" id="u118" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu118"><!-- simple frame -->' +
    '    <div class="gradient clearfix grpelem" id="u142"><!-- group -->' +

    '     <div class="clearfix grpelem" id="u145-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '      <p>CASE OPENING</p>' +
    '     </div>' +
    '    </div>' +
    '</div>' +
    '   </div>' +
    '   <div class="clearfix colelem" id="pu125"><!-- group -->' +
    '    <div class="clearfix grpelem box" onclick="openShopMenu()"  id="u125"><!-- group -->' +
    '     <div class="gradient clearfix grpelem" id="u156"><!-- group -->' +
    '      <div class="clearfix grpelem" id="u159-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '       <p>SHOP</p>' +
    '      </div>' +
    '     </div>' +
    '    </div>' +
    '    <div class="clearfix grpelem box" onclick="openBuy()" id="u128"><!-- group -->' +
    '     <div class="gradient clearfix grpelem " id="u170"><!-- group -->' +
    '      <div class="clearfix grpelem" id="u171-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '       <p>BUY CREDITS</p>' +
    '      </div>' +
    '     </div>' +
    '    </div>' +
    '   </div>' +
    '   <div class="verticalspacer" data-offset-top="0" data-content-above-spacer="814" data-content-below-spacer="263" data-sizePolicy="fixed" data-pintopage="page_fixedLeft"></div>' +
    '  </div>';

  $('#main_container').append(base)

  var el = document.querySelector('.odometer');

  od = new Odometer({
    el: el,
    value: 0,
    format: '',
    theme: ''
  });

  od.update(credits);


  $(".box").mouseover(function () {
    playClickSound();
  });

}

function clearValue() {
  $("#input_credits").val('');
}

function multiplyValue(x) {
  let value = $("#input_credits").val();
  if (value == null || value == undefined || !parseInt(value)) {
    value = 1;
  }
  else {
    value = parseInt(value);
  }
  $("#input_credits").val(value * x);
}

function chooseRandom(rarity) {

  var id = 0;
  var chosen = [];
  for (const [key, value] of Object.entries(caseItems)) {
    if (value.rarity == rarity) {
      chosen[id] = key;
      id = id + 1;
    }
  }

  var rand = Math.floor(Math.random() * (id));

  return chosen[rand];
}

function openCaseOpening() {

  $("#main_container").html("");
  playClickSound();


  var base = '<div class="clearfix borderbox slide-right" id="creditmenu"><!-- column -->' +
    '   <div class="clearfix colelem" id="pu104"><!-- group -->' +

    '   <div class="clearfix colelem" id="u131-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>' + name + '</p>' +
    '   </div>' +


    '    <div class="clip_frame grpelem" id="u104" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- image -->' +
    '     <img class="block" id="u104_img" src="img/creditcoin.png" alt="" width="42" height="42"/>' +
    '    <div class="odometer" id="u114-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- content -->' +
    '     ' + credits + '' +
    '    </div>' +
    '    </div>' +


    '   </div>' +

    '<div id="categories">' +

    '<div id="category" class="ripple" onclick="openCaseOpening()">CASE OPENING</div>' +
    '<div id="category" class="ripple" onclick="openWinnings()">WINNING</div>' +


    '</div>' +

    '<div id="caseopening">' +

    '<div id="triangle"></div>' +
    '  <div class="spinner" id="spinnerContainer">' +
    '    <ul class="spinner-items" id="spinnerList">';

  for (const [key, value] of Object.entries(caseItems)) {


    base = base + '      <li class="spinner-items__item spinner_' + caseItems[key].rarity + '" data-item="' + key + '" style=" background: url(img/' + key + '.png) no-repeat center center;background-size:130%;" id="4"></li>';

  }


  base = base + '    </ul>' +
    '    <div class="spinner__marker" id="spinnerMarker"> </div>' +
    '    <div class="spinner__marker_2" id="spinnerMarker"> </div>' +
    '  </div>' +
    '<div id="bettingoptions">BETTING OPTIONS</div>' +
    '<input id="input_credits" type="number">' +
    '    <img class="block" id="u105_img" src="img/creditcoin.png" alt="" width="42" height="42"/>' +
    '</input> ' +
    '<div class="button ripple" id="startSpinner">OPEN</div>' +
    '<div class="button2 ripple" onclick="multiplyValue(2)">x2</div>' +
    '<div class="button3 ripple" onclick="multiplyValue(3)">x3</div>' +
    '<div class="button4 ripple" onclick="multiplyValue(5)">x5</div>' +
    '<div class="button5 ripple" onclick="clearValue()">CLEAR</div>' +
    '</div>' +

    '</div>';


  $('#main_container').append(base)

  var el = document.querySelector('.odometer');

  od = new Odometer({
    el: el,
    value: credits,
    format: '',
    theme: ''
  });


  var id = 0;


  for (const [key, value] of Object.entries(caseItems)) {

    if (value.exchange > highestExchange) {
      highestExchange = value.exchange;
    }


  }


  const startSpinnerBtn = document.getElementById("startSpinner");

  animation = new SpinnerAnimation({
    container: "spinnerContainer",
    list: "spinnerList"
  });


  startSpinnerBtn.addEventListener("click", (e) => {

    if (animation.started == "ready") {
      return;
    }
    closeItemWon();
    isActionInProgress = true;
    $('.ripple').addClass('button-disable');

    betAmount = parseInt($("#input_credits").val());

    if (isNaN(parseInt($("#input_credits").val())) || animation.started || parseInt($("#input_credits").val()) > credits || parseInt($("#input_credits").val()) <= 0) {
      isActionInProgress = false;
      $('.ripple').removeClass('button-disable');
      return;
    }
    if (betAmount < lowestExchange) {

      $.post('https://core_credits/sendMessage', JSON.stringify({
        message: 'bet_limit'
      }));
      isActionInProgress = false;
      $('.ripple').removeClass('button-disable');
      return;
    }
    credits = credits - parseInt($("#input_credits").val());

    od.update(credits)
    $.post('https://core_credits/removeCredits', JSON.stringify({
      credits: parseInt($("#input_credits").val())
    }));

    $('#spinnerList').html('');

    for (i = 0; i < 100; i++) {
      if (Math.random() > (odds['import'] - ((betAmount / highestExchange)) / 3) && Object.entries(caseItems).some(([_, value]) => value.rarity === 'import')) {

        var chosen = chooseRandom('import')

        $('#spinnerList').append('      <li class="spinner-items__item spinner_import" data-item="' + chosen + '" style=" background: url(img/' + chosen + '.png) no-repeat center center;background-size:130%;" id="4"></li>');
      } else if (Math.random() > (odds['superrare'] - ((betAmount / highestExchange)) / 3) && Object.entries(caseItems).some(([_, value]) => value.rarity === 'superrare')) {

        var chosen = chooseRandom('superrare')
        $('#spinnerList').append('      <li class="spinner-items__item spinner_superrare" data-item="' + chosen + '" style=" background: url(img/' + chosen + '.png) no-repeat center center;background-size:130%;" id="4"></li>');

      } else if (Math.random() > (odds['rare'] - ((betAmount / highestExchange)) / 3) && Object.entries(caseItems).some(([_, value]) => value.rarity === 'rare')) {

        var chosen = chooseRandom('rare')
        $('#spinnerList').append('      <li class="spinner-items__item spinner_rare" data-item="' + chosen + '" style=" background: url(img/' + chosen + '.png) no-repeat center center;background-size:130%;" id="4"></li>');

      } else if (Math.random() > (odds['common'] - ((betAmount / highestExchange)) / 3) && Object.entries(caseItems).some(([_, value]) => value.rarity === 'common')) {

        var chosen = chooseRandom('common')
        $('#spinnerList').append('      <li class="spinner-items__item spinner_common" data-item="' + chosen + '" style=" background: url(img/' + chosen + '.png) no-repeat center center;background-size:130%;" id="4"></li>');

      } else if (Math.random() > (odds['supercommon'] - ((betAmount / highestExchange)) / 3) && Object.entries(caseItems).some(([_, value]) => value.rarity === 'supercommon')) {

        var chosen = chooseRandom('supercommon')
        $('#spinnerList').append('      <li class="spinner-items__item spinner_supercommon" data-item="' + chosen + '" style=" background: url(img/' + chosen + '.png) no-repeat center center;background-size:130%;" id="4"></li>');
      }
    }

    animation.reset();
    animation.start();
  });


}


function closeItemWon() {
  $("#win_gradient").fadeOut();

  setTimeout(function () {

    $("#win_gradient").remove();
    $("#win_gradient").fadeIn();


  }, 500);


}

function itemWon(win) {

  //credits = credits + caseItems[win].exchange;
  //od.update(credits);
  isActionInProgress = false;
  $('.ripple').removeClass('button-disable');
  $.post('https://core_credits/addWinning', JSON.stringify({
    item: win
  }));


  setTimeout(function () {

    var base = '<div id="win_gradient" class="slide-right">' +
      '   <div class="clearfix colelem" id="u138-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
      '    <p>OPENED</p>' +
      '   </div>' +
      '<div id="win_image" style=" background: url(img/' + win + '.png) no-repeat center center;background-size:130%;"> </div>' +
      '<div id="win_confirm" onclick="closeItemWon()" class="ripple">CLOSE</div>' +
      '<div>';

    $('#caseopening').append(base)


  }, 500);


}

function openWeb() {

  window.invokeNative('openUrl', 'https://' + header);

}

function openBuy() {

  $("#main_container").html("");
  playClickSound();

  var base = '<div class="clearfix borderbox slide-right" id="creditmenu"><!-- column -->' +

    '   <div class="clearfix colelem" id="pu104"><!-- group -->' +

    '   <div class="clearfix colelem" id="u131-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>' + name + '</p>' +
    '   </div>' +


    '    <div class="clip_frame grpelem" id="u104" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- image -->' +
    '     <img class="block" id="u104_img" src="img/creditcoin.png" alt="" width="42" height="42"/>' +
    '    <div class="odometer" id="u114-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- content -->' +
    '     ' + credits + '' +
    '    </div>' +
    '    </div>' +


    '   </div>' +


    '<div id="buy_headder">' + header + '</div>' +
    '<div id="buy_citizenid">ID: ' + citizenid + '</div>' +
    '<div id="buy_line"></div>' +
    '<div id="buy_description">' + description + '</div>' +
    '<div id="buy_button" onclick="openWeb()" class="ripple">VISIT STORE</div>' +


    '</div>';


  $('#main_container').append(base)
  var el = document.querySelector('.odometer');
  od = new Odometer({
    el: el,
    value: credits,
    format: '',
    theme: ''
  });


}

function openWinnings() {

  if (animation.started) {
    return;
  }

  $("#main_container").html("");
  playClickSound();

  var base = '<div class="clearfix borderbox slide-right" id="creditmenu"><!-- column -->' +

    '   <div class="clearfix colelem" id="pu104"><!-- group -->' +

    '   <div class="clearfix colelem" id="u131-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
    '    <p>' + name + '</p>' +
    '   </div>' +


    '    <div class="clip_frame grpelem" id="u104" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- image -->' +
    '     <img class="block" id="u104_img" src="img/creditcoin.png" alt="" width="42" height="42"/>' +
    '    <div class="odometer" id="u114-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter" data-leftAdjustmentDoneBy="pu104"><!-- content -->' +
    '     ' + credits + '' +
    '    </div>' +
    '    </div>' +


    '   </div>' +

    '<div id="categories">' +

    '<div id="category" class="ripple" onclick="openCaseOpening()">CASE OPENING</div>' +
    '<div id="category" class="ripple" onclick="openWinnings()">WINNING</div>' +


    '</div>' +

    '<div id="entry">';

  for (const [key, value] of Object.entries(winnings)) {


    for (i = 0; i < winnings[key]; i++) {
      if (caseItems[key]) {
        base = base + '<div id="shop_item" onclick="winningChoose(\'' + key + '\', this)" class="item">' +
          '<div id="shop_gradient"></div>' +
          '     <img class="block" id="u124_img" src="img/creditcoin.png" alt="" width="35" height="35"/>' +
          '<div id="shop_img" style=" background:transparent url(img/' + key + '.png) no-repeat center center;background-size:contain;"></div>' +
          '   <div class="clearfix colelem" id="u135-4" data-sizePolicy="fixed" data-pintopage="page_fixedCenter"><!-- content -->' +
          '    <p>' + caseItems[key].exchange + '</p>' +
          '   </div>' +
          '</div>';
      }
    }


  }


  base = base + '</div>' +


    '</div>';


  $('#main_container').append(base)
  var el = document.querySelector('.odometer');
  od = new Odometer({
    el: el,
    value: credits,
    format: '',
    theme: ''
  });


}

function playClickSound() {
  var audio = document.getElementById("clickaudio");
  audio.volume = 0.05;
  audio.play();
}


$(document).keyup(function (e) {
  if (e.keyCode === 27 && !isActionInProgress) {
    closeMenu();
  }

});

window.addEventListener('message', function (event) {
  var edata = event.data;
  if (edata.type == "completed") {
    var audio = document.getElementById("taskcompleted");
    audio.volume = 0.05;
    audio.play();
  }
  if (edata.type == "credits") {
    credits = edata.credits;
    taskProgress = edata.task_progress;
    winnings = edata.winnings;
    od.update(credits);
  }
  if (edata.type == "open") {

    shopCategories = edata.shop_categories;
    shopItems = edata.shop_items;
    name = edata.name;
    citizenid = edata.citizenid;
    description = edata.description;
    header = edata.header;
    lowestExchange = edata.lowest_bet;
    defaultCategory = edata.shop_def;
    caseItems = edata.caseopening_items;
    tasks = edata.tasks;
    openCreditMenu();
  }


});


class SpinnerAnimation {
  constructor({
    container,
    list
  }) {
    this.tickSound = new Audio("https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-55112/zapsplat_multimedia_cell_phone_smart_screen_button_press_click_feedback_001_60930.mp3");
    this.tickSound.playbackRate = 5;

    this.winSound = new Audio("https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-46416/zapsplat_multimedia_game_sound_treasure_chest_win_thud_coins_synth_warm_001_52067.mp3");

    this.firstRound = true;

    this.reset();


    this.spinnerContainer = document.getElementById(container);
    this.spinnerList = spinnerContainer.children.namedItem(list);
    this.spinnerMarker = spinnerContainer.children.namedItem("spinnerMarker");
    this.spinnerItems = this.spinnerList.children;
    this.spinnerWon = document.getElementById("spinnerWon");
  }

  reset() {
    this.started = false;
    this.stopped = false;
    this.stopAnimation = false;
    this.lowerSpeed = 0;
    this.ticks = 0;
    this.offSet = 0;
    this.recycle = false;
    this.tick = false;
    this.state = null;
    this.speed = 0;
    this.winningItem = 0;
    this.firstRound = false;
  }

  start(speed = 2200) {
    this.started = true;
    this.speed = speed;


    this.loop();
  }

  loop() {
    let dt = 0; // Delta Time is the amount of time between two frames
    let last = 0; // Last time of frame

    // The Animation Loop
    function loop(ms) {

      if (this.recycle) {
        this.recycle = false;
        const item = spinnerList.firstElementChild;
        spinnerList.append(item);
      }

      if (this.tick) {
        this.tick = false;

        this.tickSound.play();
      }

      this.offSet += this.speed * dt;

      const ct = ms / 1500;
      dt = ct - last;
      last = ct;


      this.spinnerList.style.right = this.offSet + "px";


      if (this.offSet >= 170) {
        this.recycle = true;
        this.offSet = 0;
        this.tick = true;
        this.ticks += 1;
        if (this.ticks >= 50 && (Math.random() * 10) >= 5) {
          this.stop();
        }
      }

      if (this.stopped) {
        let stopped = false;
        if (!stopped) this.speed -= this.lowerSpeed;

        if (this.speed <= 0) {
          stopped = true;
          this.speed = 0;
        }

        if (stopped) {


          if (this.offSet >= 85.0) {
            this.offSet += 6;
          } else {
            this.offSet -= 6;
          }

          if (this.offSet >= 170 || this.offSet <= 0) {
            this.stopAnimation = true;

            this.winSound.play();

            if (this.offSet >= 170) {
              this.winningItem = 5;


              this.offSet = 170;

              this.started = false;
              itemWon(this.spinnerItems.item(5).dataset.item);
            }

            if (this.offSet <= 0) {
              this.winningItem = 4;


              this.offSet = 0;

              this.started = false;
              itemWon(this.spinnerItems.item(4).dataset.item);
            }

          }

        }
      }

      if (!this.stopAnimation) {
        requestAnimationFrame(loop);
      }
    }

    // Bind Class to loop function
    loop = loop.bind(this);
    requestAnimationFrame(loop);
  }

  stop() {
    this.stopped = true;

    // Calculate a random lower speed
    this.lowerSpeed = Math.ceil(Math.random() * 5) + 1;
  }
}