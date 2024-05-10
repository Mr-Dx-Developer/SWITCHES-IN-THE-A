var app = new Vue({
   el: "#app",
   data: {
      selectedJobIndex: 1,
      display: false,
      data: [],
      jobs: [],
   },
   computed: {
      onLeftClick: function () {
         return () => {
            if (app.selectedJobIndex == 0) {
               document.querySelector(".slider").style.left =
                  "-" + (app.jobs.length - 2) * 502 + "px";
               app.selectedJobIndex = app.jobs.length - 1;
               return;
            }
            if (app.selectedJobIndex == 1) {
               document.querySelector(".slider").style.left = 502 + "px";
               app.selectedJobIndex = 0;
               return;
            }
            document.querySelector(".slider").style.left =
               "-" + (app.selectedJobIndex - 2) * 502 + "px";
            app.selectedJobIndex = app.selectedJobIndex - 1;
         };
      },
      onRightClick: function () {
         return () => {
            if (app.selectedJobIndex + 1 == app.jobs.length) return;
            document.querySelector(".slider").style.left =
               "-" + app.selectedJobIndex * 502 + "px";
            app.selectedJobIndex = app.selectedJobIndex + 1;
         };
      },
      selectJOB: function () {
         return (index) => {
            $.post(
               `https://${GetParentResourceName()}/item`,
               JSON.stringify({ text: index })
            );
            $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
            app.display = false;
         };
      },
   },
});

window.addEventListener("message", (event) => {
   switch (event.data.type) {
      case "ui":
         app.display = event.data.status;
         app.jobs = [];
         document.documentElement.style.setProperty('--color', event.data.color);
         for (const job in event.data.jobs) {
            app.jobs.push({
               data: event.data.jobs[job][0],
               info: event.data.jobs[job][3],
            });
         }
         break;

      default:
         console.log("unknow!");
         break;
   }
});

document.onkeyup = function (data) {
   if (data.which == 27) {
      $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
      app.display = false;
      return;
   }
};
