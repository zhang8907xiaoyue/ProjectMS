<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="com.jschrj.pojo.report.Report" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工绩效</title>
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
.ui-header{
	padding: 12px;
}
.ui-title{
	width: 240px;
	overflow: hidden;
	height: 35px;
	background-image: url(<%=request.getContextPath() %>/images/bg_title.png);
	background-repeat: no-repeat;
	background-size: contain;
	color: #fff;
	font-size: 18px;
	padding-left: 61px;
	line-height: 35px;
	letter-spacing: 0.9px;
}
.ui-body{
	padding-left: 12px;
	padding-right: 12px;
}
.ui-table{
	border-collapse: collapse;
	table-layout: fixed;
	width: 90%;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	-webkit-border-horizontal-spacing: 0px;
	-webkit-border-vertical-spacing: 0px;
	color: #000000;
	font-size: 11pt;
	font-weight: 400;
	font-style: normal;
	font-family: "微软雅黑","sans-serif";
}

.ui-table thead th{
	height: 24pt;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
	background: #FFD966;
	color: #843C0B;
	font-size: 10pt;
	font-weight: 700;
	font-style: normal;
	font-family: "微软雅黑","sans-serif";
	border-top: 1px solid #843C0B;
	border-right: 1px solid #843C0B;
	border-bottom: 1px solid #843C0B;
	border-left: 1px solid #843C0B;
}

.ui-table tbody td{
	height: 24pt;
	vertical-align: middle;
	text-align: center;
	white-space: nowrap;
	color: #000000;
	font-size: 11pt;
	font-weight: 400;
	font-style: normal;
	font-family: "微软雅黑","sans-serif";
	border-top: none;
	border-right: 1px solid #BFBFBF;
	border-bottom: 1px solid #BFBFBF;
	border-left: 1px solid #BFBFBF;
	overflow: hidden;
}
</style>
</head>
<body>
<div class="row" style="margin-bottom: 10px">
	<form id="searchForm">
		<table class="search-filed">
			<tr>
				<td class="td-label">开始</td>
				<td class="td-info">
					<div class="input-group input-group-sm">
						<input id="starttime" class="form-control date-picker" type="text"
							   data-date-format="yyyy-mm-dd" value="${starttime}"/> <span
							class="input-group-addon"> <i
							class="icon-calendar bigger-110"></i> </span>
					</div>
				</td>
				<td class="td-label">结束</td>
				<td class="td-info">
					<div class="input-group input-group-sm">
						<input id="endtime" class="form-control date-picker" type="text"
							   data-date-format="yyyy-mm-dd" /> <span
							class="input-group-addon"> <i
							class="icon-calendar bigger-110"></i> </span>
					</div>
				</td>
				<td class="td-info">
					<button id="search" type="button" class="btn btn-xs btn-primary">
						<i class="icon-search"></i> 查询
					</button>
					<button id="print" type="button" class="btn btn-xs btn-pink">
						<i class="icon-print"></i> 打印
					</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<!--startprint-->
<div class="row">
	<div class="ui-body">
		<table id="toBeSortedList" class="ui-table">
			<thead>
				<tr>
					<th rowspan="2">姓名</th>
					<th rowspan="2">部门</th>
					<th colspan="3">效率情况</th>
					<th colspan="2">bug情况</th>
					<th colspan="3">奖惩情况</th>
				</tr>
				<tr>
					<th>安排工时</th>
					<th>实际用时</th>
					<th>工作效率</th>
					<th>任务关联</th>
					<th>认定确认</th>
					<th>员工贡献</th>
					<th>员工失误</th>
					<th>每月最佳</th>
				</tr>
			</thead>
			<tbody id="tb_body">

			</tbody>
		</table>
	</div>
</div>
<!--endprint-->
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/pa/painfo.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>