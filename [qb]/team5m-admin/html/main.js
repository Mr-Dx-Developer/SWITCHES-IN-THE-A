
var targetDiscord = undefined
var myID = undefined
var targetId = undefined
var inputTarget = undefined
var selectedWeapon = undefined
var myIdentifier = undefined
var currentLanguage = undefined
var targetTicket = undefined

var firstPlayer = true
var tagStatus = false
var firstWeapon = true
var chatPage = false

var inputNumber = 0
var currentPage = "main"
var lastClass = "two"


$(function() {
     window.addEventListener('message', function(event) {
     let item = event.data
     if (event.data.type == "open") {
          $('#seven_admin').show()
     }
     if (event.data.type == "updatePersonal") {
          $('.personal_name').text(item.data.name)

          $('.personal_gender').text(item.data.gender)
          $('.personal_birth').text(item.data.birth)
          $('.personal_rank').text(item.data.grade)
          $('.personal_job').text(item.data.job)
          $('.personal_money').text(formatBalance(item.data.money))
          $('.personal_id').text(item.data.id)

          myID = item.data.id
          updateGender(item.data.isMale)
          $('.avatar').attr('src', item.data.image);
     }
     if (event.data.type == "addPlayer") {
          let div = `<div onclick="selectPlayer('`+item.id+`')" class="player one player_`+item.id+`">
          <img class="playerAvatar playerAvatar_`+item.id+`" src="`+item.image+`">
          <p class="playerId">ID: `+item.id+`</p>
          <p class="playerName">`+item.name+`</p>
          </div>`
           $('#playersList').append(div)
           updateClass(item.id)
           if(firstPlayer) {
               selectPlayer(item.id)
               firstPlayer = false
          }
     }
     if (event.data.type == "loadPlayer") {
          $('.player_name').text(item.data.name)

          $('.player_gender').text(item.data.gender)
          $('.player_birth').text(item.data.birth)
          $('.player_rank').text(item.data.grade)
          $('.player_job').text(item.data.job)
          $('.player_money').text(formatBalance(item.data.money))
          $('.player_id').text(item.data.id)
          $('.player_ping').text(item.data.ping)
          $('.player_admin').text(item.data.admin)
          $('.player_nick').text(item.data.nick)
          $('.player_warns').text(item.data.warns)
          $('.player_image').attr('src', item.data.image);

          targetId = item.data.id
          targetDiscord = item.data.discord
          discordSetActive()
          loading(false)
     }
     if (event.data.type == "updateWarn") {
          $('.player_warns').text(item.warn)
     }
     if (event.data.type == "updateVehicle") {
          $('.vehicleImage').css('background-image', 'url("images/vehicles/'+item.model+'.png")')
          $('.vehicleName').text(item.label)
          $('.vehiclePlate').text(item.license)
     }
     if (event.data.type == "updateDrift") {
          updateDrift(item.drift)
     }
     if (event.data.type == "updateVehGod") {
          updateVehGod(item.value)
     }
     if (event.data.type == "updatePlayerGod") {
          updatePlayerGod(item.value)
     }
     if (event.data.type == "updateInvisible") {
          updateInvisible(item.value)
     }
     if (event.data.type == "copyCoord") {
          const textArea = document.createElement('textarea');
          textArea.textContent = item.coord;
          document.body.append(textArea);
          textArea.select();
          document.execCommand("copy");
          textArea.remove()
     }
     if (event.data.type == "updateWeapon") {
          if(item.name == "none") {
               $('.weaponImage').hide()
          }
          else {
               $('.weaponImage').show()
               $('.weaponImage').attr('src', "images/weapons/"+item.name+"-Mid.png");
          }
          $('.weaponName').text(item.label)
     }
     if (event.data.type == "addWeapon") {
          div = `<div onclick = "loadWeapon('`+item.name+`', '`+item.label+`')" class="weaponBox weaponList_`+item.name+`">`+item.label+`</div>`
          $('#weaponList').append(div)
          if(firstWeapon) {
               loadWeapon(item.name, item.label)
               firstWeapon = false
          }
     }
     // Message
     if (event.data.type == "addMessage") {
          div = `<div class="chat chat_`+item.data.messageID+`">
          <img class="chatFrame" src="images/redFrame.png">
          <img class="chatAvatar" src="`+item.data.image+`">
          <p class="chatName">`+item.data.name+`</p>
          <p class="chatMessage">`+item.data.message+`</p>
          <div class="chatRank">`+item.data.rank+`</div>
      </div>`
      $('#chatArea').append(div)
      if(item.data.identifier == myIdentifier) {
          $('.chat_'+item.data.messageID).addClass('myMessage')
      }
      $('#chatArea').scrollTop(1000252500)
     }
     if (event.data.type == "updateDuty") {
          updateDuty(item.value)
     }
     if (event.data.type == "updateLanguage") {
          if(item.id == "chatInput") {
               $('.lang_chatInput').attr("placeholder", item.text);
          }
          else {
               $('.lang_'+item.id).text(item.text)
          }
     }
     if (event.data.type == "loadLanguage") {
          currentLanguage = item.language
     }
     if (event.data.type == "showImage") {
          window.invokeNative("openUrl", item.image);
     }
     if (event.data.type == "addSupportCategory") {
          div = `<div onclick = "loadSupportCategory('`+item.name+`', '`+item.name+`')" class="supportBox supportList_`+item.name+`">`+item.name+`</div>`
          $('#supportCategoryList').append(div)
     }
     if (event.data.type == "resetTicket") {
          $('.support').remove()
     }
     if (event.data.type == "AddTicket") {
          div = `<div onclick="openTicket('`+item.id+`', '`+item.closed+`')" class="support">
          <img class="chatFrame" src="images/redFrame.png">
          <img class="chatAvatar" src="`+item.image+`">
          <p class="chatName">`+item.name+`</p>
          <p class="chatMessage">Category: `+item.category+`</p>
          <div class="chatRank support_active supportButton_`+item.id+`">Active</div>
      </div>`
      $('#supportList').append(div)
      if(item.closed) {
          $('.supportButton_'+item.id).removeClass('support_active')
          $('.supportButton_'+item.id).addClass('support_close')
          $('.supportButton_'+item.id).text('Closed')
      }
     }
     if (event.data.type == "createTicket") {
          $('#supportCreate').show()
     }
     if (event.data.type == "addTicketMessage") {
          div = `<div class="chat ticketChat_`+item.messageID+` ticketMessage">
          <img class="chatFrame" src="images/redFrame.png">
          <img class="chatAvatar" src="`+item.image+`">
          <p class="chatName">`+item.name+`</p>
          <p class="chatMessage">`+item.message+`</p>
          <div class="chatRank ticketRank_`+item.messageID+`">`+item.rank+`</div>
      </div>`
      $('#SupportChatArea').append(div)
      $('#SupportChatArea').scrollTop(1000252500)
      if(item.identifier == myIdentifier) {
          $('.ticketChat_'+item.messageID).addClass('myMessage')
      }
      if(item.rank == currentLanguage["player"]) {
          $('.ticketRank_'+item.messageID).addClass('rankPlayer')
      }
     }
     if (event.data.type == "openTicketMessage") {
          $('#supportChat').show()
          $('#supportTitle').text(item.text)
          targetTicket = item.id
     }
     if (event.data.type == "resetTicketMessage") {
          $('.ticketMessage').remove()
     }
     if (event.data.type == "updateIdentifier") {
          myIdentifier = item.identifier
     }
     if (event.data.type == "closeTicket") {
          exit()
     }
   })
})

function openTicket(id, closed) {
     if(closed == "false") {
          exit()
          $.post('http://team5m-admin/openTicket', JSON.stringify({
               id: id
          }));
     }
}    

function loadWeapon(name, label) {
     $('.weaponBox').removeClass('activeWeapon')
     $('.weaponList_'+name).addClass('activeWeapon')
     $('.weaponListName').text(label)
     selectedWeapon = name
     weaponListStatus = true
     weaponList()
}

function openDiscord() {
     if(targetDiscord) {
          window.invokeNative("openUrl", "https://discordapp.com/users/"+targetDiscord);
     }
}

function updateClass(id) {
     if(firstPlayer) {
          selectPlayer(id)
          firstPlayer = false
     }
     else {
          if(lastClass == "two") {
               lastClass = "one"
          }
          else {
               lastClass = "two"
          }
          $('.player_'+id).addClass(lastClass)
     }  
}

function selectPlayer(id) {
     targetDiscord = undefined
     $('.player_'+id).removeClass('one')
     $('.player_'+id).removeClass('two')

     $('.player').removeClass('playerSelect')
     $('.player_'+id).addClass('playerSelect')

     loading(true)
     $.post('http://team5m-admin/loadPlayer', JSON.stringify({
          id: id
     }));
}

function checkDuty() {
     $.post('http://team5m-admin/updateDuty', JSON.stringify({}));
}

function kickAll() {
     addInput(currentLanguage["kickAllInput"])
     openInput(currentLanguage["kickAllInputTitle"], "allkick")
}


function announcement() {
     addInput(currentLanguage["AnnouncementInput"])
     addInput(currentLanguage["AnnouncementInputDelay"])
     openInput(currentLanguage["AnnouncementInputTitle"], "announcement")
}

function addInput(text) {
     inputNumber++
     let input = `<input type="text" class="input input_`+inputNumber+`" placeholder="`+text+`">`
     $('#inputArea').append(input)
}

function openInput(title, target) {
     currentPage = "input"
     $('#inputTitle').text(title)
     $('#menu').addClass('dark')

     $('#inputArea').show()
     inputTarget = target
}

function closeInput() {
     currentPage = "main"
     inputTarget = undefined
     inputNumber = 0
     $('.input').remove()
     $('#inputArea').hide()
     $('#menu').removeClass('dark')
}

function acceptInput() {
     if(inputTarget == "announcement") {
          $.post('http://team5m-admin/announcement', JSON.stringify({
               text: $('.input_1').val(),
               delay: $('.input_2').val()
          }));
     }
     else if(inputTarget == "allkick") {
          $.post('http://team5m-admin/allKick', JSON.stringify({
               reason: $('.input_1').val()
          }));
     }
     else if(inputTarget == "givebankmoney") {
          $.post('http://team5m-admin/giveBankMoney', JSON.stringify({
               id: targetId,
               value: $('.input_1').val()
          }));
     }
     else if(inputTarget == "giveitem") {
          $.post('http://team5m-admin/giveItem', JSON.stringify({
               id: targetId,
               name: $('.input_1').val(),
               amount: $('.input_2').val(),
          }));
     }
     else if(inputTarget == "giveblackmoney") {
          $.post('http://team5m-admin/giveBlackMoney', JSON.stringify({
               id: targetId,
               value: $('.input_1').val()
          }));
     }
     else if(inputTarget == "giveweapon") {
          $.post('http://team5m-admin/giveWeapon', JSON.stringify({
               id: targetId,
               name: $('.input_1').val()
          }));
     }
     else if(inputTarget == "warn") {
          $.post('http://team5m-admin/warn', JSON.stringify({
               id: targetId,
               reason: $('.input_1').val()
          }));
     }
     else if(inputTarget == "kick") {
          $.post('http://team5m-admin/kick', JSON.stringify({
               id: targetId,
               reason: $('.input_1').val()
          }));
     }
     else if(inputTarget == "spawnvehicle") {
          $.post('http://team5m-admin/spawnVehicle', JSON.stringify({
               model: $('.input_1').val()
          }));

     }
     else if(inputTarget == "addvehicle") {
          $.post('http://team5m-admin/addVehicle', JSON.stringify({
               model: $('.input_1').val()
          }));
     }
     else if(inputTarget == "deletevehicle") {
          $.post('http://team5m-admin/deletePlayerVehicle', JSON.stringify({
               plate: $('.input_1').val()
          }));
     }
     // Personal
     else if(inputTarget == "personalgivebankmoney") {
          $.post('http://team5m-admin/giveBankMoney', JSON.stringify({
               id: myID,
               value: $('.input_1').val()
          }));
     }
     else if(inputTarget == "personalgiveblackmoney") {
          $.post('http://team5m-admin/giveBlackMoney', JSON.stringify({
               id: myID,
               value: $('.input_1').val()
          }));
     }
     else if(inputTarget == "personalgiveitem") {
          $.post('http://team5m-admin/giveItem', JSON.stringify({
               id: myID,
               name: $('.input_1').val(),
               amount: $('.input_2').val(),
          }));
     }
     else if(inputTarget == "changejob") {
          $.post('http://team5m-admin/changeJob', JSON.stringify({
               name: $('.input_1').val(),
               grade: $('.input_2').val(),
          }));
     }
     else if(inputTarget == "deleteweapon") {
          $.post('http://team5m-admin/deleteWeapon', JSON.stringify({
               id: myID,
               weapon: $('.input_1').val()
          }));
     }
     else if(inputTarget == "giveweaponplayer") {
          $.post('http://team5m-admin/giveWeaponPlayer', JSON.stringify({
               id: $('.input_1').val(),
               weapon: $('.input_2').val()
          }));
     }
     else if(inputTarget == "deleteweaponplayer") {
          $.post('http://team5m-admin/deleteWeaponPlayer', JSON.stringify({
               id: $('.input_1').val(),
               weapon: $('.input_2').val()
          }));
     }
     else if(inputTarget == "ban") {
          $.post('http://team5m-admin/ban', JSON.stringify({
               id: targetId,
               reason: $('.input_1').val()
          }));
     }
     closeInput()
}

function updateDuty(value) {
     if(value) {
          $('#mainSelectionDuty').removeClass('off')
          $('#mainSelectionDuty').addClass('on')
          $('#mainSelectionDutyBox').removeClass('offduty')
          $('#mainSelectionDutyBox').addClass('onduty')
          $('#mainSelectionDutyBox').text(currentLanguage["turnOn"])
     }
     else {
          $('#mainSelectionDuty').removeClass('on') 
          $('#mainSelectionDuty').addClass('off')
          $('#mainSelectionDutyBox').removeClass('onduty')
          $('#mainSelectionDutyBox').addClass('offduty')
          $('#mainSelectionDutyBox').text(currentLanguage["turnOff"])
     }
}

function updateDrift(value) {
     if(value) {
          $('.driftDuty').removeClass('off')
          $('.driftDuty').addClass('on')
          $('.driftBox').removeClass('offduty')
          $('.driftBox').addClass('onduty')
          $('.driftText').text(currentLanguage["turnOff"])
     }
     else {
          $('.driftDuty').removeClass('on') 
          $('.driftDuty').addClass('off')
          $('.driftBox').removeClass('onduty')
          $('.driftBox').addClass('offduty')
          $('.driftText').text(currentLanguage["turnOn"])
     }
}

function updateVehGod(value) {
     if(value) {
          $('.vehGodDuty').removeClass('off')
          $('.vehGodDuty').addClass('on')
          $('.vehGodBox').removeClass('offduty')
          $('.vehGodBox').addClass('onduty')
          $('.vehGodText').text(currentLanguage["turnOff"])
     }
     else {
          $('.vehGodDuty').removeClass('on') 
          $('.vehGodDuty').addClass('off')
          $('.vehGodBox').removeClass('onduty')
          $('.vehGodBox').addClass('offduty')
          $('.vehGodText').text(currentLanguage["turnOn"])
     }
}

function updatePlayerGod(value) {
     if(value) {
          $('.playerGodDuty').removeClass('off')
          $('.playerGodDuty').addClass('on')
          $('.playerGodBox').removeClass('offduty')
          $('.playerGodBox').addClass('onduty')
          $('.playerGodText').text(currentLanguage["turnOff"])
     }
     else {
          $('.playerGodDuty').removeClass('on') 
          $('.playerGodDuty').addClass('off')
          $('.playerGodBox').removeClass('onduty')
          $('.playerGodBox').addClass('offduty')
          $('.playerGodText').text(currentLanguage["turnOn"])
     }
}

function discordSetActive() {
     if(targetDiscord) {
          $('#mainAvatarDisordButton').removeClass('offlineDiscord') 
          $('#mainAvatarDisordButton').addClass('activeDiscord')
          $('#mainAvatarDisordButton').text('View Discord Profile')
     }
     else {
          $('#mainAvatarDisordButton').removeClass('activeDiscord')
          $('#mainAvatarDisordButton').addClass('offlineDiscord') 
          $('#mainAvatarDisordButton').text('Discord Not Found')
     }
}

function changePage(page) {
     $('.page').hide()
     $('#'+page).show()

     $('.button').removeClass('active')
     $('.button_'+page).addClass('active')
     chatPage = false

     if(page == "chatPage") {
          chatPage = true
     }
}

function formatBalance(balance) {
     var formatter = new Intl.NumberFormat('en-US', {
         style: 'currency',
         currency: 'USD',
       });
    return formatter.format(balance)   
 }
 

function updateGender(value) {
     if(value) {
          $('#mainAvatarSex').removeClass('female')
          $('#mainAvatarSex').addClass('male')

          $('.personalGender').removeClass('female')
          $('.personalGender').addClass('male')
     }
     else {
          $('#mainAvatarSex').removeClass('male')
          $('#mainAvatarSex').addClass('female')

          $('.personalGender').removeClass('male')
          $('.personalGender').addClass('female')
     }
}

function reviveAll() {
     $.post('http://team5m-admin/reviveAll', JSON.stringify({}));
}

function deleteVehicles() {
     $.post('http://team5m-admin/deleteVehicles', JSON.stringify({}));
}

function clearObjects() {
     $.post('http://team5m-admin/clearObjects', JSON.stringify({}));
}

function clearPeds() {
     $.post('http://team5m-admin/clearPeds', JSON.stringify({}));
}

function revive() {
     if(targetId) {
          $.post('http://team5m-admin/revive', JSON.stringify({
               id: targetId
          }));
     }
}

function heal() {
     if(targetId) {
          $.post('http://team5m-admin/heal', JSON.stringify({
               id: targetId
          }));
     }
}

function screenshot() {
     if(targetId) {
          $.post('http://team5m-admin/screenshot', JSON.stringify({
               id: targetId
          }));
     }   
}

function freeze() {
     if(targetId) {
          $.post('http://team5m-admin/freeze', JSON.stringify({
               id: targetId
          }));
     }
}

function giveArmor() {
     if(targetId) {
          $.post('http://team5m-admin/giveArmor', JSON.stringify({
               id: targetId
          }));
     }
}

function giveBankMoney() {
     if(targetId) {
          addInput(currentLanguage["giveBankInput"])
          openInput(currentLanguage["giveBankInputTitle"], "givebankmoney")
     }
}

function teleport() {
     if(targetId) {
          $.post('http://team5m-admin/teleport', JSON.stringify({
               id: targetId
          }));
     }
}

function giveBlackMoney() {
     if(targetId) {
          addInput(currentLanguage["giveBlackInput"])
          openInput(currentLanguage["giveBlackInputTitle"], "giveblackmoney")
     }
}

function giveItem() {
     if(targetId) {
          addInput(currentLanguage["giveItemInput"])
          addInput(currentLanguage["giveItemAmountInput"])
          openInput(currentLanguage["giveItemInputTitle"], "giveitem")
     }
}

function bring() {
     if(targetId) {
          $.post('http://team5m-admin/bring', JSON.stringify({
               id: targetId
          }));
     }
}

function giveWeapon() {
     if(targetId) {
          addInput(currentLanguage["giveWeaponInput"])
          openInput(currentLanguage["giveWeaponInputTitle"], "giveweapon")
     }
}

function warn() {
     if(targetId) {
          addInput(currentLanguage["giveWarnInput"])
          openInput(currentLanguage["giveWarnInputTitle"], "warn")
     }
}

function openInventory() {
     if(targetId) {
          $.post('http://team5m-admin/openInventory', JSON.stringify({
               id: targetId
          }));
     }
}

function kick() {
     if(targetId) {
          addInput(currentLanguage["kickAllInput"])
          openInput(currentLanguage["kickInputTitle"], "kick")
     }
}

function ban() {
     if(targetId) {
          addInput(currentLanguage["banInput"])
          openInput(currentLanguage["banTitle"], "ban")
     }
}

function addTag() {
     if(!tagStatus) {
          tagStatus = true
          $('.adminTag').text(currentLanguage["disable"])
          $.post('http://team5m-admin/addTag', JSON.stringify({
               value: true
          }));
     }
     else {
          tagStatus = false
          $('.adminTag').text(currentLanguage["enable"])
          $.post('http://team5m-admin/addTag', JSON.stringify({
               value: false
          }));  
     }
}

window.addEventListener("keyup", (event) => {
     event.preventDefault();
     if (event.key == "Escape") {
           exit()
     }
     if (event.key == "Enter") {
          sendMessage()
     }
})

function reset() {
     chatPage = false
     firstPlayer = true
     firstWeapon = true
     targetTicket = undefined

     
     $('.weaponBox').remove()
     $('.player').remove()
     $('.ticketMessage').remove()
     $('.support').remove()
}
 
function exit() {
     if(currentPage == "main") {
          reset()
          $('#seven_admin').hide()
          $('#supportChat').hide()
          $('#supportCreate').hide()
          changePage('mainPage')
          $.post('http://team5m-admin/exit', JSON.stringify({}));
     }
     else if(currentPage == "input") {
          closeInput()
     }
     else if(currentPage == "ticket") {
          $('#ticketInputArea').hide()
          currentPage = "main"
     }
}


function deleteCar() {
     $.post('http://team5m-admin/deleteVehicle', JSON.stringify({}));
}

function repairCar() {
     $.post('http://team5m-admin/repairCar', JSON.stringify({}));
}

function spawnCar() {
     addInput(currentLanguage["spawnCarInput"])
     openInput(currentLanguage["spawnCarInputTitle"], "spawnvehicle")
}

function drift() {
     $.post('http://team5m-admin/drift', JSON.stringify({}));
}

function flipVehicle() {
     $.post('http://team5m-admin/flipVehicle', JSON.stringify({}));
}

function vehGod() {
     $.post('http://team5m-admin/vehGod', JSON.stringify({}));
}

function addVehicle() {
     addInput(currentLanguage["addVehicleInput"])
     openInput(currentLanguage["addVehicleInputTitle"], "addvehicle")
}

function deleteVehicle() {
     addInput(currentLanguage["deleteVehicleInput"])
     openInput(currentLanguage["deleteVehicleInputTitle"], "deletevehicle")
}

// PERSONAL

function godMode() {
     $.post('http://team5m-admin/playerGod', JSON.stringify({}));
}

function invisible() {
     $.post('http://team5m-admin/invisible', JSON.stringify({}));
}

function personalHeal() {
     $.post('http://team5m-admin/heal', JSON.stringify({
          id: myID
     }));
}

function personalArmor() {
     $.post('http://team5m-admin/giveArmor', JSON.stringify({
          id: myID
     }));
}

function personalGiveBankMoney() {
     addInput(currentLanguage["giveBankInput"])
     openInput(currentLanguage["giveBankInputTitle"], "personalgivebankmoney")
}

function personalGiveBlackMoney() {
     addInput(currentLanguage["giveBlackInput"])
     openInput(currentLanguage["giveBlackInputTitle"], "personalgiveblackmoney")
}

function personalGiveItem() {
     addInput(currentLanguage["giveItemInput"])
     addInput(currentLanguage["giveItemAmountInput"])
     openInput(currentLanguage["giveItemInputTitle"], "personalgiveitem")
}

function getCoords() {
     $.post('http://team5m-admin/getCoords', JSON.stringify({}));
}

function changeJob() {
     addInput(currentLanguage["jobInput"])
     addInput(currentLanguage["jobInputGrade"])
     openInput(currentLanguage["jobInputTitle"], "changejob")
}

function updatePlayerGod(value) {
     if(value) {
          $('.playerGodDuty').removeClass('off')
          $('.playerGodDuty').addClass('on')
          $('.playerGodBox').removeClass('offduty')
          $('.playerGodBox').addClass('onduty')
          $('.playerGodText').text(currentLanguage["turnOff"])
     }
     else {
          $('.playerGodDuty').removeClass('on') 
          $('.playerGodDuty').addClass('off')
          $('.playerGodBox').removeClass('onduty')
          $('.playerGodBox').addClass('offduty')
          $('.playerGodText').text(currentLanguage["turnOn"])
     }
}

function updateInvisible(value) {
     if(value) {
          $('.invisibleDuty').removeClass('off')
          $('.invisibleDuty').addClass('on')
          $('.invisibleBox').removeClass('offduty')
          $('.invisibleBox').addClass('onduty')
          $('.invisibleText').text(currentLanguage["turnOff"])
     }
     else {
          $('.invisibleDuty').removeClass('on') 
          $('.invisibleDuty').addClass('off')
          $('.invisibleBox').removeClass('onduty')
          $('.invisibleBox').addClass('offduty')
          $('.invisibleText').text(currentLanguage["turnOn"])
     }
}

function noclip() {
     $.post('http://team5m-admin/noclip', JSON.stringify({}));
}

// WEAPON
var weaponListStatus = false

function deleteWeapon() {
     addInput(currentLanguage["giveWeaponInput"])
     openInput(currentLanguage["deleteWeaponInputTitle"], "deleteweapon")
}

function addWeaponPlayer() {
     addInput(currentLanguage["addWeaponID"])
     addInput(currentLanguage["giveWeaponInput"])
     openInput(currentLanguage["addWeaponInputTitle"], "giveweaponplayer")
}

function deleteWeaponPlayer() {
     addInput(currentLanguage["addWeaponID"])
     addInput(currentLanguage["giveWeaponInput"])
     openInput(currentLanguage["deleteWeaponPlayerInputTitle"], "deleteweaponplayer")
}

function fullTune() {
     $.post('http://team5m-admin/addComponents', JSON.stringify({}));
}

function weaponList() {
     if(weaponListStatus) {
          $('.weaponBox').hide()
          weaponListStatus =  false
     }
     else {
          $('.weaponBox').show()
          weaponListStatus =  true
     }
}

function spawnWeapon() {
     $.post('http://team5m-admin/spawnWeapon', JSON.stringify({
          weapon: selectedWeapon
     }));
}

function sendMessage() {
     if(!targetTicket) {
          var message = $('#chatInput').val()
          if(message.length > 0) {
               $.post('http://team5m-admin/sendMessage', JSON.stringify({
                    message: message
               }));
               $('#chatInput').val("")
          }
     }
     else {
          var message = $('#supportInput').val()
          if(message.length > 0) {
               $.post('http://team5m-admin/sendTicketMessage', JSON.stringify({
                    message: message
               }));
               $('#supportInput').val("")
          }
     }
}

function loading(value) {
     if(value) {
          $('.loading').show()
          // $('#menu').addClass('dark')
     }
     else {
          $('.loading').hide()
          // $('#menu').removeClass('dark')
     }
}

function spectate() {
     $.post('http://team5m-admin/spectate', JSON.stringify({
          id: targetId
     }));
}

var supportStatus = false
var selectedSupport = false

function supportList() {
     if(supportStatus) {
          $('.supportBox').hide()
          $('#supportCategoryList').hide()
          supportStatus =  false
     }
     else {
          $('.supportBox').show()
          $('#supportCategoryList').show()
          supportStatus =  true
     }
}

function loadSupportCategory(name, label) {
     $('.supportBox').removeClass('activeSupport')
     $('.supportList_'+name).addClass('activeSupport')
     $('.supportListName').text(label)
     supportStatus = true
     selectedSupport = name
     supportList()
}

function createTicket() {
     if ($('.supportInput').val() != "" && selectedSupport) {
          $.post('http://team5m-admin/createTicket', JSON.stringify({
               category: selectedSupport,
               title: $('.supportInput').val()
          }));
          closeTicket()
     }
}

function closeTicket() {
     $('.supportBox').remove()
     $('.supportInput').val("")
     $('#supportCreate').hide()
}

function exitSupport() {
     exit()
}

function endTicket() {
     $.post('http://team5m-admin/endTicket', JSON.stringify({
          id: targetTicket
     }));
}

function invitePlayer() {
     $('.inviteInput').val("")
     if(currentPage == "ticket") {
          $('#ticketInputArea').hide()
          currentPage = "main"
     }
     else {
          $('#ticketInputArea').show()
          currentPage = "ticket"
     }
}

function acceptInvite() {
     if ($('.inviteInput').val() != "") {
          $.post('http://team5m-admin/inviteTicket', JSON.stringify({
               id: $('.inviteInput').val()
          })); 
          invitePlayer()
     }
}