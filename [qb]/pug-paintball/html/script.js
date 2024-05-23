var CreatorActive = false;
var PBallActive = false;

$(document).ready(function(){
    window.addEventListener('message', function(event){
        var data = event.data;

        if (data.action == "Update") {
            UpdatePBUI(data.type, data);
        }
    });
});

function UpdatePBUI(type, data) {
    if (type == "scoreboard") {
        if (data.active) {
            if (!PBallActive) {
                PBallActive = true;
                $(".editor").hide();
                $("#pball-RedScore").html(data.data.rScore);
                $("#pball-BlueScore").html(data.data.bScore);
                
                $("#pball-firstplacer").html(data.data.firstplacer);
                $("#pball-secondplacer").html(data.data.secondplacer);
                $("#pball-thirdplacer").html(data.data.thirdplacer);
                $("#pball-fourthplacer").html(data.data.fourthplacer);
                $("#pball-fithplacer").html(data.data.fithplacer);
                $("#pball-sixthplacer").html(data.data.sixthplacer);
                $("#pball-seventhplacer").html(data.data.seventhplacer);
                $("#pball-eigthplacer").html(data.data.eigthplacer);
                $("#pball-ninethplacer").html(data.data.ninethplacer);
                $("#pball-tenthplacer").html(data.data.tenthplacer);
                $("#pball-elleventhplacer").html(data.data.elleventhplacer);
                $("#pball-twelveplacer").html(data.data.twelveplacer);

                $("#pball-firstplaceb").html(data.data.firstplaceb);
                $("#pball-secondplaceb").html(data.data.secondplaceb);
                $("#pball-thirdplaceb").html(data.data.thirdplaceb);
                $("#pball-fourthplaceb").html(data.data.fourthplaceb);
                $("#pball-fithplaceb").html(data.data.fithplaceb);
                $("#pball-sixthplaceb").html(data.data.sixthplaceb);
                $("#pball-seventhplaceb").html(data.data.seventhplaceb);
                $("#pball-eigthplaceb").html(data.data.eigthplaceb);
                $("#pball-ninethplaceb").html(data.data.ninethplaceb);
                $("#pball-tenthplaceb").html(data.data.tenthplaceb);
                $("#pball-elleventhplaceb").html(data.data.elleventhplaceb);
                $("#pball-twelveplaceb").html(data.data.twelveplaceb);
                
                $(".background").fadeIn(300);
                $(".background2").fadeIn(300);
                $(".pball").fadeIn(300);
                $("#pball-player").html('PLAYER');
                $("#pball-kills").html('KILLS');
                $("#pball-deaths").html('DEATHS');
                $("#pball-points").html('POINTS');
                $("#pball-mode").html(data.data.mode);
            } else {
                $("#pball-RedScore").html(data.data.rScore);
                $("#pball-BlueScore").html(data.data.bScore);

                $("#pball-firstplacer").html(data.data.firstr);
                $("#pball-secondplacer").html(data.data.secondr);
                $("#pball-thirdplacer").html(data.data.thirdr);

                $("#pball-firstplacebl").html(data.data.firstbl);
            }
        } else {
            PBallActive = false;
            $(".editor").hide();
            $(".pball").fadeOut(300);
            $(".background").fadeOut(300);
            $(".background2").fadeOut(300);
        }
    }
}