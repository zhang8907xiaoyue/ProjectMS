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
    //设计如此
    $('.designso').die().live('click',function(){
        var id=$(this).attr('a-link');
        apply(id,1);
    });
    //无法重现
    $('.norepeat').die().live('click',function(){
        var id=$(this).attr('a-link');
        apply(id,2);
    });
    //完成任务
    $('.apply').die().live('click',function(){
        var id=$(this).attr('a-link');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '解决bug',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/bug/solvebugForm.do?type=new&id='+id,
                end: function(){
                    refreshTable();
                },
                btn: ['提交', '取消'],
                yes: function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    var iframeid=layero.find('iframe')[0]['name'];//获取Iframe的id
                    if(top.$('#' + iframeid)[0].contentWindow.insertRecord(id)!=false){
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
        url : common.getContextPath()+'/bug/getTosolvePage.do',
		postData:{
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**
 * 表格数据显示
 */
function tabSHow(){
	var colNames = [ 'bugId','严重程度', '标题','项目','创建人','创建时间','操作'];
	var colModel = [ 
		             {name : 'id',index : 'id',width:40},
                     {name : 'severity',index : 'severity',width:40},
        			 {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["id"];
                             return '<a href="javascript:;" class="view" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
		             {name : 'projectname',index : 'projectname',width:70},
		             {name : 'username',index : 'username',width:40},
		             {name : 'createtime',index : 'createtime',width:40},
					 {name : 'option',index : 'option',width:70,
						 formatter:function(cellvalue, options, rowObject){
                             var id=rowObject["id"];
                             return '<a href="javascript:;" class="option designso" a-link="'+id+'">设计如此</a>&nbsp;'+
                                 '<a href="javascript:;" class="option norepeat" a-link="'+id+'">无法重现</a>&nbsp;'+
                                '<a href="javascript:;" class="option apply" a-link="'+id+'">解决</a>';
						 }}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/bug/getTosolvePage.do',
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

function apply(id,result){
    top.layui.use('layer', function(){
        var layer = top.layui.layer;
        layer.confirm('确认完成bug?', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: common.getContextPath()+'/bug/applyBug.do',
                type: 'Post',
                dataType: "json",
                data:{
                    id:id,
                    result:result
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
