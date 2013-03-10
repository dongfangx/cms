document.domain = "qq.com";
expire = new Date((+new Date()) + 1 * 3600000);
cookie = {};
cookie.expires = expire;
cookie.path = "/";
cookie.domain = window.document.location.host;
(function(j, k, e, i) {
	var h = j.TD = {};
	h.ns = function(b) {
		if (!b || !b.length) {
			return null
		}
		var a = b.split(".");
		var d = h;
		for ( var c = ("TD" === a[0]) ? 1 : 0; c < a.length; ++c) {
			d[a[c]] = d[a[c]] || {};
			d = d[a[c]]
		}
		return d
	};
	h.env = {
		isIE : true === e.browser.msie,
		isEmbeded : false
	};
	h.env.isIE6 = h.env.isIE && 0 === e.browser.version.indexOf("6")
			&& !e.support.style;
	try {
		h.env.isEmbeded = null !== j.frameElement
	} catch (l) {
	}
	h.ref = {
		$win : e(j),
		$doc : e(k),
		$body : e("body")
	};
	h.cls = {
		invisible : "invisible",
		transparent : "transparent"
	};
	h.plugin = {};
	h.plugin.tcss = function(b, c, d) {
		h.plugin.tcss.sent = false;
		var a = /^(?!\.)[\w-]+(?:\.[\w-]+)*?$/;
		if (!b || "string" !== typeof b || !a.test(b)) {
			return
		}
		if (c && ("string" !== typeof c || !a.test(c))) {
			return
		} else {
			c = null
		}
		if (d && ("string" !== typeof d || !/^w+$/.test(d))) {
			return
		} else {
			d = "data-stats"
		}
		e.ajax( {
			type : "GET",
			url : "http://pingjs.qq.com/ping.js",
			success : function() {
				if (typeof (pgvMain) == "function") {
					c ? pgvMain("", {
						virtualDomain : c
					}) : pgvMain()
				}
			},
			dataType : "script",
			cache : true
		});
		h.ref.$doc.click(function(p) {
			if ("function" !== typeof (pgvSendClick)) {
				return
			}
			var r = p.target;
			if (!r || 1 !== r.nodeType) {
				return
			}
			var q = e(r).closest("a[" + d + "],input[" + d + "]");
			if (0 === q.length) {
				return
			}
			var f = q.attr(d);
			if (!a.test(f)) {
				return
			}
			var g = {
				hottag : b + "." + f
			};
			c && (g.virtualDomain = c);
			pgvSendClick(g)
		});
		h.plugin.tcss.sent = true
	};
	h.plugin.activeFix = function(a) {
		if (!h.env.isIE) {
			return
		}
		if (!a || "string" !== typeof a || !tagPattern.test(/^\w+$/)) {
			a = "activefix"
		}
		e("." + a).live("mouseup mouseout", function(b) {
			"mouseup" === b.type && b.preventDefault();
			b.target.blur()
		})
	};
	h.cookie = function(m, b, f) {
		if (typeof b == "undefined") {
			if (0 < document.cookie.length) {
				var c = document.cookie.match(new RegExp("(^| )" + m
						+ "=([^;]*)(;|$)"));
				return (null === c) ? "" : c[2]
			}
			return ""
		} else {
			if (h.cookie(m) == b) {
				return
			} else {
				f = e.extend( {
					expires : 1,
					path : "/",
					domain : window.document.location.hostname
				}, f || {});
				if (b === null) {
					b = "";
					f.expires = -1
				}
				var w = "";
				if (f.expires
						&& (typeof f.expires == "number" || f.expires.toUTCString)) {
					var x;
					if (typeof f.expires == "number") {
						x = new Date();
						x.setTime(x.getTime()
								+ (f.expires * 1 * 60 * 60 * 1000))
					} else {
						x = f.expires
					}
					w = x.toUTCString()
				}
				var d = f.path ? "; path=" + (f.path) : "";
				var a = f.domain ? "; domain=" + (f.domain) : jQuery.getHost();
				var g = f.secure ? "; secure" : "";
				document.cookie = m + "=" + b + "; path=" + d + "; domain=" + a
						+ "; expires=" + w
			}
		}
	};
	h.logout = function() {
		var a = cookie;
		a.domain = "qq.com";
		h.cookie("skey", "", a);
		h.cookie("uin", "", a);
		window.location.reload()
	};
	h.checkLogin = function() {
		h.cookie("uin") ? h.getUinInfo()
				: e("#top-bar .first")
						.html(
								'\u60a8\u8fd8\u672a\u767b\u5f55\uff0c\u8bf7<a class="login_a" href="#">\u767b\u5f55</a>');
		e(".login_a")
				.click(
						function() {
							e.blockUI( {
								message : e("#loginframe"),
								css : {
									top : "30%",
									left : "55%",
									width : "372px",
									border : "none"
								}
							});
							if (e("#login_ifr").attr("src").indexOf("http") < 0) {
								var a = window.location + "";
								a = a.indexOf("#") == -1 ? a : a.substring(0, a
										.indexOf("#"));
								e("#login_ifr")
										.attr(
												"src",
												"http://ui.ptlogin2.qq.com/cgi-bin/login?f_url=loginerroralert&reset_text=%D6%D8%D6%C3&style=0&appid=13000402&s_url="
														+ encodeURIComponent(a))
							}
						})
	};
	h.getUinNum = function(b) {
		var a = 0;
		if (b.charAt(0) == "o" || b.charAt(0) == "0") {
			a = a + 1;
			while (b.charAt(a) == "0") {
				a++
			}
			b = b.substr(a, b.length)
		}
		return b
	};
	h.getUinInfo = function() {
		e
				.ajax( {
					url : "http://c.pc.qq.com/fcgi-bin/plogin?cb=getstatus_callback&type=1",
					dataType : "jsonp",
					jsonp : "getstatus_callback",
					type : "get",
					cache : false,
					data : "Uin=" + h.getUinNum(h.cookie("uin")) + "&skey="
							+ h.cookie("skey")
				})
	};
	getstatus_callback = function(a) {
		if (a.ret == "suc") {
			if (a.Uname == "") {
				e("#top-bar .first")
						.html(
								"\u60a8\u597d\uff0c"
										+ h.cookie("qqmgr_uin")
										+ ' <a href="http://guanjia.qq.com/user/">\u4e2a\u4eba\u4e2d\u5fc3</a><a class="logout_a" href="javascript:void(0)">\u9000\u51fa</a>')
			} else {
				e("#top-bar .first")
						.html(
								"\u60a8\u597d\uff0c"
										+ a.Uname
										+ ' <a href="http://guanjia.qq.com/user/">\u4e2a\u4eba\u4e2d\u5fc3</a><a class="logout_a" href="javascript:void(0)">\u9000\u51fa</a>')
			}
			e(".logout_a").click(function() {
				h.logout()
			});
			e("body").attr("id") == "user" ? set_status(a) : null
		}
	};
	h.ref.$doc.ready(function() {
		h.plugin.tcss(h.ref.$body.attr("data-stats-prx"));
		h.env.isIE && h.plugin.activeFix();
		h.checkLogin()
	})
})(window, document, jQuery);
function ptlogin2_onResize(a, b) {
	$("#login_ifr").hide().css( {
		width : a + "px",
		height : b + "px"
	}).show();
	$("#loginframe").css( {
		width : a + "px",
		height : b + "px"
	})
}
function ptlogin2_onClose() {
	$.unblockUI()
};