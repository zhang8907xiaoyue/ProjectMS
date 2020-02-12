$(function(){
    leftMenuShow(-1);
	//root菜单点击事件
	$('#menu-root li a').die().live('click',function(){
		var _this=$(this);
        $('#menu-root li a').removeClass('active');
        $(_this).addClass('active');
		var linked=$(_this).attr('link-id');
        leftMenuShow(linked);
	});
	addTab('home.do','欢迎页',common.getContextPath()+'/account/home.do');
	//左侧菜单点击事件
	$('.menu-link').die().live('click',function(){
		_this=$(this);
		$('.menu-link.active').removeClass('active');
		_this.addClass('active');
		var id=_this.attr('link-value');
		var url=common.getContextPath()+id;
		var title=_this.attr('link-text');
		addTab(id,title,url);
	});
	layui.use('element', function() {
		var element = layui.element(); // 导航的hover效果、二级菜单等功能，需要依赖element模块

		// 监听导航点击
		element.on('nav(nav)', function(elem) {
			// console.log(elem)
			layer.msg(elem.text());
		});
	});
	//addTab('/zdry/zdryyj.do','重点人员预警',common.getContextPath()+'/zdry/zdryyj.do');
	onResize();
	$(window).resize(function() {
		  onResize();
	});
	//阻止浏览器默认右键点击事件
	$(".layui-tab-title").bind("contextmenu", function(){
	    return false;
	});
	//菜单右击事件
	$(".layui-tab-title").mousedown(function(e){
		if (3 == e.which) {
		    $('#menu').css('left',e.pageX+10+'px');
		    $('#menu').css('top',e.pageY+10+'px');
		    $('#menu').css('display','block');
		}
	});
	$('#menu').on({ 
		mouseover : function(){  
    		$('#menu').css('display','block'); 
        },  
        mouseout : function(){  
    		$('#menu').css('display','none'); 
        }   
    });
	$("body").click(function(e){
		$('#menu').css('display','none');
	});
	//tab右击，选中当前页
	$('.layui-tab-title>li').die().live('mousedown',function(e){
		if (3 == e.which) {
			var id=$(this).attr('lay-id');
			layui.use('element', function() {
				var element = layui.element();
				element.tabChange('main-tab', id);
			});
		}
	});
	//刷新tab事件
	$('#tab-refresh').die().live('click',function(){
		$('.layui-show>iframe').attr('src', $('.layui-show>iframe').attr('src'));
	});
	//关闭tab事件
	$('#tab-close').die().live('click',function(){
		layui.use('element', function() {
			var element = layui.element();
			var id=$('.layui-this').attr('lay-id');
			element.tabDelete('main-tab', id);
		});
	});
	//关闭所有tab事件
	$('#tab-closeall').die().live('click',function(){
		layui.use('element', function() {
			var element = layui.element();
			$('.layui-tab-title>li').each(function(){
				var id=$(this).attr('lay-id');
				element.tabDelete('main-tab', id);
			});
		});
	});
	//关闭所有tab事件
	$('#tab-closeother').die().live('click',function(){
		//获取当前选中的页签
		var selectedId=$('.layui-this').attr('lay-id');
		layui.use('element', function() {
			var element = layui.element();
			$('.layui-tab-title>li').each(function(){
				var id=$(this).attr('lay-id');
				if(selectedId!=id){
					element.tabDelete('main-tab', id);
				}
			});
		});
	});
	$('#changepassword').die().live('click',function(){
		top.layui.use('layer', function(){
        	var layer = top.layui.layer;
            layer.open({
            	type: 2,
				title : '修改密码',
				shadeClose : true,
				area : [ '500px', '290px'  ],
            	content: common.getContextPath()+'/account/changepassword.do',
            	btn: ['提交', '取消'],
				yes: function(index, layero){
					var body = layer.getChildFrame('body', index);
					var iframeid=layero.find('iframe')[0]['name'];//获取Iframe的id
					top.$('#' + iframeid)[0].contentWindow.updateRecord('1');
					
				},
				cancel: function(){ 
					top.layui.use('layer', function(){
	  	      			  var layer = top.layui.layer;
	  	      			  layer.closeAll('iframe');
	  	      		}); 
				}
            });
        });
	});
});

/**
 * 页面尺寸调整
 */
function onResize(){
	$("#mainTab").css('height',$(window).height()-
			$('#navbar').height()-4);
	//重新设定当前Selected的tab的iframe的高度
	$('.layui-tab-content .layui-show iframe').css('height',window.parent.innerHeight-parent.$('#navbar').height()-$('.layui-tab-title').height()-12);
}

/**
 * layer打开
 */
function dialogOpen(title,content,closed,width,height){
	layui.use('layer', function(){
		  var area=null;
		  if((width==null||width=="")&&(height==null||height=="")){
			  width=$(window).outerWidth()*0.7;
			  height=$(window).outerHeight()*0.7;
		  }else if(width.indexOf('%')>=0){
			  width=$(window).outerWidth()*(width.substring(0,width.length-1)/100);
			  height=$(window).outerHeight()*(height.substring(0,height.length-1)/100);
		  }
		  var layer = layui.layer;
		  layer.open({
				type : 2,
				title : title,
				shadeClose : true,
				maxmin : true, // 开启最大化最小化按钮
				area : [ width+'px', height+'px' ],
				content : content,
				end: function(){ 
					closed();
				}  
		  });
	});
}

/**
 * 左侧菜单显示
 */
function leftMenuShow(linked){
	$.ajax({
		url : common.getContextPath() + '/account/getLeftMenuTree.do',
		type : 'Post',
		data:{parentid:linked},
		dataType : "json",
		async : true,
		success : function(data) {
			if (data.success == false) {
				top.layui.use('layer', function(){
	    			  var layer = top.layui.layer;
	    			  layer.open({
	    				  content: data.msg,
	    				  scrollbar: false
	    			  });
	    		});
			} else {
				$('#left-menu').html('');
				for(var i=0;i<data.length;i++){
					var id='menu_'+data[i]["id"];
					var menuTemp='<li><a href="#'+id+'" data-toggle="collapse" class="collapsed"><i class="'+data[i]["iconCls"]+'"></i> <span>'+data[i]["text"]+'</span>';
					if(data[i].children!=null){
						menuTemp+=' <i class="icon-submenu lnr lnr-chevron-left"></i>';
					}
					menuTemp+='</a>';
					if(data[i].children!=null){
						menuTemp=leftMenuCall(menuTemp,data[i].children,id);
					}
					menuTemp+='</li>';
					$('#left-menu').append(menuTemp);
				}
			}
		}
	});
}

/**
 * 菜单遍历回调函数
 * @param menuTemp 菜单字符串
 * @param data 字菜单
 * @param targetid 字母块关联id
 */
function leftMenuCall(menuTemp,data,targetid){
	menuTemp+='<div id="'+targetid+'" class="collapse "><ul class="nav">';
	for(var i=0;i<data.length;i++){
		if(data[i].attributes[0].type=="0"){
			//分类
			var id='menu_'+data[i]["id"];
			menuTemp+='<li><a href="#'+id+'" data-toggle="collapse">'+data[i]["text"];
			if(data[i].children!=null){
				menuTemp+='<i class="icon-submenu lnr lnr-chevron-left"></i>';
			}
			menuTemp+='</a>';
			if(data[i].children!=null){
				menuTemp=leftMenuCall(menuTemp,data[i].children,id);
			}
			menuTemp+='</li>';
		}else{
			//菜单
			menuTemp+='<li><a class="menu-link" link-id="'+data[i]["id"]+'" link-value="'+data[i]["url"]+'" link-text="'+data[i]["text"]+'" href="javascript:void(0)">'+data[i]["text"]+'</a></li>';
		}
	}
	menuTemp+='</ul></div>';
	return menuTemp;
}

/**
 * 添加tab页
 */
function addTab(id,title,url){
	layui.use('element', function() {
		var height=window.parent.innerHeight-parent.$('#navbar').height()-$('.layui-tab-title').height()-12;
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
		$('.layui-show>iframe').attr('src', $('.layui-show>iframe').attr('src'));
	});
}

function getWdith(){
	return $(window).outerWidth();
}

function getHeight(){
    return $(window).outerHeight();
}