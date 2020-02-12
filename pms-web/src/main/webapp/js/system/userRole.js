$(function(){
	$.ajax({
        url: common.getContextPath()+'/system/getRoleList.do',
        type: 'Post',
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
				$('#roleList').html('');
				for ( var i = 0; i < data.length; i++) {
					$('#roleList').append(
							'<li class="notSelect" link-id="' + data[i].id + '">' + data[i].name
									+ '</li>');
				}
			}
        }
    });
	$.ajax({
        url: common.getContextPath()+'/system/getUserRoleList.do',
        type: 'Post',
        dataType: "json",
        async: true,
        data: {
        	userid: $('#userid').val()
        },
        success: function (data) {
      	  	if (data.success==false) {
	      		top.layui.use('layer', function() {
					var layer = top.layui.layer;
					layer.open({
						content : data.msg,
						scrollbar : false
					});
				});
      	  	} else {
                $('#roleSelected').html('');
                for(var i=0;i<data.length;i++){
                	$('#roleSelected').append('<li class="selected" link-selected-id="'+data[i].id+'">'+data[i].name+'</li>');
                }
            }
        }
    });
	$('.notSelect').die().live('click',function(){
		var id=$(this).attr('link-id');
		var name=$(this).html();
		if($('li[link-selected-id="'+id+'"]').length==0){
			$('#roleSelected').append('<li link-selected-id="'+id+'">'+name+'</li>');
		}
	});
	$('#roleSelected').find('li').die().live('click',function(){
		$(this).remove();
	});
});

function insertRecord(){
	var ids = [];
	$("#roleSelected").find('li').each(function(){
		ids.push($(this).attr('link-selected-id'));
	});
	$.ajax({
        url: common.getContextPath()+'/system/insertUserRole.do',
        type: 'Post',
        data: {
        	userid: $('#userid').val(),
        	roleids: $.trim(ids.join(","))//将数组元素拼成","形式的字符串
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
