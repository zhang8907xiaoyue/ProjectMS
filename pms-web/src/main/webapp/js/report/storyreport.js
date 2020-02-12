$(function(){
	init();
	$('#search').die().live('click',function(){
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/report/getStoryreportPage.do',
			postData:{
                "starttime":starttime,
                "endtime":endtime
			},
		    page : 1
		}).trigger("reloadGrid");
	});
    $('#export').die().live('click',function(){
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
        window.open(common.getContextPath()+
            '/report/d_storyreport.do?starttime='+starttime+ '&endtime='+endtime);
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
	    url : common.getContextPath()+'/report/getStoryreportPage.do',
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
	var colNames = [ '编号', '状态','类型','来源','标题','任务人','提出时间','截至时间','完成时间'];
	var colModel = [ 
		             {name : 'v1',index : 'v1',width:40},
                     {name : 'v2',index : 'v2',width:40},
                     {name : 'v3',index : 'v3',width:40},
                     {name : 'v4',index : 'v4',width:40},
        			 {name : 'v5',index : 'v5'},
		             {name : 'v6',index : 'v6',width:100},
		             {name : 'v7',index : 'v7',width:50},
		             {name : 'v8',index : 'v8',width:40},
                     {name : 'v9',index : 'v9',width:50}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/report/getStoryreportPage.do',
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
