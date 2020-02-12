<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>待指派</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
<style>
.search-filed{
	width：100%;
}
.search-filed .td-label{
	padding: 2px 2px 2px 10px;
	text-align: right;
}
.search-filed .td-info{
	padding: 2px 10px 2px 2px;
	text-align: left;
	width:181px;
}
.search-filed input[type="radio"]{
	margin: 10px 0 10px 4px!important;
}
</style>
</head>
<body>
<div id="tools" style="width:100%;background: #f8fafc;border:1px solid #E0E2E5;padding:10px">
		<a id="new" class="toolbar green" href="javascript:;">
			<i class="icon-plus"></i> 新增
		</a>
		<a id="edit" class="toolbar red" href="javascript:;">
			<i class="icon-pencil"></i>修改
		</a>
		<a id="delete" class="toolbar red" href="javascript:;">
			<i class="icon-trash"></i>删除
		</a>
        <a id="search" class="toolbar pink" href="javascript:;">
            <i class="icon-search"></i>查询
        </a>
		<a id="legal" class="toolbar pink" href="javascript:;">
			<i class="icon-legal"></i>认定
		</a>
		<a id="reset" class="toolbar light-green" href="javascript:;">
			<i class="icon-refresh"></i>重置
		</a>
    <a id="export" class="toolbar light-blue" href="javascript:;">
        <i class="icon-file-excel-o"></i>导出
    </a>
	</div>
<div class="row">
	<form id="searchForm">
		<table class="search-filed">
			<tr>
				<td class="td-label">提出始</td>
				<td class="td-info">
					<div class="input-group input-group-sm">
						<input id="starttime" class="form-control date-picker" type="text"
							   data-date-format="yyyy-mm-dd" /> <span
							class="input-group-addon"> <i
							class="icon-calendar bigger-110"></i> </span>
					</div>
				</td>
				<td class="td-label">提出止</td>
				<td class="td-info">
					<div class="input-group input-group-sm">
						<input id="endtime" class="form-control date-picker" type="text"
							   data-date-format="yyyy-mm-dd" /> <span
							class="input-group-addon"> <i
							class="icon-calendar bigger-110"></i> </span>
					</div>
				</td>
				<td class="td-label">完成始</td>
				<td class="td-info">
					<div class="input-group input-group-sm">
						<input id="finishedtimeS" class="form-control date-picker" type="text"
							   data-date-format="yyyy-mm-dd" /> <span
							class="input-group-addon"> <i
							class="icon-calendar bigger-110"></i> </span>
					</div>
				</td>
				<td class="td-label">完成止</td>
				<td class="td-info">
					<div class="input-group input-group-sm">
						<input id="finishedtimeE" class="form-control date-picker" type="text"
							   data-date-format="yyyy-mm-dd" /> <span
							class="input-group-addon"> <i
							class="icon-calendar bigger-110"></i> </span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td-label">bugId</td>
				<td class="td-info">
					<input id="id" type="text" class="form-control input-sm"/>
				</td>
				<td class="td-label">bug标题</td>
				<td class="td-info">
					<input id="title" type="text" class="form-control input-sm"/>
				</td>
				<td class="td-label">项目</td>
				<td class="td-info">
					<select id="project" class="col-xs-12">

					</select>
				</td>
				<td class="td-label">状态</td>
				<td class="td-info">
					<select id="status" class="col-xs-12">
						<option></option>
						<option value="1">待解决</option>
						<option value="2">待审核</option>
						<option value="3">待发布</option>
						<option value="4">已完成</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="td-label">创建人</td>
				<td class="td-info">
					<input id="openedby" readonly="readonly" type="text" onclick="showOrgMenu();" class="form-control input-sm"/>
					<div id="orgParentContent" class="ztree-content" style="display:none; position: absolute;">
						<ul id="orgParentTree" class="ztree" style="margin-top:0; width:180px; height: 200px;"></ul>
					</div>
				</td>
				<td class="td-label">指派至</td>
				<td class="td-info">
					<input id="assignto" readonly="readonly" type="text" onclick="showAssigntoMenu();" class="form-control input-sm"/>
					<div id="assigntoParentContent" class="ztree-content" style="display:none; position: absolute;">
						<ul id="assigntoParentTree" class="ztree" style="margin-top:0; width:180px; height: 200px;"></ul>
					</div>
				</td>
				<td class="td-label">责任人</td>
				<td class="td-info">
					<input id="duty" readonly="readonly" type="text" onclick="showDutyMenu();" class="form-control input-sm"/>
					<div id="dutyParentContent" class="ztree-content" style="display:none; position: absolute;">
						<ul id="dutyParentTree" class="ztree" style="margin-top:0; width:180px; height: 200px;"></ul>
					</div>
				</td>
				<td class="td-label">完成人</td>
				<td class="td-info" >
					<input id="finishedby" readonly="readonly" type="text" onclick="showFinishedbyMenu();" class="form-control input-sm"/>
					<div id="finishedbyParentContent" class="ztree-content" style="display:none; position: absolute;">
						<ul id="finishedbyParentTree" class="ztree" style="margin-top:0; width:180px; height: 200px;"></ul>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="row">
		<table id="grid-table"></table>
		<div id="grid-pager"></div> 
		<!-- /widget-box -->
	</div>
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bug/bug.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>