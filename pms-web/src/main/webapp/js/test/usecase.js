$(function(){
	init();
    //查看需求
    $('.story').die().live('click',function(){
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
                content: common.getContextPath()+'/story/storyForm.do?type=view&id='+id
            });
        });
    });
	//查看需求
    $('.usecase').die().live('click',function(){
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
                content: common.getContextPath()+'/test/usecaseForm.do?type=view&id='+id
            });
        });
    });
	//修改用例
	$('.edit').die().live('click',function(){
		var id=$(this).attr('a-link');
	    var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
		top.layui.use('layer', function(){
        	var layer = top.layui.layer;
            layer.open({
            	type: 2,
				title : '修改用例',
                skin: 'layui-layer-rim', //加上边框
				shadeClose : true,
				area : [ dialogWith+'px', dialogHeight+'px' ],
            	content: common.getContextPath()+'/test/usecaseForm.do?type=edit&id='+id,
            	end: function(){
            		refreshTable();
				},
            	btn: ['提交', '取消'],
				yes: function(index, layero){
					var body = layer.getChildFrame('body', index);
					var iframeid=layero.find('iframe')[0]['name'];//获取Iframe的id
					if(top.$('#' + iframeid)[0].contentWindow.updateRecord(id)!=false){
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
    $('.delete').die().live('click',function(){
        var id=$(this).attr('a-link');
        deleteRecord(id);
    });
    //转bug
    $('.bug').die().live('click',function(){
        var id=$(this).attr('a-link');
        var storyid=$(this).attr('link-storyid');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '转bug',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                title:false,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/bug/bugForm.do?type=new&storyid='+storyid+'&usecaseid='+id,
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
	$('#search').die().live('click',function(){
        var storyid=$('#storyid').val();
        var storytitle=$('#storytitle').val();
		var title=$('#title').val();
		jQuery("#grid-table").jqGrid('setGridParam', {
		    url : common.getContextPath()+'/test/getUsecasePage.do',
			postData:{
                "storyid":storyid,
                "storytitle":storytitle,
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

	tabSHow();
}

function refreshTable(){
    var storyid=$('#storyid').val();
    var storytitle=$('#storytitle').val();
    var title=$('#title').val();
	jQuery("#grid-table").jqGrid('setGridParam', {
	    url : common.getContextPath()+'/test/getUsecasePage.do',
		postData:{
            "storyid":storyid,
            "storytitle":storytitle,
            "title":title
		},
	    page : 1
	}).trigger("reloadGrid");
}

/**
 * 表格数据显示
 */
function tabSHow(){
    var storyid=$('#storyid').val();
    var storytitle=$('#storytitle').val();
    var title=$('#title').val();
	var colNames = [ '需求id', '需求标题','用例标题','用例类型','创建人员','创建时间','操作'];
	var colModel = [ 
		             {name : 'storyid',index : 'storyid',width:40},
        			 {name : 'storytitle',index : 'storytitle',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["storyid"];
                             return '<a href="javascript:;" class="view story" a-link="'+linked+'">'+cellvalue+'</a>';
                         }},
                     {name : 'title',index : 'title',
                         formatter:function(cellvalue, options, rowObject){
                             var linked=rowObject["id"];
                             return '<a href="javascript:;" class="view usecase" a-link="'+linked+'">'+cellvalue+'</a>';
                     }},
		             {name : 'type',index : 'type',width:40,
                         formatter:function(cellvalue, options, rowObject){
                             switch (cellvalue) {
                                 case 1:
                                     return '功能测试';
                                 case 2:
                                     return '性能测试';
                                 case 3:
                                     return '配置相关';
                                 case 4:
                                     return '安装部署';
                                 case 5:
                                     return '安全相关';
                                 case 6:
                                     return '接口测试';
                                 case 9:
                                     return '其他';
                             }
                         }},
		             {name : 'username',index : 'username',width:40},
		             {name : 'createtime',index : 'createtime',width:40},
					 {name : 'option',index : 'id',width:50,
						 formatter:function(cellvalue, options, rowObject){
					 	     var linked=rowObject["id"];
                             var storyid=rowObject["storyid"];
                             return '<a href="javascript:;" class="option edit" a-link="'+linked+'">修改</a>&nbsp;'+
                                 '<a href="javascript:;" class="option delete" a-link="'+linked+'">删除</a>&nbsp;'+
                                 '<a href="javascript:;" class="option bug" a-link="'+linked+'" link-storyid="'+storyid+'">转bug</a>';
						 }}
		            ];
	jQuery("#grid-table").jqGrid({
		url : common.getContextPath()+'/test/getUsecasePage.do',
		postData:{
            "storyid":storyid,
            "storytitle":storytitle,
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
                url: common.getContextPath()+'/test/deleteUsecase.do',
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
