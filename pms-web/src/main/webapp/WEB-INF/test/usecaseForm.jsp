<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jschrj.pojo.test.Usecasestep" %>
<%@ page import="com.jschrj.pojo.test.Usecase" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>需求表单</title>
	<jsp:include page="../share/acehead.jsp"></jsp:include>
	<jsp:include page="../share/acefoot.jsp"></jsp:include>
</head>
<body>
<input type="text" id="file-view-url" style="display: none" value="<%=Constant.FILE_VIEW_URL%>">

	<div class="row">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${type=='new'}">
					<form id="newForm" class="form-horizontal" role="form" style="padding: 20px">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="type">
								<font style="color:red">*</font>用例类型</label>
							<div class="col-xs-3">
								<select id="type" class="col-xs-10">
									<option value="1">功能测试</option>
									<option value="2">性能测试</option>
									<option value="3">配置相关</option>
									<option value="4">安装部署</option>
									<option value="5">安全相关</option>
									<option value="6">接口测试</option>
									<option value="9">其他</option>
								</select>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="stage">
								<font style="color:red">*</font>适用阶段</label>
							<div class="col-xs-6">
								<select id="stage" class="col-xs-10" multiple="multiple">
									<option value="1">单元测试阶段</option>
									<option value="2">功能测试阶段</option>
									<option value="3">集成测试阶段</option>
									<option value="4">系统测试阶段</option>
									<option value="5">冒烟测试阶段</option>
									<option value="6">版本验证阶段</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>标题</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="step">
								用例步骤</label>
							<div class="col-xs-11">
								<table id="step">
									<thead>
										<th style="width:4%">编号</th>
										<th style="width: 38%">步骤</th>
										<th style="width: 38%">预期</th>
										<th style="width:14%">操作</th>
									</thead>
									<tbody>
										<tr class="step-row">
											<td class="xh">1</td>
											<td>
												<textarea rows="1" cols="20" class="form-control step-content" style="width:100%"></textarea>
											</td>
											<td>
												<textarea rows="1" cols="20" class="form-control expect-content" style="width:100%"></textarea>
											</td>
											<td>
												<button type="button" class="btn btn-light btn-xs btn-up">
													<i class="ace-icon icon icon-angle-double-up  bigger-110 icon-only"></i>
												</button>
												<button type="button" class="btn btn-light btn-xs btn-down">
													<i class="ace-icon icon icon-angle-double-down   bigger-110 icon-only"></i>
												</button>
												<button type="button" class="btn btn-light btn-xs btn-close">
													<i class="ace-icon icon icon-close bigger-110 icon-only"></i>
												</button>
											</td>
										</tr>
										<tr class="step-row">
											<td class="xh">2</td>
											<td>
												<textarea rows="1" cols="20" class="form-control step-content" style="width:100%"></textarea>
											</td>
											<td>
												<textarea rows="1" cols="20" class="form-control expect-content" style="width:100%"></textarea>
											</td>
											<td>
												<button type="button" class="btn btn-light btn-xs btn-up">
													<i class="ace-icon icon icon-angle-double-up  bigger-110 icon-only"></i>
												</button>
												<button type="button" class="btn btn-light btn-xs btn-down">
													<i class="ace-icon icon icon-angle-double-down   bigger-110 icon-only"></i>
												</button>
												<button type="button" class="btn btn-light btn-xs btn-close">
													<i class="ace-icon icon icon-close   bigger-110 icon-only"></i>
												</button>
											</td>
										</tr>
										<tr class="step-row">
											<td class="xh">3</td>
											<td>
												<textarea rows="1" cols="20" class="form-control step-content" style="width:100%"></textarea>
											</td>
											<td>
												<textarea rows="1" cols="20" class="form-control expect-content" style="width:100%"></textarea>
											</td>
											<td>
												<button type="button" class="btn btn-light btn-xs btn-up">
													<i class="ace-icon icon icon-angle-double-up  bigger-110 icon-only"></i>
												</button>
												<button type="button" class="btn btn-light btn-xs btn-down">
													<i class="ace-icon icon icon-angle-double-down   bigger-110 icon-only"></i>
												</button>
												<button type="button" class="btn btn-light btn-xs btn-close">
													<i class="ace-icon icon icon-close   bigger-110 icon-only"></i>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="btn-file">
								附件</label>
							<div class="col-xs-10">
								<button id="btn-file" type="button" class="btn btn-xs btn-primary">
									<i class="icon-file-text-o"></i> 上传用例附件
								</button>
								<a id="a-file" href="javascript:;" link-url="" download="" style="text-decoration:underline;color:blue"></a>
								<div id="div-file" style="display: none">
									<input id="input-file" name="file" type="file">
								</div>
							</div>
						</div>
					</form>
				</c:when>
				<c:when test="${type=='edit'}">
					<form id="eidtForm" class="form-horizontal" role="form" style="padding: 20px">
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="type">
								<font style="color:red">*</font>用例类型</label>
							<div class="col-xs-3">
								<select id="type" class="col-xs-10">
									<option value="1">功能测试</option>
									<option value="2">性能测试</option>
									<option value="3">配置相关</option>
									<option value="4">安装部署</option>
									<option value="5">安全相关</option>
									<option value="6">接口测试</option>
									<option value="9">其他</option>
								</select>
								<script type="text/javascript">
                                    $("#type").val('${usecase.type}');
								</script>
							</div>
							<label class="col-xs-1 control-label no-padding-right" for="stage">
								<font style="color:red">*</font>适用阶段</label>
							<div class="col-xs-6">
								<select id="stage" class="col-xs-10" multiple="multiple">
									<option value="1">单元测试阶段</option>
									<option value="2">功能测试阶段</option>
									<option value="3">集成测试阶段</option>
									<option value="4">系统测试阶段</option>
									<option value="5">冒烟测试阶段</option>
									<option value="6">版本验证阶段</option>
								</select>
								<input type="text" id="input-stage" value="${usecase.stage}" style="display: none">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="title">
								<font style="color:red">*</font>标题</label>
							<div class="col-xs-10">
								<input type="text" id="title" class="col-xs-10" value="${usecase.title}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="step">
								用例步骤</label>
							<div class="col-xs-11">
								<table id="step">
									<thead>
									<th style="width:4%">编号</th>
									<th style="width: 38%">步骤</th>
									<th style="width: 38%">预期</th>
									<th style="width:14%">操作</th>
									</thead>
									<tbody>
									<%
										List<Usecasestep> usecasestepList=(List)request.getAttribute("usecasestepList");
										for (int i=0;i<usecasestepList.size();i++){
											%>
											<tr class="step-row">
												<td class="xh"><%=usecasestepList.get(i).getXh()%></td>
												<td><textarea rows="1" cols="20" class="form-control step-content" style="width:100%"><%=usecasestepList.get(i).getStep()%></textarea></td>
												<td><textarea rows="1" cols="20" class="form-control expect-content" style="width:100%"><%=usecasestepList.get(i).getExpect()%></textarea></td>
												<td>
													<button type="button" class="btn btn-light btn-xs btn-up">
														<i class="ace-icon icon icon-angle-double-up bigger-110 icon-only"></i>
													</button>
													<button type="button" class="btn btn-light btn-xs btn-down">
														<i class="ace-icon icon icon-angle-double-down bigger-110 icon-only"></i>
													</button>
													<button type="button" class="btn btn-light btn-xs btn-close">
														<i class="ace-icon icon icon-close bigger-110 icon-only"></i>
													</button>
												</td>
											</tr>
											<%
										}
									%>
									</tbody>
								</table>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-1 control-label no-padding-right" for="btn-file">
								附件</label>
							<div class="col-xs-10">
								<button id="btn-file" type="button" class="btn btn-xs btn-primary">
									<i class="icon-file-text-o"></i> 上传用例附件
								</button>
								<a id="a-file" href="<%=Constant.FILE_VIEW_URL%>${usecase.fileurl}" link-url="<%=Constant.FILE_VIEW_URL%>${usecase.fileurl}" download="${usecase.filename}" style="text-decoration:underline;color:blue">${usecase.filename}</a>
								<div id="div-file" style="display: none">
									<input id="input-file" name="file" type="file">
								</div>
							</div>
						</div>
						<input type="text" id="form-id" style="display: none" value="${usecase.id}">
					</form>
				</c:when>
				<c:otherwise>
					<div class="zxy-title">
						<strong>${usecase.title}</strong>
					</div>
					<div class="zxy-body">
						<div class="col-xs-9">
							<fieldset>
								<legend>步骤</legend>
								<div class="zxy-content">
									<table id="step">
										<thead>
										<th style="width:10%">编号</th>
										<th style="width: 38%">步骤</th>
										<th style="width: 38%">预期</th>
										</thead>
										<tbody>
											<%
												List<Usecasestep> usecasestepList=(List)request.getAttribute("usecasestepList");
												for (int i=0;i<usecasestepList.size();i++){
													%>
														<tr class="step-row">
															<td class="xh"><%=usecasestepList.get(i).getXh()%></td>
															<td><%=usecasestepList.get(i).getStep()%></td>
															<td><%=usecasestepList.get(i).getExpect()%></td>
														</tr>
													<%
												}
											%>
										</tbody>
									</table>
								</div>
							</fieldset>
							<fieldset>
								<legend>附件</legend>
								<div class="zxy-content">
									<a id="a-file" href="<%=Constant.FILE_VIEW_URL%>${usecase.fileurl}" link-url="${usecase.fileurl}" download="${usecase.filename}" style="text-decoration:underline;color:blue">${usecase.filename}</a>
								</div>
							</fieldset>
						</div>
						<div class="col-xs-3">
							<fieldset>
								<legend>基本信息</legend>
								<div class="zxy-content">
									<table>
										<tr>
											<td class="tb-name">需求id</td>
											<td class="tb-value">
													${usecase.storyid}
											</td>
										</tr>
										<tr>
											<td class="tb-name">用例类型</td>
											<td class="tb-value">
												<c:if test="${usecase.type=='1'}">
													功能测试
												</c:if>
												<c:if test="${usecase.type=='2'}">
													性能测试
												</c:if>
												<c:if test="${usecase.type=='3'}">
													配置相关
												</c:if>
												<c:if test="${usecase.type=='4'}">
													安装部署
												</c:if>
												<c:if test="${usecase.type=='5'}">
													安全相关
												</c:if>
												<c:if test="${usecase.type=='6'}">
													接口测试
												</c:if>
												<c:if test="${usecase.type=='9'}">
													其他
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="tb-name">适用阶段</td>
											<td class="tb-value">
												<%
													Usecase usecase=(Usecase)request.getAttribute("usecase");
													if(usecase.getStage().indexOf("1")>=0){
													    %>单元测试阶段<br/><%
													}
													if(usecase.getStage().indexOf("2")>=0){
														%>功能测试阶段<br/><%
													}
													if(usecase.getStage().indexOf("3")>=0){
														%>集成测试阶段<br/><%
													}
													if(usecase.getStage().indexOf("4")>=0){
														%>系统测试阶段<br/><%
													}
													if(usecase.getStage().indexOf("5")>=0){
														%>冒烟测试阶段<br/><%
													}
													if(usecase.getStage().indexOf("6")>=0){
														%>版本验证阶段<br/><%
													}
												%>
											</td>
										</tr>
										<tr>
											<td class="tb-name">创建人</td>
											<td class="tb-value">
												${usecase.username}
											</td>
										</tr>
										<tr>
											<td class="tb-name">创建时间</td>
											<td class="tb-value">
													${usecase.createtime}
											</td>
										</tr>
									</table>
								</div>
							</fieldset>
						</div>
					</div>
				</c:otherwise>
 			</c:choose>
		</div>
	</div>
<input type="text" id="form-type" style="display: none" value="${type}">
<input type="text" id="storyid" style="display: none" value="${storyid}">
<script type="text/javascript"
		src="<%=request.getContextPath() %>/js/ajaxfileupload.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/test/usecaseForm.js?v=<%=Constant.VERSION%>"></script>

</body>
</html>