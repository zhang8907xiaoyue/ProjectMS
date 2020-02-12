$(function(){

    $("#estimate").die().live("keyup", function () {
        regularUtil.number_only($('#estimate'));
        if($.trim($(this).val()).length>5){
            layui.use('layer', function(){
                var layer = layui.layer;
                layer.tips('工时长度超过5', '#estimate');
            });
        }
    });
    $('.img-btn-new').die().live('click',function(){
        var fileId=$(this).attr('link-file');
        $('#'+fileId).click();
    });
    $('.img-btn-preview').die().live('click',function(){
        var imgId=$(this).attr('link-img');
        var url=$('#'+imgId).attr('src');
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title: false,
                area: ['800px', '450px'],
                shade: 0.8,
                closeBtn: 0,
                shadeClose: true,
                content: url
            });
        });
    });
    $('.img-btn-delete').die().live('click',function(){
        var imgId=$(this).attr('link-img');
        var url=$('#'+imgId).attr('src',common.getContextPath()+'/images/upload.png');
        var url=$('#'+imgId).attr('path','');
    });
    $('.img-preview').die().live('click',function(){
        var url=$(this).attr('link-url');
        top.layui.use('layer', function(){
            var layer = top.layui.layer;
            layer.open({
                type: 2,
                title: false,
                area: ['800px', '450px'],
                shade: 0.8,
                closeBtn: 0,
                shadeClose: true,
                content: url
            });
        });
    });
    $('#file-code').live('change', function () {
        uploadCode();
    });
    $('#sql').die().live('click',function(){

        $('#file-sql').click();
    });
    $('#file-sql').live('change', function () {
        uploadSql();
    });
});

function insertRecord(){
    var storyid=$('#storyid').val();
    var taskid=$('#taskid').val();
    var estimate=$('#estimate').val();
    var codeurl=$('#img-code').attr('path');
    var sql=$.trim($('#sql-filename').attr('link-url'));
    var sqlname=$.trim($('#sql-filename').html());
    var testRemark=testRemarkEditor.html();
    var releaseRemark=releaseRemarkEditor.html();
    var overdueRemark=overdueRemarkEditor.html();

    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    codeurl=codeurl.split(fileViewUrl).join("");
    sql=sql.split(fileViewUrl).join("");
    testRemark=testRemark.split(fileViewUrl).join("");
    releaseRemark=releaseRemark.split(fileViewUrl).join("");
    overdueRemark=overdueRemark.split(fileViewUrl).join("");
    if($.trim(estimate).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入工时', '#estimate');
        });
        return false;
    }
    if($.trim(estimate).length>5){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('工时超过5个字符', '#estimate');
        });
        return false;
    }
    if($.trim(codeurl).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请上传规范性代码截图', '#img-code');
        });
        return false;
    }
    if($.trim(testRemark).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入测试说明', '#forTestRemark');
        });
        return false;
    }
	$.ajax({
        url: common.getContextPath()+'/task/insertTaskcomplete.do',
        type: 'Post',
        dataType: "json",
        data:{
            storyid:storyid,
            taskid:taskid,
            estimate:estimate,
            codeurl:codeurl,
            sql:sql,
            sqlname:sqlname,
            testremark:testRemark,
            releaseremark:releaseRemark,
            overdueremark:overdueRemark
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
    var estimate=$('#estimate').val();
    var codeurl=$('#img-code').attr('path');
    var sql=$.trim($('#sql-filename').attr('link-url'));
    var sqlname=$.trim($('#sql-filename').html());
    var testRemark=testRemarkEditor.html();
    var releaseRemark=releaseRemarkEditor.html();
    var overdueRemark=overdueRemarkEditor.html();

    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    codeurl=codeurl.split(fileViewUrl).join("");
    sql=sql.split(fileViewUrl).join("");
    testRemark=testRemark.split(fileViewUrl).join("");
    releaseRemark=releaseRemark.split(fileViewUrl).join("");
    overdueRemark=overdueRemark.split(fileViewUrl).join("");
    if($.trim(estimate).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入工时', '#estimate');
        });
        return false;
    }
    if($.trim(estimate).length>5){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('工时超过5个字符', '#estimate');
        });
        return false;
    }
    if($.trim(codeurl).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请上传规范性代码截图', '#img-code');
        });
        return false;
    }
    if($.trim(testRemark).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入测试说明', '#forTestRemark');
        });
        return false;
    }
    $.ajax({
        url: common.getContextPath()+'/task/updateTaskcomplete.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            estimate:estimate,
            codeurl:codeurl,
            sql:sql,
            sqlname:sqlname,
            testremark:testRemark,
            releaseremark:releaseRemark,
            overdueremark:overdueRemark
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
 * 上传代码截图
 */
function uploadCode(){
    $.ajaxFileUpload({
        url: common.getContextPath()+'/files/upload.do',
        type: 'Post',
        secureuri: false,
        dataType: "json",
        async: true,
        fileElementId: 'file-code', //file控件id
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
                $('#img-code').attr('src',data.url);
                $('#img-code').attr('path',data.url);
                var parentDiv=$('#file-code').parent();
                $(parentDiv).html('');
                $(parentDiv).append('<input id="file-code" name="file" type="file">');

            }
        }
    });
}

/**
 * 上传发布sql文件
 */
function uploadSql(){
    $.ajaxFileUpload({
        url: common.getContextPath()+'/files/upload.do',
        type: 'Post',
        secureuri: false,
        dataType: "json",
        async: true,
        fileElementId: 'file-sql', //file控件id
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
                $('#sql-filename').attr('href',data.url);
                $('#sql-filename').attr('link-url',data.url);
                $('#sql-filename').attr('download',data.name);
                $('#sql-filename').html(data.name);
                $('#sql-file').append('<input id="file-sql" name="file" type="file">');

            }
        }
    });
}