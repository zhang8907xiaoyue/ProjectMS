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
	<title>需求表单</title>
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
<input type="text" id="storyid" style="display: none" value="${storyid}">
<%=htmlData%>
	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="newForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="rwtype">
								任务类型</label>
							<div class="col-xs-3">
								<select id="rwtype" class="col-xs-12">
									<option value="1">设计</option>
									<option value="2">前端</option>
									<option value="3" selected="selected">开发</option>
									<option value="4">研究</option>
									<option value="5">事务</option>
									<option value="6">其他</option>
								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="assignto">
								<font style="color:red">*</font>指派给</label>
							<div class="col-xs-3">
								<select id="assignto" class="col-xs-12 chosen-select">

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="estimate">
								<font style="color:red">*</font>预计工时</label>
							<div class="col-xs-3">
								<input id="estimate" type="text" class="col-xs-12">
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="deadline">
								<font style="color:red">*</font>截至时间</label>
							<div class="col-xs-3">
								<input id="deadline" class="col-xs-12 date-picker" type="text"
									   data-date-format="yyyy-mm-dd" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>任务名称</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								任务描述</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
							</div>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form id="newForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="rwtype">
								任务类型</label>
							<div class="col-xs-3">
								<select id="rwtype" class="col-xs-12">
									<option value="1">设计</option>
									<option value="2">前端</option>
									<option value="3" selected="selected">开发</option>
									<option value="4">研究</option>
									<option value="5">事务</option>
									<option value="6">其他</option>
								</select>
								<script type="text/javascript">
                                    $("#rwtype").val('${task.rwtype}');
								</script>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="assignto">
								<font style="color:red">*</font>指派给</label>
							<div class="col-xs-3">
								<select id="assignto" class="col-xs-12 chosen-select">

								</select>
								<input id="input-assignto" type="text" value="${task.assignto}" style="display: none">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="estimate">
								<font style="color:red">*</font>预计工时</label>
							<div class="col-xs-3">
								<input id="estimate" type="text" class="col-xs-12" value="${task.estimate}">
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="deadline">
								<font style="color:red">*</font>截至时间</label>
							<div class="col-xs-3">
								<input id="deadline" class="col-xs-12 date-picker" type="text"
									   data-date-format="yyyy-mm-dd" value="${task.deadline}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>任务名称</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" value="${task.title}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								任务描述</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${task.contenthtml}</textarea>
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${task.id}">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
<input type="text" id="form-type" style="display: none" value="${type}">
<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/ajaxfileupload.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/story/sortingForm.js?v=<%=Constant.VERSION%>"></script>

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