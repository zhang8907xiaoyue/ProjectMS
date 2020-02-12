$(function(){
    //初始化项目
    $.ajax({
        url: common.getContextPath()+'/base/getProjectList.do',
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
                $('#project').html('');
                $('#project').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#project').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                }
            }
        }
    });
	$("#name").die().live("keyup", function () {
        regularUtil.check_chars($('#name'));
        if($.trim($(this).val()).length>100){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('客户名称长度超过100', '#name');
        	});
        }
    });
	$("#listid").die().live("keyup", function () {
        regularUtil.number_only($('#listid'));
        if($.trim($(this).val()).length>5){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('序号长度超过5', '#listid');
        	}); 
        }
    });
	//保存
	$('#btn-save').die().live('click',function(){
		var formType=$('#form-type').val();
		if(formType=="new"){
			insertRecord();
		}else{
			var id=$('#form-id').val();
			updateRecord(id);
		}
	});
	//重置
	$('#btn-reset').die().live('click',function(){
		$('#productForm')[0].reset();
	});
});

function insertRecord(){
    var projectid=$('#project').val();
	var name=$.trim($('#name').val());
	var status=$("input[name='status']:checked").val();
	var listid=$.trim($('#listid').val());
    if(projectid.length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择项目', '#project');
        });
        return false;
    }
	if(name.length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入客户名称', '#name');
    	}); 
		return false;
	}
	if(name.length>100){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('客户名称超过100个字符', '#name');
    	});  
		return false;
	}
	if(listid.length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入序号', '#listid');
    	}); 
		return false;
	}
	if(listid.length>5){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('序号超过5个字符', '#listid');
    	}); 
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/base/insertCustomer.do',
        type: 'Post',
        dataType: "json",
        data:{
            projectid:projectid,
            name:name,
        	status:status,
        	listid:listid
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
	var name=$.trim($('#name').val());
	var status=$("input[name='status']:checked").val();
	var listid=$.trim($('#listid').val());

	if(name.length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入客户名称', '#name');
    	}); 
		return false;
	}
	if(name.length>100){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('客户名称超过100个字符', '#name');
    	});  
		return false;
	}
	if(listid.length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入序号', '#listid');
    	}); 
		return false;
	}
	if(listid.length>5){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('序号超过5个字符', '#listid');
    	}); 
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/base/updateCustomer.do',
        type: 'Post',
        dataType: "json",
        data:{
        	id:id,
            name:name,
        	status:status,
        	listid:listid
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