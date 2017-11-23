function getuserconfig(key) {
    return localStorage[key];
}

function setuserconfig(key, value) {
    localStorage[key] = value;
}

function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

function setCookie(name, value) {
    var Days = 7;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + ";domain=kuaima.cn";
}

var getFromUID = function () {
    return getCookie("kuaimafauid")
}

var setFromUID = function (uid) {
    setCookie("kuaimafauid", uid)
}

var getAccessToken = function () {
    var user = new Object();
    user.uid = getuserconfig("kuaimauid");
    user.acctk = getuserconfig("kuaimaacctk");
    return user;
}

var setAccessToken = function (uid, acctk) {
    setuserconfig("kuaimauid", uid);
    setuserconfig("kuaimaacctk", acctk);
}