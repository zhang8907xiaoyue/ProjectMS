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
                content: common.getContextPath()+'/bug/bugForm.do?type=view&id='+id
            });
        });
    });
    //问题解决
    $('.success').die().live('click',function(){
        var id=$(this).attr('a-link');
        success(id);
    });
    //未解决
    $('.failed').die().live('click',function(){
        var id=$(this).attr('a-link');
        failed(id);
    });
});

function refreshTable(){
	jQuery("#grid-table").jqGrid('setGridParam', {
        url : common.getContextPath()+'/bug/getToapprovePage.do',
		postData:{
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**
 * 表格数据显示
 */
function tabSHow(){
	var colNames = [ 'bugId','严重程度', '标题','项目','完成人员','完成时间','操作'];
	var colModel = [ 
		             {name : 'id',index : 'id',width:40},
                     {name : 'severity',index : 'severity',width:40},
        			 {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["id"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
		             {name : 'projectname',index : 'projectname',width:70},
		             {name : 'finishedbyname',index : 'finishedbyname',width:40},
		             {name : 'finishedtime',index : 'finishedtime',width:40},
					 {name : 'option',index : 'option',width:40,
						 formatter:function(cellvalue, options, rowObject){
                             var id=rowObject["id"];
                             return '<a href="javascript:;" class="option failed" a-link="'+id+'">未解决</a>&nbsp;'+
                                 '<a href="javascript:;" class="option success" a-link="'+id+'">问题解决</a>';
						 }}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/bug/getToapprovePage.do',
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

function success(id){
    top.layui.use('layer', function(){
        var layer = top.layui.layer;
        layer.confirm('确认bug已解决?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: common.getContextPath()+'/bug/successBug.do',
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

function failed(id){
    top.layui.use('layer', function(){
        var layer = top.layui.layer;
        layer.confirm('确认bug未解决?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: common.getContextPath()+'/bug/failedBug.do',
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
