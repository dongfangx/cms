<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
<body id="index" class="pcmgr" data-stats-prx="pcmgr-official.index" onclick="">
	<div id="header">
		<h1 id="logo">
			<a class="logo" href="#" title="" data-stats="logo"> <img alt="KDLogo" src="<%=path%>/images/kdlogo.png">
			</a>
		</h1>
		<!-- --------------------- menu ------------------------------- -->
		<div id="nav-bar">
			<ul class="clearfix">
				<c:forEach var="nm" items="${navmenus}"  varStatus="cou">
				
					<c:choose>
					      <c:when test="${nmid== nm.navmenuid }">
					      		<li class="selected">
					      </c:when>
					      <c:otherwise>
					      		<li>
					      </c:otherwise>
				</c:choose>
				<span> <a href="<%=path%>${nm.menuurl}?nmid=${nm.navmenuid}"   title="${nm.navmenuname }">${nm.navmenuname }</a> </span></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>