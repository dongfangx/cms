<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>


<form id="pagerForm" method="post" action="<%=path %>/base/navmenu/list">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.pageSize}" />
</form>


<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<%=path %>/base/navmenu/list" rel="pagerForm" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
					<td>编号：<input type="text"  id="navmenuno" name="navmenuno"/></td>
					<td>名称：<input type="text"  id="navmenuname" name="navmenuname" value="${navmenu.navmenuname}"/></td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div>
					</td>
			</tr>
		</table>
		<div class="subBar">
		</div>
		
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="<%=path %>/base/navmenu/edit?" target="navTab"><span>添加</span></a></li>
			<li><a class="delete" href="<%=path %>/base/navmenu/del?navmenuid={sid_user}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="<%=path %>/base/navmenu/edit?navmenuid={sid_user}" target="navTab"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>编号</th>
				<th>名称</th>
				<th>URL</th>
				<th>排序</th>
				<th>状态</th>		
			</tr>
		</thead>
		<tbody>
			<c:forEach var="navmenu" items="${navmenu_list}">
				<tr target="sid_user" rel="${navmenu.navmenuid}">
					<td>
						${navmenu.navmenuno}
					</td>
					<td>
						${navmenu.navmenuname}
					</td>
					<td>
						${navmenu.menuurl}
					</td>
					<td>
						${navmenu.sort}
					</td>
					<td>
						<c:choose>
							<c:when test="${navmenu.state==1}">
								使用
							</c:when>
							<c:otherwise>
								未使用
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select>
			<span>条，共${page.recordCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${page.recordCount}" numPerPage="20" pageNumShown="5" currentPage="${page.pageNumber}"></div>

	</div>
</div>
