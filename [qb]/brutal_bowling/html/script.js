IsPlayerInRound = false
OnPage = "home_page"

window.addEventListener('message', function(event) {
    let data = event.data
   
    if (data.action === "OpenBowlingMenu"){
      $("#center_con1").css("display","flex")
      showmenu('main_menu')
      BowlingTable = data.bowlingtable
      PlayerId = data.id
      Sounds = data.sounds
      LoadDataMainPage()
      $("#center_con2").css("display","none")
    }
    else if (data.action === "OpenOwnStat"){
      document.getElementById("own_stat_elm").style.animation = "appearownstat 0.6s ease";
      $("#center_con2").css("display","flex")
      BowlingTable = data.bowlingtable
      PlayerId = data.id
      CreateOwnStat()
    }
    else if (data.action === "CloseOwnStat"){
      document.getElementById("own_stat_elm").style.animation = "hideownstat 0.6s ease";
      setTimeout(function(){
        $("#center_con2").css("display","none")
      }, 500)
    }
    else if (data.action === "OpenForceHud"){
      $(".force_hud").css("display","block")
      $(".instructions").css("display","block")
      document.getElementById("force_hud").style.animation = "appearfromleft 0.6s ease";
      document.getElementById("stick").style.animation = "movestick 1.2s linear infinite alternate"
      document.getElementById("instructions").style.animation = "appearfrombottom 0.6s ease"
    }
    else if (data.action === "CloseForceHud"){
      document.getElementById("force_hud").style.animation = "hidetoleft 0.6s ease";
      document.getElementById("instructions").style.animation = "hidetobottom 0.6s ease"
      setTimeout(function(){
        $(".force_hud").css("display","none")
        $(".stick h1").css("display", "none")
        $(".instructions").css("display","none")
      }, 500)
    }
    else if (data.action === "ThrowBall"){
      let Force = document.getElementById("stick").offsetTop
      let throw_sound = 0
      document.getElementById("stick").style.animation = "stopstick 0.6s ease infinite alternate"
      $(".stick").css("top", Force + "px")
      $(".stick h1").css("display", "block")
      Force = 100 - (Force / 3.5)
      if (Force > 60){
        throw_sound = 2
      }
      else{
        throw_sound = 1
      }
      var taudio = new Audio('assets/sounds/throw_'+throw_sound+'.mp3')
      setTimeout(function(){
        if (Sounds){
          taudio.play()
        }
      }, 500)
      $(".stick h1").html(Math.floor(Force) + "%")
      $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"force", force:Force}))
    }
    else if (data.action === "StrikeSound"){
      let SoundNum = data.number
      if (SoundNum > 3){
        let strike_sound = Math.floor(Math.random() * 2) + 1
        var strike_audio = new Audio('assets/sounds/strike_'+strike_sound+'.mp3')
        strike_audio.volume = 0.2
        strike_audio.play()
      }
      else if (SoundNum > 1){
        var strike_audio = new Audio('assets/sounds/strike_3.mp3')
        strike_audio.volume = 0.1
        strike_audio.play()
      }
    }
    else if (data.action === "OpenLeaderboard"){
      $(".end_leaderboard").css("display","block")
      document.getElementById("end_leaderboard").style.animation = "appearfromleft 0.6s ease";
      LeaderboardTable = data.table
      CreateLeaderboard()
      setTimeout(function(){
        document.getElementById("end_leaderboard").style.animation = "hidetoleft 0.6s ease";
        setTimeout(function(){
          $(".end_leaderboard").css("display","none")
        }, 500)
      }, 10000)
    }
    else if (data.action === "ControlC"){
      fallbackCopyTextToClipboard(data.coords)
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
  hidemenu('main_menu')
  setTimeout(function(){
    $("#center_con1").css("display","none")
  }, 350)
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
}

function showmenu(element){
  $("#"+element).css("display","block")
  document.getElementById(element).style.animation = "showmenu 0.6s ease";
}

function hidemenu(element){
  document.getElementById(element).style.animation = "hidemenu 0.4s ease";
  setTimeout(function(){
    $("#"+element).css("display","none")
  }, 350)
}

function isNumber(evt) {
  evt = (evt) ? evt : window.event
  var charCode = (evt.which) ? evt.which : evt.keyCode
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false
  }
  return true
}

function fallbackCopyTextToClipboard(text){
  var textArea = document.createElement("textarea");
  textArea.value = text;

  textArea.style.top = "0";
  textArea.style.left = "0";
  textArea.style.position = "fixed";

  document.body.appendChild(textArea);
  textArea.focus();
  textArea.select();

  try {
    var successful = document.execCommand('copy');
    var msg = successful ? 'successful' : 'unsuccessful';
  } catch (err) {
    console.error('Fallback: Oops, unable to copy', err);
  }

  document.body.removeChild(textArea);
}

/*/////////////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */

function LoadDataMainPage(){
  IsPlayerInRound = false

  if (OnPage == "more"){
    CreateStat()
  }

  for(let i=0; i<BowlingTable.members.length; i++){
    if (BowlingTable.members[i].id == PlayerId){
      IsPlayerInRound = true
    }
  }

  if (BowlingTable.currentround > 0){
    $(".text_con h2").html("Round "+BowlingTable.currentround)
  }

  document.getElementById("in_fee").disabled = false
  document.getElementById("range_rounds").disabled = false

  $(".big_info_con").css("background-image", "linear-gradient(135deg, rgb(22, 180, 189), rgb(10, 97, 102))")

  if (BowlingTable.leader != null){
    document.getElementById("in_fee").value = BowlingTable.settings.fee
    document.getElementById("range_rounds").value = BowlingTable.settings.rounds
    $("#range_number").html(BowlingTable.settings.rounds) 
    document.getElementById("in_fee").disabled = true
    document.getElementById("range_rounds").disabled = true
    $(".big_info_con").css("background-image", "linear-gradient(135deg, rgb(91, 133, 134), rgb(54, 77, 80))")

    if (BowlingTable.started){
      $(".small_player_info_con").html("")
      for(let i=0; i<6; i++){
        if (BowlingTable.members[i] != undefined){
          let PlayerScore = 0

          for(let _i=0; _i<BowlingTable.stats[BowlingTable.members[i].id - 1].length; _i++){
            if (BowlingTable.stats[BowlingTable.members[i].id - 1][_i].all != undefined){
              PlayerScore = PlayerScore + BowlingTable.stats[BowlingTable.members[i].id - 1][_i].all
            }
          }

          if (BowlingTable.members[i].name.length > 8){
            $(".small_player_info_con").append(`
            <div class="per_con">
              <div class="small_player_con">
                  <h1>${BowlingTable.members[i].name.substring(0,8)}...</h1>
                  <h2><i class="fa-solid fa-bowling-ball"></i> ${PlayerScore}</h2>
                  <h4>Joined <i class="fa-solid fa-check" style="color:green;"></i></h4>
              </div>
            </div>
            `)
          }
          else{
            $(".small_player_info_con").append(`
            <div class="per_con">
              <div class="small_player_con">
                  <h1>${BowlingTable.members[i].name}</h1>
                  <h2><i class="fa-solid fa-bowling-ball"></i> ${PlayerScore}</h2>
                  <h4>Joined <i class="fa-solid fa-check" style="color:green;"></i></h4>
              </div>
            </div>
            `)
          }
          
        }
        else{
          $(".small_player_info_con").append(`
          <div class="per_con" id="without_player">
              <div class="small_player_con">
              <h5>Empty</h5>
              </div>
          </div>
          `)
        }
      }
      
    }
    else{
      $(".text_con h2").html("Not Started")
      $(".small_player_info_con").html("")
      for(let i=0; i<6; i++){
        if (i < BowlingTable.members.length){
          if (BowlingTable.members[i].name.length > 8){
            $(".small_player_info_con").append(`
            <div class="per_con">
              <div class="small_player_con">
                  <h1>${BowlingTable.members[i].name.substring(0,8)}...</h1>
                  <h3>Joined <i class="fa-solid fa-check" style="color:green;"></i></h3>
              </div>
            </div>
            `)
          }
          else{
            $(".small_player_info_con").append(`
            <div class="per_con">
              <div class="small_player_con">
                  <h1>${BowlingTable.members[i].name}</h1>
                  <h3>Joined <i class="fa-solid fa-check" style="color:green;"></i></h3>
              </div>
            </div>
            `)
          }
        }
        else{
          $(".small_player_info_con").append(`
          <div class="per_con" id="without_player">
              <div class="small_player_con">
              <h5>Empty</h5>
              </div>
          </div>
          `)
        }
      }
    }

    if (IsPlayerInRound){
      if (BowlingTable.leader == PlayerId){
        if (BowlingTable.started){
          $(".navi_btn_con").html(`
          <button class="main_nav_btn mt-3"  id="leave" onclick="LeaveRound()">
            <i class="fa-solid fa-right-from-bracket"></i>
            <h1>Leave</h1>
          </button>
          <button class="main_nav_btn mt-3"  id="more" onclick="ShowMore()">
            <i class="fa-solid fa-eye"></i>
            <h1>Show more</h1>
          </button>
          `)
        }
        else{
          $(".navi_btn_con").html(`
          <button class="main_nav_btn mt-3" id="start_btn" onclick="StartRound()">
            <i class="fa-solid fa-play"></i>
            <h1>Start</h1>
          </button>
          <button class="main_nav_btn mt-3"  id="leave" onclick="LeaveRound()">
            <i class="fa-solid fa-right-from-bracket"></i>
            <h1>Leave</h1>
          </button>
          `)
        }
      }
      else if(BowlingTable.started == false){

        $(".navi_btn_con").html(`
        <button class="main_nav_btn mt-3"  id="leave" onclick="LeaveRound()">
          <i class="fa-solid fa-right-from-bracket"></i>
          <h1>Leave</h1>
        </button>
        <button class="main_nav_btn mt-3"  id="more" onclick="ShowMore()" disabled>
          <i class="fa-solid fa-eye"></i>
          <h1>Show more</h1>
        </button>
        `)
      }
      else{
        document.getElementById("in_fee").disabled = true
        document.getElementById("range_rounds").disabled = true

        $(".navi_btn_con").html(`
        <button class="main_nav_btn mt-3"  id="leave" onclick="LeaveRound()">
          <i class="fa-solid fa-right-from-bracket"></i>
          <h1>Leave</h1>
        </button>
        <button class="main_nav_btn mt-3"  id="more" onclick="ShowMore()">
          <i class="fa-solid fa-eye"></i>
          <h1>Show more</h1>
        </button>
        `)
      }
    }
    else if(BowlingTable.started == false){
      $(".navi_btn_con").html(`
        <button class="main_nav_btn mt-3"  id="start_btn" onclick="JoinRound()">
          <i class="fa-solid fa-angles-right"></i>
          <h1>Join</h1>
        </button>
        <button class="main_nav_btn mt-3"  id="more" onclick="ShowMore()" disabled>
          <i class="fa-solid fa-eye"></i>
          <h1>Show more</h1>
        </button>
      `)
    }
    else{
      document.getElementById("in_fee").disabled = true
      document.getElementById("range_rounds").disabled = true

      $(".navi_btn_con").html(`
        <button class="main_nav_btn mt-3"  id="start_btn" onclick="JoinRound()" disabled>
          <i class="fa-solid fa-angles-right"></i>
          <h1>Join</h1>
        </button>
        <button class="main_nav_btn mt-3"  id="more" onclick="ShowMore()">
          <i class="fa-solid fa-eye"></i>
          <h1>Show more</h1>
        </button>
      `)
    }
  }
  else{
    if (OnPage == "more"){
      BackToMainPage()
    }
    $(".text_con h2").html("Not Started")
    $(".small_player_info_con").html("")
    for(let i=0; i<6; i++){
      if (i < BowlingTable.members.length){
        if (BowlingTable.members[i].name.length > 8){
          $(".small_player_info_con").append(`
          <div class="per_con">
            <div class="small_player_con">
                <h1>${BowlingTable.members[i].name.substring(0,8)}...</h1>
                <h3>Joined <i class="fa-solid fa-check" style="color:green;"></i></h3>
            </div>
          </div>
          `)
        }
        else{
          $(".small_player_info_con").append(`
          <div class="per_con">
            <div class="small_player_con">
                <h1>${BowlingTable.members[i].name}</h1>
                <h3>Joined <i class="fa-solid fa-check" style="color:green;"></i></h3>
            </div>
          </div>
          `)
        }
      }
      else{
        $(".small_player_info_con").append(`
        <div class="per_con" id="without_player">
            <div class="small_player_con">
            <h5>Empty</h5>
            </div>
        </div>
        `)
      }
    }

    $(".navi_btn_con").html(`
    <button class="main_nav_btn mt-3" id="start_btn" onclick="CreateRound()">
        <i class="fa-solid fa-play"></i>
        <h1>Create</h1>
    </button>
    <button class="main_nav_btn mt-3"  id="more" onclick="ShowMore()" disabled>
        <i class="fa-solid fa-eye"></i>
        <h1>Show more</h1>
    </button>
    `)
  }

}

function SyncRangeData(id){
  $("#range_number").html(document.getElementById(id).value) 
}

function ShowMore(){
  OnPage = "more"
  document.getElementById("navi_btn_con").style.animation = "hide2 0.8s";
  document.getElementById("small_player_info_con").style.animation = "hide2 0.8s";
  document.getElementById("text_con").style.animation = "hide1 0.8s";
  document.getElementById("svg_bowling").style.animation = "hide1 0.8s";
  document.getElementById("big_info_con").style.animation = "hide1 0.8s";

  document.getElementById("player_stat_con").style.animation = "appearstat 0.8s";
  document.getElementById("up_fade").style.animation = "appear2 0.8s";
  document.getElementById("head_section").style.animation = "appear1 0.8s";

  CreateStat()

  setTimeout(function(){
    $(".more_datas").css("display","block")
  }, 200)

  setTimeout(function(){
    $(".home_page").css("display","none")
  }, 800)
}

function BackToMainPage(){
  OnPage = "home_page"
  document.getElementById("player_stat_con").style.animation = "hidestat 0.8s";
  document.getElementById("up_fade").style.animation = "hidestat 0.8s";
  document.getElementById("head_section").style.animation = "hide1 0.8s";

  document.getElementById("navi_btn_con").style.animation = "appear2 0.8s";
  document.getElementById("small_player_info_con").style.animation = "appear2 0.8s";
  document.getElementById("text_con").style.animation = "appear1 0.8s";
  document.getElementById("svg_bowling").style.animation = "appear1 0.8s";
  document.getElementById("big_info_con").style.animation = "appear1 0.8s";

  setTimeout(function(){
    $(".home_page").css("display","block")
  }, 200)

  setTimeout(function(){
    $(".more_datas").css("display","none")
  }, 800)
}

function CreateRound(){
  let fee = document.getElementById("in_fee").value
  let rounds = document.getElementById("range_rounds").value
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"create", fee, rounds}))
}

function JoinRound(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"join"}))
}

function LeaveRound(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"leave"}))
}

function StartRound(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"start"}))
}

function CreateStat(){
  $(".player_stat_con").html("")
  for(let i=0; i<BowlingTable.members.length; i++){
    if (BowlingTable.members[i].name.length > 7){
      $(".player_stat_con").append(`
      <div class="player_line">
        <div class="player_name_elm">
            <h1>${BowlingTable.members[i].name.substring(0,7)}...</h1>
        </div>
        <div class="player_stat_elm" id="${BowlingTable.members[i].id - 1}">
        </div>
      </div>
      `)
    }
    else{
      $(".player_stat_con").append(`
      <div class="player_line">
        <div class="player_name_elm">
            <h1>${BowlingTable.members[i].name}</h1>
        </div>
        <div class="player_stat_elm" id="${BowlingTable.members[i].id - 1}">
        </div>
      </div>
      `)
    }

    for(let _i=0; _i<BowlingTable.settings.rounds; _i++){
      let RoundPoints = 0

      for(let r=0; r<_i+1; r++){
        if (BowlingTable.stats[BowlingTable.members[i].id - 1][r].all != undefined){
          RoundPoints = +RoundPoints + +BowlingTable.stats[BowlingTable.members[i].id - 1][r].all
        }
      }
      
      if (BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first != undefined && BowlingTable.stats[BowlingTable.members[i].id - 1][_i].second != undefined){
        if (BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first == 10){
          $(`#${BowlingTable.members[i].id - 1}`).append(`
            <div class="player_stat_small_elm">
                <h1>X</h1>
                <div class="num_box d-flex flex-column align-items-center">
                    <h2></h2>
                </div>
                <h3>${RoundPoints}</h3>
            </div>
          `)
        }
        else if(BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first + +BowlingTable.stats[BowlingTable.members[i].id - 1][_i].second == 10){
          if (BowlingTable.settings.rounds != BowlingTable.currentround){
            if (BowlingTable.stats[BowlingTable.members[i].id - 1][_i+1].first == undefined){
              $(`#${BowlingTable.members[i].id - 1}`).append(`
              <div class="player_stat_small_elm">
                  <h1>${BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first}</h1>
                  <div class="num_box d-flex flex-column align-items-center">
                      <h2>/</h2>
                  </div>
                  <h3><i class="fa-solid fa-spinner fa-spin-pulse"></i></h3>
              </div>
              `)
            }
            else{
              $(`#${BowlingTable.members[i].id - 1}`).append(`
              <div class="player_stat_small_elm">
                  <h1>${BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first}</h1>
                  <div class="num_box d-flex flex-column align-items-center">
                      <h2>/</h2>
                  </div>
                  <h3>${RoundPoints}</h3>
              </div>
              `)
            }
          }
          else if(BowlingTable.settings.rounds == BowlingTable.currentround){
            $(`#${BowlingTable.members[i].id - 1}`).append(`
            <div class="player_stat_small_elm">
                <h1>${BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first}</h1>
                <div class="num_box d-flex flex-column align-items-center">
                    <h2>/</h2>
                </div>
                <h3>${RoundPoints}</h3>
            </div>
            `)
          }
        }
        else{
          $(`#${BowlingTable.members[i].id - 1}`).append(`
            <div class="player_stat_small_elm">
                <h1>${BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first}</h1>
                <div class="num_box d-flex flex-column align-items-center">
                    <h2>${BowlingTable.stats[BowlingTable.members[i].id - 1][_i].second}</h2>
                </div>
                <h3>${RoundPoints}</h3>
            </div>
          `)
        }
      }
      else if(BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first != undefined){
        if (BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first == 10){
          $(`#${BowlingTable.members[i].id - 1}`).append(`
            <div class="player_stat_small_elm">
                <h1>X</h1>
                <div class="num_box d-flex flex-column align-items-center">
                    <h2></h2>
                </div>
                <h3>${RoundPoints}</h3>
            </div>
          `)
        }
        else{
          $(`#${BowlingTable.members[i].id - 1}`).append(`
          <div class="player_stat_small_elm">
              <h1>${BowlingTable.stats[BowlingTable.members[i].id - 1][_i].first}</h1>
              <div class="num_box d-flex flex-column align-items-center">
                  <h2></h2>
              </div>
              <h3></h3>
          </div>
        `)
        }
      }
      else{
        $(`#${BowlingTable.members[i].id - 1}`).append(`
        <div class="player_stat_small_elm">
            <h1></h1>
            <div class="num_box d-flex flex-column align-items-center">
                <h2></h2>
            </div>
            <h3></h3>
        </div>
      `)
      }
    }
  }

  $(".rounds_con").html("")
  for(let i=0; i<BowlingTable.settings.rounds; i++){
    $(".rounds_con").append(`
      <div class="round_elm">
        <h1>${i+1}</h1>
      </div>
    `)
  }
}

function CreateOwnStat(){
  $(`#own_stat_elm`).html("")
  for(let _i=0; _i<BowlingTable.settings.rounds; _i++){
    let RoundPoints = 0

    for(let r=0; r<_i+1; r++){
      if (BowlingTable.stats[PlayerId - 1][r].all != undefined){
        RoundPoints = +RoundPoints + +BowlingTable.stats[PlayerId - 1][r].all
      }
    }
    
    if (BowlingTable.stats[PlayerId - 1][_i].first != undefined && BowlingTable.stats[PlayerId - 1][_i].second != undefined){
      if (BowlingTable.stats[PlayerId - 1][_i].first == 10){
        $(`#own_stat_elm`).append(`
          <div class="player_stat_small_elm">
              <h1>X</h1>
              <div class="num_box d-flex flex-column align-items-center">
                  <h2></h2>
              </div>
              <h3>${RoundPoints}</h3>
          </div>
        `)
      }
      else if(BowlingTable.stats[PlayerId - 1][_i].first + +BowlingTable.stats[PlayerId - 1][_i].second == 10){
        if (BowlingTable.settings.rounds != BowlingTable.currentround){
          if (BowlingTable.stats[PlayerId - 1][_i+1].first == undefined){
            $(`#own_stat_elm`).append(`
            <div class="player_stat_small_elm">
                <h1>${BowlingTable.stats[PlayerId - 1][_i].first}</h1>
                <div class="num_box d-flex flex-column align-items-center">
                    <h2>/</h2>
                </div>
                <h3><i class="fa-solid fa-spinner fa-spin-pulse"></i></h3>
            </div>
          `)
          }
          else{
            $(`#own_stat_elm`).append(`
            <div class="player_stat_small_elm">
                <h1>${BowlingTable.stats[PlayerId - 1][_i].first}</h1>
                <div class="num_box d-flex flex-column align-items-center">
                    <h2>/</h2>
                </div>
                <h3>${RoundPoints}</h3>
            </div>
            `)
          }
        }
        else if(BowlingTable.settings.rounds == BowlingTable.currentround){
          $(`#own_stat_elm`).append(`
          <div class="player_stat_small_elm">
              <h1>${BowlingTable.stats[PlayerId - 1][_i].first}</h1>
              <div class="num_box d-flex flex-column align-items-center">
                  <h2>/</h2>
              </div>
              <h3>${RoundPoints}</h3>
          </div>
          `)
        }
      }
      else{
        $(`#own_stat_elm`).append(`
          <div class="player_stat_small_elm">
              <h1>${BowlingTable.stats[PlayerId - 1][_i].first}</h1>
              <div class="num_box d-flex flex-column align-items-center">
                  <h2>${BowlingTable.stats[PlayerId - 1][_i].second}</h2>
              </div>
              <h3>${RoundPoints}</h3>
          </div>
        `)
      }
    }
    else if(BowlingTable.stats[PlayerId - 1][_i].first != undefined){
      if (BowlingTable.stats[PlayerId - 1][_i].first == 10){
        $(`#own_stat_elm`).append(`
          <div class="player_stat_small_elm">
              <h1>X</h1>
              <div class="num_box d-flex flex-column align-items-center">
                  <h2></h2>
              </div>
              <h3>${RoundPoints}</h3>
          </div>
        `)
      }
      else{
        $(`#own_stat_elm`).append(`
        <div class="player_stat_small_elm">
            <h1>${BowlingTable.stats[PlayerId - 1][_i].first}</h1>
            <div class="num_box d-flex flex-column align-items-center">
                <h2></h2>
            </div>
            <h3></h3>
        </div>
      `)
      }
    }
    else{
      $(`#own_stat_elm`).append(`
      <div class="player_stat_small_elm">
          <h1></h1>
          <div class="num_box d-flex flex-column align-items-center">
              <h2></h2>
          </div>
          <h3></h3>
      </div>
    `)
    }
  }
}

function CreateLeaderboard(){
  $(`.end_leaderboard`).html(`<div class="head">LEADERBOARD</div>`)
  for(let i=0; i<LeaderboardTable.length; i++){
    if (i < 3){
      $(`.end_leaderboard`).append(`
      <div class="lead_elm">
        <img src="assets/lead_bg.png">
        <h1>${LeaderboardTable[i].name}</h1>
        <h2>${LeaderboardTable[i].points}</h2>
      </div>
      `)
    }
    else{
      $(`.end_leaderboard`).append(`
      <div class="lead_elm">
        <h1>${LeaderboardTable[i].name}</h1>
        <h2>${LeaderboardTable[i].points}</h2>
      </div>
      `)
    }
    
  }
}