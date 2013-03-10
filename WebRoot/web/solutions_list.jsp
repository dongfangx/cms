<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>康定电子 - 首页</title>
<meta name="keywords" content="康定电子">
<meta name="description" content="康定电子">
<link rel="shortcut icon" href="http://pc1.gtimg.com/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="http://pc1.gtimg.com/favicon.ico" type="image/x-icon">
<link href="<%=path%>/css/global.css" rel="stylesheet" type="text/css" media="screen">
<link href="<%=path%>/css/index.sec.css" rel="stylesheet" type="text/css" media="screen">
</head>

<body id="index" class="pcmgr" data-stats-prx="pcmgr-official.index" onclick="pgvWatchClick({coordinateId: &#39;header&#39;})">
	<jsp:include page="header.jsp"></jsp:include>

	<!---------------------------------------------------- Content ----------------------------------------------------------->

	<!---------------------------------------------------- Image Flash ---------------------------------------------------- -->
	<div id="content">
		<div id="banner">
			<p id="banner-bg">
				<img src="<%=path %>/images/04.png" class="" width="950" height="260">
			</p>
		</div>


		<!---------------------------------------------------- News Product ---------------------------------------------------- -->
		<div class="layout block">

			<!---------------------------------------------------- Left ---------------------------------------------------- -->
			<div class="left">
				<!-- product ---->
				<span class="block-hd"><span></span>
				</span>
				<div class="block-bd clearfix">
					<div class="security_tips" style="height:520px;">
						<div class="block-title">
							<h2>
								<strong>解决方案列表</strong>
							</h2>
						</div>
						<div class="content">
							<c:forEach var="solutions" items="${solutionses}"  varStatus="cou">
							
							    <c:choose>
								      <c:when test="${cou.index%2==0 }">
								      		<div class="security-main" style="display: block;">
								      </c:when>
								      <c:otherwise>
								      		<div class="security-side" style="display: block;">
								      </c:otherwise>
							    </c:choose>
							    				<span class="span-left"> 
												<a href="<%=path %>/web/index/solutions.do?solutionsid=${solutions.solutionsid}" >
												<img src="<%=path %>${solutions.img}" height="120" width="120">
												</a> 
												</span> 
												<span class="security-text"> 
												&nbsp;编号:&nbsp;&nbsp;${solutions.solutionsno }
												<br/>
												<a href="<%=path %>/web/index/solutions.do?solutionsid=${solutions.solutionsid}"
													 data-stats="security-system.question1">${solutions.title }</a>
													<a href="<%=path %>/web/index/solutions.do?solutionsid=${solutions.solutionsid}"
													style="float: right;" 
													data-stats="security-system.question1-more">[详细]</a>
												</span>
											</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<span class="block-ft"><span></span>
				</span>
			</div>


			<!---------------------------------------------------- Right  ---------------------------------------------------- -->
			<div class="right">
				<span class="block-hd"><span></span></span>
				<div class="block-bd clearfix">
					<div class="blog-question" style="height: 550px;" >
						<div class="layout-side-wrap">
							<div class="layout-column" id="mblog-updates" style="height: 550px;" >
								<div class="block-title" style="text-align: left;">
									<h2>
										<strong>最新产品</strong>
									</h2>
								</div>
								<a id="release_entry" href="javascript:void(0)"
									data-stats="mblog-updates.release-blog" class="blog-link">更多新产品</a>
								<div id="blog_tips">
									<ul >
										<c:forEach var="product" items="${products}"  varStatus="cou">
										<c:choose>
										      <c:when test="${cou.first }">
										      		<li class="first clearfix">
										      </c:when>
										      <c:otherwise>
										      		<li class="clearfix">
										      </c:otherwise>
									    </c:choose>
										
											<a href="<%=path %>/web/index/product.do?productid=${product.productid}"  
											class="avatar" data-stats="mblog-updates.0-avatar">
													<img src="<%=path %>${product.minimg}" height="50" width="50">
											</a>

											<p class="mblog">
												<a href="<%=path %>/web/index/product.do?productid=${product.productid}" 
													title="${product.title }" data-stats="mblog-updates.2-nickname" style="font-size: 14px;">${product.title }</a>
													${product.introducation }
											</p>

											<p class="detail">
												<a href="<%=path %>/web/index/product.do?productid=${product.productid}" target="_blank"
													title="查看详细内容" class="detail"
													data-stats="mblog-updates.0-detail">[详细]</a>
											</p>
										</li>

										</c:forEach>
									</ul>
								</div>
							</div>

						</div>
					</div>
				</div>
				<span class="block-ft"><span></span>
				</span>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">	       
			index.init();
        </script>

</body>
</html>