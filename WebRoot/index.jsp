<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>LYCMS—首页</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
    <link rel="shortcut icon" href="http://www.his.com:8888/favicon.ico" type="image/x-icon">
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
	
	<jsp:include page="top.jsp"></jsp:include>	
	<script type="text/javascript">
	var x,y;
	 function fun(obj,x){
	  var ob = document.getElementById(x);
	
	  //收起所有菜单
	  var dlArray = document.getElementsByTagName("dl");
	  for(var i=0;i<dlArray.length;i++){
		dlArray[i].style.display = "none";
	  }
	
	  //还原菜单样式(这儿不灵活，到时可用jquey替换下节点的获取)
	  for(var i=0;i>=0;i++){
		var divId = "div" + i;
		var mdiv = document.getElementById("div" + i);
		if(mdiv == null) break;
		mdiv.className = "titleNav";
	  }
	
	  //收缩点击的菜单
	  if(ob.style.display =="block"){
	   ob.style.display = "none";
	   obj.className = "titleNav"
	  }else{
	   ob.style.display = "block";
	   obj.className = "dtHover"
	  }
	 }
	 
	//菜单项样式
	function mclick(obj,url){
	//还原其它菜单项样式
	  var ddArray = document.getElementsByTagName("dd");
	  for(var i=0;i<ddArray.length;i++){
		ddArray[i].className = "dd";
	  }
	  obj.className = "ddHover";
	  document.getElementById('article').src=url;
	}
	
	function switch_left() {		
	}
	</script>
	<style type="text/css">
	body,html {
		overflow:hidden;
	}
	</style>
  </head>
  
<body>
<div  class="mainBox">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
  <tr>
    <td colspan="4" style="height:32px;">
    <div class="header">
        <div class="logo">
          <ul class="rightImg">
            <li class="btn1" onMouseOver="this.className='btnHover1'" onMouseOut="this.className='btn1'"><a href="#" title="用户注销"></a></li>
            <li class="btn2" onMouseOver="this.className='btnHover2'" onMouseOut="this.className='btn2'"><a href="#" title="退出系统"></a></li>
            <li class="btn3" onMouseOver="this.className='btnHover3'" onMouseOut="this.className='btn3'"><a href="#" title="用户帮助"></a></li>
            <li class="btn4" onMouseOver="this.className='btnHover4'" onMouseOut="this.className='btn4'"><a href="#" title="修改密码"></a></li>
          </ul>
        </div>
      </div></td>
  </tr>
  <tr>
  	<td class="tdAsideBox"></td>
  	<td class="asideBox" id="asideBox">
    	<p class="asideTitle alignCenter"><b>操作菜单</b></p>
		<div class="aside">
	      <c:set var="index" value="1"></c:set>
	      <c:forEach var="pm" items="${list_pm}">
			<div id="div${index-1}" class="titleNav" onclick="fun(this,'dl${index}')">${pm.menuname}</div>
			<dl id="dl${index}">
			<c:forEach var="m" items="${list_m}">
				<c:if test="${pm.menuid==m.pmenuid}"> 
				<dd class="dd" onclick="mclick(this,'<%=path%>${m.url}')">${m.menuname}</dd>
				</c:if>
			</c:forEach>
			</dl>
			<c:set var="index" value="${index + 1}"></c:set>
	      </c:forEach>
		</div>
    </td>
    <td class="switch_left" id="switchTd">
    	<img onClick="switch_left()" alt="点击隐藏左侧" src="img/image/switch_left.gif" width="6" height="31" />
    </td>
    <td class="articleBox">
    	<iframe width="100%" height="100%" scrolling="auto" frameborder="0" src="center.jsp" name="article" id="article"></iframe>
    </td>
  </tr>
</table>
</div>
</body>
</html>
