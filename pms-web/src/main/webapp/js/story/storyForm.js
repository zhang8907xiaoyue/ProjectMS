$(function(){
    //日期控件初始化
    $('.date-picker').datepicker({
        language : 'zh-CN',
        autoclose : true,
        todayHighlight : true,
        autoclose : true
    }).next().on(ace.click_event, function() {
        $(this).prev().focus();
    });
    //初始化项目
    $.ajax({
        url: common.getContextPath()+'/base/getProjectList.do',
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
                $('#project').html('');
                $('#project').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#project').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                }
            }
        }
    });
    //初始化来源
    $.ajax({
        url: common.getContextPath()+'/base/getSourceList.do',
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
                $('#source').html('');
                $('#source').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#source').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                }
            }
        }
    });
    $('#project').change(function(){
        var projectid=$(this).val();
        //初始化来源
        $.ajax({
            url: common.getContextPath()+'/base/getModularList.do',
            type: 'Post',
            dataType: "json",
            data:{projectid:projectid},
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
                    $('#modular').html('');
                    $('#modular').append('<option value=""></option>');
                    for(var i=0;i<data.length;i++){
                        $('#modular').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
                    }
                }
            }
        });
        projectcustomerinit(projectid);
    });
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
    //查看任务
    $('.taskinfo').die().live('click',function(){
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
                content: common.getContextPath()+'/task/taskForm.do?id='+id
            });
        });
    });
    //查看用例
    $('.usecaseinfo').die().live('click',function(){
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
    $('.projectcustomer.select-all').die().live('click',function() {
        if($(this).is(':checked')){
            $('input[name="projectcustomer"]').attr("checked",true);
        }else{
            $('input[name="projectcustomer"]').attr("checked",false);
        }
    });
    if($('#form-type').val()=='edit'){
        projectcustomerinit($('#project').attr('linked'));
        $.ajax({
            url: common.getContextPath()+'/release/getReleaselistByTypeReferid.do',
            type: 'Post',
            dataType: "json",
            data:{referid:$('#form-id').val(),type:1},
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
                    $('.cb-pc').each(function(){
                        var _this=$(this);
                        for(var i=0;i<data.length;i++){
                            if ($(_this).val()==data[i].customerid) {
                                $(_this).attr("checked",true);
                            }
                        }
                    });
                }
            }
        });
    }
});

function insertRecord(){
	var project=$('#project').val();
    var source=$('#source').val();
    var modular=$('#modular').val();
    var deadline=$('#deadline').val();
    var pri=$('#pri').val();
    var release='[';
    var i=0;
    $('.cb-pc').each(function(){
        if ($(this).is(':checked')) {
            var customerid=$(this).val();
            if(i>0){
                release+=',';
            }
            release+='{\"customerid\":'+customerid+'}';
            i++;
        }
    });
    release+=']';
    var title=$('#title').val();
    var content=contentEditor.html();
    var fileurl=$.trim($('#a-file').attr('link-url'));
    var filename=$.trim($('#a-file').html());
    var target=targetEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    fileurl=fileurl.split(fileViewUrl).join("");
    target=target.split(fileViewUrl).join("");
    if($.trim(project).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择项目', '#project');
        });
        return false;
    }
    if($.trim(source).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择来源', '#source');
        });
        return false;
    }
    if($.trim(modular).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择模块', '#modular');
        });
        return false;
    }
	if($.trim(title).length==0){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('请输入标题', '#title');
    	}); 
		return false;
	}
	if($.trim(title).length>50){
		layui.use('layer', function(){
  		  	var layer = layui.layer;
  		  	layer.tips('标题超过50个字符', '#title');
    	});
		return false;
	}
	$.ajax({
        url: common.getContextPath()+'/story/insertStory.do',
        type: 'Post',
        dataType: "json",
        data:{
            project:project,
            source:source,
            modular:modular,
            deadline:deadline,
            pri:pri,
            release:release,
            title:title,
            content:content,
            fileurl:fileurl,
            filename:filename,
            target:target
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
    var deadline=$('#deadline').val();
    var pri=$('#pri').val();
    var release='[';
    var i=0;
    $('.cb-pc').each(function(){
        if ($(this).is(':checked')) {
            var customerid=$(this).val();
            if(i>0){
                release+=',';
            }
            release+='{\"customerid\":'+customerid+'}';
            i++;
        }
    });
    release+=']';
    var title=$('#title').val();
    var content=contentEditor.html();
    var fileurl=$.trim($('#a-file').attr('link-url'));
    var filename=$.trim($('#a-file').html());
    var target=targetEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    fileurl=fileurl.split(fileViewUrl).join("");
    target=target.split(fileViewUrl).join("");
    if($.trim(title).length==0){0
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入标题', '#title');
        });
        return false;
    }
    if($.trim(title).length>50){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('标题超过50个字符', '#title');
        });
        return false;
    }
	$.ajax({
        url: common.getContextPath()+'/story/updateStory.do',
        type: 'Post',
        dataType: "json",
        data:{
        	id:id,
            deadline:deadline,
            pri:pri,
            release:release,
            title:title,
            content:content,
            fileurl:fileurl,
            filename:filename,
            target:target
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

function projectcustomerinit(projectid) {
    //初始化项目更新对象
    $.ajax({
        url: common.getContextPath()+'/base/getProjectcustomerList.do',
        type: 'Post',
        dataType: "json",
        data:{projectid:projectid},
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
                var projectcustomer ='<div class="form-group" id="div-customer"><label class="col-xs-1 control-label no-padding-right" for="projectcustomer">需要更新</label><div class="col-xs-10" style="padding-top: 5px;">';
                projectcustomer+='<label><input type="checkbox" class="projectcustomer select-all"/>&nbsp;全选</label>&nbsp;'
                for(var i=0;i<data.length;i++){
                    var temp='<label><input type="checkbox" class="projectcustomer cb-pc" name="projectcustomer" value="'+data[i].id+'"/>&nbsp;'+data[i].name+'</label>&nbsp;';
                    projectcustomer+=temp;
                }
                projectcustomer+='</div></div>'
                $('#div-customer').remove();
                $('#form-content').after(projectcustomer);
            }
        }
    });
}