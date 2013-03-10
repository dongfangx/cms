<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：导航菜单管理》导航菜单列表</b> </span>
	</div>

	<div class="btnBg">
		<input type="button" value="查看" class="btnAll" id="btnShow"
			onclick="show('<%=path%>/base/navmenu/edit.do?ac=1&navmenuid=')" />
		<input type="button" value="添加" class="btnAll"
			onclick="add('<%=path%>/base/navmenu/edit.do?ac=2')" /> <input
			type="button" value="修改" class="btnAll"
			onclick="edit('<%=path%>/base/navmenu/edit.do?ac=3&navmenuid=')" /> <input
			type="button" value="删除" class="btnAll"
			onclick="del('<%=path%>/base/navmenu/del.do?ckid=')" />
	</div>


	<table id="table1" class="borderTable" border="0" cellpadding="0"
		cellspacing="0">
		<tr class="theadBg">
			<td style="width: 30px;"></td>

			<td style="width: 120px;">菜单编号</td>
			<td style="width: 180px;">菜单名称</td>
			<td>地址</td>
			<td style="width: 120px;">排序号</td>
			<td style="width: 120px;">状态</td>
			
		</tr>
		<c:forEach var="navmenu" items="${navmenus}">
			<tr onclick="clktr('${navmenu.navmenuid}')">
				<td><input type="radio" id="${navmenu.navmenuid}" name="rd"
					value="${navmenu.navmenuid}" /></td>

				<td>${navmenu.navmenuno}</td>
				<td>${navmenu.navmenuname}</td>
				<td>${navmenu.menuurl}</td>
				<td>${navmenu.sort}</td>
				<td>
						<c:if test="${navmenu.state==1}">使用</c:if>
						<c:if test="${navmenu.state==2}">未使用</c:if>
				</td>
			</tr>
		</c:forEach>

	</table>

	<div class="page">${ps}</div>

</body>
</html>
