$(function(){
    $('input[name="cb-release"]').die().live('click',function() {
        var _this=$(this);
        if($(this).is(':checked')){
            $('input[name="cb-release"]').attr("checked",false);
            $(_this).attr("checked",true);
        }
    });
    //查看需求/bug
    $('.view').die().live('click',function(){
        var type=$(this).attr('a-type');
        var id=$(this).attr('a-link');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        var url='';
        if(type=='1'){
            url=common.getContextPath()+'/story/storyForm.do?type=view&id='+id;
        }else if(type=='2'){
            url=common.getContextPath()+'/bug/bugForm.do?type=view&id='+id;
        }
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                title: '功能发布清单', //不显示标题
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: url
            });
        });
    });
    //合并单元格，从后面的列往前合并
    mergeCell('tb-release',0,0,2);
    mergeCell('tb-release',0,0,1);
    //发布
    $('#release').die().live('click',function(){
        var project=$('input[name="cb-release"]:checked').attr('link-project');
        var customer=$('input[name="cb-release"]:checked').attr('link-customer');
        var dialogWith=top.getWdith()*0.8;
        var dialogHeight=top.getHeight()*0.8;
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title : '代码发布',
                skin: 'layui-layer-rim', //加上边框
                shadeClose : true,
                area : [ dialogWith+'px', dialogHeight+'px' ],
                content: common.getContextPath()+'/release/releaseForm.do?project='+project+'&customer='+customer,
                end: function(){
                    var src=parent.$(".layui-tab-item.layui-show").find("iframe").attr("src");
                    parent.$(".layui-tab-item.layui-show").find("iframe").attr("src",src);
                },
                btn: ['确认发布', '取消'],
                yes: function(index, layero){
                    var body = layer.getChildFrame('body', index);
                    var iframeid=layero.find('iframe')[0]['name'];//获取Iframe的id
                    if(top.$('#' + iframeid)[0].contentWindow.doRelease()!=false){
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

/**
 * 合并单元格
 * @param tableId 表格id
 * @param startRow 开始行
 * @param endRow 结束行
 * @param col 列
 */
function mergeCell(tableId, startRow, endRow, col) {
    var tb = document.getElementById(tableId);
    if(!tb || !tb.rows || tb.rows.length <= 0) {
        return;
    }
    if(col >= tb.rows[0].cells.length || (startRow >= endRow && endRow != 0)) {
        return;
    }
    if(endRow == 0) {
        endRow = tb.rows.length - 1;
    }
    for(var i = startRow; i < endRow; i++) {
        if(tb.rows[startRow].cells[col].innerHTML == tb.rows[i + 1].cells[col].innerHTML) { //如果相等就合并单元格,合并之后跳过下一行
            tb.rows[i + 1].removeChild(tb.rows[i + 1].cells[col]);
            tb.rows[startRow].cells[col].rowSpan = (tb.rows[startRow].cells[col].rowSpan) + 1;
        } else {
            mergeCell(tableId, i + 1, endRow, col);
            break;
        }
    }
}