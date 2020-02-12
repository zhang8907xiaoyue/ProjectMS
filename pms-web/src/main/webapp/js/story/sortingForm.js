$(function(){
    //日期控件初始化
    $('.date-picker').datepicker({
        language : 'zh-CN',
        autoclose : true,
        todayHighlight : true,
        autoclose : true
    }).next().on(ace.click_event, function() {
        $(this).prev().focus();
    });
    //初始化指派对象
    $.ajax({
        url: common.getContextPath()+'/system/getUserList.do',
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
                $('#assignto').html('');
                $('#assignto').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#assignto').append('<option value="'+data[i].id+'">'+data[i].realname+'</option>');
                }
                if($('#form-type').val()=='edit'){
                    $("#assignto").val($('#input-assignto').val());
                }
                $("#assignto").chosen();
            }
        }
    });
    $("#estimate").die().live("keyup", function () {
        regularUtil.number_only($('#estimate'));
        if($.trim($(this).val()).length>5){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.tips('工时长度超过5', '#estimate');
            });
        }
    });
	$("#title").die().live("keyup", function () {
        regularUtil.check_chars($('#title'));
        if($.trim($(this).val()).length>50){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('标题长度超过50', '#title');
        	}); 
        }
    });

});

function insertRecord(){
    var storyid=$('#storyid').val();
	var rwtype=$('#rwtype').val();
    var assignto=$('#assignto').find("option:selected").val();
    var estimate=$('#estimate').val();
    var deadline=$('#deadline').val();
    var title=$('#title').val();
    var content=contentEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    if($.trim(assignto).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择指派人员', '#assignto');
        });
        return false;
    }
    if($.trim(estimate).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入预计工时', '#estimate');
        });
        return false;
    }
    if($.trim(deadline).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择截至时间', '#deadline');
        });
        return false;
    }
	if($.trim(title).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入标题', '#title');
    	}); 
		return false;
	}
    if($.trim(estimate).length>5){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('预计工时超过5个字符', '#estimate');
        });
        return false;
    }
	if($.trim(title).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('标题超过50个字符', '#title');
    	});
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/task/insertTask.do',
        type: 'Post',
        dataType: "json",
        data:{
            storyid:storyid,
            rwtype:rwtype,
            assignto:assignto,
            estimate:estimate,
            deadline:deadline,
            title:title,
            content:content
        },
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
                top.layui.use('layer', function(){
                    var layer = top.layui.layer;
                    layer.closeAll('iframe');
                    layer.msg(data.msg, {
                        time: 2000 //2s后自动关闭
                    });
                });
            }
        }
	});
}

function updateRecord(id){
    var rwtype=$('#rwtype').val();
    var assignto=$('#assignto').find("option:selected").val();
    var estimate=$('#estimate').val();
    var deadline=$('#deadline').val();
    var title=$('#title').val();
    var content=contentEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    if($.trim(assignto).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择指派人员', '#assignto');
        });
        return false;
    }
    if($.trim(estimate).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入预计工时', '#estimate');
        });
        return false;
    }
    if($.trim(deadline).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择截至时间', '#deadline');
        });
        return false;
    }
    if($.trim(title).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入标题', '#title');
        });
        return false;
    }
    if($.trim(estimate).length>5){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('预计工时超过5个字符', '#estimate');
        });
        return false;
    }
    if($.trim(title).length>50){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('标题超过50个字符', '#title');
        });
        return false;
    }
    $.ajax({
        url: common.getContextPath()+'/task/updateTask.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            rwtype:rwtype,
            assignto:assignto,
            estimate:estimate,
            deadline:deadline,
            title:title,
            content:content
        },
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
                top.layui.use('layer', function(){
                    var layer = top.layui.layer;
                    layer.closeAll('iframe');
                    layer.msg(data.msg, {
                        time: 2000 //2s后自动关闭
                    });
                });
            }
        }
    });
}
