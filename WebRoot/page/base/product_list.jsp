<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：产品管理 >> 产品列表</b></span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="查看" class="btnAll" id="btnShow" onclick="show('<%=path%>/base/product/edit.do?ac=1&productid=')"/></label>
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/product/edit.do?ac=2')"/></label>
		<label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/product/edit.do?ac=3&productid=')"/></label>
		<label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/product/del.do?productid=')"/></label>
	</div>

	<table id="table1" class="borderTable" border="0" cellpadding="0" cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px"></td>
			<td style="width: 120px">编号</td>

			<td style="width: 120px">产品类别</td>
			<td style="width: 120px">标题</td>
			<td style="width: 120px">小图</td>
			<td style="width: 120px">添加时间</td>
			<td style="width: 60px">状态</td>
			<td style="width: 60px">排列顺序</td>
		</tr>
			<c:forEach var="product" items="${products}">
			<tr onclick="clktr('${product.productid}')" align="center">
				<td><input type="radio" id="${product.productid}" name="rd"
					value="${product.productid}" /></td>

				<td>${product.productno}</td>
				<td>${product.productcategoryname}</td>
				<td>${product.title}</td>
				<td>${product.minimg}</td>
				<td>
					<fmt:formatDate value="${product.adddate}" pattern="yyyy-MM-dd" />
				</td>
				<td>
					<c:if test="${product.state==1}">使用</c:if>
					<c:if test="${product.state==2}">未使用</c:if>
				</td>
				<td>${product.ordernum}</td>
			</tr>
		</c:forEach>

	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
