<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<script type="text/javascript">
<!--
	function add1(){
		var id = $("#id").val();
		add('<%=path%>/base/code/add.do?id='+id);
	}
//-->
</script>
<html>
<body>
	<input type="hidden" id="id" name="id" value="${id}"/>
	<div class="btnBg">
		<input type="button" value="添加" class="btn" onclick="add1()"/>
		<input type="button" value="修改" class="btn" onclick="edit('<%=path%>/base/code/edit.do?codeid=')"/>
		<input type="button" value="删除" class="btn" onclick="del('<%=path%>/base/code/del.do?codeid=')"/>
	</div>
	<table id="table1" class="borderTable" border="0" cellpadding="0" cellspacing="0">
		<tr class="theadBg" style="height: 20px;">
			<td style="width:30px;">&nbsp;</td>
			<td width="width:80px;">
				编号
			</td>
			<td width="width:150px;">
				名称
			</td>
			<td width="width:80px;">
				使用否
			</td>
		</tr>
		<c:forEach var="code" items="${codes}">
			<tr onclick="clktr('${code.codeid}')">
				<td style="text-align: center;">
						<input  type="radio" id="${code.codeid}" name="rd" value="${code.codeid}" />
				</td>
				<td>
						${code.codeno}&nbsp;
				</td>
				<td>
					${code.codename}&nbsp;
				</td>
				<td>
					<c:choose>
						<c:when test="${code.state==1}">
								使用
							</c:when>
						<c:otherwise>
								未使用
							</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div class="pagesort">
		${ps}
	</div>
</body>
</html>