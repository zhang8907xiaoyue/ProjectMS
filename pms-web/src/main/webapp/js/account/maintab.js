$(function(){
	layui.use('element', function() {
		var element = layui.element(); // 导航的hover效果、二级菜单等功能，需要依赖element模块

		// 监听导航点击
		element.on('nav(nav)', function(elem) {
			// console.log(elem)
			layer.msg(elem.text());
		});
	});
	//addTab('/zdry/zdryyj.do','重点人员预警',common.getContextPath()+'/zdry/zdryyj.do');
	$(window).resize(function() {
		onResize();
	});
});

/**
 * 页面尺寸变化
 */
function onResize(){
	//重新设定当前Selected的tab的iframe的高度
	$('.layui-tab-content .layui-show iframe').css('height',window.parent.innerHeight-parent.$('#navbar').height()-$('.layui-tab-title').height()-20);
}

/**
 * 添加tab页
 */
function addTab(id,title,url){
	layui.use('element', function() {
		var height=window.parent.innerHeight-parent.$('#navbar').height()-$('.layui-tab-title').height()-20;
		var element = layui.element();
		if($('li[lay-id="'+id+'"]').length<=0){
			//不存在子tab则新增
			element.tabAdd('main-tab', {
				id : id,
				title : title,
				content : '<iframe scrolling="auto" frameborder="0"  src="' + url
						+ '" style="width:100%;height:'+height+'px;"></iframe>' //支持传入html
			});
		}
		element.tabChange('main-tab', id); //切换到 lay-id="yyy" 的这一项
	});
}