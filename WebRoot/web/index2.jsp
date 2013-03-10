<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<base href="<%=basePath%>">
    	<title>康定电子—首页</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="shortcut icon" href=" type="image/x-icon">
		<link rel="bookmark" href=" type="image/x-icon">
		<link href="<%=path%>/css/global.css" rel="stylesheet" type="text/css" media="screen">
		<link href="<%=path%>/css/index_1.css" rel="stylesheet" type="text/css" media="screen">
		
		<style type="text/css">
			<!--
			div,a{margin:0;padding:0;}img{border:0px;}
			.imgsBox{overflow:hidden;width:950px;height:300px;}
			.imgs a{display:block;width:950px;height:288px;}
			.clickButton{background-color:#888888;width:950px;height:12px;position:relative;top:-1px;_top:-5px;}
			.clickButton div{float:right;}
			.clickButton a{background-color:#666;border-left:#ccc 1px solid;line-height:12px;height:12px;font-size:10px;float:left;padding:0 7px;text-decoration:none;color:#fff;}
			.clickButton a.active,.clickButton a:hover{background-color:#d34600;}
			-->
			</style>
	</head>
	<body>
		<div id="header">
			<h1 id="logo">
				<a class="logo" href="http://guanjia.hhxdz.com/" title="康定电子" data-stats="logo"><img alt="康定电子" src="<%=path%>/images/head.gif"></a>
                <a href="http://guanjia.hhxdz.com/cartoonlist.html" target="_blank" title="康定电子冷漫系列" data-stats="cartoon" class="cartoon">
					<img src="<%=path%>/images/search.png" alt="" width="403" height="55">
				
				</a>
			</h1>
			<div id="nav-bar">
				<ul class="clearfix">

					<li class="selected"><span><a href="http://guanjia.hhxdz.com/index.html" data-stats="nav-bar.index" title="首　页">首　页</a></span></li>
					<li><span><a href="http://guanjia.hhxdz.com/download.html" data-stats="nav-bar.download" title="关于康定">关于康定</a></span></li>
					<li><span><a href="http://guanjia.hhxdz.com/user/" data-stats="nav-bar.user" title="投资者关系">投资者关系</a></span></li>
					<li><span><a href="http://guanjia.qzone.hhxdz.com/" target="_blank" data-stats="nav-bar.qzone" title="产品系列">产品系列</a></span></li>
					<li><span><a href="http://www.hxdz.com/guanjia" target="_blank" data-stats="nav-bar.qbar" title="解决方案">解决方案</a></span></li>
					<li><span><a href="http://support.hhxdz.com/portal/discuss_pdt/493_1.html" target="_blank" data-stats="nav-bar.support" title="服务中心">服务中心 </a></span></li>
					<li><span><a href="http://guanjia.hhxdz.com/help.html" data-stats="nav-bar.help" title="联系我们">联系我们</a></span></li>
					<--
					<li><span><a href="http://guanjia.hhxdz.com/report.html" data-stats="nav-bar.report" title="举报">举　报</a></span></li>
					<li class="lab"><a href="http://pc.hhxdz.com/" target="_blank" data-stats="nav-bar.labs" title="腾讯软件中心"><s></s>腾讯软件中心</a></li>
					-->
				</ul>
			</div>
		</div>

		<div id="content">
			<div id="banner">
					<div class="imgsBox">
						<div class="imgs">
							<a href="#">
								<img src="<%=path%>/images/13.jpg" class="" width="950" height="300">
							</a>
						</div>
						<div class="clickButton">
							<div>
								<a class="active" href="">1</a>
								<a class="" href="">2</a>
								<a class="" href="">3</a>
								<a class="" href="">4</a>
								<a class="" href="">5</a>
							</div>
						</div>
					</div>
			</div> 
			<div class="layout block">
				
								<div class="left">		
				<span class="block-hd"><span></span></span>
					<div class="block-bd clearfix">
						<div class="clearfix" id="safety-info">											
							<div class="main_tips">
								<div class="block-title" style="margin-bottom: 0pt;">
									<h2>
										<strong>管家动态</strong>
									</h2>
										<a title=" " class="more" href="http://guanjia.qzone.qq.com/" data-stats="pcmgr-dynamic.more" target="_blank">更多&gt;&gt;</a>
								</div> 
								<div class="content" style="display: block;">
									<div class="pic_info" id="slide_img">
										
										<a target="_blank" href="http://user.qzone.qq.com/88881688/blog/1312422629" data-stats="index-bannar.image1"><img src="http://s.pc.qq.com/pc/images/0c/7b/0c7b31ad84522dd6c95e755cb6409be9.jpg" name="banner-img" title="QQ电脑管家 免费极速杀毒套装发布" alt="QQ电脑管家 免费极速杀毒套装发布"></a>
										<a target="_blank" href="http://guanjia.qq.com/user/" data-stats="index-bannar.image2"><img src="http://s.pc.qq.com/pc/images/1a/e2/1ae2a2e0ecf3be6de33bcc295b62fe2c.jpg" name="banner-img" title="QQ电脑管家网游安全月" alt="QQ电脑管家网游安全月"></a>
										<a target="_blank" href="http://user.qzone.qq.com/88881688/blog/1313061935" data-stats="index-bannar.image3"><img src="http://s.pc.qq.com/pc/images/70/ae/70ae821edc07b0d7cd5eca196577595b.jpg" name="banner-img" title="“QQ密码收集器”终落网 已被QQ电脑管家“逮捕”" alt="“QQ密码收集器”终落网 已被QQ电脑管家“逮捕”"></a>
										<a target="_blank" href="http://user.qzone.qq.com/88881688/blog/1307583957" data-stats="index-bannar.image4"><img src="http://s.pc.qq.com/pc/images/45/3d/453d1eee4e081f14fbf51b8f31f5a792.jpg" name="banner-img" title="管家漫画" alt="管家漫画"></a>						
				            			<div class="ico_c"></div>
									</div>
									<div class="text_info">
										<ul class="dotted ui-sortable">										
											
											<li class="red" style=""><a class="" title="[产品动态] 管家高分通过国际AV-C测试，性能指标国内领先" target="_blank" href="http://user.qzone.qq.com/88881688/blog/1313573557" data-stats="news-system.news-hot-text9">[产品动态] 管家高分通过国际AV-C测试，性能指标国内领先</a></li><li style=""><a title="[产品动态] QQ电脑管家5.2 发布，新增软件小管家" target="_blank" href="http://user.qzone.qq.com/88881688/blog/1309416072" data-stats="news-system.news-hot-text6">[产品动态] QQ电脑管家5.2 发布，新增软件小管家</a></li><li style=""><a title="[产品动态] QQ电脑管家5.3 beta1，新增无线安全助手防蹭网更安全！" target="_blank" href="http://user.qzone.qq.com/88881688/blog/1311650985" data-stats="news-system.news-hot-text7">[产品动态] QQ电脑管家5.3 beta1，新增无线安全助手</a></li><li style=""><a title="[管家活动] 开启QQ电脑管家，赢取暑假网游安全月千万礼包" target="_blank" href="http://user.qzone.qq.com/88881688/blog/1312463237" data-stats="news-system.news-hot-text5">[产品动态] 开启QQ电脑管家，赢取暑假网游安全月千万礼包</a></li>
											<li style=""><a title="[产品动态] QQ电脑管家 免费极速杀毒套装发布" target="_blank" href="http://user.qzone.qq.com/88881688/blog/1312422629" data-stats="news-system.news-hot-text8">[产品动态] QQ电脑管家免费极速杀毒套装发布</a></li>
																	
											<li style=""><a title="[管家视频] 放松身心健康操，让忙碌飞一会儿！" target="_blank" href="http://guanjia.qq.com/video/health.html" data-stats="news-system.news-hot-text3">[管家视频] 放松身心健康操，让忙碌飞一会儿！</a></li>									
											
											<li style=""><a title="[电脑应用] 5条鲜为人知的Windows小技巧" target="_blank" href="http://sobar.soso.com/t/80640407" data-stats="news-system.news-hot-text4">[电脑应用] 5条鲜为人知的Windows小技巧</a></li>
											<li style=""><a title="[管家活动] “等级加速”活动延长，兔年持续给力！" target="_blank" href="http://guanjia.qq.com/speed.html" data-stats="news-system.news-hot-text2">[管家活动] “等级加速”活动延长，兔年持续给力！</a></li>
										</ul>
									</div>
								</div>							
							</div>
						</div> 
					</div>
					<span class="block-ft"><span></span></span>
					
					<div class="hack10"></div>
					
					<span class="block-hd"><span></span></span>
					<div class="block-bd clearfix">
						<div class="security_tips">
							<div class="block-title">
								<h2>
									<strong>安全指南</strong>
								</h2>
								<a class="more" href="http://guanjia.qq.com/security/" data-stats="security-system.more" target="_blank">更多&gt;&gt;</a>		
							</div> 
							<div class="content">
								<div class="security-main" style="display: block;">
									<span class="span-left">
										<a href="http://user.qzone.qq.com/88881688/blog/1312777369" target="_blank"><img src="http://s.pc.qq.com/pc/images/ec/7b/ec7b0edda96a776eae327d143fb9d720.jpg" height="120" width="120"></a>	
									</span>
									<span class="security-text">
										<a href="http://user.qzone.qq.com/88881688/blog/1312777369" target="_blank" data-stats="security-system.question1">"复活者木马"</a>
										<br><img src="http://pc2.gtimg.com/td/site/pcmgr/img/danger.png" style="vertical-align: middle;">&nbsp;危险指数:&nbsp;&nbsp;7.9
										<p>“复活者木马”会隐藏在电脑深处，接受黑客的指令全面掌控你的电脑，即使重装系统也很容易“复活”！</p>
										<a href="http://user.qzone.qq.com/88881688/blog/1312777369" style="float: right;" target="_blank" data-stats="security-system.question1-more">[详细]</a>
									</span>	
								</div>						
								<div class="security-side" style="display: block;">
									<span class="span-left">
										<a href="http://bbs.guanjia.qq.com/forum.php?mod=viewthread&amp;tid=15394" target="_blank"><img src="http://s.pc.qq.com/pc/images/c3/a4/c3a4e032f3fbdb42a4e03ac751cf2c04.jpg" height="120" width="120"></a>	
									</span>
									<span class="security-text">
										<a href="http://bbs.guanjia.qq.com/forum.php?mod=viewthread&amp;tid=15394" target="_blank" data-stats="security-system.question2">如何做好重装系统五件事？</a>
										<p>最让人郁闷的是系统装好后要做的事，找驱动、打补丁、装软件。而QQ电脑管家可以全部帮你搞定！</p>
										<br><a href="http://bbs.guanjia.qq.com/forum.php?mod=viewthread&amp;tid=15394" style="float: right;" target="_blank" data-stats="security-system.question2-more">[详细]</a>
									</span>	
								</div>	
							</div>
							<div class="hack10"></div>
							<div class="block-title">
								<h2>
									<strong>网络安全大事记</strong>
								</h2>
								
							</div> 
							<div class="content">
								<div class="timeline_box">
									<div class="back_line"></div>
									<div class="line_box">
								    	<div class="sc_box">
								    	<ul id="line_list">
								        </ul>
								        <ul id="date_list">
								        	<li style="background: none repeat scroll 0% 0% transparent; width: auto;">(月)</li>
								        </ul>
								        </div>
								    </div>
								    <div class="timeline_msg">
								    	<h3></h3>
								        <div id="weixie"><strong>威胁：</strong><span></span></div>
								        <div id="fangyv"><strong>防御：</strong><span></span></div>
								    </div>
								</div>
							</div>
						</div>
					</div>
					<span class="block-ft"><span></span></span>										
				</div> 
				

				<div class="right">
					
					<span class="block-hd"><span></span></span>
					<div class="block-bd clearfix">
					<div>
						<div class="layout-side-wrap">
							<div class="layout-column" id="mblog-updates">
								<div class="block-title">
									<h2><strong>最新产品</strong></h2>
										<a href="http://t.hhxdz.com/hhxdzpcmgr" target="_blank" class="more" data-stats="mblog-updates.follow">更多</a>
									</div>
									<ul>
									<li class="first clearfix">
										<a href="http://t.hhxdz.com/p/t/38567053816157" target="_blank" class="avatar" data-stats="mblog-updates.0-avatar">
										<img src="<%=path%>/images/32.jpg" alt="远程抄表器" width="50" height="50">
										</a>
										<p class="mblog">
											<a href="" target="_blank" title="远程抄表器" data-stats="mblog-updates.0-nickname">远程抄表器</a>
											利用无线互联网技术，实现远程及时抄表。解决了人工抄表费用高，不及时等问题。
										</p>
										<p class="detail"><a href="http://t.hhxdz.com/p/t/38567053816157" target="_blank" title="查看详细内容" class="detail" data-stats="mblog-updates.0-detail">[详细]</a></p>
									</li>
									<li class="clearfix">
										<a href="http://t.hhxdz.com/p/t/38567053816157" target="_blank" class="avatar" data-stats="mblog-updates.0-avatar">
										<img src="<%=path%>/images/32.jpg" alt="远程抄表器" width="50" height="50">
										</a>
										<p class="mblog">
											<a href="" target="_blank" title="远程抄表器" data-stats="mblog-updates.0-nickname">远程抄表器</a>
											利用无线互联网技术，实现远程及时抄表。解决了人工抄表费用高，不及时等问题。
										</p>
										<p class="detail"><a href="http://t.hhxdz.com/p/t/38567053816157" target="_blank" title="查看详细内容" class="detail" data-stats="mblog-updates.0-detail">[详细]</a></p>
									</li>
									<li class="clearfix">
										<a href="http://t.hhxdz.com/p/t/38567053816157" target="_blank" class="avatar" data-stats="mblog-updates.0-avatar">
										<img src="<%=path%>/images/32.jpg" alt="远程抄表器" width="50" height="50">
										</a>
										<p class="mblog">
											<a href="" target="_blank" title="远程抄表器" data-stats="mblog-updates.0-nickname">远程抄表器</a>
											利用无线互联网技术，实现远程及时抄表。解决了人工抄表费用高，不及时等问题。
										</p>
										<p class="detail"><a href="http://t.hhxdz.com/p/t/38567053816157" target="_blank" title="查看详细内容" class="detail" data-stats="mblog-updates.0-detail">[详细]</a></p>
									</li>									
									</ul>

							</div>
                            <div class="layout-column" id="safety-system">
                                <div class="block-title"><h2><strong>友情链接</strong></h2></div>
                                <ul class="clearfix ui-sortable">
                                    <li class="safety-center">
										<a class="" href="http://aq.hhxdz.com/cn/index" title="海林达电子" target="_blank" data-stats="safety-system.safety-center"><s></s>海林达电子</a>
									</li>
									<li class="safety-channel" style="">
										<a class="" href="http://imsafe.hhxdz.com/" title="华为科技" target="_blank" data-stats="safety-system.safety-channel"><s></s>华为科技</a>
									</li>
                                    <li class="game-safety" style="">
									<a class="" href="http://gamesafe.hhxdz.com/" title="海林达电子" t="" arget="_blank" data-stats="safety-system.game-safety"><s></s>华为科技</a>
									</li>
									<li class="malsite-query" style="">
									<a class="" href="http://gamesafe.hhxdz.com/" title="中信集团" t="" arget="_blank" data-stats="safety-system.game-safety"><s></s>中信集团</a>
									</li>
									<li class="game-safety" style="">
									<a class="" href="http://gamesafe.hhxdz.com/" title="海林达电子" t="" arget="_blank" data-stats="safety-system.game-safety"><s></s>华为科技</a>
									</li>
									<li class="malsite-query" style="">
									<a class="" href="http://gamesafe.hhxdz.com/" title="中信集团" t="" arget="_blank" data-stats="safety-system.game-safety"><s></s>中信集团</a>
									</li>

                                </ul>
                            </div>
							<a href="http://guanjia.hhxdz.com/user/" target="_blank" title="联系">
							<img src="<%=path%>/images/123.jpg" class="" data-stats="pcmgr-system.djjs" width="275">
							</a> 
						</div>
					</div>
					</div>
					<span class="block-ft"><span></span></span>
					
					
				</div>
			</div>
		</div>
		<div id="footer"><p>康定电子公司 版权所有 <br>Copyright © 2010 - 2011 康定DZ. All Rights Reserved.</p></div>


		<script type="text/javascript" src="<%=path%>/js/jquery-1.4.4.min.js"></script>

		<script type="text/javascript" src="<%=path%>/js/global.js"></script>

        <script type="text/javascript" src="http://pc1.gtimg.com/td/site/base/js/jquery.blockUI.js"></script>

		

		<script type="text/javascript" src="<%=path%>/js/index.js"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){
			var arryImgs = ["images/13.jpg","images/02.jpg","images/03.jpg","images/04.jpg","images/05.jpg"];
			$(".clickButton a").attr("href","javascript:return false;"); 
			var times = 1;
			function changeImage(){
				if (times == 6) {
					times = 1;
				}
				$(".clickButton a").removeClass("active");
				$(".clickButton a:nth-child(" + times + ")").addClass("active");
				$(".imgs img").attr("src",arryImgs[times-1]);
				times++;
			}
			var interval = window.setInterval(function(){
				changeImage();
			}, 1500);
			$(".clickButton a").each(function(index){
				$(this).hover(
					function(){
						$(".clickButton a").removeClass("active");
						$(this).addClass("active");
						clearInterval(interval);
						$(".imgs img").attr("src",arryImgs[index]);
						times = index+1;	
					},
					function(){
						interval = window.setInterval(function(){
							changeImage();
						}, 1500);	
					}); 
			});
		})
		</script>
        

	</body>

</html>