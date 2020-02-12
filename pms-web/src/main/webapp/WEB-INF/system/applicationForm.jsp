<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单表单</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
<jsp:include page="../share/acefoot.jsp"></jsp:include>
</head>
<body style="padding: 20px">
	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="appForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="name">
								<font style="color:red">*</font>菜单名称</label>
							<div class="col-xs-3">
								<input type="text" id="name" class="col-xs-10 col-xs-12" />
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="status">
								状态 </label>
							<div class="col-xs-3" style="padding-top: 5px;">
								<input type="radio" name="status" value="1" checked="checked"/>&nbsp;启用&nbsp;
								<input type="radio" name="status" value="0" />&nbsp;禁用
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="type">
								菜单类型 </label>
							<div class="col-xs-3">
								<select id="type" class="col-xs-10 col-xs-12">
									<option value="0">分类</option>
									<option value="1" selected="selected">菜单</option>
								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="url">
								<font style="color:red">*</font>URL </label>
							<div class="col-xs-3">
								<input type="text" id="url" class="col-xs-10 col-xs-12" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="parentid">
								<font style="color:red">*</font>上级菜单</label>
							<div class="col-xs-3" style="padding-top: 4px;">
								<input id="appParent" type="text" class="form-control input-sm" onclick="showAppMenu();" readonly="readonly"/>
								<div id="appParentContent" class="ztree-content" style="display:none; position: absolute;">
									<ul id="appParentTree" class="ztree" style="margin-top:0; width:180px; height: 200px;"></ul>
								</div>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="css">
								CSS </label>
							<div class="col-xs-3">
								<input type="text" id="css" class="col-xs-10 col-xs-12" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="icon">
								ICON </label>
							<div class="col-xs-3">
								<input type="text" id="icon" class="col-xs-10 col-xs-12" />
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="listid">
								<font style="color:red">*</font>排序</label>
							<div class="col-xs-3">
								<input type="text" id="listid" class="col-xs-10 col-xs-12" />
							</div>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form id="appForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="name">
								<font style="color:red">*</font>菜单名称</label>
							<div class="col-xs-3">
								<input type="text" id="name" class="col-xs-10 col-xs-12" value="${application.name}" />
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="status">
								状态 </label>
							<div class="col-xs-3" style="padding-top: 5px;">
								<input type="radio" name="status" value="1" checked="checked"/>&nbsp;启用&nbsp;
								<input type="radio" name="status" value="0" />&nbsp;禁用
								<script type="text/javascript">
									$("input:radio[name=status][value='${application.status}']").attr("checked",true);
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="type">
								菜单类型 </label>
							<div class="col-xs-3">
								<select id="type" class="col-xs-10 col-xs-12">
									<option value="0">分类</option>
									<option value="1" selected="selected">菜单</option>
								</select>
								<script type="text/javascript">
									$("#type").val('${application.type}');
								</script>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="url">
								<font style="color:red">*</font>URL </label>
							<div class="col-xs-3">
								<input type="text" id="url" class="col-xs-10 col-xs-12" value="${application.url}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="parentid">
								<font style="color:red">*</font>上级菜单</label>
							<div class="col-xs-3" style="padding-top: 4px;">
								<input id="appParent" type="text" class="form-control input-sm" 
									onclick="showAppMenu();" readonly="readonly"
									value="${application.parentname}" link-parentid="${application.parentid}"/>
								<div id="appParentContent" class="ztree-content" style="display:none; position: absolute;">
									<ul id="appParentTree" class="ztree" style="margin-top:0; width:180px; height: 200px;"></ul>
								</div>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="css">
								CSS </label>
							<div class="col-xs-3">
								<input type="text" id="css" class="col-xs-10 col-xs-12" value="${application.css}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="icon">
								ICON </label>
							<div class="col-xs-3">
								<input type="text" id="icon" class="col-xs-10 col-xs-12" value="${application.icon}" />
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="listid">
								<font style="color:red">*</font>排序</label>
							<div class="col-xs-3">
								<input type="text" id="listid" class="col-xs-10 col-xs-12" value="${application.listid}" />
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${application.id}">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<input type="text" id="form-type" style="display: none" value="${type}">
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/system/applicationForm.js?v=<%=Constant.VERSION%>"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>