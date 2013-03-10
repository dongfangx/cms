<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<script type="text/javascript">
function add() {
	var ifr = document.getElementById("ifr");
	ifr.src = "<%=path%>/sys/menu/add.do";
}

function del() {
	var id = $("#id").val()
	if (id == '') {
		alert('请选择需要删除的节点');
		return;
	}
	if (confirm("确认要删除记录？")) {
		location.href = "<%=path%>/sys/menu/del.do?menuid=" + id;
	}
}

function chg(val, txt) {
	if (val == 0) {
		return;
	}
	$("#id").val(val);
	$("#txt").val(txt);
	var ts = "菜单<font color='red'>[" + txt + "]</font>详细信息";
	$("#lbinfo").html(ts);
	var ifr = document.getElementById("ifr");
	ifr.src = "<%=path%>/sys/menu/edit.do?menuid=" + val;
}
</script>
<html>
<body class="easyui-layout">
	<div region="north" border="false" style="height:31px;">
		<div class="position">
			<span><b>当前位置：系统管理》菜单管理</b></span>
		</div>
	</div>
	
	<div region="west" split="true" title="&nbsp;菜单列表" style="width:250px;padding-left:8px;">
		<input type="hidden" id="id" value="" />
		<input type="hidden" id="txt" value="" />
		
		<input type="button" class="btnAll" onclick="add()" value="添加"/>
		<input type="button" class="btnAll" onclick="del()" value="删除"/>
		<div id="dd">
		</div>
	</div> 
	<div id="center" region="center" title="菜单详细信息" style="overflow:hidden;">
		<div id="div1" style="width:100%;height: 100%">
			<iframe id="ifr" name="ifr" frameborder="0" src=""></iframe>
		</div>
	</div> 
</body>
</html>
<script type="text/javascript">
	${menu_tree};
	document.getElementById('dd').innerHTML=t0;
</script>