$(document).ready(function () {
  window.addEventListener("message", function (event) {
    var item = event.data;
    if (item.display == "viewRegistration") {
      $("#2").text(item.citizenName);
      $("#3").text(item.registeredPLate);
      $("#4").text(item.vehicleMModel);
      if (item.registrationExpire == "") {
        $("#conditional").hide();
      } else {
        $("#conditional").show();
        $("#5").text(item.registrationExpire);
      }
      $("#vehiclerc").fadeIn();
    } else if (item.display == "viewInsurance") {
      $("#2i").text(item.citizenName);
      $("#3i").text(item.registeredPLate);
      $("#4i").text(item.vehicleMModel);
      $("#5i").text(item.insuranceDate);
      $("#6i").text(item.insuranceExpire);
      $("#vehicleinsurance").fadeIn();
    } else if (item.display == "viewHealthInsurance") {
      $("#1p").text(item.citizenID);
      $("#2p").text(item.citizenName);
      $("#3p").text(item.insuranceDate);
      $("#4p").text(item.insuranceExpire);
      $("#healthinsurance").fadeIn();
    } else if (item.display == "viewHomeInsurance") {
      $("#1c").text(item.citizenID);
      $("#2c").text(item.citizenName);
      $("#3c").text(item.insuranceDate);
      $("#4c").text(item.insuranceExpire);
      $("#homeinsurance").fadeIn();
    } else if (item.action == "close") {
      $("#vehiclerc").fadeOut();
      $("#vehicleinsurance").fadeOut();
      $("#healthinsurance").fadeOut();
      $("#homeinsurance").fadeOut();
    }
  });
});
