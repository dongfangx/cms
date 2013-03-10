<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>	
	<script type="text/javascript">
	function chg(val,txt,url){
		if(val==0){
			return;
		}
		$("#id").val(val);
		$("#txt").val(txt);
		var ts= "数据类型<font color='red'>["+txt+"]</font>详细信息";
		//$("#lbinfo").html(ts);
		//$('#center').css("title",ts);
		//$('#center').layout({'title',ts});
		var ifr = document.getElementById("ifr");
		ifr.src='<%=path%>/base/code/list2.do?id='+val;
	}
	</script>
	<html>
<body class="easyui-layout">
	<input type="hidden" id="id" value="" />
	<input type="hidden" id="txt" value="" />
	<div region="north" border="false" style="height:31px;">
		<div class="position">
			<span><b>当前位置：基础数据管理 >> 基础数据列表</b></span>
		</div>
	</div>
	
	<div  region="west" split="true" title="&nbsp;菜单列表" style="width:250px;padding-left:8px;">
		<div id="dd">
		</div>
	</div>
	<div id="center" region="center" title="数据类型详细信息" style="overflow:hidden;">
		<div id="div1" style="width:100%;height: 100%">
			<iframe id="ifr" name="ifr" frameborder="0" src=""></iframe>
		</div>
	</div> 

</body>
</html>
<script type="text/javascript">
	${codetype_tree};
	document.getElementById('dd').innerHTML=t0;
</script>
