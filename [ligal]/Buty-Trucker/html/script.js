$(function () {
    function display(bool) {
        if (bool) {
            document.getElementById("body").style.display="block";
        } else {
            document.getElementById("body").style.display="none";
        }
    }

    function display2(bool) {
        if (bool) {
            document.getElementById("body").style.display="block";
        } else {
            document.getElementById("body").style.display="none";
        }
    }

    display(false)
    display2(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
                $(".end").hide();
                $(".experience2").hide();
            } else {
                display(false)
            }
        }
        if (item.type === "end") {
            if (item.status == true) {
                display2(true)
                $(".end").show();
                $(".experience2").show();
                $(".fondo").hide();
                $(".legal").hide();
                $(".ilegal").hide();
                $(".info").hide();
                $(".info2").hide();
                $(".experience").hide();
                $("#totalexp").text(item.exp)
                $("#money").text(item.money)
            }
        }
        if (item.type === "end2") {
            if (item.status == false) {
                display2(false)
                $(".fondo").show();
                $(".legal").show();
                $(".ilegal").show();
                $(".experience").show();
            }
        }
        if (item.type === "exp") {
            if (item.tipo < item.exprequired) {
                document.getElementById("exp2").textContent="LEVEL 1:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired)
                $("#moneylegal").text(item.money + '$')
                $("#moneyilegal").text(item.blackmoney + '$')
            } else if (item.tipo < item.exprequired2) {
                document.getElementById("exp2").textContent="LEVEL 2:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired2)
                $("#moneylegal").text(item.money2 + '$')
                $("#moneyilegal").text(item.blackmoney2 + '$')
            }else if (item.tipo < item.exprequired3) {
                document.getElementById("exp2").textContent="LEVEL 3:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired3)
                $("#moneylegal").text(item.money3 + '$')
                $("#moneyilegal").text(item.blackmoney3 + '$')
            } else if (item.tipo < item.exprequired4) {
                document.getElementById("exp2").textContent="LEVEL 4:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired4)
                $("#moneylegal").text(item.money4 + '$')
                $("#moneyilegal").text(item.blackmoney4 + '$')
            } else if (item.tipo < item.exprequired5) {
                document.getElementById("exp2").textContent="LEVEL 5:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired5)
                $("#moneylegal").text(item.money5 + '$')
                $("#moneyilegal").text(item.blackmoney5 + '$')
            } else if (item.tipo < item.exprequired6) {
                document.getElementById("exp2").textContent="LEVEL 6:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired6)
                $("#moneylegal").text(item.money6 + '$')
                $("#moneyilegal").text(item.blackmoney6 + '$')
            } else if (item.tipo < item.exprequired7) {
                document.getElementById("exp2").textContent="LEVEL 7:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired7)
                $("#moneylegal").text(item.money7 + '$')
                $("#moneyilegal").text(item.blackmoney7 + '$')
            } else if (item.tipo < item.exprequired8) {
                document.getElementById("exp2").textContent="LEVEL 8:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired8)
                $("#moneylegal").text(item.money8 + '$')
                $("#moneyilegal").text(item.blackmoney8 + '$')
            } else if (item.tipo < item.exprequired9) {
                document.getElementById("exp2").textContent="LEVEL 9:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired9)
                $("#moneylegal").text(item.money9 + '$')
                $("#moneyilegal").text(item.blackmoney9 + '$')
            } else if (item.tipo < item.exprequired10) {
                document.getElementById("exp2").textContent="LEVEL MAX:";
                $("#exp").text(item.tipo+ ' / ' + item.exprequired10)
                $("#moneylegal").text(item.money10 + '$')
                $("#moneyilegal").text(item.blackmoney10 + '$')
            } 
        }
        if (item.type === "exp") {
            if (item.tipo > 0) {
                document.getElementById("exp3").textContent="LEVEL 1:";
                $("#exp1").text(item.tipo+ ' / 1500')

            } else if (item.tipo > 100) {
                document.getElementById("exp3").textContent="LEVEL 2:";
                $("#exp1").text(item.tipo+ ' / 3000')

            }else if (item.tipo > 200) {
                document.getElementById("exp3").textContent="LEVEL 3:";
                $("#exp1").text(item.tipo+ ' / 4500')

            } else if (item.tipo > 300) {
                document.getElementById("exp3").textContent="LEVEL 4:";
                $("#exp1").text(item.tipo+ ' / 6000')

            } else if (item.tipo > 400) {
                document.getElementById("exp3").textContent="LEVEL 5:";
                $("#exp1").text(item.tipo+ ' / 7500')

            } else if (item.tipo > 500) {
                document.getElementById("exp2").textContent="LEVEL 6:";
                $("#exp").text(item.tipo+ ' / 9000')

            } else if (item.tipo > 600) {
                document.getElementById("exp2").textContent="LEVEL 7:";
                $("#exp").text(item.tipo+ ' / 10500')

            } else if (item.tipo > 700) {
                document.getElementById("exp2").textContent="LEVEL 8:";
                $("#exp").text(item.tipo+ ' / 12000')

            } else if (item.tipo > 800) {
                document.getElementById("exp2").textContent="LEVEL 9:";
                $("#exp").text(item.tipo+ ' / 13500')

            } else if (item.tipo > 900) {
                document.getElementById("exp2").textContent="LEVEL MAX:";
                $("#exp").text(item.tipo+ ' / 15000')

            } 
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
            $(".info").hide();
            $(".info2").hide();
            return
        }
    };
        
    $(".menu").click(function(){
        $(".info").show();
        $(".info2").hide();
    });

    $(".menu2").click(function(){
        $(".info2").show();
        $(".info").hide();
    });

    $("#check").click(function(){
        $.post(`https://${GetParentResourceName()}/legal`, JSON.stringify({}));
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
        $(".info").hide();
    });

    $(".no").click(function(){
        $(".info").hide();
    });

    $("#check2").click(function(){
        $.post(`https://${GetParentResourceName()}/ilegal`, JSON.stringify({}));
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
        $(".info2").hide();
    });

    $("#no2").click(function(){
        $(".info2").hide();
    });

})