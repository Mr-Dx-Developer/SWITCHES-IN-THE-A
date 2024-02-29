$(document).ready(function() {
	"use strict";

	function e() {
	 $(".expand-player").on("click", function() {
		$("#home-wrap").velocity({
			opacity: "0"
		}, {
			duration: 0,
			easing: [.7, 0, .3, 1],
			delay: 0,
			complete: function() {
				$(".global-overlay").velocity({
					opacity: "0"
				}, {
					duration: 0,
					easing: [.7, 0, .3, 1],
					delay: 0
				})
			}
		})
	}), $(".compress-player").on("click", function() {
		$("#home-wrap").velocity({
			opacity: "1"
		}, {
			duration: 0,
			easing: [.7, 0, .3, 1],
			delay: 0,
			complete: function() {
				$(".global-overlay").velocity({
					opacity: "1"
				}, {
					duration: 0,
					easing: [.7, 0, .3, 1],
					delay: 0
				})
			}
		})
	}), $(function() {
		$("body").bind("mousewheel", function(e) {
			e.preventDefault();
			var o = this.scrollTop;
			this.scrollTop = o + e.deltaY * e.deltaFactor * -1
		})
	});
	var a = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/);
	e(), window.matchMedia("(min-width: 1025px)").matches && $(function() {
		$("[data-toggle='tooltip']").tooltip()
	}), $("#notifyMe").notifyMe(),
	function() {
		var e = document.querySelector("[data-dialog]"),
		o = document.getElementById(e.getAttribute("data-dialog")),
		t = new DialogFx(o);
		e.addEventListener("click", t.toggle.bind(t))
	}();
	var i = function(e) {
		for (var o = function(e) {
			for (var o = e.childNodes, t = o.length, l = [], n, a, i, r, s = 0; t > s; s++) n = o[s], 1 === n.nodeType && (a = n.children[0], i = a.getAttribute("data-size").split("x"), r = {
				src: a.getAttribute("href"),
				w: parseInt(i[0], 10),
				h: parseInt(i[1], 10)
			}, n.children.length > 1 && (r.title = n.children[1].innerHTML), a.children.length > 0 && (r.msrc = a.children[0].getAttribute("src")), r.el = n, l.push(r));
				return l
			}, t = function d(e, o) {
				return e && (o(e) ? e : d(e.parentNode, o))
			}, l = function(e) {
				e = e || window.event, e.preventDefault ? e.preventDefault() : e.returnValue = !1;
				var o = e.target || e.srcElement,
				l = t(o, function(e) {
					return e.tagName && "FIGURE" === e.tagName.toUpperCase()
				});
				if (l) {
					for (var n = l.parentNode, i = l.parentNode.childNodes, r = i.length, s = 0, c, d = 0; r > d; d++)
						if (1 === i[d].nodeType) {
							if (i[d] === l) {
								c = s;
								break
							}
							s++
						}
						return c >= 0 && a(c, n), !1
					}
				}, n = function() {
					var e = window.location.hash.substring(1),
					o = {};
					if (e.length < 5) return o;
					for (var t = e.split("&"), l = 0; l < t.length; l++)
						if (t[l]) {
							var n = t[l].split("=");
							n.length < 2 || (o[n[0]] = n[1])
						}
						return o.gid && (o.gid = parseInt(o.gid, 10)), o
					}, a = function(e, t, l, n) {
						var a = document.querySelectorAll(".pswp")[0],
						i, r, s;
						if (s = o(t), r = {
							galleryUID: t.getAttribute("data-pswp-uid"),
							getThumbBoundsFn: function(e) {
								var o = s[e].el.getElementsByTagName("img")[0],
								t = window.pageYOffset || document.documentElement.scrollTop,
								l = o.getBoundingClientRect();
								return {
									x: l.left,
									y: l.top + t,
									w: l.width
								}
							}
						}, n)
							if (r.galleryPIDs) {
								for (var c = 0; c < s.length; c++)
									if (s[c].pid === e) {
										r.index = c;
										break
									}
								} else r.index = parseInt(e, 10) - 1;
								else r.index = parseInt(e, 10);
								isNaN(r.index) || (l && (r.showAnimationDuration = 0), i = new PhotoSwipe(a, PhotoSwipeUI_Default, s, r), i.init())
							}, i = document.querySelectorAll(e), r = 0, s = i.length; s > r; r++) i[r].setAttribute("data-pswp-uid", r + 1), i[r].onclick = l;
			var c = n();
			c.pid && c.gid && a(c.pid, i[c.gid - 1], !0, !0)
	};