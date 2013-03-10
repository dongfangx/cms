<%@ page language="java" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
	</head>


	<body >
			<div style="float: left;font-size:26px; margin-top: 10px; margin-left: 20px; width: 700px;">
				<strong>LYSoft CMS</strong>
			</div>
			<div  style="float: left; margin-top: 40px; margin-left: 20px; width: 700px;">
				<img src="<%=path %>/img/1.gif" alt="bg" style="float: left" />
				<div style="float: left; margin-top: 10px; margin-left: 20px;">
					<strong> 安全的服务器内容保障 </strong>
					<br />
					<br />
					基于计算机图形图像技术，为服务器提供安全的流媒体，文字等内容保障。
				</div>
			</div>
			<div style="float: left; margin-top: 40px; margin-left: 20px;width: 700px;">
				<img src="<%=path %>/img/2.gif" alt="bg" style="float: left" />
				<div style="float: left; margin-top: 10px; margin-left: 20px;">
					<strong>多种产品形态，满足你的需求</strong>
					<br />
					<br />
					提供服务版，单机版，链路版等多个版本，满足客户需求
				</div>

			</div>
			<div style="float: left; margin-top: 40px; margin-left: 20px;width: 700px;">
				<img src="<%=path %>/img/3.gif" alt="bg" style="float: left" />
				<div style="float: left; margin-top: 10px; margin-left: 20px;">
					<strong>中心节点统一管理</strong>
					<br />
					<br />
					采取客户端分析监控，中心节点统一管理
				</div>
			</div>
	</body>

</html>
