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
<div class="row">
	<form id="searchForm">
		<table class="search-filed">
			<tr>
				<td class="td-label">需求Id</td>
				<td class="td-info">
					<input id="id" type="text" class="form-control input-sm"/>
				</td>
				<td class="td-label">标题</td>
				<td class="td-info">
					<input id="title" type="text" class="form-control input-sm"/>
				</td>
				<td class="td-label">项目</td>
				<td class="td-info">
					<select id="project" class="col-xs-12">

					</select>
				</td>
				<td class="td-label">来源</td>
				<td class="td-info">
					<select id="source" class="col-xs-12">

					</select>
				</td>
				<td class="td-info">
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
		src="<%=request.getContextPath()%>/js/test/totest.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>