$(window).load(function () {
    "use strict";
    setTimeout(function () {
        $("#preloader").velocity({
            opacity: "0",
            complete: function () {
                $("#loading").velocity("transition.shrinkOut", {
                    duration: 100,
                    easing: [.7, 0, .3, 1]
                })
            }
        })
    }, 100), setTimeout(function () {
        $("#home-wrap").velocity("transition.fadeIn", {
            opacity: "1",
            complete: function () {
                setTimeout(function () {
                    $(".text-intro").each(function (e) {
                        var o;
                        o = this, setTimeout(function () {
                            /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ? $(o).removeClass("opacity-0") : $(o).addClass("animated-middle fadeInUp").removeClass("opacity-0")
                        }, 150 * e + 150)
                    })
                }, 100)
            }
        }, {
            duration: 100,
            easing: [.7, 0, .3, 1]
        })
    }, 0)
}), $(document).ready(function () {
    "use strict";
    var e, o, t;
    $("#open-more-info").on("click", function () {
        $("#info-wrap").toggleClass("show-info"), $("#home-wrap").toggleClass("hide-left"), $(".global-overlay").toggleClass("hide-overlay"), $("#first-inside").toggleClass("hide-top"), $("#second-inside").toggleClass("hide-bottom"), $("#back-side").toggleClass("show-side"), $(".hide-content").toggleClass("open-hide"), $("#close-more-info").toggleClass("hide-close"), $(".command-info-wrap").toggleClass("show-command"), $(".mCSB_scrollTools").toggleClass("mCSB_scrollTools-left"), setTimeout(function () {

        }, 350)
    }), $(".to-close").on("click", function () {
        $("#info-wrap").removeClass("show-info"), $("#home-wrap").removeClass("hide-left"), $(".global-overlay").removeClass("hide-overlay"), $("#first-inside").toggleClass("hide-top"), $("#second-inside").toggleClass("hide-bottom"), $("#back-side").toggleClass("show-side"), $(".hide-content").toggleClass("open-hide"), $("#close-more-info").toggleClass("hide-close"), $(".command-info-wrap").toggleClass("show-command"), $(".mCSB_scrollTools").toggleClass("mCSB_scrollTools-left"), setTimeout(function () {
        }, 350)
    }), $(".expand-player").on("click", function () {
        $("#home-wrap").velocity({
            opacity: "0"
        }, {
            duration: 0,
            easing: [.7, 0, .3, 1],
            delay: 0,
            complete: function () {
                $(".global-overlay").velocity({
                    opacity: "0"
                }, {
                    duration: 0,
                    easing: [.7, 0, .3, 1],
                    delay: 0
                })
            }
        })
    }), $(".compress-player").on("click", function () {
        $("#home-wrap").velocity({
            opacity: "1"
        }, {
            duration: 0,
            easing: [.7, 0, .3, 1],
            delay: 0,
            complete: function () {
                $(".global-overlay").velocity({
                    opacity: "1"
                }, {
                    duration: 0,
                    easing: [.7, 0, .3, 1],
                    delay: 0
                })
            }
        })
    }), $(function () {
        $("body").bind("mousewheel", function (e) {
            e.preventDefault();
            var o = this.scrollTop;
            this.scrollTop = o + e.deltaY * e.deltaFactor * -1
        })
    }), navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/) ? ($("body").addClass("scroll-touch"), $("a#open-more-info").on("click", function () {
        event.preventDefault();
        var e = "#" + this.getAttribute("data-target");
        $("html, body").animate({
            scrollTop: $(e).offset().top
        }, 500)
    })) : window.matchMedia("(min-width: 1025px)").matches && $(function () {
        $("[data-toggle='tooltip']").tooltip()
    }),
    ! function (e) {
        for (var o = function (e) {
                (e = e || window.event).preventDefault ? e.preventDefault() : e.returnValue = !1;
                var o = function e(o, t) {
                    return o && (t(o) ? o : e(o.parentNode, t))
                }(e.target || e.srcElement, function (e) {
                    return e.tagName && "FIGURE" === e.tagName.toUpperCase()
                });
                if (o) {
                    for (var i, n = o.parentNode, l = o.parentNode.childNodes, a = l.length, s = 0, r = 0; a > r; r++)
                        if (1 === l[r].nodeType) {
                            if (l[r] === o) {
                                i = s;
                                break
                            }
                            s++
                        } return i >= 0 && t(i, n), !1
                }
            }, t = function (e, o, t, i) {
                var n, l, a = document.querySelectorAll(".pswp")[0];
                if (l = function (e) {
                        for (var o, t, i, n, l = e.childNodes, a = l.length, s = [], r = 0; a > r; r++) o = l[r], 1 === o.nodeType && (t = o.children[0], i = t.getAttribute("data-size").split("x"), n = {
                            src: t.getAttribute("href"),
                            w: parseInt(i[0], 10),
                            h: parseInt(i[1], 10)
                        }, o.children.length > 1 && (n.title = o.children[1].innerHTML), t.children.length > 0 && (n.msrc = t.children[0].getAttribute("src")), n.el = o, s.push(n));
                        return s
                    }(o), n = {
                        galleryUID: o.getAttribute("data-pswp-uid"),
                        getThumbBoundsFn: function (e) {
                            var o = l[e].el.getElementsByTagName("img")[0],
                                t = window.pageYOffset || document.documentElement.scrollTop,
                                i = o.getBoundingClientRect();
                            return {
                                x: i.left,
                                y: i.top + t,
                                w: i.width
                            }
                        }
                    }, i)
                    if (n.galleryPIDs) {
                        for (var s = 0; s < l.length; s++)
                            if (l[s].pid === e) {
                                n.index = s;
                                break
                            }
                    } else n.index = parseInt(e, 10) - 1;
                else n.index = parseInt(e, 10);
                isNaN(n.index) || (t && (n.showAnimationDuration = 0), new PhotoSwipe(a, PhotoSwipeUI_Default, l, n).init())
            }, i = document.querySelectorAll(e), n = 0, l = i.length; l > n; n++) i[n].setAttribute("data-pswp-uid", n + 1), i[n].onclick = o;
        var a = function () {
            var e = window.location.hash.substring(1),
                o = {};
            if (e.length < 5) return o;
            for (var t = e.split("&"), i = 0; i < t.length; i++)
                if (t[i]) {
                    var n = t[i].split("=");
                    n.length < 2 || (o[n[0]] = n[1])
                } return o.gid && (o.gid = parseInt(o.gid, 10)), o
        }();
        a.pid && a.gid && t(a.pid, i[a.gid - 1], !0, !0)
    }(".my-gallery")
});