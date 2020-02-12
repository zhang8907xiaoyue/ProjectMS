$(function(){
	$("#name").die().live("keyup", function () {
        regularUtil.check_chars($('#name'));
        if($.trim($(this).val()).length>50){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('菜单名称长度超过50', '#name');
        	}); 
        }
    });
	$("#url").die().live("keyup", function () {
		if($.trim($(this).val()).length>200){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('URL长度超过200', '#url');
        	}); 
        }
    });
	$("#css").die().live("keyup", function () {
        regularUtil.check_chars($('#css'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('css长度超过25', '#css');
        	}); 
        }
    });
	$("#icon").die().live("keyup", function () {
        regularUtil.check_chars($('#icon'));
        if($.trim($(this).val()).length>25){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('icon长度超过25', '#icon');
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
	appTreeInit();
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
		$('#appForm')[0].reset();
		$('#appParent').val('');
		$('#appParent').attr('link-parentid','');
	});
});

/**
 * 菜单树初始化
 */
function appTreeInit(){
	$.ajax({
        url: common.getContextPath()+'/system/getApplicationTree.do',
        type: 'Post',
        dataType: "json",
        async: false,
        success: function (data) {
        	var setting = {
        			view: {
        				dblClickExpand: false
        			},
        			data: {
        				simpleData: {
        					enable: true
        				}
        			},
        			callback: {
        				beforeClick: beforeAppClick,
        				onClick: onAppClick
        			}
        		};

        		var zNodes =data;
        		$.fn.zTree.init($("#appParentTree"), setting, zNodes);
        }
	});
}

function beforeAppClick(treeId, treeNode) {
	
}

function onAppClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("appParentTree"),
	nodes = zTree.getSelectedNodes(),
	v = "",
	id = "";
	nodes.sort(function compare(a,b){return a.id-b.id;});
	for (var i=0, l=nodes.length; i<l; i++) {
		v += nodes[i].name + ",";
		id += nodes[i].id + ",";
	}
	if (v.length > 0 ) v = v.substring(0, v.length-1);
	if (id.length > 0 ) id = id.substring(0, id.length-1);
	var obj = $("#appParent");
	obj.attr("value", v);
	obj.attr("link-parentid", id);
}

function showAppMenu() {
	var obj = $("#appParent");
	var offset = $("#appParent").offset();
	$("#appParentContent").css({left:"12px", top:obj.outerHeight() + "px"}).slideDown("fast");

	$("body").bind("mousedown", onAppBodyDown);
}
function hideAppMenu() {
	$("#appParentContent").fadeOut("fast");
	$("body").unbind("mousedown", onAppBodyDown);
}
function onAppBodyDown(event) {
	if (!(event.target.id == "appParent" || event.target.id == "appParentContent" || $(event.target).parents("#appParentContent").length>0)) {
		hideAppMenu();
	}
}

function insertRecord(){
	var name=$('#name').val();
	var type=$('#type').val();
	var url=$('#url').val();
	var status=$("input[name='status']:checked").val();
	var parentid=$('#appParent').attr('link-parentid');
	var css=$('#css').val();
	var icon=$('#icon').val();
	var listid=$('#listid').val();
	if($.trim(name).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入菜单名称', '#name');
    	}); 
		return false;
	}
	if($.trim(name).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('菜单名称超过50个字符', '#name');
    	});  
		return false;
	}
	if($.trim(url).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入URL', '#url');
    	}); 
		return false;
	}
	if($.trim(url).length>200){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('组织名称超过200个字符', '#url');
    	});  
		return false;
	}
	if(parentid==null||parentid==''){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请选择上级菜单', '#appParent');
    	}); 
		return false;
	}
	if($.trim(css).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('css超过25个字符', '#css');
    	}); 
		return false;
	}
	if($.trim(icon).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('icon超过25个字符', '#icon');
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
        url: common.getContextPath()+'/system/insertApplication.do',
        type: 'Post',
        dataType: "json",
        data:{
        	name:name,
        	type:type,
        	status:status,
        	url:url,
        	parentid:parentid,
        	css:css,
        	icon:icon,
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
                	$('#appForm')[0].reset();
                	$('#appParent').val('');
            	}
            }
        }
	});
}

function updateRecord(id){
	var name=$('#name').val();
	var type=$('#type').val();
	var url=$('#url').val();
	var status=$("input[name='status']:checked").val();
	var parentid=$('#appParent').attr('link-parentid');
	var css=$('#css').val();
	var icon=$('#icon').val();
	var listid=$('#listid').val();
	if($.trim(name).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入菜单名称', '#name');
    	}); 
		return false;
	}
	if($.trim(name).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('菜单名称超过50个字符', '#name');
    	});  
		return false;
	}
	if($.trim(url).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入URL', '#url');
    	}); 
		return false;
	}
	if($.trim(url).length>200){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('组织名称超过200个字符', '#url');
    	});  
		return false;
	}
	if(parentid==null||parentid==''){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请选择上级菜单', '#appParent');
    	}); 
		return false;
	}
	if($.trim(css).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('css超过25个字符', '#css');
    	}); 
		return false;
	}
	if($.trim(icon).length>25){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('icon超过25个字符', '#icon');
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
        url: common.getContextPath()+'/system/updateApplication.do',
        type: 'Post',
        dataType: "json",
        data:{
        	id:id,
        	name:name,
        	type:type,
        	status:status,
        	url:url,
        	parentid:parentid,
        	css:css,
        	icon:icon,
        	listid:listid
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
            } else {
            	//成功提示
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