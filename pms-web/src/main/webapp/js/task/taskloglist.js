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
	$('#search').die().live('click',function(){
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
        var userid=$('#openedby').attr('link-parentid');
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/task/getTaskloglistPage.do',
			postData:{
                "starttime":starttime,
                "endtime":endtime,
                "userid":userid
			},
		    page : 1
		}).trigger("reloadGrid");
	});
    $('#export').die().live('click',function(){
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
        var userid=$('#openedby').attr('link-parentid');
        if(userid='undefined'){
            userid="";
        }
        window.open(common.getContextPath()+
            '/task/d_tasklog.do?starttime='+starttime+ '&endtime='+endtime+ '&userid='+userid);
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
    openedbyTreeInit();
	tabSHow();
}

function refreshTable(){
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
    var userid=$('#openedby').attr('link-parentid');
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/task/getTaskloglistPage.do',
		postData:{
            "starttime":starttime,
            "endtime":endtime,
            "userid":userid
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
    var userid=$('#openedby').attr('link-parentid');
	var colNames = [ '任务id', '日志内容','填写时间','填写人'];
	var colModel = [ 
		             {name : 'taskid',index : 'taskid',width:30},
        			 {name : 'content',index : 'content',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["taskid"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
                     {name : 'createtime',index : 'createtime',width:70},
                     {name : 'username',index : 'username',width:40}
		           ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/task/getTaskloglistPage.do',
		postData:{
            "starttime":starttime,
            "endtime":endtime,
            "userid":userid
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

