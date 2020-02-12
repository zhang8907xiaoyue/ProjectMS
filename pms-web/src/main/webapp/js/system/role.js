$(function(){
	init();
	$('#new').die().live('click',function(){
		top.layui.use('layer', function(){
        	var layer = top.layui.layer;
            layer.open({
            	type: 2,
				title : '新增角色',
				shadeClose : true,
				area : [ '700px', '300px' ],
            	content: common.getContextPath()+'/system/roleForm.do?type=new',
            	end: function(){ 
            		refreshTable();
				},  
            	btn: ['提交', '取消'],
				yes: function(index, layero){
					var body = layer.getChildFrame('body', index);
					var iframeid=layero.find('iframe')[0]['name'];//获取Iframe的id
					if(top.$('#' + iframeid)[0].contentWindow.insertRecord()!=false){
						top.layui.use('layer', function() {
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
	});
	$('#search').die().live('click',function(){
		var name=$('#name').val();
		var status=$('input[name=status]:checked').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/system/getRolePage.do', 
			postData:{
				"name":name,
				"status":status
			},
		    page : 1
		}).trigger("reloadGrid");
	});
	$('#reset').die().live('click',function(){
		$('#searchForm')[0].reset();
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
			return false;
		}
		for ( var i = 0; i < ids.length; i++) {
            var id = ids[i];
            top.layui.use('layer', function(){
            	var layer = top.layui.layer;
                layer.open({
                	type: 2,
    				title : '编辑角色',
    				shadeClose : true,
    				area : [ '700px', '300px' ],
                	content: common.getContextPath()+'/system/roleForm.do?type=edit&id='+id,
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
			return false;
		}
		for ( var i = 0; i < ids.length; i++) {
            var id = ids[i];
            deleteRecord(id);
		}
	});
	$('#fprolepower').die().live('click',function(){
		var ids = $("#grid-table").jqGrid('getGridParam','selarrrow');
		if(ids.length>1){
			top.layui.use('layer', function(){
    			  var layer = top.layui.layer;
    			  layer.open({
    				  content: '只能选择一条数据',
    				  scrollbar: false
    			  });
    		});  
			return false;
		}
		for ( var i = 0; i < ids.length; i++) {
            var id = ids[i];
            top.layui.use('layer', function(){
            	var layer = top.layui.layer;
	            layer.open({
	            	type: 2,
					title : '分配角色权限',
					shadeClose : true,
					area : [ '900px', '450px' ],
	            	content: common.getContextPath()+'/system/rolePower.do?roleid='+id,
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
	var status=$('input[name=status]:checked').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/system/getRolePage.do', 
		postData:{
			"name":name,
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
	var status=$('input[name=status]:checked').val();
	var colNames = [ '角色名称', '状态','排序','操作人员','创建时间','最近修改时间'];
	var colModel = [ 
		             {name : 'name',index : 'name'},
		             {name : 'status',index : 'status'},
		             {name : 'listid',index : 'listid'},
		             {name : 'username',index : 'username'},
		             {name : 'createtime',index : 'createtime'},
		             {name : 'updatetime',index : 'updatetime'}
		           ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/system/getRolePage.do', 
		postData:{
			"name":name,
			"status":status
		},
		mtype : "post", 
		datatype : "json", 
		colNames : colNames, 
		colModel : colModel, 
		rowNum : 50,
		rowList : [20, 50, 100],
		pager : '#grid-pager',
		sortable : true,
		sortorder : "asc",
		viewrecords : true, 
		multiselect:true,//开启checkbox行选择
		multiboxonly:true,//一次只能选中一行
		rownumbers:true,//显示行号
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
		},
        gridComplete : function() {
            var ids = jQuery("#grid-table").jqGrid('getDataIDs');
            for ( var i = 0; i < ids.length; i++) {
              var id = ids[i];
              var ret = jQuery("#grid-table").jqGrid('getRowData', id);
              var zt="";
              if(ret.status=='0'){
            	  zt="禁用";
              }else{
            	  zt="启用";
              }
              jQuery("#grid-table").jqGrid('setRowData', ids[i],{
            	  status : zt
              });
            }
         },
	});   
}

function deleteRecord(id){
	top.layui.use('layer', function(){
		  var layer = top.layui.layer;
		  layer.confirm('确认禁用这笔记录?', {icon: 3, title:'提示'}, function(index){
			  $.ajax({
			        url: common.getContextPath()+'/system/deleteRole.do',
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
			            	var name=$('#name').val();
			    			var status=$('input[name=status]:checked').val();
			    			jQuery("#grid-table").jqGrid('setGridParam', {
			    			    url : common.getContextPath()+'/system/getRolePage.do', 
			    				postData:{
			    					"name":name,
			    					"status":status
			    				},
			    			    page : 1
			    			}).trigger("reloadGrid");
			            }
			        }
				});
		  });
	}); 
}