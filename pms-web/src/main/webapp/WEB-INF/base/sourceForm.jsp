<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品表单</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
<jsp:include page="../share/acefoot.jsp"></jsp:include>
</head>
<body style="padding: 20px">
	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="productForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="name">
								<font style="color:red">*</font>来源名称</label>
							<div class="col-xs-4">
								<input type="text" id="name" class="col-xs-10 col-xs-12" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="status">
								状态 </label>
							<div class="col-xs-4" style="padding-top: 5px;">
								<input type="radio" name="status" value="1" checked="checked"/>&nbsp;启用&nbsp;
								<input type="radio" name="status" value="0" />&nbsp;禁用
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="listid">
								<font style="color:red">*</font>排序</label>
							<div class="col-xs-4">
								<input type="text" id="listid" class="col-xs-10 col-xs-12" />
							</div>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form id="productForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="name">
								<font style="color:red">*</font>来源名称</label>
							<div class="col-xs-4">
								<input type="text" id="name" class="col-xs-10 col-xs-12" value="${source.name}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="status">
								状态 </label>
							<div class="col-xs-4" style="padding-top: 5px;">
								<input type="radio" name="status" value="1" checked="checked"/>&nbsp;启用&nbsp;
								<input type="radio" name="status" value="0" />&nbsp;禁用
								<script type="text/javascript">
									$("input:radio[name=status][value='${source.status}']").attr("checked",true);
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="listid">
								<font style="color:red">*</font>排序</label>
							<div class="col-xs-4">
								<input type="text" id="listid" class="col-xs-10 col-xs-12" value="${source.listid}" />
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${source.id}">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<input type="text" id="form-type" style="display: none" value="${type}">
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/base/sourceForm.js?v=<%=Constant.VERSION%>"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>