<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<title>项目管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript">
    if (top.location != self.location) {
        top.location = self.location;
    } 
</script>
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/js/jquery.cookie.js"></script>
</head>
<body class="whitebg">
	<div class="login">
		<div class="log_tit">
			<div class="log_t_l fl">
				<h1><a href="javascript:;"><img src="<%=request.getContextPath() %>/images/login_logo.png" width="310" height="78"></a></h1>
			</div>
			<div class="log_t_r ri">

			</div>
		</div>
	</div>
	<div class="log_com">
		<div class="log_c_l fl">

		</div>
		<div class="log_c_r ri">
			<div class="log_cr_con">
				<h1>登录</h1>
				<form id="loginform">
					<ul>


						<li style="display: none;"><span class="log_cr_warn" ></span></li>

						<li class="mt10"><b>用户名：</b></li>
						<li>
							<input type="text" id="123"  tabindex="1" class="log_inp input" name="loginName" >
						</li>
						<li><b class="">密码：</b></li>
						<li>
							<div>
										<span id="changePass">
											<input type="password" id="345" tabindex="2" class="log_inp input fl" name="passWord">
										</span>
							</div>
						</li>
						<li><b>验证码</b></li>
						<li>
							<input type="text" class="log_inpa" id="random" tabindex="3" size="4" maxlength="4" name="random">
							<img id="authCode" width="100" height="35" style="cursor:pointer;" src="" alt="点击刷新" title="点击刷新"/></li>
						<li class="mt10"><a class="log_cr_but"  id="btn_login">登&nbsp;录</a></li>
					</ul>

				</form>
			</div>
		</div>
		<div class="cl"></div>
	</div>

	<%--项目根路径：用于Js请求路径拼接 --%>
	<input type="text" name="projectName" id="projectName" value="<%=request.getContextPath()%>" style="display: none"/>
	<!-- END WRAPPER -->
	<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/common.js?v=<%=Constant.VERSION%>"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/account/login.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>