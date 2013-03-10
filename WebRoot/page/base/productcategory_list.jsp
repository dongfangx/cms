<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：产品分类管理 >> 产品分类列表</b></span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="查看" class="btnAll" id="btnShow" onclick="show('<%=path%>/base/productcategory/edit.do?ac=1&productcategoryid=')"/></label>
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/productcategory/edit.do?ac=2')"/></label>
		<label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/productcategory/edit.do?ac=3&productcategoryid=')"/></label>
		<label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/productcategory/del.do?productcategoryid=')"/></label>
	</div>

	<table id="table1" class="borderTable" border="0" cellpadding="0" cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px"></td>
			<td style="width: 120px">编号</td>
			<td style="width: 120px">名称</td>
			<td style="width: 120px">添加时间</td>
			<td style="width: 120px">状态</td>
			<td style="width: 120px">排列顺序</td>
		</tr>
		<c:forEach var="productcategory" items="${productcategorys}">
			<tr onclick="clktr('${productcategory.productcategoryid}')"
				align="center">
				<td><input type="radio"
					id="${productcategory.productcategoryid}" name="rd"
					value="${productcategory.productcategoryid}" />
				</td>

				<td>${productcategory.productcategoryno}</td>
				<td>${productcategory.name}</td>
				<td>
					<fmt:formatDate value="${productcategory.adddate}" pattern="yyyy-MM-dd" />
				</td>
				
				<td>
					<c:if test="${productcategory.state==1}">使用</c:if>
					<c:if test="${productcategory.state==2}">未使用</c:if>
				</td>
				<td>${productcategory.ordernum}</td>

			</tr>
		</c:forEach>

	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
