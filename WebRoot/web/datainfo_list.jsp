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

<body id="index" class="pcmgr" data-stats-prx="pcmgr-official.index" >
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
								<strong>数据资料列表</strong>
							</h2>
						</div>
						<div class="content">
								<table id="table1" style="border-color:#333333"  border="1" cellpadding="0" cellspacing="0" width="100%">
									<tr class="theadBg"  height="25px">
										<td style="width: 60px">编号</td>
										<td style="width: 80px">资料分类</td>
										<td>名称</td>
										<td style="width: 100px;">添加时间</td>
										<td style="width: 80px;">下载</td>
									</tr>
									<c:forEach var="datainfo"  items="${datainfos}">
										<tr>
											<td>${datainfo.datainfono}</td>
											<td>${datainfo.dataclassname }</td>
											<td>${datainfo.name}</td>
											<td>
												<fmt:formatDate value="${datainfo.adddate}" pattern="yyyy-MM-dd" />
											</td>
											<td>
												<a href="<%=path %>${datainfo.dataurl}">
													<img src="<%=path %>/images/pdf.gif" height="20" width="20">
												</a>
											</td>
										</tr>
									</c:forEach>
								</table>
								<div style="text-align:right;color:#666;padding:10px;">
									${ps}
								</div>
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
					<div class="blog-question" style="height: 550px;">
						<div class="layout-side-wrap">
							<div class="layout-column" id="mblog-updates" style="height: 300px;" >
								<div class="block-title" style="text-align: left;">
									<h2>
										<strong>资料类别</strong>
									</h2>
								</div>
								<div id="blog_tips">
									<ul >
										<c:forEach var="dc" items="${dataclasses}"  varStatus="cou">
										<c:choose>
										      <c:when test="${cou.first }">
										      		<li class="first clearfix">
										      </c:when>
										      <c:otherwise>
										      		<li class="clearfix">
										      </c:otherwise>
									    </c:choose>
										
											<a href="<%=path %>/web/index/datainfo.do?dcid=${dc.dataclassid}" ">
												<span style="font-size:16px;">${dc.name }</span>
											</a>
										</li>

										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="layout-column" id="question-system">
								<div class="block-title">
									<h2>
										<strong>联系我们 </strong>
									</h2>
									<a class="more" href="<%=path %>/web/index/linkme.do"
										data-stats="question-system.more" >详细&gt;&gt;</a>
								</div>
							<ul class="dotted ui-sortable">
								<li style="">联系人：张小姐</li>
								<li style="">电话：10000</li>
								<li style="">传真：10000</li>
								<li style="">地址：红牌楼加林路10号财富广场5051</li>
							</ul>
						</div>
						</div>

					</div>
				</div>
				<span class="block-ft"><span></span>
				</span>

			</div>
		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">	       
			index.init();
        </script>

</body>
</html>