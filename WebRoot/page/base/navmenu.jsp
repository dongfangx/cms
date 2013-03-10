<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<div class="pageContent">
	<form method="post" action="<%=path%>/sys/navmenu/save" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		
		<input type="hidden" id="navmenuid" name="navmenuid" value="${navmenu.navmenuid}">
		
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>编号</label>
				<input name="navmenuno" class="required" type="text" size="30" value="${navmenu.navmenuno}" alt=""/>
			</p>
			<p>
				<label>名称</label>
				<input name="navmenuname" class="required" type="text" size="30" value="${navmenu.navmenuname}" alt=""/>
			</p>
			<p>
				<label>URL</label>
				<input name="url" class="required" type="text" size="30" value="${navmenu.menuurl}" alt=""/>
			</p>
			
			<p>
				<label>排序</label>
				<input name="sort" class="required" type="text" size="30" value="${navmenu.sort}" alt=""/>
			</p>
			<p>
				<label>使用否：</label>		
				<select name="state" class="combox">
						<option value="1" <c:if test="${navmenu.state==1}"> selected="selected"</c:if>>
							使用
						</option>
						<option value="2"
							<c:if test="${navmenu.state==2}"> selected="selected"</c:if>>
							不使用
						</option>
					</select>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
