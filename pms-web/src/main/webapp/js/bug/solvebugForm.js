$(function(){

    $('#sql').die().live('click',function(){

        $('#file-sql').click();
    });
    $('#file-sql').live('change', function () {
        uploadSql();
    });
});

function insertRecord(id){
    var sql=$.trim($('#sql-filename').attr('link-url'));
    var sqlname=$.trim($('#sql-filename').html());
    var releaseRemark=releaseRemarkEditor.html();

    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    sql=sql.split(fileViewUrl).join("");
    releaseRemark=releaseRemark.split(fileViewUrl).join("");

	$.ajax({
        url: common.getContextPath()+'/bug/applyBug.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            result:3,
            sql:sql,
            sqlname:sqlname,
            releaseremark:releaseRemark
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
    var sql=$.trim($('#sql-filename').attr('link-url'));
    var sqlname=$.trim($('#sql-filename').html());
    var releaseRemark=releaseRemarkEditor.html();

    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    sql=sql.split(fileViewUrl).join("");
    releaseRemark=releaseRemark.split(fileViewUrl).join("");

    $.ajax({
        url: common.getContextPath()+'/bug/applyBug.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            result:3,
            sql:sql,
            sqlname:sqlname,
            releaseremark:releaseRemark
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