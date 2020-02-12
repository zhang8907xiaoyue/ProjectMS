function doRelease(){
    var releaseList='[';
    var i=0;
    $('.release-id').each(function () {
        var type=$(this).attr('link-type');
        var referid=$(this).attr('link-referid');
        var id=$(this).html();
        if(i>0){
            releaseList+=',';
        }
        releaseList+='{\"type\":'+type+',\"id\":\"'+id+'\",\"referid\":\"'+referid+'\"}';
        i++;
    });
    releaseList+=']';
    $.ajax({
        url: common.getContextPath()+'/release/doRelease.do',
        type: 'Post',
        dataType: "json",
        data:{
            releaseList:releaseList
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

            }
        }
    });
}