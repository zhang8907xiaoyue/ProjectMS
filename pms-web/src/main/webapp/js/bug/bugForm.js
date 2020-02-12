$(function(){
	$("#title").die().live("keyup", function () {
        regularUtil.check_chars($('#title'));
        if($.trim($(this).val()).length>50){
        	layui.use('layer', function(){
      		  	var layer = layui.layer;
      		  	layer.tips('标题长度超过50', '#title');
        	}); 
        }
    });
    $('input[name="usecasestep"]').click(function () {
        var _this=$(this);
        $('input[name="usecasestep"]').prop("checked", false);
        $(_this).prop("checked", true);
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
                $('#assignto').html('');
                $('#assignto').append('<option value=""></option>');
                for(var i=0;i<data.length;i++){
                    $('#assignto').append('<option value="'+data[i].id+'">'+data[i].realname+'</option>');
                }
                if($('#form-type').val()=='edit'){
                    $("#assignto").val($('#input-assignto').val());
                }
                $("#assignto").chosen();
            }
        }
    });
    if($('#form-type').val()=='new'){
        //初始化相关任务
        $.ajax({
            url: common.getContextPath()+'/task/getTaskList.do?storyid='+$('#storyid').val(),
            type: 'Post',
            dataType: "json",
            async: false,
            success: function (data) {
                console.log(data);
                if (data.success==false) {
                    top.layui.use('layer', function(){
                        var layer = top.layui.layer;
                        layer.open({
                            content: data.msg,
                            scrollbar: false
                        });
                    });
                } else {
                    $('#taskid').html('');
                    $('#taskid').append('<option value=""></option>');
                    for(var i=0;i<data.length;i++){
                        $('#taskid').append('<option value="'+data[i].id+'">'+data[i].id+': '+data[i].title+'</option>');
                    }
                    if($('#form-type').val()=='edit'){
                        $("#taskid").val($('#input-assignto').val());
                    }
                    $("#taskid").chosen();
                }
            }
        });
    }
    $('#project').change(function(){
        var projectid=$(this).val();
        projectcustomerinit(projectid);
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
            data:{referid:$('#form-id').val(),type:2},
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
});

function insertRecord(){
    var storyid=$('#storyid').val();
    var taskid=$('#taskid').find("option:selected").val();
    var usecasestepid=$('input[name="usecasestep"]:checked').attr('id');
    var project=$('#project').val();
    var type=$('#type').val();
    var severity=$('#severity').val();
    var assignto=$('#assignto').find("option:selected").val();
    var title=$('#title').val();
    var step=$('input[name="usecasestep"]:checked').parents('.step-row').find('.step').html();
    var expect=$('input[name="usecasestep"]:checked').parents('.step-row').find('.expect').html();
    var content=contentEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");

    if($.trim(assignto).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择指派至', '#tip-assignto');
        });
        return false;
    }
    if($.trim(title).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入bug标题', '#title');
        });
        return false;
    }
    if($.trim(title).length>50){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('bug标题超过50个字符', '#title');
        });
        return false;
    }
    if($.trim(taskid).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择相关任务', '#tip-taskid');
        });
        return false;
    }
	$.ajax({
        url: common.getContextPath()+'/bug/insertBug.do',
        type: 'Post',
        dataType: "json",
        data:{
            storyid:storyid,
            taskid:taskid,
            usecasestepid:usecasestepid,
            project:project,
            type:type,
            severity:severity,
            assignto:assignto,
            title:title,
            step:step,
            expect:expect,
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

function insertNewRecord(){
    var project=$('#project').val();
    var type=$('#type').val();
    var severity=$('#severity').val();
    var assignto=$('#assignto').find("option:selected").val();
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
    var step=$('#step').val();
    var expect=$('#expect').val();
    var content=contentEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    if($.trim(project).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入选择项目', '#project');
        });
        return false;
    }
    if($.trim(assignto).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择指派至', '#tip-assignto');
        });
        return false;
    }
    if($.trim(title).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入bug标题', '#title');
        });
        return false;
    }
    if($.trim(title).length>50){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('bug标题超过50个字符', '#title');
        });
        return false;
    }
    $.ajax({
        url: common.getContextPath()+'/bug/insertBug.do',
        type: 'Post',
        dataType: "json",
        data:{
            project:project,
            type:type,
            severity:severity,
            assignto:assignto,
            release:release,
            title:title,
            step:step,
            expect:expect,
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

function updateRecord(id){
    var type=$('#type').val();
    var severity=$('#severity').val();
    var assignto=$('#assignto').find("option:selected").val();
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
    var step=$('#step').val();
    var expect=$('#expect').val();
    var content=contentEditor.html();
    var fileViewUrl= $('#file-view-url').val();
    //去掉远程附件服务器地址
    content=content.split(fileViewUrl).join("");
    if($.trim(project).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入选择项目', '#project');
        });
        return false;
    }
    if($.trim(assignto).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请选择指派至', '#tip-assignto');
        });
        return false;
    }
    if($.trim(title).length==0){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('请输入bug标题', '#title');
        });
        return false;
    }
    if($.trim(title).length>50){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.tips('bug标题超过50个字符', '#title');
        });
        return false;
    }
    $.ajax({
        url: common.getContextPath()+'/bug/updateBug.do',
        type: 'Post',
        dataType: "json",
        data:{
            id:id,
            type:type,
            severity:severity,
            assignto:assignto,
            release:release,
            title:title,
            step:step,
            expect:expect,
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