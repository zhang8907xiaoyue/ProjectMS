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
	<title>bug认定表单</title>
	<jsp:include page="../share/acehead.jsp"></jsp:include>
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/kindeditor/themes/qq/qq.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.js"></script>
	<script>
        var contentEditor="";
        KindEditor.ready(function(K) {
            contentEditor = K.create('#dutycontent', {
                cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
                uploadJson : '<%=request.getContextPath()%>/files/kinEditorUpload.do',
                allowFileManager : true,
                cssData : 'body {font-size:14px;}',
				width:'800px',
				height:'250px'
            });
            prettyPrint();
        });
	</script>
</head>
<body style="padding: 20px">
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">

<%=htmlData%>
	<div class="row">
		<div class="col-xs-12">
			<form id="newForm" class="form-horizontal" role="form">
				<div class="form-group">

					<label class="col-xs-1 control-label no-padding-right" for="duty">
						<font style="color:red">*</font>责任人员</label>
					<div class="col-xs-3">
						<select id="duty" class="col-xs-12 chosen-select">

						</select>
						<input id="input-duty" type="text" value="${bug.duty}" style="display: none">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-1 control-label no-padding-right" for="dutycontent">
						认定描述</label>
					<div class="col-xs-10">
						<textarea id="dutycontent" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${bug.dutycontenthtml}</textarea>
					</div>
				</div>
				<input type="text" id="type" style="display: none" value="${type}">
			</form>
		</div>
	</div>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bug/dutyForm.js?v=<%=Constant.VERSION%>"></script>

</body>
</html>
<%!
	private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}
%>