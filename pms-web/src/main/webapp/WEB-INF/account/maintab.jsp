<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过往</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/layui/css/layui.css">
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/ace/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.validate.min.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/common.js"></script>
</head>
<body>
<div class="layui-tab layui-tab-card" lay-allowClose="true" lay-filter="main-tab">
  <ul class="layui-tab-title">
  </ul>
  <div class="layui-tab-content">
    
  </div>
</div>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/account/maintab.js"></script>
</body>
</html>
