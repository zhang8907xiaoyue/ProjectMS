$(function(){
	init();
    //查看需求/bug
    $('.view').die().live('click',function(){
        var project=$(this).attr('link-project');
        var customerid=$(this).attr('link-customerid');
        var version=$(this).attr('link-version');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                title: '功能发布清单', //不显示标题
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/release/releasedList.do?project='+project+'&customerid='+customerid+'&version='+version
            });
        });
    });
	$('#search').die().live('click',function(){
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
        var project=$('#project').val();
        var customer=$('#customer').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/release/getReleasedPage.do',
			postData:{
                "project":project,
                "customer":customer,
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
    $('#project').change(function(){
        var projectid=$(this).val();
        //初始化项目更新对象
        $.ajax({
            url: common.getContextPath()+'/base/getProjectcustomerList.do',
            type: 'Post',
            dataType: "json",
            data:{projectid:projectid},
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
                    $('#customer').html('');
                    $('#customer').append('<option value=""></option>');
                    for(var i=0;i<data.length;i++){
                        $('#customer').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                    }
                }
            }
        });
    });
	tabSHow();
}

function refreshTable(){
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
    var project=$('#project').val();
    var customer=$('#customer').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/release/getReleasedPage.do',
		postData:{
            "project":project,
            "customer":customer,
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
    var project=$('#project').val();
    var customer=$('#customer').val();
	var colNames = [ '项目', '客户','版本','发布人员','发布时间'];
	var colModel = [ 
		             {name : 'projectname',index : 'projectname'},
                     {name : 'customername',index : 'customername'},
		             {name : 'version',index : 'version',
                         formatter:function(cellvalue, options, rowObject){
                             return '<a href="javascript:;" class="view" link-version="'+cellvalue+'" link-project="'+rowObject["project"]+'" link-customerid="'+rowObject["customerid"]+'">'+cellvalue+'</a>';
                         }},
		             {name : 'username',index : 'username'},
		             {name : 'updatetime',index : 'updatetime'}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/release/getReleasedPage.do',
		postData:{
            "project":project,
            "customer":customer,
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
