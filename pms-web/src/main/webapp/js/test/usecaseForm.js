$(function(){
    if($('#form-type').val()=='edit'){
        common.chose_mult_set_ini('#stage',$('#input-stage').val());
    }
    $("#stage").chosen();
	$("#title").die().live("keyup", function () {
        regularUtil.check_chars($('#title'));
        if($.trim($(this).val()).length>50){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('标题长度超过50', '#title');
        	}); 
        }
    });
    $('#btn-file').die().live('click',function(){

        $('#input-file').click();
    });
    $('#input-file').live('change', function () {
        uploadFile();
    });
    //步骤控制
    $('.btn-up').die().live('click',function(){
        var step='<tr class="step-row"><td class="xh">3</td>'+
                '<td><textarea rows="1" cols="20" class="form-control step-content" style="width:100%"></textarea></td>'+
                '<td><textarea rows="1" cols="20" class="form-control expect-content" style="width:100%"></textarea></td>'+
                '<td><button type="button" class="btn btn-light btn-xs btn-up"><i class="ace-icon icon icon-angle-double-up  bigger-110 icon-only"></i></button><button type="button" class="btn btn-light btn-xs btn-append btn-down"><i class="ace-icon icon icon-angle-double-down   bigger-110 icon-only"></i></button><button type="button" class="btn btn-light btn-xs btn-append btn-close"><i class="ace-icon icon icon-close   bigger-110 icon-only"></i></button></td>'+
                '</tr>'
        $(this).parents('tr').before(step);
        var i=1;
        $('.xh').each(function () {
            $(this).html(i);
            i++;
        });
    });
    //步骤控制
    $('.btn-down').die().live('click',function(){
        var step='<tr class="step-row"><td class="xh">3</td>'+
            '<td><textarea rows="1" cols="20" class="form-control step-content" style="width:100%"></textarea></td>'+
            '<td><textarea rows="1" cols="20" class="form-control expect-content" style="width:100%"></textarea></td>'+
            '<td><button type="button" class="btn btn-light btn-xs btn-up"><i class="ace-icon icon icon-angle-double-up  bigger-110 icon-only"></i></button><button type="button" class="btn btn-light btn-xs btn-append btn-down"><i class="ace-icon icon icon-angle-double-down   bigger-110 icon-only"></i></button><button type="button" class="btn btn-light btn-xs btn-append btn-close"><i class="ace-icon icon icon-close   bigger-110 icon-only"></i></button></td>'+
            '</tr>'
        $(this).parents('tr').after(step);
        var i=1;
        $('.xh').each(function () {
            $(this).html(i);
            i++;
        });
    });
    //步骤控制
    $('.btn-close').die().live('click',function(){

        $(this).parents('tr').remove();
        var i=1;
        $('.xh').each(function () {
            $(this).html(i);
            i++;
        });
    });
});

function insertRecord(){
    var storyid=$('#storyid').val();
	var type=$('#type').val();
    var stage=$('#stage').val();
    var title=$('#title').val();
    var fileurl=$.trim($('#a-file').attr('link-url'));
    var filename=$.trim($('#a-file').html());
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    fileurl=fileurl.split(fileViewUrl).join("");
    var usecasestep='[';
    var i=0;
    $('.step-row').each(function () {
        var xh=$(this).find('.xh').html();
        var step=$(this).find('.step-content').val();
        var expect=$(this).find('.expect-content').val();
        if(i>0){
            usecasestep+=',';
        }
        usecasestep+='{\"xh\":'+xh+',\"step\":\"'+step+'\",\"expect\":\"'+expect+'\"}';
        i++;
    });
    usecasestep+=']';
    if($.trim(stage).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择适用阶段', '#stage');
        });
        return false;
    }
	$.ajax({
        url: common.getContextPath()+'/test/insertUsecase.do',
        type: 'Post',
        dataType: "json",
        data:{
            storyid:storyid,
            type:type,
            stage:stage.toString(),
            title:title,
            filename:filename,
            fileurl:fileurl,
            usecasestep:usecasestep
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

function updateRecord(id){
    var type=$('#type').val();
    var stage=$('#stage').val();
    var title=$('#title').val();
    var fileurl=$.trim($('#a-file').attr('link-url'));
    var filename=$.trim($('#a-file').html());
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    fileurl=fileurl.split(fileViewUrl).join("");
    var usecasestep='[';
    var i=0;
    $('.step-row').each(function () {
        var xh=$(this).find('.xh').html();
        var step=$(this).find('.step-content').val();
        var expect=$(this).find('.expect-content').val();
        if(i>0){
            usecasestep+=',';
        }
        usecasestep+='{\"xh\":'+xh+',\"step\":\"'+step+'\",\"expect\":\"'+expect+'\"}';
        i++;
    });
    usecasestep+=']';
    if($.trim(stage).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择适用阶段', '#stage');
        });
        return false;
    }
    $.ajax({
        url: common.getContextPath()+'/test/updateUsecase.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            type:type,
            stage:stage.toString(),
            title:title,
            filename:filename,
            fileurl:fileurl,
            usecasestep:usecasestep
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

/**
 * 上传需求附件
 */
function uploadFile(){
    $.ajaxFileUpload({
        url: common.getContextPath()+'/files/upload.do',
        type: 'Post',
        secureuri: false,
        dataType: "json",
        async: true,
        fileElementId: 'input-file', //file控件id
        beforeSend: function () {
            top.layui.use('layer', function(){
                var layer = top.layui.layer;
                layer.load();
            });
        },
        complete:function () {
            top.layui.use('layer', function(){
                var layer = top.layui.layer;
                layer.closeAll('loading');
            });
        },
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
                $('#a-file').attr('href',data.url);
                $('#a-file').attr('link-url',data.url);
                $('#a-file').attr('download',data.name);
                $('#a-file').html(data.name);
                $('#div-file').append('<input id="input-file" name="file" type="file">');

            }
        }
    });
}