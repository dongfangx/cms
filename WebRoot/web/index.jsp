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
<!-- 
<link rel="shortcut icon" href="http://pc1.gtimg.com/favicon.ico" type="image/x-icon">
<link rel="bookmark" href="http://pc1.gtimg.com/favicon.ico" type="image/x-icon">
 -->
<link href="<%=path%>/css/global.css" rel="stylesheet" type="text/css" media="screen">
<link href="<%=path%>/css/index.sec.css" rel="stylesheet" type="text/css" media="screen">

<style>
.sliderbanner {
    height: 259px;
    line-height: 0;
    margin: 0 auto 10px;
    overflow: hidden;
    position: relative;
}
.sliderbanner ul {
    left: 0;
    position: absolute;
    top: 0;
}
.sliderbanner .btns {
    bottom: 10px;
    position: absolute;
    right: 10px;
}
.sliderbanner .btns a {
    background: none repeat scroll 0 0 #000000;
    border: 2px solid #FFFFFF;
    box-shadow: 1px 1px 0 rgba(0, 0, 0, 0.3);
    display: block;
    float: left;
    margin: 0 3px;
}
.sliderbanner .btns a img {
    height: 25px;
    opacity: 0.3;
    width: 66px;
}
.sliderbanner .btns a.active img {
    opacity: 1;
}
</style>

</head>

<body id="index">
	<jsp:include page="header.jsp"></jsp:include>

	<!---------------------------------------------------- Content ----------------------------------------------------------->

	<!---------------------------------------------------- Image Flash ---------------------------------------------------- -->
	<div id="content">
		<div class="wrapper sliderbanner">
			<ul class="slider">
				<li style="position: relative;">
					<img src="<%=path%>/images/04.png" />
				</li>
					<li>
						<img src="<%=path%>/images/03.png" />
				</li>
			</ul>
			<div class="btns">
				<a href="iweibo.php" class="active"><img src="<%=path%>/images/04.png" />
				</a> <a href="javascript:;"><img src="<%=path%>/images/03.png" />
				</a>
			</div>
		</div>
		<!---------------------------------------------------- News Product ---------------------------------------------------- -->
		<div class="layout block">

			<!---------------------------------------------------- Left ---------------------------------------------------- -->
			<div class="left">
				<!-- news ------>
				<span class="block-hd"><span></span>
				</span>
				<div class="block-bd clearfix">
					<div class="clearfix" id="safety-info">

						<div class="main_tips">
							<div class="block-title" style="margin-bottom: 0pt;">
								<h2>
									<strong>康定动态</strong>
								</h2>
								<a title=" " class="more" href="<%=path%>/web/index/newsList.do"
									data-stats="pcmgr-dynamic.more" >更多&gt;&gt;</a>
							</div>
							<div class="content" style="display: block;">
								<!-- pic info ---->
								<div class="pic_info" id="slide_img">
										<img src="<%=path%>/images/news.png" class="" width="240" height="180">
								</div>

								<!-- text info ---->

								<div class="text_info">
									<ul class="dotted ui-sortable">
										<c:forEach var="news" items="${newies}">
											<li  style="">
											<a class="" title="" href="<%=path %>/web/index/news.do?newsid=${news.newsid}"
												data-stats="news-system.news-hot-text9">
												 [<fmt:formatDate value="${news.adddate}" pattern="yyyy-MM-dd" />] ${news.title} </a></li>
										</c:forEach>
									</ul>
								</div>

							</div>
						</div>
					</div>
				</div>
				<span class="block-ft"><span></span>
				</span>

				<div class="hack10"></div>

				<!-- product ---->

				<span class="block-hd"><span></span>
				</span>
				<div class="block-bd clearfix">
					<div class="security_tips" style="height:475px;">
						<div class="block-title">
							<h2>
								<strong>热门产品列表</strong>
							</h2>
							<a class="more" href="<%=path %>/web/index/productList.do"
								data-stats="security-system.more" >更多&gt;&gt;</a>
						</div>
						<div class="content">
							<c:forEach var="product" items="${products}"  varStatus="cou">
							
							    <c:choose>
								      <c:when test="${cou.count%2==0 }">
								      		<div class="security-main" style="display: block;">
								      </c:when>
								      <c:otherwise>
								      		<div class="security-side" style="display: block;">
								      </c:otherwise>
							    </c:choose>
							    				<span class="span-left"> 
												<a href="<%=path %>/web/index/product.do?productid=${product.productid}" >
												<img src="<%=path %>${product.minimg}" height="120" width="120">
												</a> 
												</span> 
												<span class="security-text"> 
												<a href="<%=path %>/web/index/product.do?productid=${product.productid}"
													data-stats="security-system.question1">${product.title }</a>
													<br> 
													编号:&nbsp;${product.productno }
													<br/>
													${product.introducation }
													<a href="<%=path %>/web/index/product.do?productid=${product.productid}"
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
					<div class="blog-question">
						<div class="layout-side-wrap">
							<div class="layout-column" id="mblog-updates" style="height: 550px;" >
								<div class="block-title" style="text-align: left;">
									<h2>
										<strong>最新产品</strong>
									</h2>
								</div>
								<a class="more" href="<%=path%>/web/index/productList.do"
										data-stats="question-system.more" >更多新产品&gt;&gt;</a>
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
												<a href="<%=path %>/web/index/product.do?productid=${product.productid}" 
													title="查看详细内容" class="detail"
													data-stats="mblog-updates.0-detail">[详细]</a>
											</p>
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
									<a class="more" href="<%=path%>/web/index/linkme.do"
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
			<script type="text/javascript" src="<%=path%>/js/jquery-1.4.4.min.js"></script>

		<script type="text/javascript" src="<%=path%>/js/global.js"></script>

        <script type="text/javascript" src="http://pc1.gtimg.com/td/site/base/js/jquery.blockUI.js"></script>

		<script type="text/javascript" src="<%=path%>/js/index.js"></script>
		
		<script type="text/javascript">
		$(function () {
			var slider = $(".slider");
			var initIndex = 0;
			var autoSliderIntervalTime = 3 * 1000;
			var autoSlideTimer;
			var autoSliderEnabled = true;
			var maxIndex = slider.find("li").length - 1;
			var scrollSlider = function () {
			slider.hide().css({
			top: -initIndex * 259
			}).fadeIn(500);
			$(".sliderbanner > .btns > a").removeClass("active");
			$(".sliderbanner > .btns > a:eq("+initIndex+")").addClass("active");
			}
			var scrollNext = function () {
			initIndex ++;
			initIndex = initIndex > maxIndex ? 0:initIndex;
			scrollSlider();
			}
			var autoScroll = function () {
			autoSlideTimer = setInterval(scrollNext,autoSliderIntervalTime);
			}
			var haltAutoScroll = function () {
			if (autoSlideTimer) {
			clearInterval(autoSlideTimer);
			autoSlideTimer = null;
			}
			}
			$(".sliderbanner > .btns > a").mouseenter(function(){
			var self = $(this);
			haltAutoScroll();
			initIndex = self.index();
			scrollSlider();
			}).mouseleave(function () {
			if (autoSliderEnabled && !autoSlideTimer) {
			autoScroll();
			}
			});
			if (initIndex > 0) {
			scrollSlider();
			}
			if (autoSliderEnabled) {
			autoScroll();
			}
			}); 
		</script>
	
</body>
</html>
