$(function(){
	init();
	//查看bug
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
                content: common.getContextPath()+'/bug/bugForm.do?type=view&id='+id
            });
        });
    });
    $('.edit').die().live('click',function(){
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        var id = $(this).attr('a-link');
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : 'bug解决修改',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/bug/solvebugForm.do?type=edit&id='+id,
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
        var id=$('#id').val();
        var title=$('#title').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/bug/getSolvedPage.do',
			postData:{
                "starttime":starttime,
                "endtime":endtime,
                "id":id,
                "title":title
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
	tabSHow();
}

function refreshTable(){
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
    var id=$('#id').val();
    var title=$('#title').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/bug/getSolvedPage.do',
		postData:{
            "starttime":starttime,
            "endtime":endtime,
            "id":id,
            "title":title
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
    var colNames = [ 'bugId','严重程度', '状态', '标题','项目','创建人','创建时间','完成时间','操作'];
	var colModel = [
                        {name : 'id',index : 'id',width:40},
                        {name : 'severity',index : 'severity',width:40},
                        {name : 'status',index : 'status',width:40,
                            formatter:function(cellvalue, options, rowObject){
                                switch (cellvalue) {
                                    case 1:
                                        return '待解决';
                                    case 2:
                                        return '待审核';
                                    case 3:
                                        return '已完成';
                                }
                            }},
                        {name : 'title',index : 'title',
                            formatter:function(cellvalue, options, rowObject){
                                var linked=rowObject["id"];
                                return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                            }},
                        {name : 'projectname',index : 'projectname',width:70},
                        {name : 'username',index : 'username',width:40},
                        {name : 'createtime',index : 'createtime',width:40},
                        {name : 'finishedtime',index : 'finishedtime',width:40},
                        {name : 'option',index : 'option',width:40,
                            formatter:function(cellvalue, options, rowObject){
                                var id=rowObject["id"];
                                return '<a href="javascript:;" class="option edit" a-link="'+id+'">修改</a>';;
                            }}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/bug/getSolvedPage.do',
		postData:{
            "starttime":starttime,
            "endtime":endtime,
            "id":id,
            "title":title
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
