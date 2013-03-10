<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：新闻管理 >> 新闻列表</b></span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="查看" class="btnAll" id="btnShow" onclick="show('<%=path%>/base/news/edit.do?ac=1&newsid=')"/></label>
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/news/edit.do?ac=2')"/></label>
		<label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/news/edit.do?ac=3&newsid=')"/></label>
		<label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/news/del.do?newsid=')"/></label>
	</div>

	<table id="table1" class="borderTable" border="0" cellpadding="0"
		cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px"></td>
			<td style="width: 120px">编号</td>
			<td style="width: 120px">标题</td>
			<td style="width: 120px">作者</td>
			<td style="width: 120px">添加时间</td>
			<td style="width: 120px">排列顺序</td>
			<td style="width: 120px">状态</td>
		</tr>
		
		<c:forEach var="news" items="${newss}">
			<tr onclick="clktr('${news.newsid}')" align="center">
				<td><input type="radio" id="${news.newsid}" name="rd"
					value="${news.newsid}" /></td>

				<td>${news.newsno}</td>
				<td>${news.title}</td>
				<td>${news.employeeid}</td>
				<td>
					<fmt:formatDate value="${news.adddate}" pattern="yyyy-MM-dd" />
				</td>
				<td>${news.ordernum}</td>
				<td>${news.state}</td>
			</tr>
		</c:forEach>

	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
