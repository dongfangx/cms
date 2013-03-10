<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>

	<input type="hidden" id="ac" name="ac" value="${ac}">

	<div class="position">
		<span> <c:choose>
				<c:when test="${navmenu==null}">
					<b>当前位置：导航菜单管理 》添加导航菜单</b>
				</c:when>
				<c:otherwise>
					<b>当前位置：导航菜单管理》修改导航菜单</b>
				</c:otherwise>
			</c:choose> </span>
	</div>

	<form id="form1" action="<%=path%>/base/navmenu/save.do" method="POST"
		onsubmit="return save()">

		<input type="hidden" id="navmenuid" name="navmenuid"
			value="${navmenu.navmenuid}">

		<table id="table1" width="100%" class="bg">

			<tr>
				<td style="120px;">
					编号
				</td>
				<td>

					<input type="text" id="navmenuno" name="navmenuno"
						value="${navmenu.navmenuno}" class="width200 nn" maxlength="10" />
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr>
				<td style="">
					名称
				</td>
				<td>

					<input type="text" id="navmenuname" name="navmenuname"
						value="${navmenu.navmenuname}" class="width200 nn" maxlength="10" />
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr>
				<td style="">
					地址
				</td>
				<td>

					<input type="text" id="menuurl" name="menuurl"
						value="${navmenu.menuurl}" class="width200 nn" maxlength="50" />
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr>
				<td style="">
					排序
				</td>
				<td>

					<input type="text" id="sort" name="sort" value="${navmenu.sort}"
						class="width200 nn" maxlength="10" />
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr>
				<td class="w120">
					状态
				</td>
				<td>
					<select name="state" class="width200">
						<option value="1"
							<c:if test="${navmenu.state==1}"> selected="selected"</c:if>>
							使用
						</option>
						<option value="2"
							<c:if test="${navmenu.state==2}"> selected="selected"</c:if>>
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
					<c:if test="${ ac!=1 }">
						<input type="submit" id="btnAdd" value="保存" class="btn" />
						<input type="reset" id="btnreset" value="取消" class="btn" />
					</c:if>
					<input type="button" id="btnReturn" value="返回" class="btn"
						onClick="list('<%=path%>/base/navmenu/list.do')" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>

