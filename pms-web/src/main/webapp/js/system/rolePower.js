$(function(){
	$.ajax({
        url: common.getContextPath()+'/system/getRolePowerList.do',
        type: 'Post',
        data: {
        	roleid: $('#roleid').val()
        },
        dataType: "json",
        async: true,
        success: function (data) {
			if (data.success == false) {
				top.layui.use('layer', function() {
					var layer = top.layui.layer;
					layer.open({
						content : data.msg,
						scrollbar : false
					});
				});
			} else {
				for(var i=0;i<data.length;i++){
            		$('input[type="checkbox"]').each(function(){
            			if($(this).attr('link-id')==data[i].id){
        					$(this).attr('checked',true);
            			}
            		});
            	}
			}
        }
    });
	//监听模块checkbox点击事件
	$('.qx-mk').die().live('click',function(){
		var _this=$(this);
		var yyid=$(_this).attr('link-id');
		if ($(_this).attr('checked')) {
			$('.qx-nr').each(function(){
				if($(this).attr('link-parentsid')==yyid){
					$(this).attr('checked',true);
				}
			});
		}else{
			$('.qx-nr').each(function(){
				if($(this).attr('link-parentsid')==yyid){
					$(this).attr('checked',false);
				}
			});
		}
	});
});

function insertRecord(){
	var ids="";
	$('.qx-mk').each(function(){
		if($(this).attr('checked')){
			ids+=$(this).attr('link-id')+',';
		}
	});
	$('.qx-nr').each(function(){
		if($(this).attr('checked')){
			ids+=$(this).attr('link-id')+',';
		}
	});
	$.ajax({
        url: common.getContextPath()+'/system/insertRolePower.do',
        type: 'Post',
        data: {
        	roleid: $('#roleid').val(),
        	appids: ids//将数组元素拼成","形式的字符串
        },
        dataType: "json",
        async: true,
        success: function (data) {
			if (data.success == false) {
				top.layui.use('layer', function() {
					var layer = top.layui.layer;
					layer.open({
						content : data.msg,
						scrollbar : false
					});
				});
			} else {
				top.layui.use('layer', function(){
	      			  var layer = top.layui.layer;
	              	  layer.msg(data.msg, {
	    				  time: 2000 //2s后自动关闭
	    			  });
	      		}); 
			}
        }
    });
}
