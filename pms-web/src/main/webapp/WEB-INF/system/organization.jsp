<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组织管理</title>
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
		<a id="edit" class="toolbar pink" href="javascript:;">
			<i class="icon-pencil"></i>修改
		</a>
		<a id="delete" class="toolbar red" href="javascript:;">
			<i class="icon-trash"></i>禁用
		</a>
		<a id="reset" class="toolbar light-blue" href="javascript:;">
			<i class="icon-refresh"></i>重置
		</a>
	</div>
<div class="row">
	<form id="searchForm">
		<table class="search-filed">
			<tr>
				<td class="td-label">部门名称：</td>
				<td class="td-info">
					<input id="orgname" type="text" class="form-control input-sm"/>
				</td>
				<td class="td-label">状态：</td>
				<td class="td-info">
					<label><input type="radio" name="status" value="-1"/>&nbsp;全部</label>&nbsp;
					<label><input type="radio" name="status" value="1" checked="checked"/>&nbsp;启用</label>&nbsp;
					<label><input type="radio" name="status" value="0"/>&nbsp;禁用</label>
					
				</td>
				<td>
					<button id="search" type="button" class="btn btn-xs btn-primary">
						<i class="icon-search"></i> 查询
					</button>
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
		src="<%=request.getContextPath()%>/js/system/organization.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>