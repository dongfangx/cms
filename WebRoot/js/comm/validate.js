
/**************************************************
* 功  能: 多个控件的值验证
* 参  数: errArr:需要验证的方法集合
***************************************************/
function IsErr(errArr) {
	var arrlen = errArr.length;
	for (var i = 0; i < arrlen; i++) {
		if (eval(errArr[i]) == false) {
			return false;
			break;
		}
	}
	return true;
}
/**************************************************
* 功  能: 非空
* 参  数: id:控件id,msg:提示信息
***************************************************/
function isNull(id, msg) {
	//var str = document.getElementById(id).value.trim();
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if(val.length ==0){
		alert("["+msg+"] 不能为空!");
		return false;
	}
	return true;
}


function isEmail(id, msg) {
	var reg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("["+msg+"] 格式不正确!");
		$("#"+id).addClass("err");
		return false;
	}
	return true;
}

function isIp(id, msg) {
	var reg = /d+.d+.d+.d+/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("IP格式不正确!");
		return false;
	}
	return true;
}

/*********************
*检查是否为 YYYY-MM-DD || YYYY/MM/DD 的日期格式 
*********************/
function isDate(id, msg) {
	var reg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("["+msg+"] 格式不正确!");
		return false;
	}
	return true;
}

/*********************
*检查是否为 "YYYY-MM-DD HH:MM:SS" || "YYYY/MM/DD HH:MM:SS" 的日期格式 
*********************/
function isDateTime(id, msg) {
	var reg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("["+msg+"] 格式不正确!");
		return false;
	}
	return true;
}

/*********************
*检查是否为 "HH:MM:SS" 的时间格式 
*********************/
function isTime(id, msg) {
	var reg = /^(\d{1,2}):(\d{1,2}):(\d{1,2})$/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("["+msg+"] 格式不正确!");
		return false;
	}
	return true;
}

/*********************
*电话
*********************/
function isPhone(id) {
	var reg = /\d{3}-\d{8}|\d{4}-\d{7}|\d{7}|\d{8}/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (reg.exec(val) == null) {
		alert("[电话号码] 格式不正确!");
		return false;
	}
	return true;
}

/*********************
*手机号码
*********************/
function isMobile(id) {
	var reg = /^(\+86)?(1[0-9]{10})$/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("[电话号码] 格式不正确!");
		return false;
	}
	return true;
}

function isInt(id, msg) {
	var reg = /^(-|\+)?\d+$/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("["+msg+"] 不为整型!");
		return false;
	}
	return true;
}


function isZIP(id) {
	var reg = /[1-9]\d{5}(?!d)/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("邮政编码格式不正确!");
		return false;
	}
	return true;
}


function isUrl(id, msg) {
	var reg = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("["+msg+"] 格式不正确!");
		return false;
	}
	return true;
}

/*********************
*端口
*********************/
function isPort(id){
	var val = document.getElementById(id).value;
	if(! isNumber(val) && val<65536){
		alert("端口为数字同时不能大于65536");
		return false;
	}
	return true;
}

/*********************
*QQ
*********************/
function isQQ(id) {
	var reg = /[1-9][0-9]{4,}/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("QQ格式不正确!");
		return false;
	}
	return true;
}
/*********************
*身份证
*********************/
function isIdCard(id, msg) {
	var reg = /\d{15}|\d{18}/;
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (!reg.exec(val)) {
		alert("["+msg+"] 格式不正确!");
		return false;
	}
	return true;
}

function len(id,len, msg) {
	var val = document.getElementById(id).value;
	val = $.trim(val);
	if (val.length == 0 || val.length > len) {
		alert("["+msg+"] 不能为空或长度不能大于"+len+"!");
		//$("#"+id).css("border","1px solid #FF0000");
		$("#"+id).focus();
		return false;
	}
	return true;
}

function ts(id){
	
}
