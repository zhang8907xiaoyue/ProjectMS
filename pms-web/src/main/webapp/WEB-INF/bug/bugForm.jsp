<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jschrj.pojo.test.Usecasestep" %>
<%@ page import="com.jschrj.pojo.test.Usecase" %>
<%@ page import="com.jschrj.pojo.task.Task" %>
<%@ page import="com.jschrj.pojo.release.Release" %>
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
<body>
<%=htmlData%>
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">

	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<input type="text" id="project" style="display: none" value="${project}">
					<form id="newForm" class="form-horizontal" role="form" style="padding: 2px">
						<div class="zxy-title">
							<strong>${usecase.title}</strong>
						</div>
						<div class="zxy-body">
							<div class="col-xs-12">
								<div class="form-group" style="padding-top: 5px;">
									<label class="col-xs-1 control-label no-padding-right" for="type">
										bug类型</label>
									<div class="col-xs-3">
										<select id="type" class="col-xs-10">
											<option value="1" selected="selected">代码错误</option>
											<option value="2">界面优化</option>
											<option value="3">设计缺陷</option>
											<option value="4">配置相关</option>
											<option value="5">安装部署</option>
											<option value="6">安全相关</option>
											<option value="7">性能问题</option>
											<option value="8">标准规范</option>
											<option value="9">测试脚本</option>
											<option value="10">其他</option>
										</select>
									</div>
									<label class="col-xs-1 control-label no-padding-right" for="severity">
										严重程度</label>
									<div class="col-xs-3">
										<select id="severity" class="col-xs-10">
											<option value="1" selected="selected">1</option>
											<option value="2">2</option>
											<option value="3" selected="selected">3</option>
											<option value="4">4</option>
										</select>
									</div>
									<label class="col-xs-1 control-label no-padding-right" for="assignto">
										<font style="color:red">*</font>指派至</label>
									<div class="col-xs-3" id="tip-assignto">
										<select id="assignto" class="col-xs-10">

										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-1 control-label no-padding-right" for="title">
										<font style="color:red">*</font>bug标题</label>
									<div class="col-xs-5">
										<input type="text" id="title" class="col-xs-12" />
									</div>
									<label class="col-xs-1 control-label no-padding-right" for="taskid">
										<font style="color:red">*</font>相关任务</label>
									<div class="col-xs-5" id="tip-taskid">
										<select id="taskid" class="col-xs-10">

										</select>
									</div>
								</div>
								<fieldset>
									<legend>步骤</legend>
									<div class="zxy-content">
										<table id="step">
											<thead>
											<th style="width:4%"></th>
											<th style="width:8%">编号</th>
											<th style="width: 36%">步骤</th>
											<th style="width: 36%">预期</th>
											</thead>
											<tbody>
											<%
												List<Usecasestep> usecasestepList=(List)request.getAttribute("usecasestepList");
												for (int i=0;i<usecasestepList.size();i++){
											%>
											<tr class="step-row">
												<td><input type="checkbox" name="usecasestep" id="<%=usecasestepList.get(i).getId()%>"></td>
												<td class="xh"><%=usecasestepList.get(i).getXh()%></td>
												<td class="step"><%=usecasestepList.get(i).getStep()%></td>
												<td class="expect"><%=usecasestepList.get(i).getExpect()%></td>
											</tr>
											<%
												}
											%>
											</tbody>
										</table>
									</div>
								</fieldset>
								<fieldset>
									<legend>实际情况</legend>
									<div class="zxy-content" >
										<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
									</div>
								</fieldset>
							</div>
						</div>
					</form>
				</c:when>
				<c:when test="${type=='newBug'}">
					<form id="newForm" class="form-horizontal" role="form" style="padding: 2px">
						<div class="form-group" style="padding-top: 5px;" id="form-content">
							<label class="col-xs-1 control-label no-padding-right" for="project">
								<font style="color:red">*</font>项目</label>
							<div class="col-xs-2" id="tip-project">
								<select id="project" class="col-xs-10">

								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="type">
								bug类型</label>
							<div class="col-xs-2">
								<select id="type" class="col-xs-10">
									<option value="1" selected="selected">代码错误</option>
									<option value="2">界面优化</option>
									<option value="3">设计缺陷</option>
									<option value="4">配置相关</option>
									<option value="5">安装部署</option>
									<option value="6">安全相关</option>
									<option value="7">性能问题</option>
									<option value="8">标准规范</option>
									<option value="9">测试脚本</option>
									<option value="10">其他</option>
								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="severity">
								严重程度</label>
							<div class="col-xs-2">
								<select id="severity" class="col-xs-10">
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
									<option value="3" selected="selected">3</option>
									<option value="4">4</option>
								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="assignto">
								<font style="color:red">*</font>指派至</label>
							<div class="col-xs-2" id="tip-assignto">
								<select id="assignto" class="col-xs-10">

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>bug标题</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="step">
								步骤</label>
							<div class="col-xs-10">
								<textarea id="step" class="col-xs-10" cols="100" rows="5" ></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="expect">
								期望</label>
							<div class="col-xs-10">
								<textarea id="expect" class="col-xs-10" cols="100" rows="5" ></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								实际情况</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
							</div>
						</div>
					</form>
				</c:when>
				<c:when test="${type=='edit'}">
					<form id="eidtForm" class="form-horizontal" role="form" style="padding: 20px">
						<div class="form-group" style="padding-top: 5px;" id="form-content">
							<label class="col-xs-1 control-label no-padding-right" for="project">
								<font style="color:red">*</font>项目</label>
							<div class="col-xs-2">
								<input type="text" id="project" class="col-xs-10" linked="${bug.project}" value="${bug.projectname}" readonly="readonly">
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="type">
								bug类型</label>
							<div class="col-xs-2">
								<select id="type" class="col-xs-10">
									<option value="1" selected="selected">代码错误</option>
									<option value="2">界面优化</option>
									<option value="3">设计缺陷</option>
									<option value="4">配置相关</option>
									<option value="5">安装部署</option>
									<option value="6">安全相关</option>
									<option value="7">性能问题</option>
									<option value="8">标准规范</option>
									<option value="9">测试脚本</option>
									<option value="10">其他</option>
								</select>
								<script type="text/javascript">
                                    $("#type").val('${bug.type}');
								</script>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="severity">
								严重程度</label>
							<div class="col-xs-2">
								<select id="severity" class="col-xs-10">
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
									<option value="3" selected="selected">3</option>
									<option value="4">4</option>
								</select>
								<script type="text/javascript">
                                    $("#severity").val('${bug.severity}');
								</script>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="assignto">
								<font style="color:red">*</font>指派至</label>
							<div class="col-xs-2" id="tip-assignto">
								<select id="assignto" class="col-xs-10">

								</select>
								<input id="input-assignto" type="text" value="${bug.assignto}" style="display: none">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>bug标题</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" value="${bug.title}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="step">
								步骤</label>
							<div class="col-xs-10">
								<textarea id="step" class="col-xs-10" cols="100" rows="5" > ${bug.step}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="expect">
								期望</label>
							<div class="col-xs-10">
								<textarea id="expect" class="col-xs-10" cols="100" rows="5" >${bug.expect}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="content">
								实际情况</label>
							<div class="col-xs-10">
								<textarea id="content" name="textarea" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${bug.contenthtml}</textarea>
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${bug.id}">
					</form>
				</c:when>
				<c:otherwise>
					<div class="zxy-title">
						<span class="storyid">${bug.id}</span>
						<strong>${bug.title}</strong>
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
								<legend>步骤</legend>
								<div class="zxy-content">
									${bug.step}
								</div>
							</fieldset>
							<fieldset>
								<legend>期望</legend>
								<div class="zxy-content">
										${bug.expect}
								</div>
							</fieldset>
							<fieldset>
								<legend>实际情况</legend>
								<div class="zxy-content">
										${bug.contenthtml}
								</div>
							</fieldset>
							<c:if test="${bug.result=='1'}">
								<fieldset>
									<legend>处理结果</legend>
									<div class="zxy-content">
										设计如此
									</div>
								</fieldset>
							</c:if>
							<c:if test="${bug.result=='2'}">
								<fieldset>
									<legend>处理结果</legend>
									<div class="zxy-content">
										无法重现
									</div>
								</fieldset>
							</c:if>
							<c:if test="${bug.result=='3'}">
								<fieldset>
									<legend>发布说明</legend>
									<div class="zxy-content">
											${bug.releaseremarkhtml}
									</div>
								</fieldset>
								<fieldset>
									<legend>发布sql文件</legend>
									<div class="zxy-content">
										<a href="<%=Constant.FILE_VIEW_URL%>${bug.sql}" link-url="<%=Constant.FILE_VIEW_URL%>${bug.sql}" download="${bug.sqlname}" style="text-decoration:underline;color:blue">${bug.sqlname}</a>
									</div>
								</fieldset>
							</c:if>

						</div>
						<div class="col-xs-3">
							<fieldset>
								<legend>基本信息</legend>
								<div class="zxy-content">
									<table>
										<tr>
											<td class="tb-name">需求id</td>
											<td class="tb-value">
													${bug.storyid}
											</td>
										</tr>
										<tr>
											<td class="tb-name">bug类型</td>
											<td class="tb-value">
												<c:if test="${bug.type=='1'}">
													代码错误
												</c:if>
												<c:if test="${bug.type=='2'}">
													界面优化
												</c:if>
												<c:if test="${bug.type=='3'}">
													设计缺陷
												</c:if>
												<c:if test="${bug.type=='4'}">
													配置相关
												</c:if>
												<c:if test="${bug.type=='5'}">
													安装部署
												</c:if>
												<c:if test="${bug.type=='6'}">
													安全相关
												</c:if>
												<c:if test="${bug.type=='7'}">
													性能问题
												</c:if>
												<c:if test="${bug.type=='8'}">
													标准规范
												</c:if>
												<c:if test="${bug.type=='9'}">
													测试脚本
												</c:if>
												<c:if test="${bug.type=='10'}">
													其他
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="tb-name">状态</td>
											<td class="tb-value">
												<c:if test="${bug.status=='1'}">
													待解决
												</c:if>
												<c:if test="${bug.status=='2'}">
													待审核
												</c:if>
												<c:if test="${bug.status=='3'}">
													待发布
												</c:if>
												<c:if test="${bug.status=='4'}">
													已完成
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="tb-name">严重程度</td>
											<td class="tb-value">
												${bug.severity}
											</td>
										</tr>
										<tr>
											<td class="tb-name">创建人</td>
											<td class="tb-value">
												${bug.username}
											</td>
										</tr>
										<tr>
											<td class="tb-name">指派至</td>
											<td class="tb-value">
													${bug.assigntoname}
											</td>
										</tr>
										<tr>
											<td class="tb-name">责任人</td>
											<td class="tb-value">
													${bug.dutyname}
											</td>
										</tr>
										<tr>
											<td class="tb-name">由谁完成</td>
											<td class="tb-value">
													${bug.finishedbyname}
											</td>
										</tr>
										<tr>
											<td class="tb-name">创建时间</td>
											<td class="tb-value">
													${bug.createtime}
											</td>
										</tr>
										<tr>
											<td class="tb-name">完成时间</td>
											<td class="tb-value">
													${bug.finishedtime}
											</td>
										</tr>
									</table>
								</div>
							</fieldset>
							<fieldset>
								<legend>关联任务</legend>
								<div class="zxy-content">
									<%
										if(request.getAttribute("task")!=null){
											Task task=(Task)request.getAttribute("task");
										    %>
												<a href="javascript:;" class="taskinfo" a-link="<%=task.getId()%>">
													<%=task.getTitle()%>
												</a>
											<%
										}
									%>
								</div>
							</fieldset>
						</div>
					</div>
				</c:otherwise>
 			</c:choose>
		</div>
	</div>
<input type="text" id="form-type" style="display: none" value="${type}">
<input type="text" id="storyid" style="display: none" value="${storyid}">
<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/ajaxfileupload.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bug/bugForm.js?v=<%=Constant.VERSION%>"></script>

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