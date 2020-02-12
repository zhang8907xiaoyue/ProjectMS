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
                content: common.getContextPath()+'/task/taskForm.do?type=view&id='+id
            });
        });
    });
	//任务完成修改
	$('.modify').die().live('click',function(){
        var id = $(this).attr('a-link');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '修改完成任务',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/task/completeForm.do?type=edit&id='+id,
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
	});
	$('#search').die().live('click',function(){
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
        var taskid=$('#taskid').val();
		var title=$('#title').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/task/getCompletedPage.do',
			postData:{
                "taskid":taskid,
                "title":title,
                "starttime":starttime,
                "endtime":endtime
			},
		    page : 1
		}).trigger("reloadGrid");
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
	tabSHow();
}

function refreshTable(){
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
    var taskid=$('#taskid').val();
    var title=$('#title').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/task/getCompletedPage.do',
		postData:{
            "taskid":taskid,
            "title":title,
            "starttime":starttime,
            "endtime":endtime
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
    var taskid=$('#taskid').val();
    var title=$('#title').val();
	var colNames = [ '任务id', '任务名称','项目','来源','完成时间','截至时间','操作'];
	var colModel = [ 
		             {name : 'taskid',index : 'taskid',width:40},
        			 {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["taskid"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
		             {name : 'projectname',index : 'projectname',width:40},
		             {name : 'sourcename',index : 'sourcename',width:40},
		             {name : 'createtime',index : 'createtime',width:50},
		             {name : 'deadline',index : 'deadline',width:40},
					 {name : 'option',index : 'option',width:40,
						 formatter:function(cellvalue, options, rowObject){
					 	     var linked=rowObject["id"];
                             return '<a href="javascript:;" class="option modify" a-link="'+linked+'">修改</a>';
						 }}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/task/getCompletedPage.do',
		postData:{
            "taskid":taskid,
            "title":title,
            "starttime":starttime,
            "endtime":endtime
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
