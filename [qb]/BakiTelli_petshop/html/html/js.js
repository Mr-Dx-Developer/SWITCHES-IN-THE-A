console.log("discord.gg/debux | Tebex : debux.shop")

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    console.log(event.data.action)
    if (event.data.action == "openmenu") {
      $(".bg").css("display", "block");
  } 
});
});

$(".close-button").click(function () {
  $(".bg").css("display", "none");
	$.post('http://BakiTelli_petshop/closenui', JSON.stringify({}));
});