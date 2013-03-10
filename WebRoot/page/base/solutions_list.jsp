<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：解决方案管理&gt;&gt; 解决方案列表</b></span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="查看" class="btnAll" id="btnShow" onclick="show('<%=path%>/base/solutions/edit.do?ac=1&solutionsid=')"/></label>
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/solutions/edit.do?ac=2')"/></label>
		<label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/solutions/edit.do?ac=3&solutionsid=')"/></label>
		<label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/solutions/del.do?solutionsid=')"/></label>
	</div>

	<table id="table1" class="borderTable" border="0" cellpadding="0"
		cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px"></td>
			<td style="width: 120px">编号</td>
			<td style="width: 120px">标题</td>
			<td style="width: 120px">图片</td>
			<td style="width: 120px">添加时间</td>
			<td style="width: 120px">状态</td>
			<td style="width: 120px">排列顺序</td>
		</tr>
		<c:forEach var="solutions" items="${solutionss}">
			<tr onclick="clktr('${solutions.solutionsid}')" align="center">
				<td><input type="radio" id="${solutions.solutionsid}" name="rd"
					value="${solutions.solutionsid}" /></td>

				<td>${solutions.solutionsno}</td>
				<td>${solutions.title}</td>
				<td>${solutions.img}</td>
				<td>
					<fmt:formatDate value="${solutions.adddate}" pattern="yyyy-MM-dd" />
				</td>
				<td>
					<c:if test="${solutions.state==1}">使用</c:if>
					<c:if test="${solutions.state==2}">未使用</c:if>
				</td>
				<td>${solutions.ordernum}</td>
			</tr>
		</c:forEach>

	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
