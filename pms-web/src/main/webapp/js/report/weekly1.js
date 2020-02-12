$(function () {
    //合并单元格，从后面的列往前合并
    mergeCell('toBeSortedList',0,0,1);
    mergeCell('toBeSortedList',0,0,0);

    mergeCell('toBeDevelopedList',0,0,1);
    mergeCell('toBeDevelopedList',0,0,0);

    mergeCell('bugList',0,0,0);
    $('#print').die().live('click',function(){
        printPage();
    });
});

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