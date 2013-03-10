<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<html>
<body>
	<form id="form1" action="<%=path%>/base/code/save.do" method="POST" onsubmit="return save()">
		<input type="hidden" id="id" name="id" value="${id}"/>
		<input type="hidden" id="codeid" name="codeid" value="${code.codeid}">

			<table width="100%" class="bg">
				<tr>
					<td class="w120">
						编号
					</td>
					<td>
						<input type="text" id="codeno" name="codeno" value="${code.codeno}" class="width200 no nn" maxlength="50" />
						<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
					<td class="w120">
						名称
					</td>
					<td>
						<input type="text" id="codename" name="codename" value="${code.codename}" class="width200 nn" maxlength="50" />
						<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
					<td class="w120">
						使用否
					</td>
					<td>
						<select name="state" class="width200">
							<option value="1" <c:if test="${codetype.state==1}"> selected="selected"</c:if>>
								使用
							</option>
							<option value="2"
								<c:if test="${codetype.state==2}"> selected="selected"</c:if>>
								不使用
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						<input type="submit" id="btnAdd" value="保存" class="btn"/>
						<input type="reset" id="btnreset" value="取消" class="btn" />
						<input type="button" id="btnReturn" value="返回" class="btn" onClick="list('<%=path%>/base/code/list2.do?id=${id}')" />
					</td>
				</tr>

			</table>
	</form>

	<div id="dd" icon="icon-save"
		style="padding: 5px; width: 400px; height: 200px; display: none;">
		<script type="text/javascript">
		${code_tree}
		</script>
	</div>


</body>
</html>
