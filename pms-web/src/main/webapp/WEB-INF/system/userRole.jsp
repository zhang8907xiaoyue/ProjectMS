<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户角色</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
<style>
.selectBox {
	background: transparent
		url('<%=request.getContextPath()%>/images/switch.png') no-repeat 50%
		50%;
	width: 600px;
	padding: 5px;
}

.selectBox:after {
	content: ".";
	display: block;
	height: 0;
	line-height: 0;
	font-size: 0;
	clear: both;
	min-height: 0;
	visibility: hidden;
}

.selectBox .left {
	padding: 5px;
	border: #C6CED0 solid 1px;
	width: 250px;
	height: 300px;
	overflow: auto;
	float: left;
}

.selectBox .left:hover {
	border-color: rgba(82, 168, 236, 0.8);
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	outline: 0;
	outline: thin dotted \9;
}

.selectBox .right {
	padding: 5px;
	border: #C6CED0 solid 1px;
	width: 250px;
	height: 300px;
	overflow: auto;
	float: right;
}

.selectBox .right:hover {
	border-color: rgba(82, 168, 236, 0.8);
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px
		rgba(82, 168, 236, 0.6);
	outline: 0;
	outline: thin dotted \9;
}

.selectBox ul {
	margin: 0px;
	padding: 0px;
}

.selectBox li {
	border-bottom: 1px #eee solid;
    padding: 2px 10px;
    color: #555;
    font-size: 14px;
    cursor: pointer;
}
.selectBox .right li{
    cursor:pointer;
}

.selectBox li:hover {
	background: #4C91D4;
	color: #fff;
}
</style>
</head>
<body>
	<div class="selectBox">
		<div class="left">
			<ul id="roleList" name="roleList"></ul>
		</div>
		<div class="right">
			<ul id="roleSelected" name="roleSelected"></ul>
		</div>
	</div>
	<input type="text" id="userid" value="${userid}" style="display: none">
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/system/userRole.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>