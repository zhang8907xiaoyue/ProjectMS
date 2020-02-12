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
        var targetEditor="";
        KindEditor.ready(function(K) {
            contentEditor = K.create('#content', {
                cssPath : '<%=request.getContextPath()%>/kindeditor/plugins/code/prettify.css',
                uploadJson : '<%=request.getContextPath()%>/files/kinEditorUpload.do',
                allowFileManager : true,
                cssData : 'body {font-size:14px;}',//控制默认字体大小
				width:'800px',
				height:'250px'
            });
            targetEditor = K.create('#target', {
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
<body>
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">
<%=htmlData%>
	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="newForm" class="form-horizontal" role="form" style="padding: 20px">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="project">
								<font style="color:red">*</font>项目</label>
							<div class="col-xs-3">
								<select id="project" class="col-xs-10">

								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="source">
								<font style="color:red">*</font>来源</label>
							<div class="col-xs-3">
								<select id="source" class="col-xs-10">

								</select>
							</div>
						</div>
						<div class="form-group" id="form-content">
							<label class="col-xs-1 control-label no-padding-right" for="modular">
								<font style="color:red">*</font>模块</label>
							<div class="col-xs-3">
								<select id="modular" class="col-xs-10">

								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="deadline">
								截至时间</label>
							<div class="col-xs-3">
								<input id="deadline" class="col-xs-10 date-picker" type="text"
									   data-date-format="yyyy-mm-dd" />
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="pri">
								优先级</label>
							<div class="col-xs-3">
								<select id="pri" class="col-xs-10">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
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
								需求描述</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
								<button id="btn-file" type="button" class="btn btn-xs btn-primary">
									<i class="icon-file-text-o"></i> 上传需求附件
								</button>
								<a id="a-file" href="javascript:;" link-url="" download="" style="text-decoration:underline;color:blue"></a>
								<div id="div-file" style="display: none">
									<input id="input-file" name="file" type="file">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								验收标准</label>
							<div class="col-xs-10">
								<textarea id="target" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
							</div>
						</div>
					</form>
				</c:when>
				<c:when test="${type=='edit'}">
					<form id="eidtForm" class="form-horizontal" role="form" style="padding: 20px">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="project">
								<font style="color:red">*</font>项目</label>
							<div class="col-xs-3">
								<input type="text" id="project" class="col-xs-10" readonly="readonly" linked="${story.project}" value="${story.projectname}">

							</div>
							<label class="col-xs-1 control-label no-padding-right" for="source">
								<font style="color:red">*</font>来源</label>
							<div class="col-xs-3">
								<input type="text" class="col-xs-10" readonly="readonly" value="${story.sourcename}">
							</div>
						</div>
						<div class="form-group" id="form-content">
							<label class="col-xs-1 control-label no-padding-right" for="modular">
								<font style="color:red">*</font>模块</label>
							<div class="col-xs-3">
								<input type="text" class="col-xs-10" readonly="readonly" value="${story.modularname}">
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="deadline">
								截至时间</label>
							<div class="col-xs-3">
								<input id="deadline" class="col-xs-10 date-picker" type="text"
									   data-date-format="yyyy-mm-dd" value="${story.deadline}"/>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="pri">
								优先级</label>
							<div class="col-xs-3">
								<select id="pri" class="col-xs-10">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
								<script type="text/javascript">
                                    $("#pri").val('${story.pri}');
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>标题</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" value="${story.title}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								需求描述</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${story.contenthtml}</textarea>
								<button id="btn-file" type="button" class="btn btn-xs btn-primary">
									<i class="icon-file-text-o"></i> 上传需求附件
								</button>
								<a id="a-file" href="${story.fileurl}" link-url="${story.fileurl}" download="${story.filename}" style="text-decoration:underline;color:blue">${story.filename}</a>
								<div id="div-file" style="display: none">
									<input id="input-file" name="file" type="file">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								验收标准</label>
							<div class="col-xs-10">
								<textarea id="target" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${story.targethtml}</textarea>
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${story.id}">
					</form>
				</c:when>
				<c:otherwise>
					<div class="zxy-title">
						<span class="storyid">${story.id}</span>
						<strong>${story.title}</strong>
					</div>
					<div class="zxy-body">
						<div class="col-xs-9">
							<fieldset>
								<legend>需求更新</legend>
								<div class="zxy-content">
										<%
											List<Release> releaseList=(List<Release>)request.getAttribute("releaseList");
											for(int i=0;i<releaseList.size();i++){
											    %><%=releaseList.get(i).getCustomername()%>&nbsp;<%
											}
										%>

								</div>
							</fieldset>
							<fieldset>
								<legend>需求描述</legend>
								<div class="zxy-content">
										${story.contenthtml}
								</div>
							</fieldset>
							<fieldset>
								<legend>附件</legend>
								<div class="zxy-content">

									<a id="a-file" href="<%=Constant.FILE_VIEW_URL%>${story.fileurl}" link-url="${story.fileurl}" download="${story.filename}" style="text-decoration:underline;color:blue">${story.filename}</a>
								</div>
							</fieldset>
							<fieldset>
								<legend>验收标准</legend>
								<div class="zxy-content">
										${story.targethtml}
								</div>
							</fieldset>
							<fieldset>
								<legend>任务指派</legend>
								<div class="zxy-content">
									<table id="tb-tasklist">
										<thead>
											<th>任务Id</th>
											<th>状态</th>
											<th>标题</th>
											<th>指派至</th>
										</thead>
										<tbody>
											<%
												List<Task> taskList=(List)request.getAttribute("taskList");
												for (int i=0;i<taskList.size();i++){
													%><tr>
														<td><%=taskList.get(i).getId()%></td>
														<td><%
															if(taskList.get(i).getStatus()==1){
														    	%>开发中<%
															}else if(taskList.get(i).getStatus()==2){
																%>已完成<%
															}else if(taskList.get(i).getStatus()==3){
																%>暂停<%
															}
															%>
														</td>
														<td>
															<a href="javascript:;" class="taskinfo" a-link="<%=taskList.get(i).getId()%>">
																<%=taskList.get(i).getTitle()%>
															</a>
														</td>
														<td><%=taskList.get(i).getAssigntoname()%></td>
														</tr>
													<%
												}
											%>
										</tbody>
									</table>

								</div>
							</fieldset>
							<fieldset>
								<legend>测试用例</legend>
								<div class="zxy-content">
									<table id="tb-usecaselist">
										<thead>
											<th>用例Id</th>
											<th>用例类型</th>
											<th>标题</th>
											<th>创建时间</th>
											<th>创建人</th>
										</thead>
										<tbody>
										<%
											List<Usecase> usecaseList=(List)request.getAttribute("usecaseList");
											for (int i=0;i<usecaseList.size();i++){
												%><tr>
													<td><%=usecaseList.get(i).getId()%></td>
													<td>
														<%
															if(usecaseList.get(i).getType()==1){
															    %>功能测试<%
															}else if(usecaseList.get(i).getType()==2){
																%>性能测试<%
															}else if(usecaseList.get(i).getType()==3){
																%>配置相关<%
															}else if(usecaseList.get(i).getType()==4){
																%>安装部署<%
															}else if(usecaseList.get(i).getType()==5){
																%>安全相关<%
															}else if(usecaseList.get(i).getType()==6){
																%>接口测试<%
															}else if(usecaseList.get(i).getType()==9){
																%>其他<%
															}
														%>
													</td>
													<td width="30%">
														<a href="javascript:;" class="usecaseinfo" a-link="<%=usecaseList.get(i).getId()%>">
															<%=usecaseList.get(i).getTitle()%>
														</a>
													</td>
													<td width="180px"><%=usecaseList.get(i).getCreatetime()%></td>
													<td><%=usecaseList.get(i).getUsername()%></td>
												</tr>
												<%
											}
										%>
										</tbody>
									</table>
								</div>
							</fieldset>
							<fieldset>
								<legend>关联bug</legend>
								<div class="zxy-content">
									<table id="tb-buglist">
										<thead>
										<th>任务id</th>
										<th>状态</th>
										<th>标题</th>
										<th>指派至</th>
										<th>创建时间</th>
										<th>创建人</th>
										</thead>
										<tbody>
										<%
											List<Bug> bugList=(List)request.getAttribute("bugList");
											for (int i=0;i<bugList.size();i++){
												%><tr>
													<td><%=bugList.get(i).getTaskid()%></td>
													<td>
														<%
															if(bugList.get(i).getStatus()==1){
																%>待解决<%
															}else if(bugList.get(i).getStatus()==2){
																%>待审核<%
															}else if(bugList.get(i).getStatus()==3){
																%>待发布<%
															}else if(bugList.get(i).getStatus()==4){
																%>完成<%
															}
														%>
													</td>
													<td>
														<a href="javascript:;" class="buginfo" a-link="<%=bugList.get(i).getId()%>">
															<%=bugList.get(i).getTitle()%>
														</a>
													</td>
													<td><%=bugList.get(i).getAssigntoname()%></td>
													<td width="180px"><%=bugList.get(i).getCreatetime()%></td>
													<td><%=bugList.get(i).getUsername()%></td>
												</tr>
												<%
													}
												%>
										</tbody>
									</table>
								</div>
							</fieldset>
						</div>
						<div class="col-xs-3">
							<fieldset>
								<legend>基本信息</legend>
								<div class="zxy-content">
									<table>
										<table>
											<tr>
												<td class="tb-name">项目</td>
												<td class="tb-value">${story.projectname}</td>
											</tr>
											<tr>
												<td class="tb-name">来源</td>
												<td class="tb-value">${story.sourcename}</td>
											</tr>
											<tr>
												<td class="tb-name">模块</td>
												<td class="tb-value">${story.modularname}</td>
											</tr>
											<tr>
												<td class="tb-name">状态</td>
												<td class="tb-value tb-status">
														<c:if test="${story.status=='1'}">
															待分拣
														</c:if>
														<c:if test="${story.status=='2'}">
															待开发
														</c:if>
														<c:if test="${story.status=='3'}">
															待测试
														</c:if>
														<c:if test="${story.status=='4'}">
															待发布
														</c:if>
														<c:if test="${story.status=='5'}">
															已完成
														</c:if>
											</tr>
											<tr>
												<td class="tb-name">优先级</td>
												<td class="tb-value">${story.pri}</td>
											</tr>
											<tr>
												<td class="tb-name">创建时间</td>
												<td class="tb-value">${story.openeddate}</td>
											</tr>
											<tr>
												<td class="tb-name">截至时间</td>
												<td class="tb-value" style="color:red">${story.deadline}</td>
											</tr>

										</table>

									</table>
								</div>
							</fieldset>
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
		src="<%=request.getContextPath()%>/js/story/storyForm.js?v=<%=Constant.VERSION%>"></script>

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