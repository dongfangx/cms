<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<c:when test="${news==null}">
   				<b>当前位置：新闻管理 >> 添加新闻</b>
   		</c:when>
			<c:otherwise>
   				<b>当前位置：新闻管理 >> 修改新闻</b>
   		</c:otherwise>
		</c:choose></SPAN>
	</div>
	
	
	<form id="form1" action="<%=path %>/base/news/save.do" method="POST" onsubmit="return save()">

		<input type="hidden" id="ac" name="ac"> 
		<input type="hidden" id="newsid" name="newsid" value="${ news.newsid}">

		<table width="100%" class="bg">

			<tr class="w120">
				<td>编号</td>
				<td>
					<input type="text" id="newsno" name="newsno" value="${news.newsno}" class="width200 no nn" maxlength="50" /> 
					<span style="color: red">*</span></td>
			</tr>
			<!-- 
			<tr class="w120">
				<td>作者</td>
				<td><input type="text" id="employeeid" name="employeeid"
					value="${news.employeeid}" class="width200 no nn" maxlength="50" />
					<span style="color: red">*</span></td>
			</tr>
			 -->
			 
			<tr class="w120">
				<td>标题</td>
				<td>
				<input type="text" id="title" name="title" value="${news.title}" class="width200  nn" maxlength="50" /> 
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr class="w120">
				<td>图片</td>
				<td>
					<input type="text" id="img" name="img" value="${news.img}"
					class="width200 " maxlength="50" /> 
					<span style="color: red">*</span>
				</td>
			</tr>
			<tr class="w120">
				<td>内容</td>
				<td>
					<textarea id="content" name="content" style="width:700px;height:400px;" >
						${news.content}
					</textarea>
				</td>
			</tr>
			
			<tr>
				<td>状态</td>
				<td><select name="state" class="width200">
						<option value="1"
							<c:if test="${news.state==1}"> selected="selected"</c:if>>
							使用</option>
						<option value="2"
							<c:if test="${news.state==2}"> selected="selected"</c:if>>
							不使用</option>
				</select></td>
			</tr>
			<tr class="w120">
				<td>排列顺序</td>
				<td>
					<input type="text" id="ordernum" name="ordernum" value="${news.ordernum}" class="width200 " maxlength="10" />
				</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><c:if test="${ ac!=1}">
						<input type="submit" id="btnAdd" value="保存" class="btn" />
						<input type="reset" id="btnreset" value="取消" class="btn" />
					</c:if> <input type="button" id="btnReturn" value="返回" class="btn"
					onClick="list('<%=path%>/base/news/list.do')" /></td>
			</tr>
		</table>
	</form>

</body>
</html>

