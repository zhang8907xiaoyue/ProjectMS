<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jschrj.common.Constant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>过往</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<jsp:include page="../share/acehead.jsp"></jsp:include>
	<style>
		html,body{
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
			font-family: "Microsoft Yahei", "Hiragino Sans GB", "Helvetica Neue", Helvetica, tahoma, arial, Verdana, sans-serif, "WenQuanYi Micro Hei", "\5B8B\4F53";
		}
		ul,li {
			margin: 0;
			padding: 0;
			list-style: none;
		}
		h3,h4,p {
			margin: 0;
			padding: 0;
		}
		.fl {
			float: left;
		}
		.clearfix::after {
			content: '';
			display: block;
			clear: both;
		}
		.gzt-ct * {
			box-sizing: border-box;
		}
		.gzt-ct {
			width: 100%;
			height: 100vh;
			background-color: #efefef;
		}
		.gzt-item {
			box-sizing: border-box;
			width: 100%;
			display: flex;
		}
		.item-height {
			height: 40vh;
		}

		.item-height2 {
			height: 56vh;
			margin-top: 2vh;
		}

		.box-right {
			width: 48%;
			height: 100%;
			border-radius: 7px;
			box-shadow: 2px 2px 7px #a0a0a0;
			background-color: #fff;
			margin: 5px;
		}

		.box {
			width: 99%;
			height: 100%;
			border-radius: 7px;
			box-shadow: 2px 2px 7px #a0a0a0;
			background-color: #fff;
			margin: 5px;
			margin-right: 14px;
		}

		/* 工作台卡片样式 */
		.gzt-cards {
			width: 50%;
			height: 100%;
			margin:5px;
			border-radius: 7px;
			box-shadow: 2px 2px 7px #a0a0a0;
			background-color: #fff;
		}
		.gzt-cards li {
			width: 50%;
			height: 50%;
			padding: 1%;
			border-left: 1px solid #b5b5b5;
			cursor: pointer;
		}
		.gzt-cards li:nth-child(1),.gzt-cards li:nth-child(2) {
			border-bottom: 1px solid #b5b5b5;
		}
		.gzt-cards li:nth-child(1),.gzt-cards li:nth-child(3) {
			border-left: none;
		}
		.cards-item {
			display: flex;
			justify-content: center;
			align-items: center;
			color: #1b6fc9;
		}
		.cards-img {
			width: 65px;
			margin-right: 20px;
		}
		.cards-img img {
			width: 100%;
		}
		.cards-info h4 {
			margin-top: 3px;
			color: #615f5f;
		}
		.cards-val {
			font-weight: 700;
			font-size: 24px;
		}

		@media screen and (max-width: 1200px) {
			.item-height{
				height: 40vh;
			}
			.item-height2{
				height: 60vh;
			}
		}
	</style>
</head>
<body>
<!-- 工作台外层容器 -->
<div class="gzt-ct">
	<div class="gzt-item item-height">
		<ul class="gzt-cards clearfix">
			<li class="cards-item fl" link="task">
				<div class="cards-img">
					<img src="<%=request.getContextPath() %>/images/home/grdb.png" alt="">
				</div>
				<div class="cards-info">
					<p><span class="cards-val" id="task">0</span>件</p>
					<h4>我的任务</h4>
				</div>
			</li>

			<li class="cards-item fl" link="bug">
				<div class="cards-img">
					<img src="<%=request.getContextPath() %>/images/home/yqsp.png" alt="">
				</div>
				<div class="cards-info">
					<p><span class="cards-val" id="bug">0</span>件</p>
					<h4>我的bug</h4>
				</div>
			</li>

			<li class="cards-item fl" link="test">
				<div class="cards-img">
					<img src="<%=request.getContextPath() %>/images/home/bgsp.png" alt="">
				</div>
				<div class="cards-info">
					<p><span class="cards-val" id="test">0</span>件</p>
					<h4>待测试</h4>
				</div>
			</li>

			<li class="cards-item fl" link="release">
				<div class="cards-img">
					<img src="<%=request.getContextPath() %>/images/home/thsp.png" alt="">
				</div>
				<div class="cards-info">
					<p><span class="cards-val" id="release">0</span>件</p>
					<h4>待发布</h4>
				</div>
			</li>
		</ul>
		<div class="box-right">
			<div id="projectChart"  style="width: 100%;height: 100%;"></div>
		</div>
	</div>

	<div class="gzt-item item-height2">
		<div class="box">
			<div id="sourceChart"  style="width: 100%;height: 100%;"></div>
		</div>
	</div>
</div>
<jsp:include page="../share/acefoot.jsp"></jsp:include>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/echarts.js"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/account/home.js?v=<%=Constant.VERSION%>"></script>
</body>
</html>
