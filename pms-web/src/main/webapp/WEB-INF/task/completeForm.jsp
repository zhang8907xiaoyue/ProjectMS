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
        var testRemarkEditor="";
        var releaseRemarkEditor="";
        var overdueRemarkEditor="";
        KindEditor.ready(function(K) {
            testRemarkEditor = K.create('#testRemark', {
                cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
                uploadJson : '<%=request.getContextPath()%>/files/kinEditorUpload.do',
                allowFileManager : true,
                cssData : 'body {font-size:14px;}',
                width:'800px',
                height:'250px'
            });
            releaseRemarkEditor = K.create('#releaseRemark', {
                cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
                uploadJson : '<%=request.getContextPath()%>/files/kinEditorUpload.do',
                allowFileManager : true,
                cssData : 'body {font-size:14px;}',
                width:'800px',
                height:'250px'
            });
            overdueRemarkEditor = K.create('#overdueRemark', {
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
	<style type="text/css">
		.img-toolbar{
			position: absolute;
			height:25px;
			width:150px;
			bottom: -25px;
			margin-bottom: 25px;
			background: rgba(0, 0, 0, 0.5);
			background-image: initial;
			background-position-x: initial;
			background-position-y: initial;
			background-size: initial;
			background-repeat-x: initial;
			background-repeat-y: initial;
			background-attachment: initial;
			background-origin: initial;
			background-clip: initial;
			background-color: rgba(0, 0, 0, 0.498039);
			padding: 5px;
		}
		.img-btn{
			width:16px;
			height:16px;
			display: inline-block;
		}
		.img-btn-new{
			background: url(<%=request.getContextPath() %>/images/icons/icon-new.png)
		}
		.img-btn-preview{
			background: url(<%=request.getContextPath() %>/images/icons/icon-eye.png)
		}
		.img-btn-delete{
			background: url(<%=request.getContextPath() %>/images/icons/icon-delete.png)
		}
	</style>
</head>
<body style="padding: 20px">
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">
<input type="text" id="storyid" style="display: none" value="${storyid}">
<input type="text" id="taskid" style="display: none" value="${taskid}">
<%=htmlData%>
	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="newForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="estimate">
								<font style="color:red">*</font>工时</label>
							<div class="col-xs-3">
								<input id="estimate" type="text" class="col-xs-10">
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="img-code">
								<font style="color:red">*</font>代码截图</label>
							<div class="col-xs-7">
								<img id="img-code" alt="" path="" src="<%=request.getContextPath()%>/images/upload.png" style="width:150px;height: 150px;border: #cccccc solid 1px;">
								<div class="img-toolbar">
									<a class="img-btn img-btn-new" link-file="file-code" href="javascript:;" title="上传"></a>
									<a class="img-btn img-btn-preview" link-img="img-code" href="javascript:;" title="预览"></a>
									<a class="img-btn img-btn-delete" link-img="img-code" href="javascript:;" title="删除"></a>
								</div>
								<div style="display: none">
									<input id="file-code" name="file" type="file">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="testRemark">
								<font style="color:red">*</font>测试说明</label>
							<div class="col-xs-10" id="forTestRemark">
								<textarea id="testRemark" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="releaseRemark">
								发布说明</label>
							<div class="col-xs-10">
								<textarea id="releaseRemark" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
								<button id="sql" type="button" class="btn btn-xs btn-primary">
									<i class="icon-file-text-o"></i> 上传发布sql文件
								</button>
								<a id="sql-filename" href="javascript:;" link-url="" download="" style="text-decoration:underline;color:blue"></a>
								<div id="sql-file" style="display: none">
									<input id="file-sql" name="file" type="file">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="overdueRemark">
								超期说明</label>
							<div class="col-xs-10">
								<textarea id="overdueRemark" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
							</div>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form id="eidtForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="estimate">
								<font style="color:red">*</font>工时</label>
							<div class="col-xs-3">
								<input id="estimate" type="text" class="col-xs-10" value="${taskcomplete.estimate}">
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="img-code">
								<font style="color:red">*</font>代码截图</label>
							<div class="col-xs-7">
								<img id="img-code" alt="" path="<%=Constant.FILE_VIEW_URL%>${taskcomplete.codeurl}" src="<%=Constant.FILE_VIEW_URL%>${taskcomplete.codeurl}" style="width:150px;height: 150px;border: #cccccc solid 1px;">
								<div class="img-toolbar">
									<a class="img-btn img-btn-new" link-file="file-code" href="javascript:;" title="上传"></a>
									<a class="img-btn img-btn-preview" link-img="img-code" href="javascript:;" title="预览"></a>
									<a class="img-btn img-btn-delete" link-img="img-code" href="javascript:;" title="删除"></a>
								</div>
								<div style="display: none">
									<input id="file-code" name="file" type="file">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="testRemark">
								<font style="color:red">*</font>测试说明</label>
							<div class="col-xs-10" id="forTestRemark">
								<textarea id="testRemark" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${taskcomplete.testremarkhtml}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="releaseRemark">
								发布说明</label>
							<div class="col-xs-10">
								<textarea id="releaseRemark" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${taskcomplete.releaseremarkhtml}</textarea>
								<button id="sql" type="button" class="btn btn-xs btn-primary">
									<i class="icon-file-text-o"></i> 上传发布sql文件
								</button>
								<a id="sql-filename" href="<%=Constant.FILE_VIEW_URL%>${taskcomplete.sql}" link-url="<%=Constant.FILE_VIEW_URL%>${taskcomplete.sql}" download="${taskcomplete.sqlname}" style="text-decoration:underline;color:blue">${taskcomplete.sqlname}</a>
								<div id="sql-file" style="display: none">
									<input id="file-sql" name="file" type="file">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="overdueRemark">
								超期说明</label>
							<div class="col-xs-10">
								<textarea id="overdueRemark" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${taskcomplete.overdueremarkhtml}</textarea>
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${taskcomplete.id}">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/ajaxfileupload.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/task/completeForm.js?v=<%=Constant.VERSION%>"></script>

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