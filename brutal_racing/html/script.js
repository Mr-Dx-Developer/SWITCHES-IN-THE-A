Category = null
accessibility = "open"
AccValue =  $('#open').html()
Veh_num = 0

window.addEventListener('message', function(event) {
    let data = event.data

    if (data.action === "OpenCreateMenu") {
      Today = data.TodayRecords
      Top = data.Top25Records
      Party = data.Party
      PlayerName = data.PlayerName
      PartyLists = data.PartyLists
      Vehicles = data.Vehicles
      Veh_num = 0
      sort(Top)
      $('#top').css("background-color", "var(--main_color)")
      $('#today').css("background-color", "rgb(76, 76, 76)")
      $(".section-main h5").html(Party)
      $(".change-container #veh_type h2").html(Vehicles[0].Label)
      if (PartyLists[Party].PartyImg === "none"){
        $("img").css("border","none")
      }else{
        $("img").attr("src","assets/"+PartyLists[Party].PartyImg)
        $("img").css("border","solid 3px rgb(75, 75, 75)")
      }
      document.documentElement.style.setProperty('--main_color', "rgb("+PartyLists[Party].MenuColor.r+","+PartyLists[Party].MenuColor.g+","+PartyLists[Party].MenuColor.b+")")
      hide(".section-spectate")
      show(".section-main")

      MaxPlayer = data.MaxPlayers
      MinPlayer = data.MinPlayers
      MaxLap = data.MaxLaps

      hide2(".join-container")
      hide2(".start-container")
      show2(".create-container")
    }
    else if (data.action === "OpenJoinMenu") {
      Today = data.TodayRecords
      Top = data.Top25Records
      Party = data.Party
      PlayerName = data.PlayerName
      PartyLists = data.PartyLists
      Vehicles = data.Vehicles
      sort(Top)
      $('#top').css("background-color", "var(--main_color)")
      $('#today').css("background-color", "rgb(76, 76, 76)")
      $(".section-main h5").html(Party)
      if (PartyLists[Party].PartyImg === "none"){
        $("img").css("border","none")
      }else{
        $("img").attr("src","assets/"+PartyLists[Party].PartyImg)
        $("img").css("border","solid 3px rgb(75, 75, 75)")
      }
      document.documentElement.style.setProperty('--main_color', "rgb("+PartyLists[Party].MenuColor.r+","+PartyLists[Party].MenuColor.g+","+PartyLists[Party].MenuColor.b+")")
      hide(".section-spectate")
      show(".section-main")

      hide2(".start-container")
      hide2(".create-container")
      show2(".join-container")
      if (PartyLists[Party].started === true){
        show(".startedloading")
        $(".section-main .join-container .create").remove()
      }else{
        hide(".startedloading")
        $(".section-main .join-container").append(`<button class="create" onclick="joinparty()">Join</button>`)
      }

      MyServerID = data.MyServerID

      $(".section-main .join-container #player").html(PartyLists[Party].createdata.MaxPlayers)
      $(".section-main .join-container #lap").html(PartyLists[Party].createdata.MaxLaps)
      $(".section-main .join-container #vehicle").html(Vehicles[PartyLists[Party].createdata.Model - 1].Label)
      $(".section-main .join-container #acc").html(PartyLists[Party].createdata.AccessibilityTEXT)
      $(".section-main .join-container #ent").html(PartyLists[Party].createdata.MoneyAmount)

      refreshjoinedplayer()
    }
    else if (data.action === "OpenStartMenu") {
      Today = data.TodayRecords
      Top = data.Top25Records
      Party = data.Party
      PlayerName = data.PlayerName
      PartyLists = data.PartyLists
      sort(Top)
      $('#top').css("background-color", "var(--main_color)")
      $('#today').css("background-color", "rgb(76, 76, 76)")
      $(".section-main h5").html(Party)
      if (PartyLists[Party].PartyImg === "none"){
        $("img").css("border","none")
      }else{
        $("img").attr("src","assets/"+PartyLists[Party].PartyImg)
        $("img").css("border","solid 3px rgb(75, 75, 75)")
      }
      document.documentElement.style.setProperty('--main_color', "rgb("+PartyLists[Party].MenuColor.r+","+PartyLists[Party].MenuColor.g+","+PartyLists[Party].MenuColor.b+")")
      hide(".section-spectate")
      show(".section-main")

      hide2(".join-container")
      hide2(".create-container")
      show2(".start-container")

      MyServerID = data.MyServerID

      $(".section-main .start-container #player").html(PartyLists[Party].createdata.MaxPlayers)
      $(".section-main .start-container #lap").html(PartyLists[Party].createdata.MaxLaps)
      $(".section-main .start-container #vehicle").html(Vehicles[PartyLists[Party].createdata.Model - 1].Label)
      $(".section-main .start-container #acc").html(PartyLists[Party].createdata.AccessibilityTEXT)
      $(".section-main .start-container #ent").html(PartyLists[Party].createdata.MoneyAmount)

      refreshjoinedplayer()
    }
    else if (data.action === "RefreshPartyLists") {
      PartyLists = data.PartyLists
      MyServerID = data.MyServerID
      refreshjoinedplayer()
    }
    else if (data.action === "Rounds") {
      Lap = data.Rounds
      LapTime = data.LapTime
      BestTime = data.BestTime
      AllLaps = PartyLists[Party].createdata.MaxLaps
      $(".section-HUD #laps").html((AllLaps - Lap + 1)+"/"+AllLaps+"<i><a>Laps</a></i>")
      $(".section-HUD #lap h2").html(fancyTimeFormat(LapTime))
      $(".section-HUD #best h2").html(fancyTimeFormat(BestTime))
    }
    else if (data.action === "StartTimer") {
      show(".section-HUD")
      time = 0
      StoppedTimer = false
      function Time(){
        setTimeout(function(){
          if (StoppedTimer === false){
            time++
            $(".section-HUD #time h2").html(fancyTimeFormat(time))
            Time()
          }
        },1000)
      }
      Time()
    }
    else if (data.action === "StopTimer") {
      StoppedTimer = true
      hide(".section-HUD")
    }
    else if (data.action === "OpenSpec") {
      show(".section-spectate")
      let SpecPlayerName = data.name
      Ranks = data.ranks
      PartyLists = data.PartyLists
      if (SpecPlayerName != "nil"){
        $(".section-spectate h2").html('Spectating: '+SpecPlayerName)
        $(".section-spectate h3").html('You can switch between the members with the arrows ⬅️ ➡️')
      }
      else{
        $(".section-spectate h2").html('')
        $(".section-spectate h3").html('')
      }
      
      $('.specstat').html("")
      for (let i = 0; i < Ranks.length; i++) {
        if (Ranks[i].ID === MyServerID){
          $('.specstat').append(`
          <div class="stat-element" id="myname">
              <table>
                  <tr>
                      <th class="number">${i+1}</th>
                      <th>You</th>
                      <th class="time">${fancyTimeFormat(Ranks[i].TotalTime)}</th>
                  </tr>
              </table>
          </div>`)
        }
        else{
          $('.specstat').append(`
          <div class="stat-element">
              <table>
                  <tr>
                      <th class="number">${i+1}</th>
                      <th>${Ranks[i].NAME}</th>
                      <th class="time">${fancyTimeFormat(Ranks[i].TotalTime)}</th>
                  </tr>
              </table>
          </div>`)
        }
      }

      for (let i = 0; i < PartyLists[Party].members.length; i++) {
        $('.specstat').append(`
        <div class="stat-element" id="notfinished">
            <table>
                <tr>
                    <th class="number">-</th>
                    <th>${PartyLists[Party].members[i]["NAME"].slice(0, 7)}</th>
                    <th class="time"><div class="loader"></div></th>
                </tr>
            </table>
        </div>`)
      }

    }
    else if (data.action === "CloseSpec") {
      hide(".section-spectate")
    }
    else if (data.action === "Core") {
      Core = data.Core
      if (Core === "STANDALONE"){
        $(".ent").css("display","none")
        $("#moneyinput").css("display","none")
      }else{
        $(".ent").css("display","block")
        $("#moneyinput").css("display","block")
      }
    }
    else if (data.action === "ClosePanel") {
      Close()
    }
})

function fancyTimeFormat(duration){   
    var hrs = ~~(duration / 3600);
    var mins = ~~((duration % 3600) / 60);
    var secs = ~~duration % 60;

    var ret = "";

    if (hrs > 0) {
        ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
    }

    ret += "" + mins + ":" + (secs < 10 ? "0" : "");
    ret += "" + secs;
    return ret;
}

document.onkeyup = function() {
  if (event.key == 'Escape') {
    Close()
  }
}

function Close(){
  hide(".section-main")
  hide(".section-spectate")
  hide(".sure")
  hide(".info_container")
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
}

function show(element){
  $(element).css("display", "block")
  setTimeout(function(){
      $(element).css("opacity", "1")
  }, 10);
}

function hide(element){
  $(element).css("opacity", "0")
  setTimeout(function(){
    $(element).css("display", "none")
  }, 400)
}

function show2(element){
  $(element).css("display", "block")
}

function hide2(element){
  $(element).css("display", "none")
}

function sort(Type){
  IsIn = false
  Time = []
  for (let i = 0; i < Type.length; i++) {
    if (Type[i].party === Party){
    Time.push(Type[i].time)
    }
  }
  Time.sort(function(a, b){return a-b})
  $('.stats').html("")
  for (let b = 0; b != Time.length; b++){
    for (let i = 0; i < Type.length; i++) {
      if (Type[i].party === Party){
        IsIn = true
        if (Type[i].time === Time[b]){
          if (Type === Top){
            if (Type[i].name === PlayerName){
              $('.stats').append(`
              <div class="stat-element" id="myname">
                <div class="date">${Type[i].date}</div>
                  <table>
                      <tr>
                          <th class="number">${b+1}</th>
                          <th>You</th>
                          <th class="time">${fancyTimeFormat(Type[i].time)}</th>
                      </tr>
                  </table>
              </div>`)
            }
            else{
              $('.stats').append(`
              <div class="stat-element">
                <div class="date">${Type[i].date}</div>
                  <table>
                      <tr>
                          <th class="number">${b+1}</th>
                          <th>${Type[i].name}</th>
                          <th class="time">${fancyTimeFormat(Type[i].time)}</th>
                      </tr>
                  </table>
              </div>`)
            }
          }
          else{
            if (Type[i].name === PlayerName){
              $('.stats').append(`
              <div class="stat-element" id="myname">
                  <table>
                      <tr>
                          <th class="number">${b+1}</th>
                          <th>You</th>
                          <th class="time">${fancyTimeFormat(Type[i].time)}</th>
                      </tr>
                  </table>
              </div>`)
            }
            else{
              $('.stats').append(`
              <div class="stat-element">
                  <table>
                      <tr>
                          <th class="number">${b+1}</th>
                          <th>${Type[i].name}</th>
                          <th class="time">${fancyTimeFormat(Type[i].time)}</th>
                      </tr>
                  </table>
              </div>`)
            }
          }
        }
      }
    }
  }
  if (Type.length === 0 || IsIn === false){
    $('.stats').html("<h1>There aren't any data...</h1>")
  }
}

function changeboard(id){
  $('#'+id).css("background-color", "var(--main_color)")
  if (id === "today"){
    sort(Today)
    $('#top').css("background-color", "rgb(76, 76, 76)")
  }
  else{
    sort(Top)
    $('#today').css("background-color", "rgb(76, 76, 76)")
  }
}

function change_accessibility(id){
  $('#'+id).css("background-color", "var(--main_color)")
  if (id === "open"){
    $('#request').css("background-color", "rgb(76, 76, 76)")
  }
  else{
    $('#open').css("background-color", "rgb(76, 76, 76)")
  }
  accessibility = id
  AccValue =  $('#'+id).html()
}

function change_player(id){
  Player_Number = $(".change-container #player").html().substring(0, $(".change-container #player").html().indexOf('<'))
  if (id === "increase" && Player_Number < MaxPlayer){
    Player_Number = +Player_Number + +1
  }
  else if (id === "decrease" && Player_Number > MinPlayer){
    Player_Number = +Player_Number - +1
  }
  $(".change-container #player").html(Player_Number+'<i class="fa-solid fa-user"></i>')
}

function change_lap(id){
  Lap_Number = $(".change-container #lap").html().substring(0, $(".change-container #lap").html().indexOf('<'))
  if (id === "increase" && Lap_Number < MaxLap){
    Lap_Number = +Lap_Number + +1
  }
  else if (id === "decrease" && Lap_Number > 1){
    Lap_Number = +Lap_Number - +1
  }
  $(".change-container #lap").html(Lap_Number+'<i class="fa-solid fa-clock-rotate-left"></i>')
}

function change_veh(id){
  if (id === "increase" && Veh_num < Vehicles.length - 1){
    Veh_num = +Veh_num + +1
  }
  else if (id === "decrease" && Veh_num > 0){
    Veh_num = +Veh_num - +1
  }
  $(".change-container #veh_type h2").html(Vehicles[Veh_num].Label)
}

function createparty(){
  MoneyAmount = document.getElementById('moneyinput').value
  if (MoneyAmount === ""){
    MoneyAmount = 0
  }
  Player_Number = $(".change-container #player").html().substring(0, $(".change-container #player").html().indexOf('<'))
  Lap_Number = $(".change-container #lap").html().substring(0, $(".change-container #lap").html().indexOf('<'))
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"CreateParty", MaxPlayers:Player_Number, MinPlayers:MinPlayer, MaxLaps:Lap_Number, Accessibility:accessibility, Party, MoneyAmount, AccValue, Model:Veh_num}))
}

function isNumber(evt) {
  evt = (evt) ? evt : window.event;
  var charCode = (evt.which) ? evt.which : evt.keyCode;
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false;
  }
  return true;
}

function joinparty(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"JoinParty", Party}))
}

function refreshjoinedplayer(){
  inserted = 0
  $('.players').html("")
  if($(".start-container").is(":visible")){
    for (let i = 0; i < PartyLists[Party].createdata.MaxPlayers; i++) {
      if (i < PartyLists[Party].members.length){
        if (PartyLists[Party].members[i]["ID"] === MyServerID){
            $('.players').append(`
            <div class="joined-element">
                <table>
                    <tr>
                        <th class="id">${PartyLists[Party].members[i]["ID"]}</th>
                        <th>${PartyLists[Party].members[i]["NAME"].slice(0, 7)}</th>
                        <th><button class="action kick" id="${PartyLists[Party].members[i]["ID"]}" onclick="kickplayer(id)" style="opacity: 0.5;"><i class="fa-solid fa-xmark"></i></button></th>
                    </tr>
                </table>
            </div>`)
            inserted++
        }
        else{
          $('.players').append(`
          <div class="joined-element">
              <table>
                  <tr>
                      <th class="id">${PartyLists[Party].members[i]["ID"]}</th>
                      <th>${PartyLists[Party].members[i]["NAME"].slice(0, 7)}</th>
                      <th><button class="action kick" id="${PartyLists[Party].members[i]["ID"]}" onclick="kickplayer(id)"><i class="fa-solid fa-xmark"></i></button></th>
                  </tr>
              </table>
          </div>`)
          inserted++
        }
      }
    }

    for (let _i = 0; _i < PartyLists[Party].waitlist.length; _i++) {
      $('.players').append(`
      <div class="joined-element" id="notjoined">
          <table>
              <tr>
                  <th class="id">${PartyLists[Party].waitlist[_i]["ID"]}</th>
                  <th>${PartyLists[Party].waitlist[_i]["NAME"].slice(0, 7)}</th>
                  <th><button class="action kick" id="${PartyLists[Party].waitlist[_i]["ID"]}" onclick="kickplayer(id)"><i class="fa-solid fa-xmark"></i></button>
                  <button class="action approve" id="${PartyLists[Party].waitlist[_i]["ID"]}" onclick="acceptplayer(id)"><i class="fa-solid fa-check"></i></button></th>
              </tr>
          </table>
      </div>`)
      inserted++
    }

    if (inserted < PartyLists[Party].createdata.MaxPlayers){
      for (let i = 0; i < (PartyLists[Party].createdata.MaxPlayers - inserted); i++) {
        $('.players').append(`
        <div class="joined-element" id="notjoined">
            <table>
                <tr>
                    <th>Empty</th>
                </tr>
            </table>
        </div>`)
      }
    }
  }
  else{
    for (let i = 0; i < PartyLists[Party].createdata.MaxPlayers; i++) {
      if (i < PartyLists[Party].members.length){
        $('.players').append(`
        <div class="joined-element">
            <table>
                <tr>
                    <th class="id">${PartyLists[Party].members[i]["ID"]}</th>
                    <th>${PartyLists[Party].members[i]["NAME"].slice(0, 7)}</th>
                </tr>
            </table>
        </div>`)
      }
      else{
        $('.players').append(`
        <div class="joined-element" id="notjoined">
            <table>
                <tr>
                    <th>Empty</th>
                </tr>
            </table>
        </div>`)
      }
    }
  }
  for (let i = 0; i < PartyLists[Party].members.length; i++) {
    if (PartyLists[Party].members[i]["ID"] === MyServerID){
      $(".section-main .join-container .create").remove()
      $(".section-main .join-container").append(`<button class="create" onclick="leaveparty()">Leave</button>`)
      break
    }
    else{
      $(".section-main .join-container .create").remove()
      $(".section-main .join-container").append(`<button class="create" onclick="joinparty()">Join</button>`)
    }
  }
  if (PartyLists[Party].started === true){
    show(".startedloading")
    $(".section-main .join-container .create").remove()
  }else{
    hide(".startedloading")
  }
}

function cancelparty(){
  $(".sure .container h1").html("Are you sure to cancel this party?")
  show(".sure")
  suredata = "cancelparty"
}

function startparty(){
  $(".sure .container h1").html("Are you sure to start this party?")
  show(".sure")
  suredata = "startparty"
}

function acceptplayer(id){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"AcceptJoin", Party, PlayerID:id}))
}

function kickplayer(id){
  if (id != MyServerID){
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"KickPlayer", Party, PlayerID:id}))
  }
}

function leaveparty(){
  $(".sure .container h1").html("Are you sure to leave this party?")
  show(".sure")
  suredata = "leaveparty"
}

function returnsure(id){
  if (suredata === "cancelparty"){
    if (id === "yes"){
      hide(".sure")
      hide2(".start-container")
      show(".create-container")
      $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"CancelParty", Party}))
    }else{
      hide(".sure")
    }
  }
  else if (suredata === "leaveparty"){
    if (id === "yes"){
      hide(".sure")
      $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"LeaveParty", Party}))
    }else{
      hide(".sure")
    }
  }
  else if (suredata === "startparty"){
    if (id === "yes"){
      hide(".sure")
      Close()
      $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"StartParty", Party}))
    }else{
      hide(".sure")
    }
  }
}

function Info(id){
  if (id === "show"){
    show(".info_container")
  }
  else{
    hide(".info_container")
  }
}
  