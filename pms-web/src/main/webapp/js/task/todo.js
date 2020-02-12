$(function(){
    tabSHow();
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
                content: common.getContextPath()+'/task/taskForm.do?id='+id
            });
        });
    });
    //添加备注
    $('.remark').die().live('click',function(){
        var storyid=$(this).attr('link-storyid');
        var taskid=$(this).attr('link-taskid');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '添加备注',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ '700px', '400px' ],
                content: common.getContextPath()+'/task/remarkForm.do?storyid='+storyid+'&taskid='+taskid,
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
    //添加日志
    $('.log').die().live('click',function(){
        var storyid=$(this).attr('link-storyid');
        var taskid=$(this).attr('link-taskid');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '添加备注',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ '700px', '400px' ],
                content: common.getContextPath()+'/task/logForm.do?storyid='+storyid+'&taskid='+taskid,
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
    //暂停任务
    $('.suspend').die().live('click',function(){
        var storyid=$(this).attr('link-storyid');
        var taskid=$(this).attr('link-taskid');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '任务暂停',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ '700px', '400px' ],
                content: common.getContextPath()+'/task/suspendForm.do?storyid='+storyid+'&taskid='+taskid,
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
    //开始任务
    $('.start').die().live('click',function(){
        var storyid=$(this).attr('link-storyid');
        var taskid=$(this).attr('link-taskid');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.confirm('重新开始任务？', {
                btn: ['确认','取消'] //按钮
            }, function(){
                $.ajax({
                    url: common.getContextPath()+'/task/insertTaskcontrol.do',
                    type: 'Post',
                    dataType: "json",
                    data:{
                        taskid:taskid,
                        type:1,
                    },
                    async: false,
                    success: function (data) {
                        if (data.success==false) {
                            top.layui.use('layer', function(){
                                var layer = top.layui.layer;
                                layer.open({
                                    content: "任务"+taskid+"开始失败！",
                                    scrollbar: false
                                });
                            });
                        } else {
                            refreshTable();
                            top.layui.use('layer', function(){
                                var layer = top.layui.layer;
                                layer.closeAll('iframe');
                                layer.msg("任务"+taskid+"开始成功", {
                                    time: 2000 //2s后自动关闭
                                });
                            });
                        }
                    }
                });
            }, function(){
                top.layui.use('layer', function(){
                    var layer = top.layui.layer;
                    layer.closeAll('iframe');
                });
            });

        });
    });
    //完成任务
    $('.complete').die().live('click',function(){
        var storyid=$(this).attr('link-storyid');
        var taskid=$(this).attr('link-taskid');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '任务完成',
                skin: 'layui-layer-rim', //加上边框
                maxmin: true,
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/task/completeForm.do?type=new&storyid='+storyid+'&taskid='+taskid,
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
});

function refreshTable(){
	jQuery("#grid-table").jqGrid('setGridParam', {
        url : common.getContextPath()+'/task/getTodoPage.do',
		postData:{
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**
 * 表格数据显示
 */
function tabSHow(){
	var colNames = [ '任务id','优先级','状态', '标题','项目','来源','截至时间','操作'];
	var colModel = [ 
		             {name : 'id',index : 'id',width:40},
                     {name : 'pri',index : 'pri',width:40},
                     {name : 'status',index : 'status',width:40,
                        formatter:function(cellvalue, options, rowObject){
                            if(cellvalue=="1"){
                                return "待开发";
                            }else if(cellvalue=="3"){
                                return "暂停";
                            }
                            }},
        			 {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["id"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
		             {name : 'projectname',index : 'projectname',width:70},
		             {name : 'sourcename',index : 'sourcename',width:40},
		             {name : 'deadline',index : 'deadline',width:40},
					 {name : 'option',index : 'option',width:60,
						 formatter:function(cellvalue, options, rowObject){
					 	     var storyid=rowObject["storyid"];
                             var taskid=rowObject["id"];
                             if(rowObject["status"]=="3"){
                                 return '<a href="javascript:;" class="option remark" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="备注">备注</a>'+
                                     '&nbsp;<a href="javascript:;" class="option log" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="日志">日志</a>'+
                                     '&nbsp;<a href="javascript:;" class="option start" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="开始">开始</a>'+
                                     '&nbsp;<a href="javascript:;" class="option complete" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="完成">完成</a>';
                             }else{
                                 return '<a href="javascript:;" class="option remark" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="备注">备注</a>'+
                                     '&nbsp;<a href="javascript:;" class="option log" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="日志">日志</a>'+
                                     '&nbsp;<a href="javascript:;" class="option suspend" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="暂停">暂停</a>'+
                                     '&nbsp;<a href="javascript:;" class="option complete" link-storyid="'+storyid+'" link-taskid="'+taskid+'" title="完成">完成</a>';
                             }
						 }}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/task/getTodoPage.do',
		postData:{
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
