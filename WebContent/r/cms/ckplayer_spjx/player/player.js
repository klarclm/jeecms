function ckcpt() {
    var a = "";
    return a
}
function ckstyle() {
    var a = {
        cpath: "",
        language: "",
        flashvars: "",
        setup: "1,1,1,1,1,2,0,1,0,0,0,1,200,0,2,1,0,1,1,1,2,10,3,0,1,1,3000,0,0,0,0,1,1,1,1,1,1,250,0,90,0,0",
        pm_bg: "0x000000,100,230,180",
        mylogo: "logo.swf",
        pm_mylogo: "1,1,-100,-55",
        logo: "cklogo.png",
        pm_logo: "2,0,-100,20",
        control_rel: "related.swf,ckplayer/related.xml,0",
        control_pv: "Preview.swf,105,2000",
        pm_repc: "",
        pm_spac: "|",
        pm_fpac: "file->f",
        pm_advtime: "2,0,-110,10,0,300,0",
        pm_advstatus: "1,2,2,-200,-40",
        pm_advjp: "1,1,2,2,-100,-40",
        pm_padvc: "2,0,-10,-10",
        pm_advms: "2,2,-46,-56",
        pm_zip: "1,1,-20,-8,1,0,0",
        pm_advmarquee: "1,2,50,-60,50,20,0,0x000000,50,0,20,1,30,2000",
        pm_glowfilter: "1,0x01485d, 100, 6, 3, 10, 1, 0, 0",
        advmarquee: escape(''),
        mainfuntion: "",
        flashplayer: "",
        calljs: "ckplayer_status,ckadjump,playerstop,ckmarqueeadv",
        myweb: escape(""),
        cpt_lights: "1",
        cpt_share: "ckplayer/share.xml",
        cpt_list: ckcpt()
    };
    return a
}
!function () {
    var CKobject = {
        _K_: function (a) {
            return document.getElementById(a)
        },
        _T_: !1,
        _M_: !1,
        _G_: !1,
        _Y_: !1,
        _I_: null,
        _J_: 0,
        _O_: {},
        uaMatch: function (a, b, c, d, e, f, g, h, i) {
            var j = b.exec(a);
            return null != j ? {b: "IE", v: j[2] || "0"} : (j = c.exec(a), null != j ? {
                b: j[1] || "",
                v: j[2] || "0"
            } : (j = d.exec(a), null != j ? {b: j[1] || "", v: j[2] || "0"} : (j = e.exec(a), null != j ? {
                b: j[1] || "",
                v: j[2] || "0"
            } : (j = f.exec(a), null != j ? {b: j[2] || "", v: j[1] || "0"} : (j = g.exec(a), null != j ? {
                b: j[1] || "",
                v: j[2] || "0"
            } : (j = h.exec(a), null != j ? {b: j[1] || "", v: j[2] || "0"} : (j = i.exec(a), null != j ? {
                b: j[1] || "",
                v: j[2] || "0"
            } : {b: "unknown", v: "0"})))))))
        },
        browser: function () {
            var a = navigator.userAgent, c = /(msie\s|trident.*rv:)([\w.]+)/, d = /(firefox)\/([\w.]+)/, e = /(opera).+version\/([\w.]+)/, f = /(chrome)\/([\w.]+)/, g = /version\/([\w.]+).*(safari)/, h = /(safari)\/([\w.]+)/, i = /(mozilla)\/([\w.]+)/, j = /(mobile)\/([\w.]+)/, k = a.toLowerCase(), l = this.uaMatch(k, c, d, e, f, g, h, i, j);
            return l.b && (b = l.b, v = l.v), {B: b, V: v}
        },
        Platform: function () {
            var d, e, a = "", b = navigator.userAgent;
            navigator.appVersion, d = {
                iPhone: b.indexOf("iPhone") > -1 || b.indexOf("Mac") > -1,
                iPad: b.indexOf("iPad") > -1,
                ios: !!b.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
                android: b.indexOf("Android") > -1 || b.indexOf("Linux") > -1,
                webKit: b.indexOf("AppleWebKit") > -1,
                trident: b.indexOf("Trident") > -1,
                gecko: b.indexOf("Gecko") > -1 && -1 == b.indexOf("KHTML"),
                presto: b.indexOf("Presto") > -1,
                mobile: !!b.match(/AppleWebKit.*Mobile.*/) || !!b.match(/AppleWebKit/),
                webApp: -1 == b.indexOf("Safari")
            };
            for (e in d)if (d[e]) {
                a = e;
                break
            }
            return a
        },
        isHTML5: function () {
            return !!document.createElement("video").canPlayType
        },
        getType: function () {
            return this._T_
        },
        getVideo: function () {
            var c, d, a = "", b = this._E_["v"];
            if (b && b.length > 1)for (c = 0; c < b.length; c++)d = b[c].split("->"), d.length >= 1 && "" != d[0] && (a += '<source src="' + d[0] + '"'), d.length >= 2 && "" != d[1] && (a += ' type="' + d[1] + '"'), a += ">";
            return a
        },
        getVars: function (a) {
            var b = this._A_;
            return "undefined" == typeof b ? null : a in b ? b[a] : null
        },
        getParams: function () {
            var a = "";
            return this._A_ && (1 == parseInt(this.getVars("p")) && (a += ' autoplay="autoplay"'), 1 == parseInt(this.getVars("e")) && (a += ' loop="loop"'), 2 == parseInt(this.getVars("p")) && (a += ' preload="metadata"'), this.getVars("i") && (a += ' poster="' + this.getVars("i") + '"')), a
        },
        getpath: function (a) {
            var d, e, f, g, h, j, k, l, m, n, o, p, q, b = "CDEFGHIJKLMNOPQRSTUVWXYZcdefghijklmnopqrstuvwxyz", c = a.substr(0, 1);
            if (b.indexOf(c) > -1 && (a.substr(0, 4) == c + "://" || a.substr(0, 4) == c + ":\\"))return a;
            for (d = unescape(window.location.href).replace("file:///", ""), e = parseInt(document.location.port), f = document.location.protocol + "//" + document.location.hostname, g = "", h = "", j = "", k = 0, l = unescape(a).split("//"), l.length > 0 && (g = l[0] + "//"), m = "http|https|ftp|rtsp|mms|ftp|rtmp|file", n = m.split("|"), 80 != e && e && (f += ":" + e), i = 0; i < n.length; i++)if (n[i] + "://" == g) {
                k = 1;
                break
            }
            if (0 == k)if ("/" == a.substr(0, 1))j = f + a; else {
                for (h = d.substring(0, d.lastIndexOf("/") + 1).replace("\\", "/"), c = a.replace("../", "./"), f = c.split("./"), o = f.length, l = c.replace("./", ""), p = h.split("/"), q = p.length - o, i = 0; q > i; i++)j += p[i] + "/";
                j += l
            } else j = a;
            return j
        },
        getXhr: function () {
            var a;
            try {
                a = new ActiveXObject("Msxml2.XMLHTTP")
            } catch (b) {
                try {
                    a = new ActiveXObject("Microsoft.XMLHTTP")
                } catch (b) {
                    a = !1
                }
            }
            return a || "undefined" == typeof XMLHttpRequest || (a = new XMLHttpRequest), a
        },
        getX: function () {
            var f = "ckstyle()";
            this.getVars("x") && 1 != parseInt(this.getVars("c")) && (f = this.getVars("x") + "()");
            try {
                "object" == typeof eval(f) && (this._X_ = eval(f))
            } catch (e) {
                try {
                    "object" == typeof eval(ckstyle) && (this._X_ = ckstyle())
                } catch (e) {
                    this._X_ = ckstyle()
                }
            }
        },
        getSn: function (a, b) {
            return b >= 0 ? this._X_[a].split(",")[b] : this._X_[a]
        },
        getUrl: function (a, b) {
            var d, e, c = ["get", "utf-8"];
            a && 2 == a.length && (d = a[0], e = a[1].split("/"), e.length >= 2 && (c[0] = e[1]), e.length >= 3 && (c[1] = e[2]), this.ajax(c[0], c[1], d, function (a) {
                var d, e, f, g, h, c = CKobject;
                if (a && "error" != a) {
                    if (d = "", e = a, a.indexOf("}") > -1) {
                        for (f = a.split("}"), g = 0; g < f.length - 1; g++)d += f[g] + "}", h = f[g].replace("{", "").split("->"), 2 == h.length && (c._A_[h[0]] = h[1]);
                        e = f[f.length - 1]
                    }
                    c._E_["v"] = e.split(","), b ? c.showHtml5() : (c.changeParams(d), c.newAdr())
                }
            }))
        },
        getflashvars: function (a) {
            var d, b = "", c = 0;
            if (a)for (d in a)c > 0 && (b += "&"), "f" == d && a[d] && !this.getSn("pm_repc", -1) && (a[d] = this.getpath(a[d]), a[d].indexOf("&") > -1 && (a[d] = encodeURIComponent(a[d]))), "y" == d && a[d] && (a[d] = this.getpath(a[d])), b += d + "=" + a[d], c++;
            return b
        },
        getparam: function (a) {
            var e, f, b = "", c = "", d = {
                allowScriptAccess: "always",
                allowFullScreen: !0,
                quality: "high",
                bgcolor: "#000"
            };
            if (a)for (e in a)d[e] = a[e];
            for (f in d)b += f + '="' + d[f] + '" ', c += '<param name="' + f + '" value="' + d[f] + '" />';
            return b = b.replace("movie=", "src="), {w: b, v: c}
        },
        getObjectById: function (a) {
            var b, c, d, e;
            return this._T_ ? this : (b = null, c = this._K_(a), d = "embed", c && "OBJECT" == c.nodeName && ("undefined" != typeof c.SetVariable ? b = c : (e = c.getElementsByTagName(d)[0], e && (b = e))), b)
        },
        ajax: function (a, b, c, d) {
            var e = this.getXhr(), f = [], g = "";
            "get" == a ? (g = c.indexOf("?") > -1 ? c + "&t=" + (new Date).getTime() : c + "?t=" + (new Date).getTime(), e.open("get", g)) : (f = c.split("?"), c = f[0], g = f[1], e.open("post", c, !0)), e.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"), e.setRequestHeader("charset", b), "post" == a ? e.send(g) : e.send(null), e.onreadystatechange = function () {
                if (4 == e.readyState) {
                    var a = e.responseText;
                    "" != a ? d(a) : d(null)
                }
            }
        },
        addListener: function (a, b) {
            var c = CKobject._V_;
            if (c.addEventListener)try {
                c.addEventListener(a, b, !1)
            } catch (a) {
                this.getNot()
            } else if (c.attachEvent)try {
                c.attachEvent("on" + a, b)
            } catch (a) {
                this.getNot()
            } else c["on" + a] = b
        },
        removeListener: function (a, b) {
            var c = CKobject._V_;
            if (c.removeEventListener)try {
                c.removeEventListener(a, b, !1)
            } catch (a) {
                this.getNot()
            } else if (c.detachEvent)try {
                c.detachEvent("on" + a, b)
            } catch (a) {
                this.getNot()
            } else c["on" + a] = null
        },
        Flash: function () {
            var c, d, f, g, a = !1, b = 0;
            if (document.all || this.browser()["B"].toLowerCase().indexOf("ie") > -1)try {
                c = new ActiveXObject("ShockwaveFlash.ShockwaveFlash"), a = !0, d = c.GetVariable("$version"), b = parseInt(d.split(" ")[1].split(",")[0])
            } catch (e) {
            } else if (navigator.plugins && navigator.plugins.length > 0 && (c = navigator.plugins["Shockwave Flash"]))for (a = !0, f = c.description.split(" "), g = 0; g < f.length; ++g)isNaN(parseInt(f[g])) || (b = parseInt(f[g]));
            return {f: a, v: b}
        },
        embed: function (a, b, c, d, e, f, g, h, i) {
            var j = ["all"];
            f ? this.isHTML5() ? this.embedHTML5(b, c, d, e, h, g, j) : this.embedSWF(a, b, c, d, e, g, i) : this.Flash()["f"] && parseInt(this.Flash()["v"]) > 10 ? this.embedSWF(a, b, c, d, e, g, i) : this.isHTML5() ? this.embedHTML5(b, c, d, e, h, g, j) : this.embedSWF(a, b, c, d, e, g, i)
        },
        embedSWF: function (a, b, c, e, f, g, h) {
            c || (c = "ckplayer_a1"), h || (h = {
                bgcolor: "#FFF",
                allowFullScreen: !0,
                allowScriptAccess: "always",
                wmode: "transparent"
            }), this._A_ = g, this.getX();
            var i = "undefined", j = !1, k = document, l = "http://www.macromedia.com/go/getflashplayer", m = '<a href="' + l + '" target="_blank">请点击此处下载安装最新的flash插件</a>', n = {
                w: "您的网页不符合w3c标准，无法显示播放器",
                f: "您没有安装flash插件，无法播放视频，" + m,
                v: "您的flash插件版本过低，无法播放视频，" + m
            }, o = typeof k.getElementById != i && typeof k.getElementsByTagName != i && typeof k.createElement != i, p = 'id="' + c + '" name="' + c + '" ', q = "", r = "";
            h["movie"] = a, h["flashvars"] = this.getflashvars(g), -1 == e && (d = !0, this._K_(b).style.width = "100%", e = "100%"), q += '<object pluginspage="http://www.macromedia.com/go/getflashplayer" ', q += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ', q += 'codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" ', q += 'width="' + e + '" ', q += 'height="' + f + '" ', q += p, q += 'align="middle">', q += this.getparam(h)["v"], q += "<embed ", q += this.getparam(h)["w"], q += ' width="' + e + '" height="' + f + '" name="' + c + '" id="' + c + '" align="middle" ' + p, q += 'type="application/x-shockwave-flash" pluginspage="' + l + '" />', q += "</object>", o ? this.Flash()["f"] ? this.Flash()["v"] < 10 ? (r = n["v"], j = !0) : (r = q, this._T_ = !1) : (r = n["f"], j = !0) : (r = n["w"], j = !0), r && (this._K_(b).innerHTML = r), j && (this._K_(b).style.color = "#0066cc", this._K_(b).style.lineHeight = this._K_(b).style.height, this._K_(b).style.textAlign = "center")
        },
        embedHTML5: function (c, d, e, g, h, i, j) {
            var k, l;
            for (this._E_ = {
                c: c,
                p: d,
                w: e,
                h: g,
                v: h,
                s: j
            }, this._A_ = i, this.getX(), b = this.browser()["B"], v = this.browser()["V"], x = v.split("."), t = x[0], m = b + v, n = b + t, w = "", s = !1, f = this.Flash()["f"], a = !1, j || (j = ["iPad", "iPhone", "ios"]), k = 0; k < j.length; k++) {
                if (w = j[k], "all" == w.toLowerCase()) {
                    s = !0;
                    break
                }
                if ("all+false" == w.toLowerCase() && !f) {
                    s = !0;
                    break
                }
                if (w.indexOf("+") > -1 ? (w = w.split("+")[0], a = !0) : a = !1, this.Platform() == w || m == w || n == w || b == w) {
                    if (!a) {
                        s = !0;
                        break
                    }
                    if (!f) {
                        s = !0;
                        break
                    }
                }
            }
            if (s) {
                if (h && (l = h[0].split("->"), l && 2 == l.length && l[1].indexOf("ajax") > -1))return this.getUrl(l, !0), void 0;
                this.showHtml5()
            }
        },
        status: function () {
            this._H_ = parseInt(this.getSn("setup", 20));
            var f = "ckplayer_status";
            "" != this.getSn("calljs", 0) && (f = this.getSn("calljs", 0));
            try {
                if ("function" == typeof eval(f))return this._L_ = eval(f), this._M_ = !0, !0
            } catch (e) {
                try {
                    if ("function" == typeof eval(ckplayer_status))return this._L_ = ckplayer_status, this._M_ = !0, !0
                } catch (e) {
                    return !1
                }
            }
            return !1
        },
        showHtml5: function () {
            var v, f, C = CKobject, p = C._E_["p"], a = C._E_["v"], c = C._E_["c"], b = !1, s = this._E_["v"], w = C._E_["w"], h = C._E_["h"], d = !1, r = "";
            if (1 == s.length && (r = ' src="' + s[0].split("->")[0] + '"'), -1 == w && (d = !0, C._K_(c).style.width = "100%", w = "100%"), w.toString().indexOf("%") > -1 && (w = "100%"), h.toString().indexOf("%") > -1 && (h = "100%"), v = "<video controls" + r + ' id="' + p + '" width="' + w + '" height="' + h + '"' + C.getParams() + ">" + C.getVideo() + "</video>", C._K_(c).innerHTML = v, C._K_(c).style.backgroundColor = "#000", C._V_ = this._K_(p), d || (C._K_(c).style.width = this._E_["w"].toString().indexOf("%") > -1 ? .01 * C._K_(c).offsetWidth * parseInt(this._E_["w"]) + "px" : C._V_.width + "px", C._K_(c).style.height = this._E_["h"].toString().indexOf("%") > -1 ? .01 * C._K_(c).offsetHeight * parseInt(this._E_["h"]) + "px" : C._V_.height + "px"), C._P_ = !1, C._T_ = !0, "" != C.getVars("loaded")) {
                f = C.getVars("loaded") + "()";
                try {
                    "function" == typeof eval(f) && eval(f)
                } catch (e) {
                    try {
                        "function" == typeof eval(loadedHandler) && loadedHandler()
                    } catch (e) {
                    }
                }
            }
            C.status(), C.addListener("play", C.playHandler), C.addListener("pause", C.playHandler), C.addListener("error", C.errorHandler), C.addListener("emptied", C.errorHandler), C.addListener("loadedmetadata", C.loadedMetadataHandler), C.addListener("ended", C.endedHandler), C.addListener("volumechange", C.volumeChangeHandler)
        },
        videoPlay: function () {
            this._T_ && this._V_.play()
        },
        videoPause: function () {
            this._T_ && this._V_.pause()
        },
        playOrPause: function () {
            this._T_ && (this._V_.paused ? this._V_.play() : this._V_.pause())
        },
        fastNext: function () {
            this._T_ && (this._V_["currentTime"] = this._V_["currentTime"] + 10)
        },
        fastBack: function () {
            this._T_ && (this._V_["currentTime"] = this._V_["currentTime"] - 10)
        },
        changeVolume: function (a) {
            this._T_ && (this._V_["volume"] = .01 * a)
        },
        videoSeek: function (a) {
            this._T_ && (this._V_["currentTime"] = a)
        },
        newAddress: function (a) {
            var c, b = [];
            if (a && (b = this.isHtml5New(a), b && this._T_)) {
                if (this.changeParams(a), c = b[0].split("->"), c && 2 == c.length && c[1].indexOf("ajax") > -1)return this.getUrl(c, !1), void 0;
                this._E_["v"] = b, this.newAdr()
            }
        },
        quitFullScreen: function () {
            document.cancelFullScreen ? document.cancelFullScreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitCancelFullScreen && document.webkitCancelFullScreen()
        },
        changeStatus: function (a) {
            this._H_ = a
        },
        newAdr: function () {
            var a = this._E_["v"];
            this._V_.pause(), 1 == a.length ? this._V_.src = a[0].split("->")[0] : this._V_["innerHTML"] = this.getVideo(), this._V_.load()
        },
        isHtml5New: function (a) {
            var b, c, d, e;
            if (-1 == a.indexOf("html5"))return !1;
            for (b = a.replace(/{/g, ""), c = b.split("}"), d = "", e = 0; e < c.length; e++)if (c[e].indexOf("html5") > -1) {
                d = c[e].replace("html5->", "").split(",");
                break
            }
            return d
        },
        changeParams: function (a) {
            var b, c, e, f;
            if (a)for (b = a.replace(/{/g, ""), c = b.split("}"), e = 0; e < c.length; e++)if (f = c[e].split("->"), 2 == f.length)switch (f[0]) {
                case"p":
                    1 == parseInt(f[1]) ? this._V_.autoplay = !0 : 2 == parseInt(f[1]) ? this._V_.preload = "metadata" : (this._V_.autoplay = !1, null != this._I_ && (clearInterval(this._I_), this._I_ = null));
                    break;
                case"e":
                    this._V_.loop = 1 == parseInt(f[1]) ? !0 : !1;
                    break;
                case"i":
                    this._V_.poster = f[1]
            }
        },
        frontAdPause: function () {
            this.getNot()
        },
        frontAdUnload: function () {
            this.getNot()
        },
        changeFace: function () {
            this.getNot()
        },
        plugin: function () {
            this.getNot()
        },
        videoClear: function () {
            this.getNot()
        },
        videoBrightness: function () {
            this.getNot()
        },
        videoContrast: function () {
            this.getNot()
        },
        videoSaturation: function () {
            this.getNot()
        },
        videoSetHue: function () {
            this.getNot()
        },
        videoWAndH: function () {
            this.getNot()
        },
        videoWHXY: function () {
            this.getNot()
        },
        changeFlashvars: function () {
            this.getNot()
        },
        changeMyObject: function () {
            this.getNot()
        },
        getMyObject: function () {
            this.getNot()
        },
        changeeFace: function () {
            this.getNot()
        },
        changeStyle: function () {
            this.getNot()
        },
        promptLoad: function () {
            this.getNot()
        },
        promptUnload: function () {
            this.getNot()
        },
        marqueeLoad: function () {
            this.getNot()
        },
        marqueeClose: function () {
            this.getNot()
        },
        getNot: function () {
            var a = "The ckplayer's API for HTML5 does not exist";
            return a
        },
        volumeChangeHandler: function () {
            var a = CKobject;
            a._V_.muted ? (a.returnStatus("volumechange:0", 1), a._O_["volume"] = 0, a._O_["mute"] = !0) : (a._O_["mute"] = !1, a._O_["volume"] = 100 * a._V_["volume"], a.returnStatus("volumechange:" + 100 * a._V_["volume"], 1))
        },
        endedHandler: function () {
            var f, C = CKobject, e = parseInt(C.getVars("e"));
            if (C.returnStatus("ended", 1), C._I_ && (clearInterval(C._I_), C._I_ = null), 0 == e || 4 == e || 6 == e) {
                6 == e && this.quitFullScreen(), f = "playerstop()", "" != C.getSn("calljs", 2) && (f = C.getSn("calljs", 2) + "()");
                try {
                    if ("function" == typeof eval(f))return eval(f), void 0
                } catch (e) {
                    try {
                        if ("function" == typeof eval(playerstop))return playerstop(), void 0
                    } catch (e) {
                        return
                    }
                }
            }
        },
        loadedMetadataHandler: function () {
            var a = CKobject;
            a.returnStatus("loadedmetadata", 1), a._O_["totaltime"] = a._V_["duration"], a._O_["width"] = a._V_["width"], a._O_["height"] = a._V_["height"], a._O_["awidth"] = a._V_["videoWidth"], a._O_["aheight"] = a._V_["videoHeight"], a._V_.defaultMuted ? (a.returnStatus("volumechange:0", 1), a._O_["mute"] = !0, a._O_["volume"] = 0) : (a._O_["mute"] = !1, a._O_["volume"] = 100 * a._V_["volume"], a.returnStatus("volumechange:" + 100 * a._V_["volume"], 1))
        },
        errorHandler: function () {
            CKobject.returnStatus("error", 1)
        },
        playHandler: function () {
            var b, c, d, a = CKobject;
            if (a._V_.paused)a.returnStatus("pause", 1), a.addO("play", !1), null != a._I_ && (clearInterval(a._I_), a._I_ = null); else {
                if (a.returnStatus("play", 1), a.addO("play", !0), a._P_ || (a.returnStatus("play", 1), a._P_ = !0), a._I_ = setInterval(a.playTime, parseInt(a.getSn("setup", 37))), !a._G_) {
                    a._G_ = !0;
                    for (b in a._A_)"g" == b && a._A_[b] && (c = parseInt(a._A_[b]), a.videoSeek(c))
                }
                if (!a._Y_) {
                    a._Y_ = !0;
                    for (b in a._A_)"j" == b && a._A_[b] && (d = parseInt(a._A_[b]), a._J_ = d > 0 ? d : parseInt(a._O_["totaltime"]) + d)
                }
            }
        },
        returnStatus: function (a, b) {
            var c = a;
            3 == this._H_ && (c = this._E_["p"] + "->" + c), this._M_ && b <= this._H_ && this._L_(c)
        },
        addO: function (a, b) {
            this._O_[a] = b
        },
        getStatus: function () {
            return this._O_
        },
        playTime: function () {
            var a = CKobject, b = a._V_["currentTime"];
            a._O_["time"] = b, a._J_ > 0 && b > a._J_ && (a._J_ = 0, a.videoSeek(a._O_["totaltime"])), a.returnStatus("time:" + b, 1)
        }
    };
    window.CKobject = CKobject
}();