<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../../top.jsp"></jsp:include>

<script type="text/javascript">
<!--
function open1(){
	$('#dd').css("display","block").dialog({
		title:'请选择所属上级菜单',
		buttons:[{
			text:'确定',
			iconCls:'icon-ok',
			handler:function(){
				if($("#pmenuid").val()==''){
					alert('请选择父节点');
					return;
				}
				$('#dd').dialog('close');
			}
		},{
			text:'取消',
			handler:function(){
				$('#dd').dialog('close');
			}
		}]
	});
}
function chg(val,txt){
	$("#pmenuid").val(val);
	$("#pmenuname").val(txt);
}

//-->
</script>
<html>
<body>

	<form id="form1" action="<%=path %>/sys/menu/save.do" method="POST" onsubmit="return save()">

		<input type="hidden" id="menuid" name="menuid" value="${menu.menuid}">
		<input type="hidden" id="pmenuid" name="pmenuid" value="${menu.pmenuid}">

			<table width="100%" class="bg">
				<tr>
					<td width="80px;">
						编号
					</td>
					<td>
						<input type="text" id="menuno" name="menuno"
							value="${menu.menuno}" class="width200 nn no" maxlength="6"/>
							<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
					<td>
						菜单名称
					</td>
					<td>
						<input type="text" id="menuname" name="menuname"
							value="${menu.menuname}" class="width200 nn" maxlength="50"/>
							<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
					<td>
						URL
					</td>
					<td>
						<input type="text" id="url" name="url" value="${menu.url}"
							class="width200 nn" maxlength="100"/>
							<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
				<td>
						父菜单
					</td>
					<td>
						<input type="text" id="pmenuname" name="pmenuname" onclick="open1()"
							value="${menu.pmenuname}" class="width200 nn" maxlength="50"/>
							<span style="color:red">*</span>
					</td>
				</tr>
				<tr>
					<td>
						使用否
					</td>
					<td>
						<select name="state" class="width200">
							<option value="1" <c:if test="${menu.state==1}"> selected="selected"</c:if>>
								使用
							</option>
							<option value="2"
								<c:if test="${menu.state==2}"> selected="selected"</c:if>>
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
						<input type="submit" class="btn"  value="保存"/>
						<input type="reset" class="btn" value="取消"/>
					</td>
				</tr>
			</table>
	</form>

	<div id="dd" icon="icon-save" style="padding:5px;width:400px;height:200px;display:none;">
		<div id="dd1" style="width:100%;height:100%;">
		</div>
	</div>
</body></html>
<script type="text/javascript">
	${menu_tree};
	document.getElementById('dd1').innerHTML=t0;
</script>