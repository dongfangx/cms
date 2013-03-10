<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<html>
<body>
	<div class="position">
		<span>
			<b>当前位置：基础类型管理 >> 基础类型列表</b>
		</span>
	</div>
	
	<div class="btnBg">
       	<label><input type="button" value="添加" class="btnAll" onclick="add('<%=path%>/base/codetype/edit.do?ac=2')"/></label>
        <label><input type="button" value="修改" class="btnAll" onclick="edit('<%=path%>/base/codetype/edit.do?ac=3&codetypeid=')"/></label>
        <label><input type="button" value="删除" class="btnAll" onclick="del('<%=path%>/base/codetype/del.do?codetypeid=')"/></label>
	</div>
	
	<table id="table1" class="borderTable" border="0" cellpadding="0" cellspacing="0">
		<tr class="theadBg">
			<td style="width: 20px">&nbsp;</td>
			<td style="width: 40px">
				类型ID
			</td>
			<td style="width: 80px">
				类型名称
			</td>
			<td style="width: 120px">
				url
			</td>
		</tr>
		<c:forEach var="codetype" items="${codetypes}">
			<tr onclick="clktr('${codetype.codetypeid}')">
				<td style="text-align: center;">
						<input  type="radio" id="${codetype.codetypeid}" name="rd" value="${codetype.codetypeid}" />
				</td>
				<td>
					${codetype.codetypeid}
				</td>
				<td>
					${codetype.codetypename}&nbsp;
				</td>
				<td>
					${codetype.url}&nbsp;
				</td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align:right;color:#666;padding:10px;">
		${ps}
	</div>
</body>
</html>
