<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jschrj.pojo.base.Extend" %>
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
                cssData : 'body {font-size:14px;}',
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
	<style type="text/css">
		#historyItem{
			margin-top: 0px!important;
			margin-bottom: 0px!important;
			line-height: 20px;
			display: block;
			list-style-type: decimal;
			margin-block-start: 1em;
			margin-block-end: 1em;
			margin-inline-start: 0px;
			margin-inline-end: 0px;
			padding-inline-start: 10px;
		}
		#historyItem li{
			display: list-item;
			text-align: -webkit-match-parent;
		}
		#historyItem li span strong{
			font-weight: 700;
		}
		#historyItem .history{
			background: #f5f5f5;
			padding: 4px 10px 6px;
			min-height: 20px;
			border: 1px solid #f1f1f1;
			border-left: 1px dashed #ddd;
		}
		#historyItem .history .article-content {
			font-size: 14px;
			padding: 0;
			word-break: break-all;
		}
	</style>
</head>
<body>
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">
<div class="zxy-title">
	<span class="storyid">${story.id}-${task.id}</span>
	<strong>${task.title}</strong>
</div>
<div class="zxy-body">
	<div class="col-xs-9">
		<fieldset>
			<legend>任务描述</legend>
			<div class="zxy-content">
				${task.contenthtml}
			</div>
		</fieldset>
		<fieldset>
			<legend>历史记录</legend>
			<div class="zxy-content">
				<%
					List<Extend> optListTemp=(List<Extend>)request.getAttribute("optList");
					if(optListTemp!=null){
					    %>
							<ol id="historyItem">
							<%
								for(int i=0;i<optListTemp.size();i++){
								    %><li value=<%=i%>><%
									if("0".equals(optListTemp.get(i).getExt3())){
										//创建并指派
										%>
											<span class="item">
												<%=i+1%>.&nbsp;<%=optListTemp.get(i).getExt1()%>，由&nbsp;<strong><%=optListTemp.get(i).getExt2()%></strong>&nbsp;创建并指派
											</span>
								        <%
									}
									if("1".equals(optListTemp.get(i).getExt3())){
									    //暂停
										%>
											<span class="item">
												<%=i+1%>.&nbsp;<%=optListTemp.get(i).getExt1()%>，由&nbsp;<strong><%=optListTemp.get(i).getExt2()%></strong>&nbsp;暂停任务
											</span>
											<div class="history">
												<div class="article-content comment53200"><%=optListTemp.get(i).getExt4()%></div>
											</div>
										<%
									}
									if("2".equals(optListTemp.get(i).getExt3())){
									    //开始
										%>
											<span class="item">
												<%=i+1%>.&nbsp;<%=optListTemp.get(i).getExt1()%>，由&nbsp;<strong><%=optListTemp.get(i).getExt2()%></strong>&nbsp;开始任务
											</span>
										<%
									}
									if("3".equals(optListTemp.get(i).getExt3())){
									    //添加备注
										%>
											<span class="item">
												<%=i+1%>.&nbsp;<%=optListTemp.get(i).getExt1()%>，由&nbsp;<strong><%=optListTemp.get(i).getExt2()%></strong>&nbsp;添加备注
											</span>
											<div class="history">
												<div class="article-content comment53200"><%=optListTemp.get(i).getExt4()%></div>
											</div>
										<%
									}
									if("4".equals(optListTemp.get(i).getExt3())){
									    //添加备注
										%>
											<span class="item">
												<%=i+1%>.&nbsp;<%=optListTemp.get(i).getExt1()%>，由&nbsp;<strong><%=optListTemp.get(i).getExt2()%></strong>&nbsp;添加日志
											</span>
											<div class="history">
												<div class="article-content comment53200"><%=optListTemp.get(i).getExt4()%></div>
											</div>
										<%
									}
									%></li><%
								}
					    	%>
							</ol>
						<%
					}
				%>
			</div>
		</fieldset>
		<fieldset>
			<legend>需求描述</legend>
			<div class="zxy-content">
				${story.contenthtml}
					<br/>
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
			<legend>任务完成情况</legend>
			<div class="zxy-content">
				<p>代码截图</p>
				<c:if test="${taskcomplete.codeurl!='' and taskcomplete.codeurl!=null}">
					<p><img src="<%=Constant.FILE_VIEW_URL%>${taskcomplete.codeurl}" alt="" style="width:500px;height:250px"></p>
				</c:if>
				<p>测试说明</p>
				<p>${taskcomplete.testremarkhtml}</p>
				<p>发布说明</p>
				<p>
					${taskcomplete.releaseremarkhtml}<br/>
						<a href="<%=Constant.FILE_VIEW_URL%>${taskcomplete.sql}" link-url="<%=Constant.FILE_VIEW_URL%>${taskcomplete.sql}" download="${taskcomplete.sqlname}" style="text-decoration:underline;color:blue">${taskcomplete.sqlname}</a>
				</p>
				<p>超期说明</p>
				<p>${taskcomplete.overdueremarkhtml}</p>
			</div>
		</fieldset>
		<fieldset>
			<legend>关联bug</legend>
			<div class="zxy-content">
				<table id="tb-buglist">
					<thead>
					<th>bugId</th>
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
						<td><%=bugList.get(i).getId()%></td>
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
							<tr>
								<td class="tb-name">状态</td>
								<td class="tb-value">
									<c:if test="${task.status=='1'}">
										开发中
									</c:if>
									<c:if test="${task.status=='2'}">
										开发完成
									</c:if>
									<c:if test="${task.status=='3'}">
										<div style="color: orange">暂停</div>
									</c:if>
								</td>
							</tr>
							<td class="tb-name">任务类型</td>
							<td class="tb-value">
								<c:if test="${task.rwtype=='1'}">
									设计
								</c:if>
								<c:if test="${task.rwtype=='2'}">
									前端
								</c:if>
								<c:if test="${task.rwtype=='3'}">
									开发
								</c:if>
								<c:if test="${task.rwtype=='4'}">
									研究
								</c:if>
								<c:if test="${task.rwtype=='5'}">
									事务
								</c:if>
								<c:if test="${task.rwtype=='6'}">
									其他
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="tb-name">指派至</td>
							<td class="tb-value">${task.assigntoname}</td>
						</tr>
						<tr>
							<td class="tb-name">预计工时</td>
							<td class="tb-value">${task.estimate}</td>
						</tr>
						<tr>
							<td class="tb-name">指派人</td>
							<td class="tb-value tb-status">${task.username}</td>
						</tr>
						<tr>
							<td class="tb-name">指派时间</td>
							<td class="tb-value tb-status">${task.createtime}</td>
						</tr>
						<tr>
							<td class="tb-name">截至时间</td>
							<td class="tb-value tb-status" style="color:red">${task.deadline}</td>
						</tr>
					</table>

				</table>
			</div>
		</fieldset>
		<fieldset>
			<legend>需求信息</legend>
			<div class="zxy-content">
				<table>
					<table>
						<tr>
							<td class="tb-name">需求id</td>
							<td class="tb-value">${story.id}</td>
						</tr>
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
							</td>
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
							<td class="tb-value">${story.deadline}</td>
						</tr>

					</table>

				</table>
			</div>
		</fieldset>
		<fieldset>
			<legend>完成信息</legend>
			<div class="zxy-content">
				<table>
					<table>
						<tr>
							<td class="tb-name">由谁完成</td>
							<td class="tb-value">${taskcomplete.username}</td>
						</tr>
						<tr>
							<td class="tb-name">实际工时</td>
							<td class="tb-value">${taskcomplete.estimate}</td>
						</tr>
						<tr>
							<td class="tb-name">完成时间</td>
							<td class="tb-value">${taskcomplete.createtime}</td>
						</tr>

					</table>

				</table>
			</div>
		</fieldset>
	</div>
</div>

<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/task/taskForm.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>