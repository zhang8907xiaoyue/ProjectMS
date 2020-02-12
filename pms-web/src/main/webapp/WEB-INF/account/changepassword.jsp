<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
<jsp:include page="../share/acefoot.jsp"></jsp:include>
</head>
<body style="padding: 20px">
	<div class="row">
		<div class="col-xs-12">
			<form id="passwordForm" class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-xs-3 control-label no-padding-right" for="oldpassword">
						<font style="color:red">*</font>旧密码</label>
					<div class="col-xs-8">
						<input type="text" id="oldpassword" class="col-xs-10 col-xs-12" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label no-padding-right" for="newpassword">
						<font style="color:red">*</font>新密码</label>
					<div class="col-xs-8">
						<input type="text" id="newpassword" class="col-xs-10 col-xs-12" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-3 control-label no-padding-right" for="confirmpassword">
						<font style="color:red">*</font>确认密码</label>
					<div class="col-xs-8">
						<input type="text" id="confirmpassword" class="col-xs-10 col-xs-12" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/account/changepassword.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>