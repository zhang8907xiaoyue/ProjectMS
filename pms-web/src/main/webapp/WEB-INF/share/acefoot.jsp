<!-- basic scripts -->
<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery
			|| document.write("<script src='<%=request.getContextPath() %>/ace/js/jquery-2.0.3.min.js'>"
					+ "<"+"script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=request.getContextPath() %>/ace/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

<script type="text/javascript">
	if ("ontouchend" in document)
		document.write("<script src='<%=request.getContextPath() %>/ace/js/jquery.mobile.custom.min.js'>"
				+ "<"+"script>");
</script>
<!-- 动态监听，如die() -->
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ace/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ace/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<!--[if lte IE 8]>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ace/js/excanvas.min.js"></script>
<![endif]-->
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/chosen.jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.knob.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.autosize.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.dragsort-0.5.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/bootstrap-tag.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/ace-elements.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/ace.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/date-time/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/date-time/bootstrap-timepicker.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/date-time/moment.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/date-time/daterangepicker.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jqGrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ace/js/jqGrid/i18n/grid.locale-zh-CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/tree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/tree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/tree/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/echarts.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/regularUtil.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/common.js"></script>