<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：资料分类管理 >> 资料分类列表</b></span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="查看" class="btnAll" id="btnShow" onclick="show('<%=path%>/base/dataclass/edit.do?ac=1&dataclassid=')"/></label>
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/dataclass/edit.do?ac=2')"/></label>
		<label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/dataclass/edit.do?ac=3&dataclassid=')"/></label>
		<label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/dataclass/del.do?dataclassid=')"/></label>
	</div>
	<table id="table1" class="borderTable" border="0" cellpadding="0" cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px"></td>
			<td style="width: 120px">编号</td>
			<td>名称</td>
			<td style="width: 120px">状态</td>
			<td style="width: 120px">排列顺序</td>
		</tr>
		<c:forEach var="dataclass" items="${dataclasss}">
			<tr onclick="clktr('${dataclass.dataclassid}')" align="center">
				<td><input type="radio" id="${dataclass.dataclassid}" name="rd" value="${dataclass.dataclassid}" /></td>
				<td>${dataclass.dataclassno}</td>
				<td>${dataclass.name}</td>
				<td>
					<c:if test="${dataclass.state==1}">使用</c:if> 
					<c:if test="${dataclass.state==2}">未使用</c:if></td>
				<td>${dataclass.ordernum}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
