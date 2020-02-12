<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("doman", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>404</title>
    <link href="${doman}/css/errorpage.css" rel="stylesheet"
	type="text/css">
  </head>
<body>
	<div class="msg_tip_body">
	<div class="msg_tip_box">
    <div class="msg_tip_title">

    <em>
       	提示信息：404
    </em>

</div>
	  <div class="alert_error">
	    <p class="msg_tip_content">对不起！您访问的资源不存在。<br/>您可以确认输入的网址是否正确或者点击下面的链接返回！</p>
	<p class="alert_bl"><a href="javascript:history.go(-1)">返回上一页</a> 或 <a href="index.do">返回首页</a></p>
	</div>
	</div>
</div>
</body>
</html>