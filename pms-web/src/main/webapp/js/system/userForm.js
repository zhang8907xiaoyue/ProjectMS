$(function(){
	$("#name").die().live("keyup", function () {
        regularUtil.check_chars($('#name'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('登录名长度超过25', '#name');
        	}); 
        }
    });
	$("#realname").die().live("keyup", function () {
        regularUtil.check_chars($('#realname'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('真实姓名长度超过25', '#realname');
        	}); 
        }
    });
	$("#password").die().live("keyup", function () {
        regularUtil.check_chars($('#password'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('密码长度超过25', '#password');
        	}); 
        }
    });
    $("#email").die().live("keyup", function () {
        if($.trim($(this).val()).length>20){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.tips('邮箱长度超过20', '#email');
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
		$('#userForm')[0].reset();
		$('#orgParent').val('');
		$('#orgParent').attr('link-parentid','');
		$('#power').val('');
		$('#power').attr('link-parentid','');
	});
});

function insertRecord(){
	var name=$('#name').val();
	var realname=$('#realname').val();
	var password=$('#password').val();
    var type=$('#type').val();
    var email=$('#email').val();
	var status=$("input[name='status']:checked").val();
	var orgid=$('#organization').val();
	var listid=$('#listid').val();
	if($.trim(name).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入登录名', '#name');
    	}); 
		return false;
	}
	if($.trim(name).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('登录名超过50个字符', '#name');
    	}); 
		return false;
	}
	if($.trim(realname).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入真实姓名', '#realname');
    	}); 
		return false;
	}
	if($.trim(realname).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('真实姓名超过25个字符', '#realname');
    	}); 
		return false;
	}
	if($.trim(password).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入密码', '#password');
    	}); 
		return false;
	}
	if($.trim(password).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('密码超过25个字符', '#password');
    	}); 
		return false;
	}
    if($.trim(type).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择用户类型', '#type');
        });
        return false;
    }
    if($.trim(email).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入邮箱', '#email');
        });
        return false;
    }
    if($.trim(email).length>20){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('邮箱超过20个字符', '#email');
        });
        return false;
    }
	if(orgid==null||orgid==''){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请选择部门', '#organization');
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
        url: common.getContextPath()+'/system/insertUser.do',
        type: 'Post',
        dataType: "json",
        data:{
        	name:name,
        	realname:realname,
        	password:password,
            type:type,
            email:email,
        	status:status,
        	orgid:orgid,
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
	          		$('#userForm')[0].reset();
            	}
            	
            }
        }
	});
}

function updateRecord(id){
	var name=$('#name').val();
	var realname=$('#realname').val();
	var password=$('#password').val();
    var type=$('#type').val();
    var email=$('#email').val();
	var status=$("input[name='status']:checked").val();
	var orgid=$('#organization').val();
	var listid=$('#listid').val();
	if($.trim(name).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入登录名', '#name');
    	}); 
		return false;
	}
	if($.trim(name).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('登录名超过50个字符', '#name');
    	}); 
		return false;
	}
	if($.trim(realname).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入真实姓名', '#realname');
    	}); 
		return false;
	}
	if($.trim(realname).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('真实姓名超过25个字符', '#realname');
    	}); 
		return false;
	}
	if($.trim(password).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入密码', '#password');
    	}); 
		return false;
	}
	if($.trim(password).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('密码超过25个字符', '#password');
    	}); 
		return false;
	}
    if($.trim(type).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择用户类型', '#type');
        });
        return false;
    }
    if($.trim(email).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入邮箱', '#email');
        });
        return false;
    }
    if($.trim(email).length>20){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('邮箱超过20个字符', '#email');
        });
        return false;
    }
	if(orgid==null||orgid==''){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请选择部门', '#organization');
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
        url: common.getContextPath()+'/system/updateUser.do',
        type: 'Post',
        dataType: "json",
        data:{
        	id:id,
        	name:name,
        	realname:realname,
        	password:password,
            type:type,
            email:email,
        	status:status,
        	orgid:orgid,
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