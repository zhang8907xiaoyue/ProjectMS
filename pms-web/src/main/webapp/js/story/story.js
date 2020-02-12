$(function(){
	init();
	$('#new').die().live('click',function(){
	    var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
		top.layui.use('layer', function(){
        	var layer = top.layui.layer;
            layer.open({
            	type: 2,
				title : '新增需求',
                skin: 'layui-layer-rim', //加上边框
				shadeClose : true,
				area : [ dialogWith+'px', dialogHeight+'px' ],
            	content: common.getContextPath()+'/story/storyForm.do?type=new',
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
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
        var id=$('#id').val();
		var title=$('#title').val();
        var status=$('#status').val();
        var project=$('#project').val();
        var source=$('#source').val();
        var openedby=$('#openedby').attr('link-parentid');
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/story/getStoryPage.do',
			postData:{
				"starttime":starttime,
				"endtime":endtime,
                "id":id,
                "title":title,
                "status":status,
                "project":project,
                "source":source,
                "openedby":openedby
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
            var dialogWith=top.getWdith()*0.8;
            var dialogHeight=top.getHeight()*0.8;
            var id = ids[i];
            top.layui.use('layer', function(){
            	var layer = top.layui.layer;
                layer.open({
                	type: 2,
    				title : '编辑需求',
                    skin: 'layui-layer-rim', //加上边框
    				shadeClose : true,
                    area : [ dialogWith+'px', dialogHeight+'px' ],
                	content: common.getContextPath()+'/story/storyForm.do?type=edit&id='+id,
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
    //查看需求
    $('.view').die().live('click',function(){
        var id=$(this).attr('a-link');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                title: false, //不显示标题
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/story/storyForm.do?type=view&id='+id
            });
        });
    });
});

/**
 * 初始化
 */
function init(){
	//日期控件初始化
    $('.date-picker').datepicker({
        language : 'zh-CN',
        autoclose : true,
        todayHighlight : true,
        autoclose : true
    }).next().on(ace.click_event, function() {
        $(this).prev().focus();
    });
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
    //初始化来源
    $.ajax({
        url: common.getContextPath()+'/base/getSourceList.do',
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
                $('#source').html('');
                $('#source').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#source').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                }
            }
        }
    });
    openedbyTreeInit();
	tabSHow();
}

function refreshTable(){
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
    var id=$('#id').val();
    var title=$('#title').val();
    var status=$('#status').val();
    var project=$('#project').val();
    var source=$('#source').val();
    var openedby=$('#openedby').attr('link-parentid');
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/story/getStoryPage.do',
		postData:{
            "starttime":starttime,
            "endtime":endtime,
            "id":id,
            "title":title,
            "status":status,
            "project":project,
            "source":source,
            "openedby":openedby
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**
 * 表格数据显示
 */
function tabSHow(){
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
    var id=$('#id').val();
    var title=$('#title').val();
    var status=$('#status').val();
    var project=$('#project').val();
    var source=$('#source').val();
    var openedby=$('#openedby').attr('link-parentid');
	var colNames = [ '需求id', '标题','状态','项目','来源','模块','创建人员','创建时间'];
	var colModel = [ 
		             {name : 'id',index : 'id',width:40},
        			 {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["id"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
		             {name : 'status',index : 'status',width:40,
                         formatter:function(cellvalue, options, rowObject){
							switch (cellvalue) {
								case 1:
									return '待分拣';
                                case 2:
                                    return '待开发';
                                case 3:
                                    return '待测试';
                                case 4:
                                    return '待发布';
                                case 5:
                                    return '已完成';
                            }
                         }},
		             {name : 'projectname',index : 'projectname',width:70},
		             {name : 'sourcename',index : 'sourcename',width:40},
                     {name : 'modularname',index : 'modularname',width:40},
		             {name : 'openedbyname',index : 'openedbyname',width:40},
		             {name : 'openeddate',index : 'openeddate',width:70}
		           ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/story/getStoryPage.do',
		postData:{
            "starttime":starttime,
            "endtime":endtime,
            "id":id,
            "title":title,
            "status":status,
            "project":project,
            "source":source,
            "openedby":openedby
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
		}
	});   
}

function deleteRecord(id){
	top.layui.use('layer', function(){
		  var layer = top.layui.layer;
		  layer.confirm('确认禁用这笔记录?', {icon: 3, title:'提示'}, function(index){
			  $.ajax({
			        url: common.getContextPath()+'/story/deleteStory.do',
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

/**************************************创建人树start*********************************/
/**
 * 组织树初始化
 */
function openedbyTreeInit(){
    $.ajax({
        url: common.getContextPath()+'/system/getOrgUserTree.do',
        type: 'Post',
        dataType: "json",
        async: false,
        success: function (data) {
            var setting = {
                check: {
                    enable: true,
                    chkboxType: {"Y":"ps", "N":"ps"}
                },
                view: {
                    dblClickExpand: false
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    beforeClick: beforeOrgClick,
                    onCheck: onOrgClick
                }
            };

            var zNodes =data;
            $.fn.zTree.init($("#orgParentTree"), setting, zNodes);
        }
    });
}

function beforeOrgClick(treeId, treeNode) {

}

function onOrgClick(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("orgParentTree"),
        nodes = zTree.getCheckedNodes(),
        v = "",
        id = "";
    nodes.sort(function compare(a,b){return a.id-b.id;});
    for (var i=0, l=nodes.length; i<l; i++) {
        v += nodes[i].name + ",";
        id += nodes[i].id + ",";
    }
    if (v.length > 0 ) v = v.substring(0, v.length-1);
    if (id.length > 0 ) id = id.substring(0, id.length-1);
    var obj = $("#openedby");
    obj.attr("value", v);
    obj.attr("link-parentid", id);
}

function showOrgMenu() {
    var obj = $("#openedby");
    var offset = $("#openedby").offset();
    $("#orgParentContent").css({left:offset.left + "px", top:offset.top + obj.outerHeight() + "px"}).slideDown("fast");

    $("body").bind("mousedown", onOrgBodyDown);
}
function hideOrgMenu() {
    $("#orgParentContent").fadeOut("fast");
    $("body").unbind("mousedown", onOrgBodyDown);
}
function onOrgBodyDown(event) {
    if (!(event.target.id == "openedby" || event.target.id == "orgParentContent" || $(event.target).parents("#orgParentContent").length>0)) {
        hideOrgMenu();
    }
}
/**************************************创建人树end*********************************/