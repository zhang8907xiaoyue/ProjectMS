<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="com.jschrj.pojo.task.Taskcomplete" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%
		request.setCharacterEncoding("UTF-8");
		String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";

	%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>功能发布清单</title>
	<jsp:include page="../share/acehead.jsp"></jsp:include>
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
</head>
<body>
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">
<div class="zxy-body">
	<div class="col-xs-10">
		<%
			List<Taskcomplete> taskList=(List<Taskcomplete>)request.getAttribute("taskList");
			for(int i=0;i<taskList.size();i++){
			    %>
					<fieldset>
						<legend>
							<div class="release-id" style="display: none;" link-referid="<%=taskList.get(i).getId()%>" link-type="<%=taskList.get(i).getStoryid()%>"><%=taskList.get(i).getEstimate()%></div>
							<%
								if(taskList.get(i).getStoryid()==1){
								    %>需求<%
								}else{
									%>bug<%
								}
							%>
							<%=taskList.get(i).getId()%>：<%=taskList.get(i).getTitle()%>
						</legend>
						<div class="zxy-content">
							<p>发布说明</p>
							<p>
								<%=taskList.get(i).getReleaseremarkhtml()%><br/>
								<a href="<%=Constant.FILE_VIEW_URL%><%=taskList.get(i).getSql()%>" link-url="<%=Constant.FILE_VIEW_URL%><%=taskList.get(i).getSql()%>" download="<%=taskList.get(i).getSqlname()%>" style="text-decoration:underline;color:blue"><%=taskList.get(i).getSqlname()%></a>
							</p>
						</div>
					</fieldset>
				<%
			}
		%>
	</div>
</div>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/release/releaseForm.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>