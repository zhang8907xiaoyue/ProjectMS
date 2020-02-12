<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="com.jschrj.pojo.system.Application" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色权限</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
</head>
<style>
input[type="checkbox"]{
	margin: 15px 0 10px 4px!important;
}
</style>
<body>
<div class="row">
	<div class="col-sm-12">
		<%
					List<Application> appList=(List<Application>)request.getAttribute("appList");
					for(Application app:appList){
						%>
						<div class="widget-box transparent">
							<div class="widget-header widget-header-flat">
								<h4 class="lighter">
									<%=app.getName() %>&nbsp;<input type="checkbox" class="qx-mk" link-id="<%=app.getId()%>">
								</h4>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<%
											String result=qxShow(app.getId(),app.getChildren());
											%><%=result%><%
									%>
								</div>
							</div>
						</div>
						<%
					}
				 %>
				 <%!
				 	//遍历所有模块权限(祖先模块id，应用程序集)
					private String qxShow(int parentsid,List<Application> appList) {
						String result="";
						for(Application app:appList){
							if(app.getType()==0){
								result+="<label style='font-weight: bolder;display:inline-block;margin-left:10px;'>"+
										"<input type='checkbox' class='qx-nr' link-id='"+app.getId()+"' link-parentsid='"+parentsid+"'>&nbsp;"+
										app.getName()+
										"</label>";
							}else{
								result+="<label style='display:inline-block;margin-left:10px;'>"+
										"<input type='checkbox' class='qx-nr' link-id='"+app.getId()+"' link-parentsid='"+parentsid+"'>&nbsp;"+
										app.getName()+
										"</label>";
							}
							if(app.getChildren().size()>0){
								result+=qxShow(parentsid,app.getChildren());
							}
						}	
						return result;				
					}
				  %>						
	</div>
</div>	
<input type="text" id="roleid" value="${roleid}" style="display: none">
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/system/rolePower.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>