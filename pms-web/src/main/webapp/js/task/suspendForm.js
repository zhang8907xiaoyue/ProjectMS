$(function(){

});

function insertRecord(){
    var storyid=$('#storyid').val();
    var taskid=$('#taskid').val();
    var content=$('#remark').val();
    if($.trim(content).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入备注', '#textPosition');
        });
        return false;
    }
    if($.trim(content).length>500){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('备注长度超过500字符', '#textPosition');
        });
        return false;
    }
	$.ajax({
        url: common.getContextPath()+'/task/insertTaskcontrol.do',
        type: 'Post',
        dataType: "json",
        data:{
            taskid:taskid,
            type:0,
            content:content
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
