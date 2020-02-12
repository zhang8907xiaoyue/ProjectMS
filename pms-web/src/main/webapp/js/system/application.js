$(function(){
	init();
	$('#new').die().live('click',function(){
				top.layui.use('layer', function() {
					var layer = top.layui.layer;
					layer.open({
						type : 2,
						title : '新增菜单',
						shadeClose : true,
						area : [ '800px', '400px' ],
						content : common.getContextPath()
								+ '/system/applicationForm.do?type=new',
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
		var parentid=$('#appParent').attr('link-parentid');
		var status=$('input[name=status]:checked').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/system/getApplicationPage.do', 
			postData:{
				"name":name,
				"parentid":parentid,
				"status":status
			},
		    page : 1
		}).trigger("reloadGrid");
	});
	$('#reset').die().live('click',function(){
		$('#searchForm')[0].reset();
		$('#appParent').val('');
		$('#appParent').attr('link-parentid','');
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
    				title : '编辑角色',
    				shadeClose : true,
    				area : [ '800px', '400px'  ],
                	content: common.getContextPath()+'/system/applicationForm.do?type=edit&id='+id,
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
});

/**
 * 初始化
 */
function init(){
	appTreeInit();
	tabSHow();
}

function refreshTable(){
	var name=$('#name').val();
	var parentid=$('#appParent').attr('link-parentid');
	var status=$('input[name=status]:checked').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/system/getApplicationPage.do', 
		postData:{
			"name":name,
			"parentid":parentid,
			"status":status
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**************************************组织树start*********************************/
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
	$("#appParentContent").css({left:offset.left + "px", top:offset.top + obj.outerHeight() + "px"}).slideDown("fast");

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
/**************************************组织树end*********************************/

/**
 * 表格数据显示
 */
function tabSHow(){
	var name=$('#orgname').val();
	var parentid=$('#orgParent').attr('link-parentid');
	var status=$('input[name=status]:checked').val();
	var colNames = [ '名称', '类型','状态','路径','CSS','图标','上级菜单','序号'];
	var colModel = [ 
		             {name : 'name',index : 'name'},
		             {name : 'type',index : 'type'},
		             {name : 'status',index : 'status'},
		             {name : 'url',index : 'url'},
		             {name : 'css',index : 'css'},
		             {name : 'icon',index : 'icon'},
		             {name : 'parentname',index : 'parentname',sortable : false},
		             {name : 'listid',index : 'listid'}
		           ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/system/getApplicationPage.do', 
		postData:{
			"name":name,
			"parentid":parentid,
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
              var type="";
              switch (ret.type) {
					case '0':
						type="分类";
						break;
					case '1':
						type="菜单";
						break;
		
					default:
						break;
              }
              var zt="";
              if(ret.status=='0'){
            	  zt="禁用";
              }else{
            	  zt="启用";
              }
              
              jQuery("#grid-table").jqGrid('setRowData', ids[i],{
            	  type : type,
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
			        url: common.getContextPath()+'/system/deleteApplication.do',
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
			    			var parentid=$('#appParent').attr('link-parentid');
			    			var status=$('input[name=status]:checked').val();
			    			jQuery("#grid-table").jqGrid('setGridParam', {
			    			    url : common.getContextPath()+'/system/getApplicationPage.do', 
			    				postData:{
			    					"name":name,
			    					"parentid":parentid,
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