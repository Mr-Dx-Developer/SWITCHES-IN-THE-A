console.log("discord.gg/debux | Tebex : debux.shop")

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    if (event.data.action == "announceadmin") {
      $('#kutu').empty();
      $(".bg").css("display", "block");
      $(".main-admin").css("display", "block");
  } 
  if (event.data.action == "announceclient") {
    $('#kutu').empty();
    $('#kutu2').empty();
    $(".main-admin").css("display", "none");
    $(".bg").css("display", "block");
    $(".main-client").css("display", "block");
} 
  if (event.data.action == "notify-1") {
    $(".bg").css("display", "none");
    $(".main-admin").css("display", "none");
    $(".main-client").css("display", "none");
    $(".notify").css("display", "block");
    $(".notify").animate({
      top: "0.15vw"
  }, 1000);
    $(".text-4").html(event.data.text);
} 
if (event.data.action == "addpost-1") {
html = `
<div class="recent-box">
<div class="baslik">`+event.data.servername+` <p>`+event.data.tarih+`</p></div>
<div class="text">`+event.data.text+`</div>
</div>
`
$('#kutu').prepend(html);
} 
if (event.data.action == "addpost-2") {
  html = `
  <div class="recent-box-2">
  <div class="baslik-3">`+event.data.servername+` <p>`+event.data.tarih+`</p></div>
  <div class="text-3">`+event.data.text+`</div>
</div>
  `
  $('#kutu2').prepend(html);
  } 
  if (event.data.action == "addpost-2-big") {
    html = `
    <div class="big-recent-box">
    <div class="baslik-2">`+event.data.servername+` <p>`+event.data.tarih+`</p></div>
  <div class="text-2">`+event.data.text+`</div>
</div>
    `
    $('#kutu2-big').prepend(html);
    } 
if (event.data.action == "notify-1-display") {
  $(".bg").css("display", "none");
  $(".main-admin").css("display", "none");
  $(".main-client").css("display", "none");
  $(".main-client").css("display", "none");
  $(".notify").animate({
    top: "-10.8vw"
}, 1000);
} 

if (event.data.action == "notify-1-display-N") {

$(".notify").css("display", "none");
} 
if (event.data.action == "notify-2") {
  $(".bg").css("display", "none");
  $(".main-admin").css("display", "none");
  $(".main-client").css("display", "none");
  $(".notify-bg-big").css("display", "block");
  $(".main-client").css("display", "none");
  $(".notify-bg-big").animate({
    top: "37.15vw"
}, 1000);
  $(".text-5").html(event.data.text);
} 
if (event.data.action == "notify-2-display") {
$(".bg").css("display", "none");
$(".main-admin").css("display", "none");
$(".main-client").css("display", "none");
$(".main-client").css("display", "none");
$(".notify-bg-big").animate({
  top: "-22vw"
}, 1000);
} 

if (event.data.action == "notify-2-display-N") {

$(".notify-bg-big").css("display", "none");
}  
});
});

$(document).on('keydown', function(event) {
  switch(event.keyCode) {
      case 27: // ESC
          $(".bg").css("display", "none");
          $(".main-admin").css("display", "none");
          $(".main-client").css("display", "none");
          $('#kutu2-big').empty();
          $.post('https://Dx-announce/close');
  }
});

$(".button-1").click(function () {
  $(".bg").css("display", "none");
  $(".main-admin").css("display", "none");
  $(".main-client").css("display", "none");
  $.post('https://Dx-announce/close');
  var id = $(".input").val()
  $.post('https://Dx-announce/button-1', JSON.stringify({
      id: id
  }));
});


$(".button-2").click(function () {
  $(".bg").css("display", "none");
  $(".main-admin").css("display", "none");
  $(".main-client").css("display", "none");
  $.post('https://Dx-announce/close');
  var id = $(".input").val()
  $.post('https://Dx-announce/button-2', JSON.stringify({
      id: id
  }));
});

$(".button-3").click(function () {
  $(".bg").css("display", "none");
  $(".main-admin").css("display", "none");
  $(".main-client").css("display", "none");
  $.post('https://Dx-announce/close');
  var id = $(".input").val()
  $.post('https://Dx-announce/button-1', JSON.stringify({
      id: id
  }));
  $.post('https://Dx-announce/button-3', JSON.stringify({
    id: id,
    tarih: GetDateAndTime(),
}));
});

$(".button-4").click(function () {
  $(".bg").css("display", "none");
  $(".main-admin").css("display", "none");
  $(".main-client").css("display", "none");
  $.post('https://Dx-announce/close');
  var id = $(".input").val()
  $.post('https://Dx-announce/button-2', JSON.stringify({
      id: id
  }));
  $.post('https://Dx-announce/button-4', JSON.stringify({
    id: id,
    tarih: GetDateAndTime(),
}));
});

function GetDateAndTime() {
  var tarih = new Date();
  return anlik = (("0" + tarih.getDate()).slice(-2) + "-" + ("0" + (tarih.getMonth()+1)).slice(-2)  + "-" + tarih.getFullYear() + " " + ("0" + tarih.getHours()).slice(-2) + ":" + ("0" + tarih.getMinutes()).slice(-2))
}