<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<%--<link rel="stylesheet" type="text/css" href="/css/style.css" />
		--%>
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/xtree.css" />
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/jquery-easyui-1.2/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/jquery-easyui-1.2/themes/icon.css">
		
		<link rel="stylesheet" href="<%=path %>/editor/themes/default/default.css" />
		

		<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=path %>/jquery-easyui-1.2/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=path %>/jquery-easyui-1.2/easyloader.js"></script>
		
		<script type="text/javascript" src="<%=path %>/js/curd.js"></script>
		
		<script type="text/javascript" src="<%=path %>/js/xtree/xtree.js"></script>
		<script type="text/javascript" src="<%=path %>/js/xtree/map.js"></script>
		<script type="text/javascript" src="<%=path %>/js/xtree/checkboxTreeItem.js"></script>
		<script type="text/javascript" src="<%=path %>/js/xtree/radioTreeItem.js"></script>
		
		
		<script type="text/javascript" src="<%=path %>/js/datepicker/WdatePicker.js"></script>
		<!-- 
		<script type="text/javascript" src="<%=path %>/lhgdialog/lhgcore.min.js"></script>
		<script type="text/javascript" src="<%=path %>/lhgdialog/lhgdialog.js"></script>
		 -->
		
		
		<script charset="utf-8" src="<%=path %>/editor/kindeditor.js"></script>
		<script charset="utf-8" src="<%=path %>/editor/lang/zh_CN.js"></script>
		
		<script type="text/javascript">
			//set xtree img url 
			webFXTreeConfig.setImagePath("<%=path %>/img/xtree/");
		</script>
	</head>