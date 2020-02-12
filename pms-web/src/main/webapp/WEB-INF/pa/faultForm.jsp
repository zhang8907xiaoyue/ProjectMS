<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jschrj.pojo.task.Task" %>
<%@ page import="com.jschrj.pojo.release.Release" %>
<%@ page import="com.jschrj.pojo.test.Usecase" %>
<%@ page import="com.jschrj.pojo.bug.Bug" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%
		request.setCharacterEncoding("UTF-8");
		String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";

	%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>员工过失表单</title>
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
            contentEditor = K.create('#content', {
                cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
                uploadJson : '<%=request.getContextPath()%>/files/kinEditorUpload.do',
                allowFileManager : true,
                cssData : 'body {font-size:14px;}',//控制默认字体大小
				width:'800px',
				height:'250px'
            });
            prettyPrint();
        });
	</script>
</head>
<body>
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">
<%=htmlData%>
	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="newForm" class="form-horizontal" role="form" style="padding: 20px">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="employee">
								<font style="color:red">*</font>姓名</label>
							<div class="col-xs-3">
								<select id="employee" class="col-xs-12 chosen-select">

								</select>

							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>标题</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								内容</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>

							</div>
						</div>

					</form>
				</c:when>
				<c:when test="${type=='edit'}">
					<form id="eidtForm" class="form-horizontal" role="form" style="padding: 20px">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="employee">
								<font style="color:red">*</font>姓名</label>
							<div class="col-xs-3">
								<select id="employee" class="col-xs-12 chosen-select">

								</select>
								<input id="input-employee" type="text" value="${fault.employeeid}" style="display: none">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>标题</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" value="${fault.title}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								需求描述</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${fault.contenthtml}</textarea>

							</div>
						</div>

						<input type="text" id="form-id" style="display: none" value="${fault.id}">
					</form>
				</c:when>
				<c:otherwise>
					<div class="zxy-title">
						<span class="storyid">${fault.id}</span>
						<strong>${fault.title}</strong>
					</div>
					<div class="zxy-body">
						<div class="col-xs-10">
							<div class="zxy-content">
									${fault.contenthtml}
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
<input type="text" id="form-type" style="display: none" value="${type}">
<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/ajaxfileupload.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/pa/faultForm.js?v=<%=Constant.VERSION%>"></script>

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