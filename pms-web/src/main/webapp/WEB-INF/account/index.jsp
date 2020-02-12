<%@page import="java.util.List"%>
<%@page import="com.jschrj.pojo.system.Application"%>
<%@page import="com.jschrj.pojo.system.User"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目管理系统</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/tpez/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/tpez/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/tpez/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/tpez/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/tpez/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/tpez/css/demo.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/layui/css/layui.css">
<style type="text/css">
.navbar-default .brand{
	padding: 0px;
	margin-right: 25px;
}
.navbar-btn{
	padding: 6px 0;
}
.navbar-nav .icon-menu{
	padding-top: 18px;
    padding-bottom: 18px;
}
.navbar-nav > li > a{
	padding: 18px 20px;
}
#wrapper .sidebar{
	width: 200px;
}
.sidebar .nav > li > a {
    padding: 18px 30px;
    color: #AEB7C2;
}
.sidebar .nav > li > a:focus, .sidebar .nav > li > a.active {
    background-color: #2b333e!important;
}
.sidebar .nav span{
	font-weight: bolder;
}
#wrapper #sidebar-nav, #wrapper .main{
	padding-top: 58px;
}
#wrapper .main{
	width: calc(100% - 200px);
}
.main-content{
	padding:2px;
}
.sidebar .nav > li > a.active{
	background-color: #828488!important;
}
.navbar-default .navbar-nav>li>a{
	color:#fff!important;
}
</style>
</head>
<body>
<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav id="navbar" class="navbar navbar-default navbar-fixed-top" style="height: 58px">
			<div class="brand">
				<a href="javascript:;"><img src="<%=request.getContextPath() %>/images/logo.png" class="img-responsive logo" style="height:50px;padding-top: 5px;"></a>
			</div>
			<div class="container-fluid">

				<div id="navbar-menu">
					<ul class="nav navbar-nav" id="menu-root">
						<style>
							#menu-root li span{
								left: 5px;
							}
							#menu-root li a.active,#menu-root li a:hover{
								text-decoration: none;
								background-color: rgba(0,0,0,.1);
							}
						</style>
						<li class="btn-menu hidden-xs hidden-sm">
							<a href="javascript:;" link-id="-1" class="active"><i class="fa fa-television"></i><span>工作平台</span></a>
						</li>
						<li class="btn-menu hidden-xs hidden-sm">
							<a href="javascript:;" link-id="-3"><i class="fa fa-gavel"></i><span>绩效考核</span></a>
						</li>
						<li class="btn-menu hidden-xs hidden-sm">
							<a href="javascript:;" link-id="-2"><i class="fa fa-file-excel-o"></i><span>统计报表</span></a>
						</li>
						<li class="btn-menu hidden-xs hidden-sm">
							<a href="javascript:;" link-id="-4"><i class="fa fa-database"></i><span>基础资料</span></a>
						</li>
						<li class="btn-menu hidden-xs hidden-sm">
							<a href="javascript:;" link-id="-5"><i class="fa fa-gears"></i><span>系统设定</span></a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=request.getContextPath() %>/tpez/img/user.png" class="img-circle" alt="Avatar"> <span>${realname}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a id="changepassword" href="javascript:;"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
								<li><a href="<%=request.getContextPath() %>/account/logOut.do"><i class="lnr lnr-exit"></i> <span>登出</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul id="left-menu" class="nav">
						
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="layui-tab layui-tab-card" lay-allowClose="true" lay-filter="main-tab">
				  <ul class="layui-tab-title">
				  </ul>
				  <div class="layui-tab-content">
				    
				  </div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
	</div>
	<ul id="menu"
		class="user-menu dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
		<li><a id="tab-refresh" href="javascript:;"> <i class="icon-refresh"></i> 刷新 </a></li>
		<li><a id="tab-closeself" href="javascript:;"> <i class="icon-close"></i> 关闭 </a></li>
		<li><a id="tab-closeall" href="javascript:;"> <i class="icon-list"></i> 关闭所有 </a></li>
		<li><a id="tab-closeother" href="javascript:;"> <i class="icon-files-o"></i> 关闭其他 </a></li>
	</ul>
	<%--项目根路径：用于Js请求路径拼接 --%>
	<input type="text" name="projectName" id="projectName" value="<%=request.getContextPath()%>" style="display: none"/>
	<!-- Javascript -->
	<script src="<%=request.getContextPath() %>/tpez/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/tpez/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/tpez/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="<%=request.getContextPath() %>/tpez/scripts/klorofil-common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<!-- 动态监听，如die() -->
	<script type="text/javascript"
		src="<%=request.getContextPath() %>/ace/js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/account/index.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>