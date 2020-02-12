//为所有 AJAX 请求设置默认 成功与失败函数：
$.ajaxSetup({
	timeout : '20000',
	error : function(jqXHR, textStatus, errorThrown) {
		if (textStatus == 'timeout') {
			top.layui.use('layer', function(){
    			  var layer = top.layui.layer;
    			  layer.open({
    				  content: '请求超时！',
    				  scrollbar: false
    			  });
    		});
		} else {
			top.layui.use('layer', function(){
	  			  var layer = top.layui.layer;
	  			  layer.open({
	  				  content: errorThrown,
	  				  scrollbar: false
	  			  });
	  		});
		}
	},
    beforeSend: function () {
    	//开启layer遮罩
    	top.layui.use('layer', function(){
    		  var layer = top.layui.layer;
    	      layer.load();
    	}); 
    },
	complete:function () {
		//关闭layer遮罩
    	top.layui.use('layer', function(){
  		  var layer = top.layui.layer;
  	      layer.closeAll('loading');
    	}); 
	}
});
var common={
		addTab:function(id, title, href, iconCls){
			var tabPanel = top.$("#tab-main");
			if(!tabPanel.tabs('exists', title)){
				//添加页签
				var content = '<iframe scrolling="auto" frameborder="0"  src="' + href
						+ '" style="width:100%;height:100%;"></iframe>';
				tabPanel.tabs('add', {
					id : id,
					title : title,
					content : content,
					iconCls : iconCls,
					bodyCls : 'tab-body',
					fit : true,
					closable : true
				});
			}else{
				tabPanel.tabs('select', title);
			}
			
		},
		datePlusZearo:function(s){
			//日期补0
			return s < 10 ? '0' + s: s;
		},
		timestampToTime:function(timestamp){
			return new Date(parseInt(timestamp)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");   
		},
		getContextPath : function() {
            //获取系统根路径
            //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
            var curWwwPath = window.document.location.href;
            //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
            var pathName = window.document.location.pathname;
            var pos = curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht = curWwwPath.substring(0, pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName = top.$('#projectName').val();
            return (localhostPaht + projectName);
		},
		getFileName:function(file){
			var pos=file.lastIndexOf("\\");
		    return file.substring(pos+1);  
		},
    	chose_mult_set_ini:function (select, values) {
            var arr = values.split(',');
            var length = arr.length;
            var value ='';
            for (i = 0; i < length; i++) {
                value = arr[i];
                $(select + " option[value='" + value + "']").attr('selected', 'selected');
            }
            $(select).trigger("liszt:updated");
        },merge_table_cell:function(tableId, startRow, endRow, col){
			//合并单元格
			var tb = document.getElementById(tableId);
			if (col >= tb.rows[0].cells.length) {
				return;
			}
			if (col == 0) { endRow = tb.rows.length-1; }
			for (var i = startRow; i < endRow; i++) {
				if (tb.rows[startRow].cells[col].innerHTML == tb.rows[i + 1].cells[0].innerHTML) {
					tb.rows[i + 1].removeChild(tb.rows[i + 1].cells[0]);
					tb.rows[startRow].cells[col].rowSpan = (tb.rows[startRow].cells[col].rowSpan | 0) + 1;
					if (i == endRow - 1 && startRow != endRow) {
                        common.merge_table_cell(tableId, startRow, endRow, col + 1);
					}
				} else {
                    common.merge_table_cell(tableId, startRow, i + 0, col + 1);
					startRow = i + 1;
				}
			}
		}
};
