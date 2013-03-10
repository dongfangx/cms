function f(id){
	return document.getElementById(id);
}
//选择所有
function selAll() {
	if ($("#chkall").attr("checked")) {
		 $("[name='chk']").attr("checked",true);//全选
	} else {
		 $("[name='chk']").removeAttr("checked");
	}
}

//seelct onchange()
function schg(id1,id2){
	var name = $("#"+id1).find("option:selected").text();
	$("#"+id2).val(name);
}

function clktr(id){
	$("#"+id).attr("checked",true);
	
}


/**
 *查看
 **/
function show(url) {
	var vals = $("input[name='rd']:checked").val();
	if(!vals || vals == 'undefined' || vals==''){
		alert('请选择要查看的对象');
		return;
	}
	location.href = url + vals;
}

/**
 *添加
 **/
function add(url) {
	location.href = url;
}

function edit(url) {
	var vals = $("input[name='rd']:checked").val();
	if(!vals || vals == 'undefined' || vals==''){
		alert('请选择要修改的对象');
		return;
	}
	location.href = url + vals;
}


function whsb(url) {
	var vals = $("input[name='rd']:checked").val();
	if(!vals || vals == 'undefined' || vals==''){
		alert('请选择要维护的对象');
		return;
	}
	location.href = url + vals;
}

function list(url) {
	location.href = url;
}

function reset(formId){
	var form = document.getElementById(formId);
		form.reset();
}

function refresh(){
	location.reload();
}

/**
 * 刷新父页面
 */
function rtnp(){
	parent.location.reload();
}


function del(url) {
	var vals = $("input[name='rd']:checked").val();
	if(!vals || vals == 'undefined' || vals==''){
		alert('请选择要删除的对象');
		return;
	}
	if(confirm('你确认要删除'))
	{ 
		location.href = url + vals;
	}
	else{
		return;
	}
}

function dela(url) {
	var vals = $("input[name='rd']:checked").val();
	if(!vals || vals == 'undefined' || vals==''){
		alert('请选择要删除的对象');
		return;
	}
	if(confirm('你确认要删除'))
	{
		dAjax(url + vals,'','html',refresh);
	}
	else{
		return;
	}
}

function zkzcedit(url)
{
		var old=$("input[name='jcwno']").valueOf();
		var xin=$("input[name='xcwno']").valueOf();
	    if(old==xin){
		alert('旧床位和新床位必须不同');
		return;
	}
	location.href = url;
		
}

//数据列表页面鼠标滑动效果
$(document).ready(function() {
	//查看表单不可修改
	var ac = $("#ac").val();
	if(ac=='1'){
		$("form :text").attr("disabled", "disabled");
		$("form :radio").attr("disabled", "disabled");
		$("form :checkbox").attr("disabled", "disabled");
		$("form select").attr("disabled", "disabled");
		$("textarea[name='memo']").attr("disabled", "disabled");
	}
	
	$(".borderTable tr").click(function(){
		$(".borderTable tr").removeClass("trclick");
	    $(this).toggleClass("trclick");
	}).dblclick(function(){
		 $(this).find("input[type=radio]").attr("checked", true);
		 $("#btnShow").click();
	});
	
	var c = "#900";
	var l = $(".borderTable").find("tr").mouseover(function() {
		c = $(this).find("td").eq(0).css("background-color");
		$(this).find("td").css("background-color", "#F9FFCE");
	}).mouseout(function() {
		$(this).find("td").css("background-color", c);
	});
	var bc = "#900";
					
	$(".nn").focus(function() {
				var td = this.parentNode;
				if ($(td).find(".notnull").length > 0) {
					td.removeChild($(td).find(".notnull")[0]);
				}
	}).blur(function() {
		var td = this.parentNode;
		if ($.trim(this.value) == "") {
			var tr = td.parentNode;
			var i = $(tr).find("td").index(td);
			var htm = $.trim($(tr).find("td").eq(i - 1).html());
			$(this).after("<span class=\"notnull\" style='color:red'>"
				+ htm.replace("*","")
				+ "\u4e0d\u80fd\u4e3a\u7a7a</span>");
		} else {
			if ($(td).find(".notnull").length > 0) {
				td.removeChild($(td).find(".notnull")[0]);
			}
		}
	});
	$(".no").blur(function() {
		var td = this.parentNode;
		if ($.trim(this.value) != ""
				&& !isNumber2(this.value)) {
			if ($(td).find(".number").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				$(this).after("<span style='color:red' class=\"number\">"
				+ htm.replace("*","")
				+ "\u5fc5\u987b\u4e3a\u6570\u5b57</span>");
			}
		} else {
			if ($(td).find(".number").length > 0) {
				td.removeChild($(td).find(".number")[0]);
			}
		}
	});
	$(".date").blur(function() {
		var td = this.parentNode;
		if (!isDate(this.value)) {
			if ($(td).find(".vdate").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				$(this).after("<span style='color:red' class=\"vdate\">"
					+ htm.replace("*","")
					+ "\u65e5\u671f\u683c\u5f0f\u4e0d\u5bf9</span>");
			}
		} else {
			if ($(td).find(".vdate").length > 0) {
				td.removeChild($(td).find(".vdate")[0]);
			}
		}
	});

});

//验证数字
function isNumber(s) {
	if (s == "") {
		return true;
	}
	var patrn = /^\d+(\.\d+)?$/;
	if (!patrn.exec(s)) {
		return false;
	}
	return true;
}
//必须是数字
function isNumber2(s) {
	if (s == "") {
		return false;
	}
	var patrn = /^\d+(\.\d+)?$/;
	if (!patrn.exec(s)) {
		return false;
	}
	return true;
}
//验证日期
function isDate(s) {
	if (s == "") {
		return true;
	}
	var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
	return reg.exec(s);
}

//验证
function chk() {
	var yz=true;
	$(".an").each(function () {
		var td = this.parentNode;
		if ($.trim(this.value) == "") {
			if ($(td).find(".notnull").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				yz=false;
				return false;
			}
		}
	});
	return yz;
}


//提交
function save() {
	var bl = true;
	$(".nn").each(function () {
		var td = this.parentNode;
		if ($.trim(this.value) == "") {
			bl = false;
			if ($(td).find(".notnull").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				$(this).after("<span class=\"notnull\" style='color:red'>" + htm.replace("*", "") + "\u4e0d\u80fd\u4e3a\u7a7a</span>");
			}
		}
	});
	$(".no").each(function () {
		var td = this.parentNode;
		if (!isNumber2(this.value)) {
			bl = false;
			if ($(td).find(".number").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				$(this).after("<span style='color:red' class=\"number\">" + htm.replace("*", "") + "\u5fc5\u987b\u4e3a\u6570\u5b57</span>");
			}
		}
	});
	$(".date").each(function () {
		var td = this.parentNode;
		if (!isDate(this.value)) {
			bl = false;
			if ($(td).find(".vdate").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				$(this).after("<span style='color:red' class=\"vdate\">" + htm.replace("*", "") + "\u65e5\u671f\u683c\u5f0f\u4e0d\u5bf9</span>");
			}
		}
	});
	$(".nne").each(function () {//验证EMAIL
		var td = this.parentNode;
		if ($.trim(this.value) == "") {
			bl = false;
			if ($(td).find(".notnull").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				$(this).after("<span class=\"notnull\" style='color:red'>" + htm.replace("*", "") + "\u4e0d\u80fd\u4e3a\u7a7a</span>");
			   //msg+=htm.replace("*", "、");
			}
		}
	});
	return bl;
}

//用消息框提示
function save2(formId) {
	var bl = true;
    var len=0;
	var msg="";
	$(".nn").each(function () {
		var td = this.parentNode;
		if ($.trim(this.value) == "") {
			bl = false;
			if ($(td).find(".notnull").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				//$(this).after("<span class=\"notnull\" style='color:red'>" + htm.replace("*", "") + "\u4e0d\u80fd\u4e3a\u7a7a</span>");
			   msg+=htm.replace("*", "、");
			}
		}
	});
	
	if(msg.length!=len){
	len=msg.length;
	msg=msg.substr(0,msg.length-1);
	msg+="\u4e0d\u80fd\u4e3a\u7a7a;";
	}
	$(".no").each(function () {
		var td = this.parentNode;
		if (!isNumber(this.value)) {
			bl = false;
			if ($(td).find(".number").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				//$(this).after("<span style='color:red' class=\"number\">" + htm.replace("*", "") + "\u5fc5\u987b\u4e3a\u6570\u5b57</span>");
			 msg+=htm.replace("*", "、");
			}
		}
	});
	if(msg.length!=len){
	len=msg.length;
	msg=msg.substr(0,msg.length-1);
	msg+="\u5fc5\u987b\u4e3a\u6570\u5b57;";}
	$(".date").each(function () {
		var td = this.parentNode;
		if (!isDate(this.value)) {
			bl = false;
			if ($(td).find(".vdate").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				//$(this).after("<span style='color:red' class=\"vdate\">" + htm.replace("*", "") + "\u65e5\u671f\u683c\u5f0f\u4e0d\u5bf9</span>");
			 msg+=htm.replace("*", "、");
			}
		}
	});
	if(msg.length!=len){
	msg=msg.substr(0,msg.length-1);
	msg+="\u65e5\u671f\u683c\u5f0f\u4e0d\u5bf9;";	
	}
	$(".email").blur(function () {
		var td = this.parentNode;
		if (!isDate(this.value)) {
			bl = false;
			if ($(td).find(".vemail").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				//$(this).after("<span style='color:red' class=\"vemail\">" + htm.replace("*", "") + "邮相格式不正确</span>");
			 msg+=htm.replace("*", "、");
			}
		}
	});
}

//查询框提示
function search() {
	var bl = true;
	var sn = true;
    var len=0;
	var msg="";
	$(".sn").each(function () {
		if ($.trim(this.value) != "") {
			sn = false;
		}
	});
	if(sn){
		alert("查询条件不能全为空！");
		return false;
	}
	$(".sno").each(function () {
		var td = this.parentNode;
		if (!isNumber(this.value)) {
			bl = false;
			if ($(td).find(".number").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				//$(this).after("<span style='color:red' class=\"number\">" + htm.replace("*", "") + "\u5fc5\u987b\u4e3a\u6570\u5b57</span>");
			 msg+=htm.replace("*", "、");
			}
		}
	});
	if(msg.length!=len){
	len=msg.length;
	msg=msg.substr(0,msg.length-1);
	msg+="\u5fc5\u987b\u4e3a\u6570\u5b57;";}
	$(".date").each(function () {
		var td = this.parentNode;
		if (!isDate(this.value)) {
			bl = false;
			if ($(td).find(".vdate").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				//$(this).after("<span style='color:red' class=\"vdate\">" + htm.replace("*", "") + "\u65e5\u671f\u683c\u5f0f\u4e0d\u5bf9</span>");
			 msg+=htm.replace("*", "、");
			}
		}
	});
	if(msg.length!=len){
	msg=msg.substr(0,msg.length-1);
	msg+="\u65e5\u671f\u683c\u5f0f\u4e0d\u5bf9;";	
	}
	$(".email").blur(function () {
		var td = this.parentNode;
		if (!isDate(this.value)) {
			bl = false;
			if ($(td).find(".vemail").length == 0) {
				var tr = td.parentNode;
				var i = $(tr).find("td").index(td);
				var htm = $.trim($(tr).find("td").eq(i - 1).html());
				//$(this).after("<span style='color:red' class=\"vemail\">" + htm.replace("*", "") + "邮相格式不正确</span>");
			 msg+=htm.replace("*", "、");
			}
		}
	});
	if(msg.length!=len){
		msg=msg.substr(0,msg.length-1);
		msg+="邮相格式不正确。";	
	}
	alert(b1);
	if (bl) {
		return true;
	}else{
		alert(msg);
		return false;
	}
}


/**
 * dAjax('/base/code/edit.do','codeid=11&codename=22','json',ok);
 * @param {Object} url	访问地址(eg,'/base/code/edit.do'
 * @param {Object} params	访问参数(eg,'codeid=11&codename=22'
 * @param {Object} returnType	返回类型('html','xml','json','txt'
 * @param {Object} func		返回执行函数(如,ok
 */
function dAjax(url,params,returnType, func){
$.ajax({
   type: "POST",
   url: url,
   dataType:returnType,
   data: params,
   success: func
});
}