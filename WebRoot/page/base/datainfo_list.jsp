<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>
	<div class="position">
		<span><b>当前位置：资料信息管理 >> 资料信息列表</b></span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="查看" class="btnAll" id="btnShow" onclick="show('<%=path%>/base/datainfo/edit.do?ac=1&datainfoid=')"/></label>
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/datainfo/edit.do?ac=2')"/></label>
		<label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/datainfo/edit.do?ac=3&datainfoid=')"/></label>
		<label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/datainfo/del.do?datainfoid=')"/></label>
	</div>
	<table id="table1" class="borderTable" border="0" cellpadding="0" cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px"></td>
			<td style="width: 120px">编号</td>
			<td style="width: 120px">资料分类</td>
			<td>名称</td>
			<td style="width: 120px">文件地址</td>
			<td style="width: 120px">添加时间</td>
			<td style="width: 120px">状态</td>
			<td style="width: 120px">排列顺序</td>
		</tr>
		<c:forEach var="datainfo" items="${datainfos}">
			<tr onclick="clktr('${datainfo.datainfoid}')" align="center">
				<td><input type="radio" id="${datainfo.datainfoid}" name="rd" value="${datainfo.datainfoid}" /></td>
				<td>${datainfo.datainfono}</td>
				<td>${datainfo.dataclassname }</td>
				<td>${datainfo.name}</td>
				<td>${datainfo.dataurl}</td>
				<td>
					<fmt:formatDate value="${datainfo.adddate}" pattern="yyyy-MM-dd" />
				</td>
				<td>
					<c:if test="${datainfo.state==1}">使用</c:if>
					<c:if test="${datainfo.state==2}">未使用</c:if>
				</td>
				<td>${datainfo.ordernum}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
