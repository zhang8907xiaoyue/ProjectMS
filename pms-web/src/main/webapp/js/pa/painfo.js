$(function () {
    //日期控件初始化
    $('.date-picker').datepicker({
        language : 'zh-CN',
        autoclose : true,
        todayHighlight : true,
        autoclose : true
    }).next().on(ace.click_event, function() {
        $(this).prev().focus();
    });
    tabShow();
    hbdyg();

    $('#search').die().live('click',function(){
        tabShow();
        hbdyg();
    });
    $('#print').die().live('click',function(){
        printPage();
    });
});

function hbdyg() {
    //合并单元格，从后面的列往前合并
    mergeCell('toBeSortedList',0,0,1);
    mergeCell('toBeSortedList',0,0,0);

    mergeCell('toBeDevelopedList',0,0,1);
    mergeCell('toBeDevelopedList',0,0,0);

    mergeCell('bugList',0,0,0);
}

function tabShow() {
    var starttime = $('#starttime').val();
    var endtime = $('#endtime').val();
    $.ajax({
        url: common.getContextPath()+'/pa/getPainfoList.do',
        type: 'Post',
        dataType: "json",
        data:{
            starttime:starttime,
            endtime:endtime
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
                $('#tb_body').html('');
                for(var i=0;i<data.length;i++){
                    $('#tb_body').append('<tr><td>'+data[i].v2+'</td>'+
                        '<td>'+data[i].v1+'</td>'+
                        '<td>'+data[i].v3+'</td>'+
                        '<td>'+data[i].v4+'</td>'+
                        '<td>'+data[i].v5+'</td>'+
                        '<td>'+data[i].v6+'</td>'+
                        '<td>'+data[i].v7+'</td>'+
                        '<td>'+data[i].v8+'</td>'+
                        '<td>'+data[i].v9+'</td>'+
                        '<td>'+data[i].v10+'</td></tr>');
                }
            }
        }
    });
}


/**
 * 合并单元格
 * @param tableId 表格id
 * @param startRow 开始行
 * @param endRow 结束行
 * @param col 列
 */
function mergeCell(tableId, startRow, endRow, col) {
    var tb = document.getElementById(tableId);
    if(!tb || !tb.rows || tb.rows.length <= 0) {
        return;
    }
    if(col >= tb.rows[0].cells.length || (startRow >= endRow && endRow != 0)) {
        return;
    }
    if(endRow == 0) {
        endRow = tb.rows.length - 1;
    }
    for(var i = startRow; i < endRow; i++) {
        if(tb.rows[startRow].cells[col].innerHTML == tb.rows[i + 1].cells[col].innerHTML) { //如果相等就合并单元格,合并之后跳过下一行
            tb.rows[i + 1].removeChild(tb.rows[i + 1].cells[col]);
            tb.rows[startRow].cells[col].rowSpan = (tb.rows[startRow].cells[col].rowSpan) + 1;
        } else {
            mergeCell(tableId, i + 1, endRow, col);
            break;
        }
    }
}

/**
 * 打印报告
 */
function printPage(){
    bdhtml=window.document.body.innerHTML;
    sprnstr="<!--startprint-->";
    eprnstr="<!--endprint-->";
    prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
    prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
    window.document.body.innerHTML=prnhtml;
    window.print();
}