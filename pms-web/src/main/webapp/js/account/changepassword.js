$(function(){
	$("#oldpassword").die().live("keyup", function () {
        regularUtil.check_chars($('#oldpassword'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('旧密码长度超过25', '#oldpassword');
        	}); 
        }
    });
	$("#newpassword").die().live("keyup", function () {
        regularUtil.check_chars($('#newpassword'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('新密码长度超过25', '#newpassword');
        	}); 
        }
    });
	$("#confirmpassword").die().live("keyup", function () {
        regularUtil.check_chars($('#confirmpassword'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('确认密码长度超过25', '#confirmpassword');
        	}); 
        }
    });
});

function updateRecord(id){
	var oldpassword=$.trim($('#oldpassword').val());
	var newpassword=$.trim($('#newpassword').val());
	var confirmpassword=$.trim($('#confirmpassword').val());
	if(oldpassword.length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入旧密码', '#oldpassword');
    	}); 
		return false;
	}
	if(oldpassword.length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('旧密码超过25个字符', '#oldpassword');
    	}); 
		return false;
	}
	if(newpassword.length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入新密码', '#newpassword');
    	}); 
		return false;
	}
	if(newpassword.length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('新密码超过25个字符', '#newpassword');
    	}); 
		return false;
	}
	if(confirmpassword.length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入确认密码', '#confirmpassword');
    	}); 
		return false;
	}
	if(confirmpassword.length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('确认密码超过25个字符', '#confirmpassword');
    	}); 
		return false;
	}
	if(newpassword!=confirmpassword){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('两次输入的密码不一致', '#confirmpassword');
    	}); 
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/system/updatePassword.do',
        type: 'Post',
        dataType: "json",
        data:{
        	oldpassword:oldpassword,
        	newpassword:newpassword
        },
        async: false,
        success: function (data) {
        	if (data.success==false) {
        		//错误提示
        		top.layui.use('layer', function(){
	      			  var layer = top.layui.layer;
	      			  layer.open({
	      				  content: data.msg,
	      				  scrollbar: false
	      			  });
	      		});  
        		return false;
            } else {
            	parent.window.location = common.getContextPath()+"/account/logOut.do";
            	//成功提示
//            	top.layui.use('layer', function(){
//	      			  var layer = top.layui.layer;
//	      			  layer.closeAll('iframe');
//	              	  layer.msg(data.msg, {
//	    				  time: 2000 //2s后自动关闭
//	    			  });
//	      		}); 
            }
        }
	});
}