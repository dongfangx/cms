<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>
<script>
        var editor;
		KindEditor.ready(function(K) {
			var editor = K.create('textarea[name="content"]', {
				cssPath : '../plugins/code/prettify.css',
				uploadJson : '<%=path%>/util/image/upload.do',
				//allowUpload : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
</script>
<body>

	<div class="position">
		<span><c:choose>
			<c:when test="${product==null}">
   				<b>当前位置：产品管理 >> 添加产品</b>
   		</c:when>
			<c:otherwise>
   				<b>当前位置：产品管理 >> 修改产品</b>
   		</c:otherwise>
		</c:choose></span>
	</div>
	<form id="form1" name="form1" action="<%=path %>/base/product/save.do" method="POST"  onsubmit="return save()" enctype ="multipart/form-data">

		<input type="hidden" id="ac" name="ac">
		<input type="hidden" id="productid" name="productid" value="${ product.productid}">
			
			<table width="100%" class="bg">

			<tr class="w120">
				<td>编号</td>
				<td><input type="text" id="productno" name="productno"
					value="${product.productno}" class="width200 no nn" maxlength="50" />
					<span style="color: red">*</span></td>
			</tr>
			
			<tr class="w120">
				<td>产品类别</td>
				<td>
					<select id="productcategoryid" name="productcategoryid" class="width200 nn">
						<option value="">----请选择产品分类----</option>
						<c:forEach var="pc" items="${pcs}">
							<option value="${pc.productcategoryid}" <c:if test="${pc.productcategoryid==product.productcategoryid}"> selected="selected"  </c:if>>
								${pc.name} 
							</option>
						</c:forEach>
					</select>
				<span style="color: red">*</span>
				</td>
			</tr>
			<tr class="w120">
				<td>标题</td>
				<td><input type="text" id="title" name="title"
					value="${product.title}" class="width200  nn" maxlength="50" />
					<span style="color: red">*</span></td>
			</tr>
			<tr class="w120">
				<td>产品简介</td>
				<td><input type="text" id="introducation" name="introducation"
					value="${product.introducation}" class="w500" maxlength="100" />
				</td>
			</tr>
			<tr class="w120">
				<td>小图片</td>
				<td>
					<span>${ product.minimg}</span>
					<input  type ="file"  name ="minimg" size ="30"/>
				</td>
			</tr>
			<tr class="w120">
				<td>大图片</td>
				<td>
					<span>${ product.maximg}</span>
					<input  type ="file"  name ="maximg" size ="30"/>
				</td>
			</tr>
			<tr class="w120">
				<td>内容</td>
				<td>
					<textarea id="content" name="content" style="width:700px;height:400px;" >
						${product.content}
					</textarea>
				</td>
			</tr>

			<tr>
				<td>状态</td>
				<td><select name="state" class="width200">
						<option value="1"
							<c:if test="${product.state==1}"> selected="selected"</c:if>>
							使用</option>
						<option value="2"
							<c:if test="${product.state==2}"> selected="selected"</c:if>>
							不使用</option>
				</select></td>
			</tr>

			<tr class="w120">
				<td>排列顺序</td>
				<td><input type="text" id="ordernum" name="ordernum"
					value="${product.ordernum}" class="width200 " /></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><c:if test="${ ac!=1}">
						<input type="submit" id="btnAdd" value="保存" class="btn" />
						<input type="reset" id="btnreset" value="取消" class="btn" />
					</c:if> <input type="button" id="btnReturn" value="返回" class="btn"
					onClick="list('<%=path%>/base/product/list.do')" /></td>
			</tr>
		</table>
	</form>

</body>
</html>

