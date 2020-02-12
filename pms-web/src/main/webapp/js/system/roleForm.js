$(function(){
	$("#name").die().live("keyup", function () {
        regularUtil.check_chars($('#name'));
        if($.trim($(this).val()).length>50){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('角色名称长度超过50', '#name');
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
		$('#orgForm')[0].reset();
		$('#orgParent').val('');
		$('#orgParent').attr('link-parentid','');
	});
});

function insertRecord(){
	var name=$('#name').val();
	var status=$("input[name='status']:checked").val();
	var listid=$('#listid').val();
	if($.trim(name).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入角色名称', '#name');
    	}); 
		return false;
	}
	if($.trim(name).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('角色名称超过50个字符', '#name');
    	});  
		return false;
	}
	if($.trim(listid).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入序号', '#listid');
    	}); 
		return false;
	}
	if($.trim(listid).length>5){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('序号超过5个字符', '#listid');
    	}); 
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/system/insertRole.do',
        type: 'Post',
        dataType: "json",
        data:{
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
            	if(!$('#continue').attr('checked')){
            		top.layui.use('layer', function(){
	  	      			  var layer = top.layui.layer;
	  	      			  layer.closeAll('iframe');
		              	  layer.msg(data.msg, {
		    				  time: 2000 //2s后自动关闭
		    			  });
	  	      		}); 
            	}else{
            		//继续新增
                	top.layui.use('layer', function(){
	  	      			  var layer = top.layui.layer;
	  	              	  layer.msg(data.msg, {
	  	    				  time: 2000 //2s后自动关闭
	  	    			  });
	  	      		}); 
                	$('#roleForm')[0].reset();
            	}
            }
        }
	});
}

function updateRecord(id){
	var name=$('#name').val();
	var status=$("input[name='status']:checked").val();
	var listid=$('#listid').val();
	if($.trim(name).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入角色名称', '#name');
    	}); 
		return false;
	}
	if($.trim(name).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('角色名称超过50个字符', '#name');
    	});  
		return false;
	}
	if($.trim(listid).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入序号', '#listid');
    	}); 
		return false;
	}
	if($.trim(listid).length>5){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('序号超过5个字符', '#listid');
    	}); 
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/system/updateRole.do',
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