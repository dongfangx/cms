//此处为string类添加三个成员 
String.prototype.Trim = function(){ return Trim(this);} 
String.prototype.LTrim = function(){return LTrim(this);} 
String.prototype.RTrim = function(){return RTrim(this);} 

//此处为独立函数 
function LTrim(str) 
{ 
	var i; 
	for(i=0;i<str.length;i++) 
	{ 
		if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break; 
	} 
	str=str.substring(i,str.length); 
	return str; 
} 
function RTrim(str) 
{ 
	var i; 
	for(i=str.length-1;i>=0;i--) 
	{ 
		if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break; 
	} 
	str=str.substring(0,i+1); 
	return str; 
} 
function Trim(str) 
{ 
	return LTrim(RTrim(str)); 
}

//为DATE增加格式化日期方法(形如:date.format("yyyy-MM-dd"))
Date.prototype.format = function(format)
{
var o = {
"M+" : this.getMonth()+1, //month

"d+" : this.getDate(), //day

"h+" : this.getHours(), //hour

"m+" : this.getMinutes(), //minute

"s+" : this.getSeconds(), //second

"q+" : Math.floor((this.getMonth()+3)/3), //quarter

"S" : this.getMilliseconds() //millisecond

}
if(/(y+)/.test(format))
format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
for(var k in o)
if(new RegExp("("+ k +")").test(format))
format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] :("00"+ o[k]).substr((""+ o[k]).length));

return format;
}

/************************************************************
 *
 * 判断数组中是否有重复项
 * 参数n表示从数组的n号下标开始查找以后的重复项
 * 返回: -1 表示无重复项; 返回值大于等于0时，表示此下标的数值有重复
 *
 ************************************************************/
Array.prototype.hasSameData = function(n){
	
	if(n<this.length){
		var i;
		for(i=n+1;i<this.length;i++)
			if(this[n] == this[i]) return n;

		if(i==this.length) return this.hasSameData(++n);   
	}else return -1;   
}
  
/*************************************************************************
 *
 * 名  称: CutLengthByTd
 *
 * 类  型: public
 *
 * 功  能: 通过td的id号截取字符串长度
 *
 * 参  数: vLen:需要截取的长度，tdId:需要验证的td的Id 的Array
 *		
 * 返回值: 

 *
 *************************************************************************/
    function CutLengthByTd(vLen,tdId)
    {
		var ArrTd = document.getElementsByTagName("TD");
		var arrLen = ArrTd.length;
		var tdLen = tdId.length;
		
		for(var j=0;j<arrLen;j++)
		{
	    	
	    	for(var i=0;i<tdLen;i++)
	    	{
	    		
	    		if(ArrTd[j].id == tdId[i])
	    		{
					//alert("ArrTd[j].id:"+ArrTd[j].id+":tdId[i]:"+tdId[i]);	    			
					if(ArrTd[j].innerHTML.length >vLen)
					{
						ArrTd[j].innerHTML = ArrTd[j].innerHTML.substring(0,vLen)+"...";
					}
				}
			}
			
		}    		
    }
/*************************************************************************
 *
 * 名  称: CutLengthByTable
 *
 * 类  型: public
 *
 * 功  能: 通过td的id号截取字符串长度
 *
 * 参  数: vLen:需要截取的长度，tableId:需要验证的table的Id
 *		
 * 返回值: 

 *
 *************************************************************************/
    //通过table的id号截取字符串长度
    function CutLengthByTable(vLen,tableId)
    {
    	var ArrTd = document.getElementById(tableId).getElementsByTagName("TD");
    	var arrLen = ArrTd.length;
    	for(var j=0;j<arrLen;j++)
    	{
		if(ArrTd[j].innerHTML.length >vLen)
		{
			ArrTd[j].innerHTML = ArrTd[j].innerHTML.substring(0,vLen)+"...";
		}
    	}
    } 
/*************************************************************************
 *
 * 名  称: ValidData
 *
 * 类  型: public
 *
 * 功  能: 日期格式的验证
 *
 * 参  数: ControlId:需要验证的控件ID
 *		ErrMsg:错误信息(提示名称)
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/	
function ValidData(strVal,ErrMsg)
{
	var strEmail = strVal;
	if(/^\s+$/.test(strVal)){
		alert(ErrMsg + "录入日期格式不正确！");
		return false;
	}
	if (strEmail.search(/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/) != -1)
	return true;
	else
	alert(ErrMsg + "录入日期格式不正确！");
	return false;
	

}
/*************************************************************************
 *
 * 名  称: date4struts
 *
 * 类  型: public
 *
 * 功  能: 针对STRUTS2日期标签的日期格式的验证
 *
 * 参  数: ControlName:需要验证的控件NAME值
 *		  ErrMsg:错误信息(提示名称)
 *		  nullFlag:为空标志(允许为空则为true)
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/	
function date4struts(ControlName,ErrMsg,nullFlag){
	var flag = false;
	var dateValue = document.getElementsByName(ControlName)[0].getElementsByTagName("input")[1].value;

	if(nullFlag){
		if(dateValue.length != 0){
			flag = ValidData(dateValue,ErrMsg);
		}else{
			return true;
		}
	}else{
		if(dateValue.length != 0){
			flag = ValidData(dateValue,ErrMsg);
		}else{
			alert(ErrMsg + "不允许为空!");
			return false;
		}
	}
	
	return flag;
}
 
/*************************************************************************
 *
 * 名  称: IsPost
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入是否整型
 *
 * 参  数: ControlId:需要验证的控件ID
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/     
function IsPost(ControlId)     
{     
        var str = document.getElementById(ControlId).value;    
        if(str.length!=0){    
	        reg=/^\d{6}$/;    
        	if(!reg.test(str)){ 
	   
             	alert("邮政编码录入格式不正确!");//请将“字符串类型”要换成你要验证的那个属性名称！    
		return false;
	        }    
        }    
	return true;
}     

/*************************************************************************
 *
 * 名  称: IsErr
 *
 * 类  型: public
 *
 * 功  能: 多个控件的值验证
 *
 * 参  数: errArr:需要验证的方法集合
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/	
function IsErr(errArr)
{
	
	var arrlen = errArr.length;
	for(var i=0;i<arrlen;i++)
	{
		if(eval(errArr[i])== false)
		{
			return false;
			break;
		}
	}
	return true;
}
/*************************************************************************
 *
 * 名  称: IsSpecial
 *
 * 类  型: public
 *
 * 功  能: 特殊字符的验证
 *
 * 参  数: ControlId:需要验证的控件ID
 *		ErrMsg:错误信息(提示名称)
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/	
function IsSpecial(ControlId,ErrMsg)
{
	
	var bFlag = true;
	var ControlVal = document.getElementById(ControlId).value;
	//alert(ControlVal);
	if(ControlVal.indexOf('%')>-1
		||ControlVal.indexOf('#') > -1
		||ControlVal.indexOf('\'') > -1
		||ControlVal.indexOf('&') > -1)
	{
		alert(ErrMsg+"中不能录入特殊字符%、#、&、‘");
		return false;
	}

	return true;
	
}
/*************************************************************************
 *
 * 名  称: IsSpecialByNode
 *
 * 类  型: public
 *
 * 功  能: 特殊字符的验证
 *
 * 参  数: ControlNode:需要验证的控件
 *		ErrMsg:错误信息(提示名称)
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/	
function IsSpecialByNode(ControlNode,ErrMsg)
{
	
	var bFlag = true;
	var ControlVal = ControlNode.value;
	//alert(ControlVal);
	if(ControlVal.indexOf('%')>-1
		||ControlVal.indexOf('#') > -1
		||ControlVal.indexOf('\'') > -1
		||ControlVal.indexOf('&') > -1)
	{
		alert(ErrMsg+"中不能录入特殊字符%、#、&、‘");
		return false;
	}

	return true;
	
}
/*************************************************************************
 *
 * 名  称: verify
 *
 * 类  型: public
 *
 * 功  能: 验证值是否为空
 *
 * 参  数: data:
 *		
 * 返回值: true 值为空；false 值不为空
 *
 *************************************************************************/			
function verify(data){
	return (/^\s*$/.test(data));
}
/*************************************************************************
 *
 * 名  称: isNumFormat
 *
 * 类  型: public
 *
 * 功  能: 验证值的小数前后位数
 *
 * 参  数: ControlId:需要验证的控件ID
 *		  ErrMsg:错误信息(提示名称)
 *		  potl:限制小数点左位数
 *		  potr:限制小数点右位数
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/			
function isNumFormat(ControlId,ErrMsg,potl,potr){
	var vFlag = false;
	vFlag = checkNum(ControlId,ErrMsg);
	if(vFlag){
		var ControlVal = String(document.getElementById(ControlId).value);
		
		ControlVal = ControlVal.Trim();

		if(ControlVal.indexOf("-") != -1){
			alert(ErrMsg + "不能为负数");
			return false;
		}

		if(ControlVal.indexOf(".") != -1){
			var valueArg = ControlVal.split(".");
			if(valueArg[0].length > potl){
				alert(ErrMsg + "整数部分位数不能多于【" + potl + "】位");
				return false;
			}
			if(valueArg[1].length > potr){
				alert(ErrMsg + "小数部分位数不能多于【" + potr + "】位");
				return false;
			}
		}else{
			if(ControlVal.length > potl){
				alert(ErrMsg + "整数部分位数不能多于【" + potl + "】位");
				return false;
			}
		}
	}
	return vFlag;
}
/*************************************************************************
 *
 * 名  称: isNumFormatByNode
 *
 * 类  型: public
 *
 * 功  能: 验证值的小数前后位数
 *
 * 参  数: ControlNode:需要验证的控件
 *		  ErrMsg:错误信息(提示名称)
 *		  potl:限制小数点左位数
 *		  potr:限制小数点右位数
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/			
function isNumFormatByNode(ControlNode,ErrMsg,potl,potr){
	var vFlag = false;
	vFlag = checkNumByNode(ControlNode,ErrMsg);
	if(vFlag){
		var ControlVal = String(ControlNode.value);
		
		ControlVal = ControlVal.Trim();
		
		if(ControlVal.indexOf("-") != -1){
			alert(ErrMsg + "不能为负数");
			return false;
		}
		if(ControlVal.indexOf(".") != -1){
			var valueArg = ControlVal.split(".");
			if(valueArg[0].length > potl){
				alert(ErrMsg + "整数部分位数不能多于【" + potl + "】位");
				return false;
			}
			if(valueArg[1].length > potr){
				alert(ErrMsg + "小数部分位数不能多于【" + potr + "】位");
				return false;
			}
		}else{
			if(ControlVal.length > potl){
				alert(ErrMsg + "整数部分位数不能多于【" + potl + "】位");
				return false;
			}
		}
	}
	return vFlag;
}
/*************************************************************************
 *
 * 名  称: NotNull
 *
 * 类  型: public
 *
 * 功  能: 验证控件的值是否为空
 *
 * 参  数: ControlId:需要验证的控件ID
 	ErrMsg:错误信息(提示名称)
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/			
function NotNull(ControlId,ErrMsg)
{
	
	var bFlag = true;
	var ControlNode = document.getElementById(ControlId);
	var ControlVal = ControlNode.value;
	//alert(ControlNode.nodeName);
	if(ControlNode.nodeName != "select" && ControlNode.nodeName != "SELECT"){
		//alert("11");
		ControlVal = String(ControlVal.Trim());
		document.getElementById(ControlId).value = ControlVal;
	}
	//alert("aa");
	if(IsSpecial(ControlId,ErrMsg) == false)
	{
		return false;
	}
	
	if(/^\s*$/.test(ControlVal))
	{
		alert(ErrMsg+"不能为空！");
		bFlag = false;
		return bFlag;
		
	}
	if(ControlVal  == null ||ControlVal  =="NULL"||ControlVal  =="Null")
	{
		alert(ErrMsg+"不能为空！");
		bFlag = false;
		return bFlag;

	}
	return bFlag;
	
}
/*************************************************************************
 *
 * 名  称: NotNullByNode
 *
 * 类  型: public
 *
 * 功  能: 验证控件的值是否为空

 *
 * 参  数: ControlNode:需要验证的控件
 	ErrMsg:错误信息(提示名称)
 *		
 * 返回值: true 格式正确；false 格式不正确

 *
 *************************************************************************/			
function NotNullByNode(ControlNode,ErrMsg)
{
	
	var bFlag = true;
	var ControlVal = ControlNode.value;
	ControlVal = String(ControlVal.Trim());
	ControlNode.value = ControlVal;
	if(IsSpecialByNode(ControlNode,ErrMsg) == false)
	{
		return false;
	}
	
	if(/^\s*$/.test(ControlVal))
	{
		alert(ErrMsg+"不能为空！");
		bFlag = false;
		return bFlag;
		
	}
	if(ControlVal  == null ||ControlVal  =="NULL"||ControlVal  =="Null")
	{
		alert(ErrMsg+"不能为空！");
		bFlag = false;
		return bFlag;

	}
	return bFlag;
	
}

/*************************************************************************
 *
 * 名  称: CheckControlLen
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入字符的长度
 *
 * 参  数: ControlId:需要验证的控件ID
 		ControlLen:文本允许的长度	
 *		ErrMsg:错误信息(提示名称)
 * 返回值: false 不正确；true 正确
 *
 *************************************************************************/
function CheckControlLen(ControlId,ControlLen,ErrMsg) 
{
	var bFlag = true;
	var num =document.getElementById(ControlId).value.length;
	var arr = document.getElementById(ControlId).value.match(/[^\x00-\x80]/ig);
	if(arr != null)num+= arr.length;
	if(num > ControlLen)
	{
		alert(ErrMsg + "录入字符超长");
		//alert(ErrMsg + "长度不能超过"+ControlLen+"个字符！");
		bFlag =  false;
	}
	return bFlag;
}
/*************************************************************************
 *
 * 名  称: CheckControlLenByNode
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入字符的长度
 *
 * 参  数: ControlNode:需要验证的控件
 		ControlLen:文本允许的长度	
 *		ErrMsg:错误信息(提示名称)
 * 返回值: false 不正确；true 正确
 *
 *************************************************************************/
function CheckControlLenByNode(ControlNode,ControlLen,ErrMsg) 
{
	var bFlag = true;
	var num =ControlNode.value.length;
	var arr = ControlNode.value.match(/[^\x00-\x80]/ig);
	if(arr != null)num+= arr.length;
	if(num > ControlLen)
	{
		alert(ErrMsg + "录入字符超长");
		//alert(ErrMsg + "长度不能超过"+ControlLen+"个字符！");
		bFlag =  false;
	}
	return bFlag;
}
/*************************************************************************
 *
 * 名  称: isEmail
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入邮箱格式是否正确
 *
 * 参  数: ControlId:需要验证的控件ID
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/
function isEmail(ControlId) {
	var strEmail = document.getElementById(ControlId).value;
	if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
	return true;
	else
	alert("电子邮箱录入格式不正确！");
	return false;
}
/*************************************************************************
 *
 * 名  称: isPhone
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入电话格式是否正确
 *
 * 参  数: ControlId:需要验证的控件ID
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/
function isPhone(ControlId) {
	var strPhone = document.getElementById(ControlId).value;
	if (strPhone.search(/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/) != -1)
	return true;
	else
	alert("电话录入格式不正确！");
	return false;
}
/*************************************************************************
 *
 * 名  称: isMobilePhone
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入手机号码格式是否正确
 *
 * 参  数: ControlId:需要验证的控件ID
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/
function isMobilePhone(ControlId) {
	var strMobil = document.getElementById(ControlId).value;
	var bFailed = false;
	if(strMobil.length != 11)
	{
		bFailed = true;
	}
	if (strMobil.search(/^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}|159\d{8}|158\d{8}$/) != -1)
		return true;
	else{
		
		 bFailed = false;
		}
   if(bFailed ||!isPhone(ControlId)) {  
      alert("手机或电话录入格式不正确！");
	  return false;
	}
	
	return true;
}
/*************************************************************************
 *
 * 名  称: isTime
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入时间（时：分）格式是否正确
 *
 * 参  数: ControlId:需要验证的控件ID
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/
function isTime(ControlId) {
	var strTime = document.getElementById(ControlId).value+":01";
	var arrTime =strTime.match(/^(\d{1,2})(:)?(\d{1,2})\2(\d{1,2})$/);
	   
	  if (arrTime == null) {alert('输入的参数不是时间格式'); return false;} 
	  	   
	  if (arrTime[1]>24 || arrTime[3]>60 || arrTime[4]>60)    
	  {   
	     
	    alert("时间格式不正确！");    
	    return false   
	  }    
	  return true;
}
/*************************************************************************
 *
 * 名  称: checkNum
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入是否为数字
 *
 * 参  数: ControlId:需要验证的控件ID
 *		ErrMsg:错误信息(提示名称)
 * 返回值: false 不为空；true 为空
 *
 *************************************************************************/
function checkNum(ControlId,ErrMsg){
	var ControlVal = document.getElementById(ControlId).value;
	document.getElementById(ControlId).value = ControlVal.Trim();
	if (isNaN(ControlVal))
	{alert(ErrMsg + "中只能输入数字！");
	return false;
	}
	return true;
}
/*************************************************************************
 *
 * 名  称: checkNumByNode
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入是否为数字
 *
 * 参  数: ControlNode:需要验证的控件
 *		ErrMsg:错误信息(提示名称)
 * 返回值: false 不为空；true 为空
 *
 *************************************************************************/
function checkNumByNode(ControlNode,ErrMsg){
	var ControlVal = ControlNode.value;
	ControlNode.value = ControlVal.Trim();
	if (isNaN(ControlVal))
	{alert(ErrMsg + "中只能输入数字！");
	return false;
	}
	return true;
}
/*************************************************************************
 *
 * 名  称: isInt
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入是否整型
 *
 * 参  数: ControlId:需要验证的控件ID
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/
function isInt(ControlId,ErrMsg) {
	var ControlVal = document.getElementById(ControlId).value;
	document.getElementById(ControlId).value = ControlVal.Trim();
	
	if (ControlVal.search(/^[1-9]+\d*$/) != -1)
	return true;
	else
	alert(ErrMsg + "录入整数格式不正确！");
	return false;
}
/*************************************************************************
 *
 * 名  称: isIntByNode
 *
 * 类  型: public
 *
 * 功  能: 验证文本输入是否整型
 *
 * 参  数: ControlNode:需要验证的控件
 *		
 * 返回值: true 格式正确；false 格式不正确
 *
 *************************************************************************/
function isIntByNode(ControlNode,ErrMsg) {
	var ControlVal = ControlNode.value;
	ControlNode.value = ControlVal.Trim();
	
	if (ControlVal.search(/^[1-9]+\d*$/) != -1)
	return true;
	else
	alert(ErrMsg + "录入整数格式不正确！");
	return false;
}

/*************************************************************************
 *
 * 名  称: AjaxRequest
 *
 * 类  型: public
 *
 * 功  能: 异步前台相应
 *
 * 参  数: url:需要调用的action
 			
 *		arrpars：后台执行action需要的参数
 * 返回值: 无
 *
 *************************************************************************/			
function AjaxRequest(url,arrpars)
{
	var pars;
	pars = GetArrayString(arrpars);

	var myAjax = new Ajax.Request(    
	       url,{method:'get',    
	       parameters:pars, 
	       onLoading:showDiv,   
	       onComplete:ReturnResponse,    
	       onFailure:reportError});//构造函数，见讲解   
        
}
/*************************************************************************
 *
 * 名  称: AjaxRequest
 *
 * 类  型: public
 *
 * 功  能: 异步前台相应
 *
 * 参  数: url:需要调用的action
 			
 *		arrpars：后台执行action需要的参数
 * 返回值: 无
 *
 *************************************************************************/			
function AjaxRequest_Arr(url,arrpars)
{
	var myAjax = new Ajax.Request(    
	       url,{method:'get',    
	       parameters:arrpars, 
	       onLoading:showDiv,   
	       onComplete:ReturnResponse,    
	       onFailure:reportError});//构造函数，见讲解   
        
}
function showDiv()
{

}
/*************************************************************************
 *
 * 名  称: GetArrayString
 *
 * 类  型: public
 *
 * 功  能: 将数组转换成字符串
 *
 * 参  数: 数组
 *
 * 返回值: 得字符串
 *
 *************************************************************************/
function GetArrayString(arrpars)
{
	var pars = "";
	var parlen = arrpars.length;
	if(parlen < 1)
	{
		return;
	}
	pars = Form.Element.serialize($(arrpars[0]));
	
	for(i=1;i<arrpars.length;i++)   
	{   
		
	  	pars = pars + "&" + Form.Element.serialize($(arrpars[i]));
	}  
	return pars;
}
/*************************************************************************
 *
 * 名  称: GetArrayString
 *
 * 类  型: public
 *
 * 功  能: 将数组转换成字符串
 *
 * 参  数: 数组
 *
 * 返回值: 得字符串
 *
 *************************************************************************/
function GetArrayString1(arrpars)
{
	var pars = "";
	var parlen = arrpars.length;
	if(parlen < 1)
	{
		return;
	}
	pars = Form.Element.serialize($(arrpars[0]));
	//alert(" arrpars[0]= " + document.getElementsByName(arrpars[0])[0].value);
	
	for(i=1;i<arrpars.length;i++)   
	{   
		//alert(arrpars[i]);
		//alert( arrpars[i] + ":= " + document.getElementsByName(arrpars[i])[0].value);
	  	pars = pars + "&" + " arrpars[i]= " + document.getElementsByName(arrpars[i]);
	}  
	return pars;
}
/*************************************************************************
 *
 * 名  称: StrSplit
 *
 * 类  型: public
 *
 * 功  能: 分割字符串
 *
 * 参  数: 需要分割的字符串
 *
 * 返回值: 得到分割后的字符串数组
 *
 *************************************************************************/
function StrSplit(strSplit)
{
	var SplitStr = strSplit.split('#abc');
	return SplitStr;
}
/*************************************************************************
 *
 * 名  称: reportError
 *
 * 类  型: public
 *
 * 功  能: 错误信息报错
 *
 * 参  数: 
 *
 * 返回值: 
 *
 *************************************************************************/
function reportError(){    
        
}
/*************************************************************************
 *
 * 名  称: Left
 *
 * 类  型: public
 *
 * 功  能: 得到左边的字符串
 *
 * 参  数: len:长度
 *
 * 返回值: 得到左边的字符串
 *
 *************************************************************************/
String.prototype.Left = function(len)
{

    if(isNaN(len)||len==null)
    {
        len = this.length;
    }
    else
    {
        if(parseInt(len)<0||parseInt(len)>this.length)
        {
            len = this.length;
        }
    }
    
    return this.substr(0,len);
}


/*************************************************************************
 *
 * 名  称: Right
 *
 * 类  型: public
 *
 * 功  能: 得到右边的字符串
 *
 * 参  数: len:长度
 *
 * 返回值: 得到右边的字符串
 *
 *************************************************************************/
String.prototype.Right = function(len)
{

    if(isNaN(len)||len==null)
    {
        len = this.length;
    }
    else
    {
        if(parseInt(len)<0||parseInt(len)>this.length)
        {
            len = this.length;
        }
    }
    
    return this.substring(this.length-len,this.length);
}

/*************************************************************************
 *
 * 名  称: isLongDate
 *
 * 类  型: public
 *
 * 功  能: 是否是正确的长日期
 *
 * 参  数: 无
 *
 * 返回值: true:是；false:否
 *
 *************************************************************************/
String.prototype.isLongDate = function()
{
    var r = this.replace(/(^\s*)|(\s*$)/g, "").match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/); 
    if(r==null)
    {
        return false; 
    }
    var d = new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]); 
    return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);

}

/*************************************************************************
 *
 * 名  称: isShortDate
 *
 * 类  型: public
 *
 * 功  能: 是否是正确的短日期
 *
 * 参  数: 无
 *
 * 返回值: true:是；false:否
 *
 *************************************************************************/
String.prototype.isShortDate = function()
{
    var r = this.replace(/(^\s*)|(\s*$)/g, "").match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
    if(r==null)
    {
        return false; 
    }
    var d = new Date(r[1], r[3]-1, r[4]); 
    return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}

/*************************************************************************
 *
 * 名  称: isDate
 *
 * 类  型: public
 *
 * 功  能: 是否是正确的日期
 *
 * 参  数: 无
 *
 * 返回值: true:是；false:否
 *
 *************************************************************************/
String.prototype.isDate = function()
{
    return this.isLongDate()||this.isShortDate();
}

/*************************************************************************
 *
 * 名  称: toDate
 *
 * 类  型: public
 *
 * 功  能: 转换成日期
 *
 * 参  数: 无
 *
 * 返回值: 日期
 *
 *************************************************************************/
String.prototype.toDate = function()
{
    try
    {
        return new Date(this.replace(/-/g, "\/"));
    }
    catch(e)
    {
        return null;
    }
}

/*************************************************************************
 *
 * 名  称: DateAdd
 *
 * 类  型: public
 *
 * 功  能: 类似于VB中的DateAdd方法
 *
 * 参  数: interval:间隔单位
 *          number :间隔数量
 *          date   :开始日期
 *
 * 返回值: yyyy-mm-dd格式的字符串
 *
 *************************************************************************/
function DateAdd(interval,number,date)
{ 
    //date 可以是时间对象也可以是字符串，
    //如果是后者，形式必须为: yyyy-mm-dd hh:mm:ss 其中分隔符不定。"2006年12月29日 16点01分23秒" 也是合法的
    number = parseInt(number);
    if (typeof(date)=="string"){    
        date = date.toDate();
    }
    if (typeof(date)=="object"){
        var date = date
    }
    switch(interval){
        //年
        case "y": date.setFullYear(date.getFullYear()+number); break;
        //月
        case "m": date.setMonth(date.getMonth()+number); break;
        //日
        case "d": date.setDate(date.getDate()+number); break;
        //周
        case "w": date.setDate(date.getDate()+7*number); break;
        //双周
        case "dw": date.setDate(date.getDate()+14*number); break;
        /*
        //小时
        case "h": date.setHours(date.getHour()+number); break;
        //分钟
        case "n": date.setMinutes(date.getMinutes()+number); break;
        //秒
        case "s": date.setSeconds(date.getSeconds()+number); break;
        //毫秒
        case "l": date.setMilliseconds(date.getMilliseconds()+number); break;
        */
    } 
    var year,month,day;
    year = date.getFullYear();
    month = date.getMonth()+1;
    day = date.getDate();
    return year + "-" + ("00" + month).Right(2) + "-" + ("00" + day).Right(2);        
}

/*************************************************************************
 *
 * 名  称: ReplaceText
 *
 * 类  型: public
 *
 * 功  能: 将字符串中的“#”替换成“#d”
 *
 * 参  数: strData:要替换的字符串
 *
 * 返回值: 替换后的字符串
 *
 *************************************************************************/
function ReplaceText(val)
{
    return val.replace(new RegExp("#", "g"), "#d");
}

/*************************************************************************
 *
 * 名  称: GetStrValues
 *
 * 类  型: public
 *
 * 功  能: 将传入的数组按照分割符"#abc"连接成一个字符串
 *
 * 参  数: values:要连接的数组
 *
 * 返回值: 连接后的字符串
 *
 * 备 注:  
 *************************************************************************/
function GetStrValues(values) {
    var i = 0;
    var strValue = ReplaceText(values[0]);
    for (i=1;i<values.length;i++)
    {
        strValue = strValue + "#abc" + ReplaceText(values[i]);
    };
    return escape(strValue);    
}

/*************************************************************************
 *
 * 名  称: SetTextUneditStyle
 *
 * 类  型: public
 *
 * 功  能: 设置文本框控件不可用时的样式
 *
 * 参  数: 要设置的文本框
 *
 * 返回值: 无
 *
 *************************************************************************/
function SetTextUneditStyle(obj)
{
    if (obj.disabled == false)
        return;
    obj.style.border = "none";
    obj.style.backgroundColor = "Transparent";
};

/*************************************************************************
 *
 * 名  称: SetTextUneditStyleAll
 *
 * 类  型: public
 *
 * 功  能: 设置页面中所有文本框控件不可用时的样式
 *
 * 参  数: 要设置的页面
 *
 * 返回值: 无
 *
 *************************************************************************/
function SetTextUneditStyleAll(form)
{
    var inputs = form.document.getElementsByTagName("INPUT");
    
    for (i=0;i<inputs.length;i++)
    {
        if (inputs[i].type == "text")
        {
            if (inputs[i].disabled == true)
            {
                inputs[i].style.border = "none";
                inputs[i].style.backgroundColor = "Transparent";
            };            
        };
    };    
}

/*************************************************************************
 *
 * 名  称: confirmSave
 *
 * 类  型: public
 *
 * 功  能: 保存前的确认函数
 *
 * 返回值: true:确定保存;false:否认保存;
 *
 *************************************************************************/
function confirmSave()
{
	return confirm("你确定要保存吗？");
}

  