$(function(){
	init();
	$('#new').die().live('click',function(){
		top.layui.use('layer', function() {
			var layer = top.layui.layer;
			layer.open({
				type : 2,
				title : '新增用户',
				shadeClose : true,
				area : [ '800px', '430px' ],
				content : common.getContextPath()+'/system/userForm.do?type=new',
				end : function() {
					refreshTable();
				},
				btn : [ '提交', '取消' ],
				yes : function(index, layero) {
					var body = layer.getChildFrame('body', index);
					var iframeid = layero.find('iframe')[0]['name'];// 获取Iframe的id
					if(top.$('#' + iframeid)[0].contentWindow.insertRecord()!=false){
						top.layui.use('layer', function() {
							var layer = top.layui.layer;
							layer.closeAll('iframe');
						});
					}
				},
				cancel : function() {
					top.layui.use('layer', function() {
						var layer = top.layui.layer;
						layer.closeAll('iframe');
					});
				}
			});
		});
	});
	$('#search').die().live('click',function(){
		var name=$('#name').val();
		var realname=$('#realname').val();
		var orgname=$('#orgname').val();
		var status=$('input[name=status]:checked').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/system/getUserPage.do', 
			postData:{
				"name":name,
				"realname":realname,
				"orgname":orgname,
				"status":status
			},
		    page : 1
		}).trigger("reloadGrid");
	});
	$('#reset').die().live('click',function(){
		$('#searchForm')[0].reset();
		$('#orgParent').val('');
		$('#orgParent').attr('link-parentid','');
	});
	$('#edit').die().live('click',function(){
		var ids = $("#grid-table").jqGrid('getGridParam','selarrrow');
		if(ids.length>1){
			top.layui.use('layer', function(){
    			  var layer = top.layui.layer;
    			  layer.open({
    				  content: '只能选择一条数据',
    				  scrollbar: false
    			  });
    		});  
			return;
		}
		for ( var i = 0; i < ids.length; i++) {
            var id = ids[i];
            top.layui.use('layer', function(){
            	var layer = top.layui.layer;
                layer.open({
                	type: 2,
    				title : '编辑用户',
    				shadeClose : true,
    				area : [ '800px', '430px' ],
                	content: common.getContextPath()+'/system/userForm.do?type=edit&id='+id,
                	end: function(){ 
                		refreshTable();
    				},  
                	btn: ['提交', '取消'],
    				yes: function(index, layero){
    					var body = layer.getChildFrame('body', index);
    					var iframeid=layero.find('iframe')[0]['name'];//获取Iframe的id
    					if(top.$('#' + iframeid)[0].contentWindow.updateRecord(id)!=false){
    						top.layui.use('layer', function(){
	      	  	      			  var layer = top.layui.layer;
	      	  	      			  layer.closeAll('iframe');
	      	  	      		}); 
    					}
    					
    				},
    				cancel: function(){ 
    					top.layui.use('layer', function(){
    	  	      			  var layer = top.layui.layer;
    	  	      			  layer.closeAll('iframe');
    	  	      		}); 
    				}
                });
            });
		}
	});
	$('#delete').die().live('click',function(){
		var ids = $("#grid-table").jqGrid('getGridParam','selarrrow');
		if(ids.length>1){
			top.layui.use('layer', function(){
    			  var layer = top.layui.layer;
    			  layer.open({
    				  content: '只能选择一条数据',
    				  scrollbar: false
    			  });
    		});  
			return;
		}
		for ( var i = 0; i < ids.length; i++) {
            var id = ids[i];
            deleteRecord(id);
		}
	});
	$('#fpuserrole').die().live('click',function(){
		var ids = $("#grid-table").jqGrid('getGridParam','selarrrow');
		if(ids.length>1){
			top.layui.use('layer', function(){
    			  var layer = top.layui.layer;
    			  layer.open({
    				  content: '只能选择一条数据',
    				  scrollbar: false
    			  });
    		});  
			return;
		}
		for ( var i = 0; i < ids.length; i++) {
            var id = ids[i];
            top.layui.use('layer', function(){
            	var layer = top.layui.layer;
	            layer.open({
	            	type: 2,
					title : '分配用户角色',
					shadeClose : true,
					area : [ '700px', '410px' ],
	            	content: common.getContextPath()+'/system/userRole.do?userid='+id,
	            	btn: ['提交', '取消'],
					yes: function(index, layero){
						var body = layer.getChildFrame('body', index);
						var id=layero.find('iframe')[0]['name'];//获取Iframe的id
						top.$('#'+id)[0].contentWindow.insertRecord();
						top.layui.use('layer', function(){
		  	      			  var layer = top.layui.layer;
		  	      			  layer.closeAll('iframe');
		  	      		}); 
					},
					cancel: function(){ 
						top.layui.use('layer', function(){
		  	      			  var layer = top.layui.layer;
		  	      			  layer.closeAll('iframe');
		  	      		}); 
					}
	            });
            });
		}
	});
});

/**
 * 初始化
 */
function init(){
	tabSHow();
}

function refreshTable(){
	var name=$('#name').val();
	var realname=$('#realname').val();
	var orgname=$('#orgname').val();
	var status=$('input[name=status]:checked').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/system/getUserPage.do', 
		postData:{
			"name":name,
			"realname":realname,
			"orgname":orgname,
			"status":status
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**
 * 表格数据显示
 */
function tabSHow(){
	var name=$('#name').val();
	var realname=$('#realname').val();
	var orgname=$('#orgname').val();
	var status=$('input[name=status]:checked').val();
	var colNames = [ '登录名', '真实姓名','密码','状态','类型','邮箱','部门名称','最近修改时间'];
	var colModel = [ 
		             {name : 'name',index : 'name'},
		             {name : 'realname',index : 'realname'},
		             {name : 'password',index : 'password'},
		             {name : 'status',index : 'status',
		            	 formatter:function(cellvalue, options, rowObject){
		            		 var status='';
		            		 if(cellvalue=='0'){
		            			 status='禁用';
		            		 }else if(cellvalue=='1'){
		            			 status='启用';
		            		 }
			            	 return status;
			             }},
						{name : 'type',index : 'type',
							formatter:function(cellvalue, options, rowObject){
								var status='';
								if(cellvalue=='1'){
									status='开发人员';
								}else if(cellvalue=='2'){
									status='测试人员';
								}else if(cellvalue=='3'){
                                    status='项目经理';
                                }else if(cellvalue=='4'){
                                    status='需求组（运维）';
                                }else if(cellvalue=='5'){
                                    status='管理人员';
                                }
								return status;
							}},
        			 {name : 'email',index : 'email',sortable : false},
		             {name : 'orgname',index : 'orgname',sortable : false},
		             {name : 'updatetime',index : 'updatetime'}
		           ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/system/getUserPage.do', 
		postData:{
			"name":name,
			"realname":realname,
			"orgname":orgname,
			"status":status
		},
		mtype : "post", 
		datatype : "json", 
		colNames : colNames, 
		colModel : colModel, 
		rowNum : 50,
		rowList : [20, 50, 100],
		pager : '#grid-pager',
		viewrecords : true, 
		rownumbers:true,//显示行号
		multiselect:true,//开启checkbox行选择
		multiboxonly:true,//一次只能选中一行
		autowidth:true,		//自适应表格宽度：为父元素宽度
		shrinkToFit:true,//此属性用来说明当初始化列宽度时候的计算类型，如果为ture，则按比例初始化列宽度。如果为false，则列宽度使用colModel指定的宽度
		height:$(window).height()-$('#tools').outerHeight()-$('#searchForm').outerHeight()-37-40,//表格数据区高度，37指列名表高度，40指footer高度
		pgbuttons:true,//是否显示分页按钮
		loadComplete : function() {
			var table = this;
			setTimeout(function(){
				updatePagerIcons(table);
				enableTooltips(table);
			}, 0);
		}
	});   
}

function deleteRecord(id){
	top.layui.use('layer', function(){
		  var layer = top.layui.layer;
		  layer.confirm('确认禁用这笔记录?', {icon: 3, title:'提示'}, function(index){
			  $.ajax({
			        url: common.getContextPath()+'/system/deleteUser.do',
			        type: 'Post',
			        dataType: "json",
			        data:{
			        	id:id
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
				              	  layer.msg(data.msg, {
				    				  time: 2000 //2s后自动关闭
				    			  });
				      		}); 
			            	refreshTable();
			            }
			        }
				});
		  });
	}); 
}