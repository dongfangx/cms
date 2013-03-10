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
			<c:choose>
				<c:when test="${codetype==null}">
	   				<b>当前位置：基础类型管理>> 添加基础类型</b>
	   		</c:when>
				<c:otherwise>
	   				<b>当前位置：基础类型管理>> 修改基础类型</b>
	   		</c:otherwise>
			</c:choose>
		</span>
	</div>
	<form id="form1" action="<%=path%>/base/codetype/save.do" method="POST" onsubmit="return save()">

		<input type="hidden" id="ac" name="ac" value="${ac}">
		<table width="100%" class="bg">
			<tr>
				<td class="w120">
					类型编号
				</td>
				<td>
					<input type="text" id="codetypeid" name="codetypeid"
						value="${codetype.codetypeid}" class="width200 no nn" maxlength="50" />
						<span style="color:red">*</span>
				</td>
			</tr>
			<tr>
				<td class="w120">
					类型名称
				</td>
				<td>
					<input type="text" id="codetypename" name="codetypename"
						value="${codetype.codetypename}" class="width200 nn" maxlength="50" />
						<span style="color:red">*</span>
				</td>
			</tr>
			<tr>
				<td class="w120">
					url
				</td>
				<td>
					<input type="text" id="url" name="url" value="${codetype.url}" class="width200 nn" maxlength="50" />
					<span style="color:red">*</span>
				</td>
			</tr>
			<tr>
				<td class="w120">
					使用否
				</td>
				<td>
					<select name="state" class="width200 nn">
						<option value="1" <c:if test="${codetype.state==1}"> selected="selected"</c:if>>
							使用
						</option>
						<option value="2"
							<c:if test="${codetype.state==2}"> selected="selected"</c:if>>
							不使用
						</option>
					</select><span style="color:red">*</span>
				</td>
			</tr>
			<tr>
				<td class="w120">
					备注
				</td>
				<td>
					<input type="text" id="memo" name="memo" value="${codetype.memo}" class="width300" maxlength="100" />
				</td>
			</tr>

			<tr>
				<td>
					&nbsp;
				</td>
				<td>
						<input type="submit" id="btnAdd" value="保存" class="btn"/>
						<input type="reset" id="btnreset" value="取消" class="btn" />
					<input type="button" id="btnReturn" value="返回" class="btn" onClick="list('<%=path%>/base/codetype/list.do')" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

