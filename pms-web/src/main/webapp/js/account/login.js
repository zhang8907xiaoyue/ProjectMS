$(function () {
	//页面布局
	$('.login-bg>.container>.form-wrapper').css('padding-top',($(window).height()-$('.login-bg>.container>.form-wrapper').height())/2);
	//禁用页面点击事件
	$('body').bind('contextmenu',function(){
	    return false;
	}); 
    //点击登录
    $('#btn_login').die().live('click', function () {
        login();
    });
    //回车登录
    $('body').bind('keypress', function (event) {
        if (event.keyCode == 13) {
            login();
        }
    });
    verifyCodeRefresh();
    //验证码点击刷新事件
    $('#authCode').click(function () {
        verifyCodeRefresh();
    });
    // if($.cookie('c_name')!=""){
    // 	$("#123").val( $.cookie('c_name') );
    // }
    // if($.cookie('c_password')!=""){
    // 	$("#345").val( $.cookie('c_password') );
    // 	$("#rememberme").attr('checked',true);
    // }
    // //是否记住密码
    // $("#rememberme").click(function(){
    // 	if(!this.checked){
    // 		$.cookie("c_name", "", { path: '/' }); //删除用户名cookie
    // 		$.cookie("c_password", "", { path: '/' }); //删除密码cookie
	//     }
    // });
});

function login() {
    var username = $('#123').val();
    var password = $('#345').val();
    var code = $('#random').val();
    var r_code = $('#authCode').attr('link-code');
    if (username == "" || username == null) {
        alert('用户名不能为空');
        verifyCodeRefresh();
        return;
    }
    if (password == "" || password == null) {
        alert('密码不能为空');
        verifyCodeRefresh();
        return;
    }
    if(code==""||code==null){
        alert("验证码不能为空");
        verifyCodeRefresh();
        return;
    }
    if(!(code.toUpperCase()==r_code)){
        alert("验证码不正确");
        verifyCodeRefresh();
        return;
    }
    $.ajax({
        type: "post",
        url: "checkLogin.do",
        data: { username: username, password: password },
        async: true,
        dataType: "json",
        beforeSend: function () {
            //弹出遮罩
        },
        complete: function () {
            //关闭遮罩
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
            console.log(jqXHR.readyState);
            console.log(textStatus);
            console.log(errorThrown);
        },
        success: function (data) {
            if (data.success==false) {
                alert(data.msg);
            } else {
            	if($("#rememberme").attr('checked')){
            		$.cookie('c_name',username, { path: '/', expires: 365 }); 
            		$.cookie('c_password',password, { path: '/', expires: 365 });
            	}
                window.location = common.getContextPath()+"/account/index.do";
            }
        }
    });
}

/**
 * 验证码刷新
 */
function verifyCodeRefresh(){
    $.ajax({
        type: "get",
        url: "/account/getVerifyCode.do",
        async: false,
        dataType: "text",
        beforeSend : function() {
        },
        complete : function() {
        },
        error : function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
            console.log(jqXHR.readyState);
            console.log(textStatus);
            console.log(errorThrown);
        },
        success: function (data) {
            $('#authCode').attr('link-code',data);
            $('#authCode').attr('src','/account/verifyCodeShow.do?verifyCode='+data);
        }
    });
}