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
<title>运维部报表</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
<style>
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
		border-top: 1px solid #FFD966;
		border-right: 1px solid #FFD966;
		border-bottom: 1px solid #FFD966;
		border-left: 1px solid #FFD966;
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
<div style="float: right;padding-right: 20px;">
	<button id="print" type="button" class="btn btn-xs btn-pink">
		<i class="icon-print"></i> 打印
	</button>
</div>
<!--startprint-->
<div class="row">
	<div class="ui-header">
		<div class="ui-title">未分拣</div>
	</div>
	<div class="ui-body">
		<table id="toBeSortedList" class="ui-table">
			<thead>
				<th style="width:150px">项目</th>
				<th style="width:150px">客户</th>
				<th>需求</th>
				<th style="width:200px">提出时间</th>
				<th style="width:150px">截止时间</th>
			</thead>
			<tbody>
				<%
					List<Report> toBeSortedList=(List<Report>)request.getAttribute("toBeSortedList");
					for(int i=0;i<toBeSortedList.size();i++){
						%>
							<tr>
								<td><%=toBeSortedList.get(i).getV1()%></td>
								<td><%=toBeSortedList.get(i).getV2()%></td>
								<td title="<%=toBeSortedList.get(i).getV3()%>"><%=toBeSortedList.get(i).getV3()%></td>
								<td><%=toBeSortedList.get(i).getV4()%></td>
								<td><%=toBeSortedList.get(i).getV5()%></td>
							</tr>
						<%
					}
				%>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="ui-header">
		<div class="ui-title">开发中</div>
	</div>
	<div class="ui-body">
		<table id="toBeDevelopedList" class="ui-table">
			<thead>
			<th style="width:150px">项目</th>
			<th style="width:150px">客户</th>
			<th>任务</th>
			<th style="width:150px">开发人员</th>
			<th style="width:200px">指派时间</th>
			<th style="width:150px">截止时间</th>
			</thead>
			<tbody>
			<%
				List<Report> toBeDevelopedList=(List<Report>)request.getAttribute("toBeDevelopedList");
				for(int i=0;i<toBeDevelopedList.size();i++){
			%>
			<tr>
				<td><%=toBeDevelopedList.get(i).getV1()%></td>
				<td><%=toBeDevelopedList.get(i).getV2()%></td>
				<td title="<%=toBeDevelopedList.get(i).getV3()%>"><%=toBeDevelopedList.get(i).getV3()%></td>
				<td><%=toBeDevelopedList.get(i).getV4()%></td>
				<td><%=toBeDevelopedList.get(i).getV5()%></td>
				<td><%=toBeDevelopedList.get(i).getV6()%></td>
			</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="ui-header">
		<div class="ui-title">Bug</div>
	</div>
	<div class="ui-body">
		<table id="bugList" class="ui-table">
			<thead>
			<th style="width:150px">项目</th>
			<th>内容</th>
			<th style="width:150px">开发人员</th>
			<th style="width:200px">指派时间</th>
			</thead>
			<tbody>
			<%
				List<Report> bugList=(List<Report>)request.getAttribute("bugList");
				for(int i=0;i<bugList.size();i++){
			%>
			<tr>
				<td><%=bugList.get(i).getV1()%></td>
				<td title="<%=bugList.get(i).getV2()%>"><%=bugList.get(i).getV2()%></td>
				<td><%=bugList.get(i).getV3()%></td>
				<td><%=bugList.get(i).getV4()%></td>
			</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</div>
<!--endprint-->
<jsp:include page="../share/acefoot.jsp"></jsp:include>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/report/weekly1.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>