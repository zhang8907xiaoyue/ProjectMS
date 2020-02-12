<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户表单</title>
<jsp:include page="../share/acehead.jsp"></jsp:include>
<jsp:include page="../share/acefoot.jsp"></jsp:include>
</head>
<body style="padding: 20px">
	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="userForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="name">
								<font style="color:red">*</font>登录名</label>
							<div class="col-xs-4">
								<input type="text" id="name" class="col-xs-10 col-xs-12" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="realname">
								<font style="color:red">*</font>真实姓名</label>
							<div class="col-xs-4">
								<input type="text" id="realname" class="col-xs-10 col-xs-12" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="password">
								<font style="color:red">*</font>密码</label>
							<div class="col-xs-4">
								<input type="text" id="password" class="col-xs-10 col-xs-12" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="type">
								<font style="color:red">*</font>类型(邮件)</label>
							<div class="col-xs-4">
								<select id="type" class="col-xs-12">
									<option value="1" selected="selected">开发人员</option>
									<option value="2">测试人员</option>
									<option value="3">项目经理</option>
									<option value="4">需求组（运维）</option>
									<option value="5">管理人员</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="email">
								<font style="color:red">*</font>邮箱</label>
							<div class="col-xs-4">
								<input type="text" id="email" class="col-xs-10 col-xs-12" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="parentid">
								<font style="color:red">*</font>所属部门</label>
							<div class="col-xs-4">
								<select id="organization" class="col-xs-10 col-xs-12">
								</select>
								<script type="text/javascript">
									//初始化部门
									$.ajax({
								        url: common.getContextPath()+'/system/getOrgList.do',
								        type: 'Post',
								        dataType: "json",
								        async: false,
								        success: function (data) {
								        	if (data.success==false) {
								        		top.layui.use('layer', function(){
									      			  var layer = top.layui.layer;
									      			  layer.open({
									      				  content: data.msg,
									      				  scrollbar: false
									      			  });
									      		});  
								            } else {
								            	$('#organization').html('');
								        		$('#organization').append('<option value="">--请选择--</option>');
								            	for(var i=0;i<data.length;i++){
								            		$('#organization').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
								            	}
												$("#organization").val('${user.orgid}');
								            }
								        }
									});
								</script>
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
					<form id="userForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="name">
								<font style="color:red">*</font>登录名</label>
							<div class="col-xs-4">
								<input type="text" id="name" class="col-xs-10 col-xs-12" value="${user.name}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="realname">
								<font style="color:red">*</font>真实姓名</label>
							<div class="col-xs-4">
								<input type="text" id="realname" class="col-xs-10 col-xs-12" value="${user.realname}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="password">
								<font style="color:red">*</font>密码</label>
							<div class="col-xs-4">
								<input type="text" id="password" class="col-xs-10 col-xs-12" value="${user.password}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="type">
								<font style="color:red">*</font>类型(邮件)</label>
							<div class="col-xs-4">
								<select id="type" class="col-xs-12">
									<option value="1" selected="selected">开发人员</option>
									<option value="2">测试人员</option>
									<option value="3">项目经理</option>
									<option value="4">需求组（运维）</option>
									<option value="5">管理人员</option>
								</select>
								<script type="text/javascript">
                                    $("#type").val('${user.type}');
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="email">
								<font style="color:red">*</font>邮箱</label>
							<div class="col-xs-4">
								<input type="text" id="email" class="col-xs-10 col-xs-12" value="${user.email}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="parentid">
								<font style="color:red">*</font>所属部门</label>
							<div class="col-xs-4">
								<select id="organization" class="col-xs-10 col-xs-12">
								</select>
								<script type="text/javascript">
									//初始化部门
									$.ajax({
								        url: common.getContextPath()+'/system/getOrgList.do',
								        type: 'Post',
								        dataType: "json",
								        async: false,
								        success: function (data) {
								        	if (data.success==false) {
								        		top.layui.use('layer', function(){
									      			  var layer = top.layui.layer;
									      			  layer.open({
									      				  content: data.msg,
									      				  scrollbar: false
									      			  });
									      		});  
								            } else {
								            	$('#organization').html('');
								        		$('#organization').append('<option value="">--请选择--</option>');
								            	for(var i=0;i<data.length;i++){
								            		$('#organization').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
								            	}
												$("#organization").val('${user.orgid}');
								            }
								        }
									});
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="status">
								状态 </label>
							<div class="col-xs-4" style="padding-top: 5px;">
								<input type="radio" name="status" value="1" checked="checked"/>&nbsp;启用&nbsp;
								<input type="radio" name="status" value="0" />&nbsp;禁用
								<script type="text/javascript">
									$("input:radio[name=status][value='${user.status}']").attr("checked",true);
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label no-padding-right" for="listid">
								<font style="color:red">*</font>排序</label>
							<div class="col-xs-4">
								<input type="text" id="listid" class="col-xs-10 col-xs-12" value="${user.listid}" />
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${user.id}">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<input type="text" id="form-type" style="display: none" value="${type}">
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/system/userForm.js?v=<%=Constant.VERSION%>"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>