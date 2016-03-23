/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 19/3/2010 22:58
 */

var seccodecheck = /^([a-zA-Z0-9])+$/;

if ("undefined" == typeof jsi) var jsi = [];
jsi[0] || (jsi[0] = "vi");
jsi[1] || (jsi[1] = "./");
jsi[2] || (jsi[2] = 0);
jsi[3] || (jsi[3] = 6);
var strHref = window.location.href;
if (-1 < strHref.indexOf("?")) var strHref_split = strHref.split("?"), script_name = strHref_split[0], query_string = strHref_split[1];
else script_name = strHref, query_string = "";

function nv_checkadminlogin_seccode(a) {
	return a.value.length == jsi[3] && seccodecheck.test(a.value) ? !0 : !1
}

function nv_randomPassword(a) {
	for (var b = "", c = 0; c < a; c++) b += "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".charAt(Math.floor(62 * Math.random()));
	return b
}

function nv_checkadminlogin_submit() {
	if (1 == jsi[2]) {
		var a = document.getElementById("seccode");
		if (!nv_checkadminlogin_seccode(a)) return alert(login_error_security), a.focus(), !1
	}
	var a = document.getElementById("login"),
		b = document.getElementById("password");
	return "" == a.value ? (a.focus(), !1) : "" == b.value ? (b.focus(), !1) : !0
}

function nv_change_captcha() {
	var a = document.getElementById("vimg");
	nocache = nv_randomPassword(10);
	a.src = jsi[1] + "index.php?scaptcha=captcha&nocache=" + nocache;
	document.getElementById("seccode").value = "";
	return !1
};