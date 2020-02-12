<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="com.jschrj.pojo.release.Release" %>
<%@ page import="java.util.List" %>
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
	<div class="col-xs-12">
		<table id="tb-release" class="table  table-bordered table-hover">
			<thead>
			<tr>
				<th class="center" style="width:50px">序号</th>
				<th class="center" style="width:120px">项目</th>
				<th class="center" style="width:120px">客户</th>
				<th class="center" style="width:100px">类型</th>
				<th class="center">需求(bug)标题</th>
				<th class="center" style="width:200px">需求创建时间</th>
				<th class="center" style="width:200px">测试完成时间</th>
			</tr>
			</thead>
			<tbody>
				<%
					List<Release> releaseList=(List<Release>)request.getAttribute("releaseList");
					for(int i=0;i<releaseList.size();i++){
					    %>
							<tr class="">
								<td class="center">
									<%=i+1%>
								</td>
								<td class="center">
									<%=releaseList.get(i).getProjectname()%>
								</td>
								<td class="center">
									<%=releaseList.get(i).getCustomername()%>
								</td>
								<td class="center">
									<%
										if(releaseList.get(i).getType()==1){
									    	%>需求<%
										}else if(releaseList.get(i).getType()==2){
											%>bug<%
										}
									%>
								</td>
								<td class="center">
									<a href="javascript:;" class="option view" a-type="<%=releaseList.get(i).getType()%>" a-link="<%=releaseList.get(i).getReferid()%>"><%=releaseList.get(i).getReferid()%>:&nbsp;<%=releaseList.get(i).getTitle()%></a>
								</td>
								<td class="center">
									<%=releaseList.get(i).getCreatetime()%>
								</td>
								<td class="center">
									<%=releaseList.get(i).getUpdatetime()%>
								</td>
							</tr>
						<%
					}
				%>



			</tbody>
		</table>
	</div><!-- /.span -->
</div>
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/release/releasedlist.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>