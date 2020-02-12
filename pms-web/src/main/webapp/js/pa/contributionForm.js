$(function(){
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
                $('#employee').html('');
                $('#employee').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#employee').append('<option value="'+data[i].id+'">'+data[i].realname+'</option>');
                }
                if($('#form-type').val()=='edit'){
                    $("#employee").val($('#input-employee').val());
                }
                $("#employee").chosen();
            }
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

    var employeeid=$('#employee').find("option:selected").val();
    var title=$('#title').val();
    var content=contentEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    if($.trim(employeeid).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择姓名', '#employee');
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
	if($.trim(title).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('标题超过50个字符', '#title');
    	});
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/pa/insertContribution.do',
        type: 'Post',
        dataType: "json",
        data:{
            employeeid:employeeid,
            status:1,
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
    var employeeid=$('#employee').find("option:selected").val();
    var title=$('#title').val();
    var content=contentEditor.html();

    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    if($.trim(employeeid).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择姓名', '#employee');
        });
        return false;
    }
    if($.trim(title).length==0){0
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入标题', '#title');
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
        url: common.getContextPath()+'/pa/updateContribution.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            employeeid:employeeid,
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
