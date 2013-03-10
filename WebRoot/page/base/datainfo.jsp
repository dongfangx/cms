<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<body>

	<div class="position">
		<SPAN><c:choose>
			<c:when test="${datainfo==null}">
   				<b>当前位置：资料信息管理 >> 添加资料信息</b>
   		</c:when>
			<c:otherwise>
   				<b>当前位置：资料信息管理 >> 修改资料信息</b>
   		</c:otherwise>
		</c:choose></SPAN>
	</div>
	<form id="form1" action="<%=path %>/base/datainfo/save.do" method="POST" enctype ="multipart/form-data">

		<input type="hidden" id="ac" name="ac">
		<input type="hidden" id="datainfoid" name="datainfoid" value="${ datainfo.datainfoid}">
		<table width="100%" class="bg">
			<tr class="w120">
				<td>编号</td>
				<td><input type="text" id="datainfono" name="datainfono" value="${datainfo.datainfono}" class="width200  nn"
					maxlength="50"/> 
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr class="w120">
				<td>资料分类</td>
				<td>
				<select id="dataclassid" name="dataclassid" class="width200 nn">
					<option value="">----请选择资料分类----</option>
					<c:forEach var="ds" items="${dataclasses}">
						<option value="${ds.dataclassid}" <c:if test="${ds.dataclassid==datainfo.dataclassid}"> selected="selected"  </c:if>>
							${ds.name} 
						</option>
					</c:forEach>
				</select>
				<span style="color: red">*</span>
				</td>
			</tr>
			<tr class="w120">
				<td>名称</td>
				<td>
					<input type="text" id="name" name="name" value="${datainfo.name}" class="width200  nn" maxlength="50" />
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr class="w120">
				<td>文件地址</td>
				<td>
					${datainfo.dataurl }
					<input type ="file" name ="img" size ="30"/><br/>
				</td>
			</tr>
			<tr>
				<td>状态</td>
				<td><select name="state" class="width200">
						<option value="1" <c:if test="${datainfo.state==1}"> selected="selected"</c:if>>使用</option>
						<option value="2" <c:if test="${datainfo.state==2}"> selected="selected"</c:if>>不使用</option>
				</select>
				</td>
			</tr>
			<tr class="w120">
				<td>排列顺序</td>
				<td><input type="text" id="ordernum" name="ordernum" value="${datainfo.ordernum}" class="width200 "
					maxlength="50"/> 
				<span style="color: red">*</span>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><c:if test="${ ac!=1}">
						<input type="submit" id="btnAdd" value="保存" class="btn" />
						<input type="reset" id="btnreset" value="取消" class="btn" />
					</c:if> <input type="button" id="btnReturn" value="返回" class="btn" onClick="list('<%=path%>/base/datainfo/list.do')" /></td>
			</tr>
		</table>
	</form>

</body>
</html>

