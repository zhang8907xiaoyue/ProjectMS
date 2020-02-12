$(function(){

    //查看bug
    $('.buginfo').die().live('click',function(){
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
});
