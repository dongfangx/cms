<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：信息管理 >> 信息列表</b></span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="查看" class="btnAll" id="btnShow" onclick="show('<%=path%>/base/info/edit.do?ac=1&infoid=')"/></label>
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/info/edit.do?ac=2')"/></label>
		<label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/info/edit.do?ac=3&infoid=')"/></label>
		<label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/info/del.do?infoid=')"/></label>
	</div>

	<table id="table1" class="borderTable" border="0" cellpadding="0" cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px"></td>
			<td style="width: 120px">编号</td>
			<td style="width: 120px">标题</td>
			<td style="width: 120px">添加时间</td>
			<td style="width: 120px">状态</td>
			<td style="width: 120px">排列顺序</td>
		</tr>
		<c:forEach var="info" items="${infos}">
			<tr onclick="clktr('${info.infoid}')" align="center">
				<td><input type="radio" id="${info.infoid}" name="rd"
					value="${info.infoid}" /></td>

				<td>${info.infono}</td>
				<td>${info.title}</td>
				<td>
					<fmt:formatDate value="${info.adddate}" pattern="yyyy-MM-dd" />
				</td>
				<td>
					<c:if test="${info.state==1}">使用</c:if>
					<c:if test="${info.state==2}">未使用</c:if>
				</td>
				<td>${info.ordernum}</td>
			</tr>
		</c:forEach>

	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
