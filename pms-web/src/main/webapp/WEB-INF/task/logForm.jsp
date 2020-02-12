<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%
		request.setCharacterEncoding("UTF-8");
		String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";

	%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>任务日志表单</title>
	<jsp:include page="../share/acehead.jsp"></jsp:include>
	<jsp:include page="../share/acefoot.jsp"></jsp:include>

</head>
<body style="padding: 20px">
<input type="text" id="storyid" style="display: none" value="${storyid}">
<input type="text" id="taskid" style="display: none" value="${taskid}">
	<div class="row">
		<div class="col-xs-12">
			<form id="newForm" class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-xs-1 control-label no-padding-right" for="content">
						<font style="color:red">*</font>内容</label>
					<div class="col-xs-10" id="textPosition">
						<textarea id="content" rows="10" cols="20" class="form-control" style="width:100%"></textarea>
					</div>

				</div>

			</form>
		</div>
	</div>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/task/logForm.js?v=<%=Constant.VERSION%>"></script>

</body>
</html>