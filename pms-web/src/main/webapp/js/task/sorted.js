$(function(){
	init();
	//查看任务
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
                content: common.getContextPath()+'/task/taskForm.do?id='+id
            });
        });
    });
	//再次指派
	$('.sorting').die().live('click',function(){
		var id=$(this).attr('a-link');
	    var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
		top.layui.use('layer', function(){
        	var layer = top.layui.layer;
            layer.open({
            	type: 2,
				title : '任务分拣',
                skin: 'layui-layer-rim', //加上边框
				shadeClose : true,
                maxmin: true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
            	content: common.getContextPath()+'/story/sortingForm.do?type=new&storyid='+id,
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
    //修改指派任务
    $('.modify').die().live('click',function(){
        var taskid=$(this).attr('a-link');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '修改指派任务',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                maxmin: true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/story/sortingForm.do?type=edit&taskid='+taskid,
                end: function(){
                    refreshTable();
                },
                btn: ['提交', '取消'],
                yes: function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    var iframeid=layero.find('iframe')[0]['name'];//获取Iframe的id
                    if(top.$('#' + iframeid)[0].contentWindow.updateRecord(taskid)!=false){
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
    //删除已指派任务
    $('.delete').die().live('click',function(){
        var id=$(this).attr('a-link');
        var status=$(this).attr('link-status');
        if(status=='2'){
            alert('任务已经完成，不可以删除');
        }else{
            deleteRecord(id);
        }
    });
	$('#search').die().live('click',function(){
        var id=$('#id').val();
		var title=$('#title').val();
        var storyid=$('#storyid').val();
        var assignto=$('#assignto').attr('link-parentid');
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/task/getSortedPage.do',
			postData:{
                "id":id,
                "title":title,
                "storyid":storyid,
                "assignto":assignto
			},
		    page : 1
		}).trigger("reloadGrid");
	});
});

/**
 * 初始化
 */
function init(){
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
    assigntoTreeInit();
	tabSHow();
}

function refreshTable(){
    var id=$('#id').val();
    var title=$('#title').val();
    var storyid=$('#storyid').val();
    var assignto=$('#assignto').attr('link-parentid');
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/task/getSortedPage.do',
		postData:{
            "id":id,
            "title":title,
            "storyid":storyid,
            "assignto":assignto
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**
 * 表格数据显示
 */
function tabSHow(){
    var id=$('#id').val();
    var title=$('#title').val();
    var storyid=$('#storyid').val();
    var assignto=$('#assignto').attr('link-parentid');
	var colNames = [ '需求id','任务id', '状态','预计工时','任务名称','指派至','创建时间','截至时间','操作'];
	var colModel = [
                     {name : 'storyid',index : 'storyid',width:40},
		             {name : 'id',index : 'id',width:40},
                     {name : 'status',index : 'status',width:40,
                         formatter:function(cellvalue, options, rowObject){
                             switch (cellvalue) {
                                 case 1:
                                     return '开发中';
                                 case 2:
                                     return '开发完成';
                                 case 3:
                                     return '暂停';
                             }
                         }},
                     {name : 'estimate',index : 'estimate',width:40},
        			 {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["id"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
		             {name : 'assigntoname',index : 'assigntoname',width:40},
		             {name : 'createtime',index : 'createtime',width:70},
		             {name : 'deadline',index : 'deadline',width:40},
					 {name : 'option',index : 'option',width:50,
						 formatter:function(cellvalue, options, rowObject){
                             var taskid=rowObject["id"];
                             var status=rowObject["status"];
					 	     var linked=rowObject["storyid"];
                             return '<a href="javascript:;" class="option modify" a-link="'+taskid+'">修改</a>&nbsp;'+
                                 '<a href="javascript:;" class="option delete" a-link="'+taskid+'" link-status="'+status+'">删除</a>&nbsp;'+
                                 '<a href="javascript:;" class="option sorting" a-link="'+linked+'">再次指派</a>';
						 }}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/task/getSortedPage.do',
		postData:{
            "id":id,
            "title":title,
            "storyid":storyid,
            "assignto":assignto
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
                url: common.getContextPath()+'/task/deleteTask.do',
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

/**************************************指派树start*********************************/
/**
 * 组织树初始化
 */
function assigntoTreeInit(){
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
    var obj = $("#assignto");
    obj.attr("value", v);
    obj.attr("link-parentid", id);
}

function showOrgMenu() {
    var obj = $("#assignto");
    var offset = $("#assignto").offset();
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
/**************************************指派树end*********************************/