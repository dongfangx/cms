<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<script>
        var editor;
        KindEditor.ready(function(K) {
                editor = K.create('#content');
        });
</script>
<body>

	<div class="position">
		<SPAN><c:choose>
			<c:when test="${solutions==null}">
   				<b>当前位置：解决方案管理 >> 添加解决方案</b>
   		</c:when>
			<c:otherwise>
   				<b>当前位置：解决方案管理 >> 修改解决方案</b>
   		</c:otherwise>
		</c:choose></SPAN>
	</div>
	<form id="form1" action="<%=path %>/base/solutions/save.do" method="POST" onsubmit="return save()" enctype ="multipart/form-data">

		<input type="hidden" id="ac" name="ac">
		<input type="hidden" id="solutionsid" name="solutionsid" value="${ solutions.solutionsid}">

		<table width="100%" class="bg">

			<tr class="w120">
				<td>编号</td>
				<td><input type="text" id="solutionsno" name="solutionsno"
					value="${solutions.solutionsno}" class="width200 no nn"
					maxlength="50" /> 
					<span style="color: red">*</span>
				</td>
			</tr>

			<tr class="w120">
				<td>标题</td>
				<td><input type="text" id="title" name="title"
					value="${solutions.title}" class="width200  nn" maxlength="50" />
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr class="w120">
				<td>简介</td>
				<td><input type="text" id="introducation" name="introducation"
					value="${solutions.introducation}" class="w500 " maxlength="100" />
				</td>
			</tr>			
			<tr class="w120">
				<td>图片</td>
				<td>
					<span>${ solutions.img}</span>
					<input  type ="file"  name ="img" size ="30"/>
				</td>
			</tr>
			<tr class="w120">
				<td>内容</td>
				<td>
					<textarea id="content" name="content" style="width:700px;height:400px;" >
						${solutions.content}
					</textarea>
				</td>
			</tr>

			<tr>
				<td>状态</td>
				<td><select name="state" class="width200">
						<option value="1"
							<c:if test="${solutions.state==1}"> selected="selected"</c:if>>
							使用</option>
						<option value="2"
							<c:if test="${solutions.state==2}"> selected="selected"</c:if>>
							不使用</option>
				</select>
				</td>
			</tr>

			<tr class="w120">
				<td>排列顺序</td>
				<td><input type="text" id="ordernum" name="ordernum"
					value="${solutions.ordernum}" class="width200" maxlength="50" />
				</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><c:if test="${ ac!=1}">
						<input type="submit" id="btnAdd" value="保存" class="btn" />
						<input type="reset" id="btnreset" value="取消" class="btn" />
					</c:if> <input type="button" id="btnReturn" value="返回" class="btn"
					onClick="list('<%=path%>/base/solutions/list.do')" /></td>
			</tr>
		</table>
	</form>

</body>
</html>

