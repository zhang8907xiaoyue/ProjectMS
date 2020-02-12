$(function(){
	init();
	//查看过失详情
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
                content: common.getContextPath()+'/pa/monthbestForm.do?type=view&id='+id
            });
        });
    });
    $('#new').die().live('click',function(){
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '新增每月最佳',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/pa/monthbestForm.do?type=new',
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
                    title : '编辑每月最佳',
                    skin: 'layui-layer-rim', //加上边框
                    shadeClose : true,
                    area : [ dialogWith+'px', dialogHeight+'px' ],
                    content: common.getContextPath()+'/pa/monthbestForm.do?type=edit&id='+id,
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
	$('#search').die().live('click',function(){
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/pa/getMonthbestPage.do',
			postData:{
                "starttime":starttime,
                "endtime":endtime
			},
		    page : 1
		}).trigger("reloadGrid");
	});
    $('#reset').die().live('click',function(){
        $('#searchForm')[0].reset();
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
	tabSHow();
}

function refreshTable(){
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/pa/getMonthbestPage.do',
		postData:{
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
	var colNames = [ '月份','员工姓名', '标题','创建人','创建时间'];
	var colModel = [
                     {name : 'month',index : 'month',width:70},
		             {name : 'employee',index : 'employee',width:70},
        			 {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["id"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
		             {name : 'username',index : 'username',width:70},
		             {name : 'createtime',index : 'createtime',width:100}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/pa/getMonthbestPage.do',
		postData:{
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
                url: common.getContextPath()+'/pa/deleteMonthbest.do',
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