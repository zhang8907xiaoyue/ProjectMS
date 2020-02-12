$(function() {
	widgetInit();
	//监听文件上传事件
	$('input[name="file"]').live('change', function () {
		var id=$(this).attr('id');
		$.ajaxFileUpload({
            url: 'file_Add.do',
            type: 'Post',
            secureuri: false,
            data: {
                sjbh: $.trim($('#sjbh').val()),
                type: 1//类型：1，文件；2，图片；3，视频。管理系统只上传文件
            },
            dataType: "json",
            async: true,
            fileElementId: id, //file控件id
            beforeSend: function () {
          	  	webframe.$.messager.progress({
                    text: "processing..."
                });
            },
            error : function(jqXHR, textStatus, errorThrown) {
          	  	webframe.$.messager.alert('错误', "上传失败，请上传word文档或者excel，且不能大于1M！", 'error');
    		},
    		complete:function () {
          	  	webframe.$.messager.progress('close');
    		},
            success: function (data) {
          	  if (data.success==false) {
          		  webframe.$.messager.alert('文件上传失败', data.msg, 'warning');
                } else {
                	webframe.$.messager.show({
                        title: '提示',
                        msg: '附件上传成功'
                    });
                	var ftpUrl=$.trim($('#ftpUrl').val());
                	$('.table-body').append('<tr><td>'+data.fjbh+'</td>'+
                		'<td>'+data.sjbh+'</td>'+	
                		'<td>'+data.name+'</td>'+
                		'<td><a href="' + ftpUrl + '/' + data.url + '" title="下载" ">下载</a>&nbsp;&nbsp;' +
                        '<a class="fileDelete newFileDelete" href="javascript:void(0)" title="删除" delete-link="' + data.id + '"">删除</a></td>'+
                		'</tr>');
                    
                }
            }
        });
	});
	//删除附件
	$('.fileDelete').die().live('click', function() {
		_this=$(this);
		$.ajax({
			url : 'file_Delete.do',
			type : 'Post',
			secureuri : false,
			data : {
				id : _this.attr('delete-link')
			},
			dataType : "json",
			async : true,
			fileElementId : 'file', //file控件id
			beforeSend : function() {
				webframe.$.messager.progress({
					text : "processing..."
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				webframe.$.messager.alert('错误', errorThrown, 'error');
			},
			complete : function() {
				webframe.$.messager.progress('close');
			},
			success : function(data) {
				if (data.success == false) {
					webframe.$.messager.alert('附件上传失败', data.msg, 'warning');
				} else {
					webframe.$.messager.show({
						title : '提示',
						msg : data.msg
					});
					_this.parent().parent().remove();
				}
			}
		});
	});
	
});

/**
 * 组件初始化
 */
function widgetInit(){
	//禁用页面点击事件
	$('body').bind('contextmenu',function(){
	    return false;
	}); 
	$.ajax({
		url : '',
		type : 'Post',
		secureuri : false,
		data : {
//			sjbh: $.trim($('#sjbh').val())
		},
		dataType : "json",
		async : true,
		fileElementId : 'file', //file控件id
		beforeSend : function() {
			webframe.$.messager.progress({
				text : "processing..."
			});
		},
//		error : function(jqXHR, textStatus, errorThrown) {
//			webframe.$.messager.alert('错误', errorThrown, 'error');
//		},
		complete : function() {
			webframe.$.messager.progress('close');
		},
		success : function(data) {
			if (data.success == false) {
				webframe.$.messager.alert('附件获取失败', data.msg, 'warning');
			} else {
				for(var i=0;i<data.length;i++){
					$('.table-body').append('<tr><td>'+data[i].fjbh+'</td>'+
	                		'<td>'+$.trim($('#sjbh').val())+'</td>'+	
	                		'<td>'+data[i].name+'</td>'+
	                		'<td><a href="' + ftpUrl + '/' + data[i].url + '" title="下载" ">下载</a>&nbsp;&nbsp;' +
	                        '<a class="fileDelete" href="javascript:void(0)" title="删除" delete-link="' + data[i].id + '"">删除</a></td>'+
	                		'</tr>');
				}
			}
		}
	});
}



