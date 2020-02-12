regularUtil = {
    check_ipv4_subnet: function (ipstr) {
        var arr = ipstr.split("/");
        if (arr.length == 2) {
            if (arr[1] == "" || arr[1] < 0 || arr[1] > 32) {
                return false;
            } else {
                return regularUtil.check_ipv4(arr[0]);
            }
        } else if (arr.length != 2) {
            return false;
        }
    },
    check_ipv6_subnet: function (ipstr) {
        var arr = ipstr.split("/");
        if (arr.length == 2) {
            if (arr[1] == "" || arr[1] < 0 || arr[1] > 128) {
                return false;
            } else {
                return regularUtil.check_ipv6(arr[0]);
            }
        } else if (arr.length != 2) {
            return false;
        }
    },
    // IPv6
    check_ipv6: function (ip) {
        if (ip.match(/^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$/) != null) {
            return true;
        } else {
            return false;
        }
    },
    //IPv4
    check_ipv4: function (ip) {
        var invalidPattern = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
        return invalidPattern.test(ip);
    },
    // 只允許數字,不是数字予以代替
    //txtinput为前台控件如$('#id')
    number_only: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /[^0-9\$]/g;
                if (invalidPattern.test(txtinput.val())) {
                    txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    // 只允許數字/不是数字予以代替
    //txtinput为前台控件如$('#id')
    numbersprit_only: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /[^0-9\/]/g;
                if (invalidPattern.test(txtinput.val())) {
                    txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    // 只允許英文
    //txtinput为前台控件如$('#id')
    english_only: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /[^A-Za-z]/g;
                if (invalidPattern.test(txtinput.val())) {
                    txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    // 只允許英文和数字
    //txtinput为前台控件如$('#id')
    englishandnumber_only: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /[^A-Za-z0-9]/g;
                if (invalidPattern.test(txtinput.val())) {
                    txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    // 挡掉特殊字符
    //txtinput为前台控件如$('#id')
    check_chars: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /["'\\<>\[\]{}!@#$%^&*\|;?\/`~+=]/g;
                if (invalidPattern.test(txtinput.val())) {
                    txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    //挡掉非固定电话字符
    //txtinput为前台控件如$('#id')
    check_tel: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /[^0-9-]/g;
                if (invalidPattern.test(txtinput.val())) {
                	txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    //挡掉非手机号字符
    //txtinput为前台控件如$('#id')
    check_phone: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /[^0-9]/g;
                if (invalidPattern.test(txtinput.val())) {
                	txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    //挡掉非ip字符
    //txtinput为前台控件如$('#id')
    ip_only: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /[^A-Fa-f0-9\/:.]/g;
                if (invalidPattern.test(txtinput.val())) {
                    txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    //事件关键字卡控
    //txtinput为前台控件如$('#id')
    check_valid_event_keyw: function (txtinput) {
        if (txtinput.length > 0) {
            if (txtinput.val() == "") {
                return;
            } else {
                var invalidPattern = /["'<>\[\]{}#$%^&?~]/g;
                if (invalidPattern.test(txtinput.val())) {
                    txtinput.val(txtinput.val().replace(invalidPattern, ""));
                }
            }
        }
    },
    tel_valid: function (text) {
        var invalidPattern = /^0\d{2,3}-[1-9]\d{6,7}$/;
        if (invalidPattern.test(text)) {
        	return true;
        }else{
        	return false;
        }
    },
    phone_valid: function (text) {
        var invalidPattern = /^1[3|4|5|7|8|9][0-9]{9}$/;
        if (invalidPattern.test(text)) {
        	return true;
        }else{
        	return false;
        }
    },
    idcard_valid: function (text) {
    	//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
        var invalidPattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (invalidPattern.test(text)) {
        	return true;
        }else{
        	return false;
        }
    },
    bankcard_valid: function (text) {
        var invalidPattern = /^([1-9]{1})(\d{14}|\d{18})$/;
        if (invalidPattern.test(text)) {
        	return true;
        }else{
        	return false;
        }
    },
    postalcode_valid: function (text) {
    	//邮编正则表达式
        var invalidPattern = /^[1-9][0-9]{5}$/;
        if (invalidPattern.test(text)) {
        	return true;
        }else{
        	return false;
        }
    }
};