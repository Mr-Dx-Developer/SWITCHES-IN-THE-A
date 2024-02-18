(function() {
  var mainElement = document.getElementById("main");
  var content1Element = document.getElementById("content1");
  var content2Element = document.getElementById("content2");

  mainElement.style.display = "none";

  window.addEventListener("message", function(event) {
      if (event.data.action === "open") {
          mainElement.style.display = "block";

          content2Element.style.display = (event.data.content === undefined) ? "none" : "block";

          content1Element.innerHTML = event.data.title;
          content2Element.innerHTML = event.data.content;

          $('#main').animate({
              'margin-left': '-5%'
          });
      } else if (event.data.action === "close") {
          $('#main').animate({
              'margin-left': '-30%'
          });

          setTimeout(function() {
              mainElement.style.display = "none";
              content1Element.innerHTML = "";
              content2Element.innerHTML = "";
          }, 1000);
      }
  });
})();
