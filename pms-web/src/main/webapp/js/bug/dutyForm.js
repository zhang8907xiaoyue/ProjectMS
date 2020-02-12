$(function(){
    //初始化指派对象
    $.ajax({
        url: common.getContextPath()+'/system/getUserList.do',
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
                $('#duty').html('');
                $('#duty').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#duty').append('<option value="'+data[i].id+'">'+data[i].realname+'</option>');
                }
                if($('#type').val()=='edit'){
                    $("#duty").val($('#input-duty').val());
                }
                $("#duty").chosen();
            }
        }
    });

});

function updateRecord(id){
    var duty=$('#duty').find("option:selected").val();
    var dutycontent=contentEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    dutycontent=dutycontent.split(fileViewUrl).join("");
    if($.trim(duty).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择责任人员', '#duty');
        });
        return false;
    }

    $.ajax({
        url: common.getContextPath()+'/bug/updateBug.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            duty:duty,
            dutycontent:dutycontent
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
                    layer.closeAll('iframe');
                    layer.msg(data.msg, {
                        time: 2000 //2s后自动关闭
                    });
                });
            }
        }
    });
}
