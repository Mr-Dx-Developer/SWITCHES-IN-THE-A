PlayerInGame = false
BetTimerRun = false

window.addEventListener('message', function(event) {
    let data = event.data
   
    if (data.action === "OpenBoxingMenu"){
      Areatable = data.areatable
      PlayerId = data.id
      Label = data.label
      $(`.label`).html(Label)
      showmenu("boxing_menu")
      RefreshBoxingMenu()

      if (Areatable.bet == true){
        for (let i=1; i<3; i++) {
          if (document.getElementById("player_btn"+i)){
            document.getElementById("player_btn"+i).remove()
          }
          if (document.getElementById("player_bet"+i) == undefined){
            $("#player_container"+i).append(`
            <div class="input-group input-group-lg mt-3 bet_con" style="width: 200px;">
                <input class="form-control" placeholder="AMOUNT" id="in_bet${i}"></input>
            </div>
            <button class="basic_btn px-3 mt-3" id="player_bet${i}" onclick="Bet(id)">BET</button>
            `)
          }
        }
  
        $("#start_btn").css("display", "none")
        $(`.bet_countback`).css("display", "block")
        
        function CountbackBet(){
          BetTimerRun = true
          $(`.bet_countback`).html("START IN "+Areatable.bettimer)
          setTimeout(function(){
            if (Areatable.bettimer > 0){
  
              Areatable.bettimer = Areatable.bettimer - 1 
  
              CountbackBet()
            }
            else{
              BetTimerRun = false
              $(`.bet_countback`).css("display", "none")
              $("#start_btn").css("display", "block")
            }
          },1000)
        }

        if (BetTimerRun == false){
          CountbackBet()
        }
      }
    }
    if (data.action === "OpenBoxingHud"){
      Round = data.round
      AllTime = data.time
      Player1_name = data.player1_name
      Player2_name = data.player2_name
      Player1_points = data.player1_points
      Player2_points = data.player2_points
      $(`.stat_hud #player1 .name`).html(Player1_name)
      $(`.stat_hud #player2 .name`).html(Player2_name)
      $(`.stat_hud #player1 .points`).html("POINTS "+Player1_points)
      $(`.stat_hud #player2 .points`).html("POINTS "+Player2_points)
      $(`.stat_hud .timer`).html(AllTime)
      $(`.stat_hud .round`).html("ROUND "+Round)

      showmenu("stat_hud")

      $(`.stat_hud .timer`).css("color", "rgb(117, 214, 27)")
      $(`.stat_hud .timer`).css("text-shadow", "0px 0px 7px rgb(117, 214, 27)")

      function Timer(){
        setTimeout(function(){
          if (AllTime != 0 && CountFrom == 1){
            AllTime = AllTime - 1 

            $(`.stat_hud .timer`).html(AllTime)
            
            if (AllTime < 10){
              $(`.stat_hud .timer`).css("color", "rgb(232, 69, 69)")
              $(`.stat_hud .timer`).css("text-shadow", "0px 0px 7px rgb(232, 69, 69)")
            }

            Timer()
          }
        },1000)
      }
      Timer()
    }
    if (data.action === "BoxingStats"){
      Player1_hp = data.player1_health - 20
      Player2_hp = data.player2_health - 20

      $(`.stat_hud #player1 .hp_bg .hp`).css("width", Player1_hp * (100/80)+"%")
      $(`.stat_hud #player2 .hp_bg .hp`).css("width", Player2_hp * (100/80)+"%")
    }
    if (data.action === "Countback"){
      hidemenu("stat_hud")
      CountFrom = 3
      $(`.countback`).css("display", "block")

      function Countback(){
        $(`.countback .number`).html(CountFrom)
        var el = document.getElementById("cnumber");
        el.style.animation = 'none'
        el.offsetHeight 
        el.style.animation = null
        setTimeout(function(){
          if (CountFrom != 1){

            CountFrom = CountFrom - 1 

            Countback()
          }
          else{
            $(`.countback`).css("display", "none")
          }
        },1000)
      }

      Countback()
    }
    else if (data.action === "EndNotify"){
      Areatable = data.table
      WinnerNum = data.winner

      if (WinnerNum == false){
        $(".end_notify .winner").html("TIE")
        $(".end_notify .name").html("")
      }
      else{
        $(".end_notify .winner").html("WINNER")
        $(".end_notify .name").html(Areatable["player"+WinnerNum].nickname)

        if (Areatable["player"+WinnerNum].id === PlayerId){
          if (localStorage.getItem("totalwins") == null){
            localStorage.setItem("totalwins","0")
          }
          else{
            let wins = localStorage.getItem("totalwins")
            localStorage.setItem("totalwins", +wins + 1)
          }
        }
      }

      for (let i=1; i<3; i++) {
        $(`#player_con${i} .player_name`).html(Areatable["player"+i].nickname)
        $(`#player_con${i} .points`).html("POINTS "+Areatable["player"+i].points)
      }
      showendnotify()

      setTimeout(function(){
        hideendnotify()
      },10000)
    }
    else if (data.action === "Close"){
      Close()
    }
   
})

document.onkeydown = function(data) {
  if (event.key == 'Escape') {
    Close()
  }
}

function Close(){
  hidemenu("boxing_menu")
  hidemenu("stat_hud")
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
}

function showmenu(element){
  document.getElementById(element).style.animation = "showmenu 0.7s ease";
  $("#"+element).css("display","block")
}

function hidemenu(element){
  document.getElementById(element).style.animation = "hidemenu 0.4s ease";
  setTimeout(function(){
    $("#"+element).css("display","none")
  }, 350)
}

function RefreshBoxingMenu(){
  PlayerInGame = false
  if (Areatable.started == false || Areatable.bet == true){
    for (let i=1; i<3; i++) {
      if (document.getElementById("player_btn"+i)){
        document.getElementById("player_btn"+i).remove()
      }
      $("#player_container"+i).append(`
      <button class="basic_btn px-3 mt-3" id="player_btn${i}" onclick="Join(id)">JOIN</button>
      `)
    }

    for (let k in Areatable) {
      if (k != "started"){
        if (Areatable[k].id != null){
          ShowPlayerDetails(k)
        }
        else{
          HidePlayerDetails(k.slice(-1))
        }
      }
    }
  }
  else{
    for (let i=1; i<3; i++) {
      if (document.getElementById("player_bet"+i)){
        document.querySelector(".bet_con").remove()
        document.getElementById("player_bet"+i).remove()
      }
    }
  }
  StartButtonCheck()
  if (PlayerInGame == false){
    $(".match_con").css("height", "0px")
  }

  if (Areatable.started){
    document.getElementById("range_rounds").value = Areatable.rounds
    document.getElementById("gloves").checked = Areatable.gloves
    document.getElementById("bet").checked = Areatable.bet

    document.getElementById("range_rounds").disabled = true
    document.getElementById("gloves").disabled = true
    document.getElementById("bet").disabled = true
  }
  else{
    document.getElementById("range_rounds").disabled = false
    document.getElementById("gloves").disabled = false
    document.getElementById("bet").disabled = false
  }

  SyncRangeData("range_rounds")

  if (Areatable.bet == false){
    for (let i=1; i<3; i++) {
      if (document.getElementById("player_bet"+i)){
        document.querySelector(".bet_con").remove()
        document.getElementById("player_bet"+i).remove()
      }
    }
  }
}

function ShowPlayerDetails(k){
  let number = k.slice(-1)
  let nickname = Areatable[k].nickname 
  let wins = Areatable[k].totalwins
  let gender = Areatable[k].gender
  $("#details_"+number).css("height", "270px")
  $("#nickname_"+number).html(nickname)
  $("#wins_"+number).html(wins)
  $("#gender_"+number).html(gender)
  document.getElementById("player_btn"+number).remove()
  if (Areatable[k].id == PlayerId){
    PlayerInGame = true
    $(".match_con").css("height", "270px")
    $("#player_container"+number).append(`
    <button class="back_btn px-3 mt-3" id="player_btn${number}" onclick="Leave(id)">LEAVE</button>
    `)
  }
  else{
    $("#player_container"+number).append(`
    <button class="basic_btn px-3 mt-3" id="player_btn${number}" disabled onclick="Join(id)">JOIN</button>
    `)
  }
}

function HidePlayerDetails(number){
  $("#details_"+number).css("height", "0px")
  $("#nickname_"+number).html("")
  $("#wins_"+number).html("")
  $("#gender_"+number).html("")
}


function Join(id){
  if (localStorage.getItem("totalwins") == null){
    localStorage.setItem("totalwins","0")
  }
  let totalwins = localStorage.getItem("totalwins")
  let place = id.slice(-1)
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"join", place, totalwins}))
}

function Leave(id){
  PlayerInGame = false
  $(".match_con").css("height", "0px")
  place = id.slice(-1)
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"leave", place}))
}

function StartButtonCheck(){
  if(Areatable.player1.id != null && Areatable.player2.id != null && PlayerInGame){
    document.getElementById("start_btn").disabled = false
    document.getElementById("start_btn").innerHTML = "START"
  }
  else if(PlayerInGame == false && Areatable.player1.id != null && Areatable.player2.id != null){
    document.getElementById("start_btn").disabled = true
    document.getElementById("start_btn").innerHTML = "FULL"
  }
  else{
    document.getElementById("start_btn").disabled = true
    document.getElementById("start_btn").innerHTML = "START"
  }
}

function Start(){
  let rounds =  document.getElementById("range_rounds").value
  let gloves = document.getElementById("gloves").checked
  let bet = document.getElementById("bet").checked
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"start", rounds, gloves, bet}))
}

function SyncRangeData(id){
  $("#range_number").html(document.getElementById(id).value) 
}

function Bet(id){
  let player = id.slice(-1)
  let amount = document.getElementById("in_bet"+player).value
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"bet", player, amount}))
  document.getElementById("in_bet"+player).value = ""
}

function showendnotify(){
  $(".end_notify").css("display","block")
  setTimeout(function(){
    $(".end_notify .texts").css("opacity","1")
    $(".end_notify .bg").css("opacity","1")
  }, 400)
}

function hideendnotify(){
  $(".texts").css("opacity","0")
  $(".end_notify .bg").css("opacity","0")
  setTimeout(function(){
    $(".end_notify").css("display","block")
  }, 1700)
}


function isNumber(evt) {
  evt = (evt) ? evt : window.event
  var charCode = (evt.which) ? evt.which : evt.keyCode
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false
  }
  return true
}
