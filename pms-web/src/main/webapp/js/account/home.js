$(function(){
	init();
	// setInterval(function(){
	// 	init();
	// },60000);
	$('.gzt-cards li').die().live('click',function(){
		var linked=$(this).attr('link');
		switch (linked) {
			case 'task':
                parent.addTab('/task/todo.do.do','我的任务',common.getContextPath()+'/task/todo.do.do');
				break;
            case 'bug':
                parent.addTab('/bug/tosolve.do','待解决bug',common.getContextPath()+'/bug/tosolve.do');
                break;
            case 'test':
                parent.addTab('/test/totest.do','测试列表',common.getContextPath()+'/test/totest.do');
                break;
            case 'release':
                parent.addTab('/release/torelease.do','待发布列表',common.getContextPath()+'/release/torelease.do');
                break;

        }
	});
});

function init(){
	//初始化个人待办
    $.ajax({
        url: common.getContextPath()+'/account/getGkCounts.do',
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
                $('#task').html(data.ext1);
                $('#bug').html(data.ext2);
                $('#test').html(data.ext3);
                $('#release').html(data.ext4);
            }
        }
    });
	//初始化项目需求占比
    $.ajax({
        type: "post",
        url: "getProjectSum.do",
        async: true,
        dataType: "json",
        error : function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
            console.log(jqXHR.readyState);
            console.log(textStatus);
            console.log(errorThrown);
        },
        success: function (data) {
            projectChart(data);
        }
    });
    //初始化来源统计
    $.ajax({
        type: "post",
        url: "getSourceSum.do",
        async: true,
        dataType: "json",
        error : function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.responseText);
            console.log(jqXHR.readyState);
            console.log(textStatus);
            console.log(errorThrown);
        },
        success: function (data) {
            sourceChart(data);
        }
    });
}

function projectChart(data){
    var nameArray=new Array();
    for(var i = 0; i < data.length; i++){
        nameArray[i]=data[i].name;
	}
    var myChart = echarts.init(document.getElementById('projectChart'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '项目需求占比'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'right',
            data:nameArray
        },
        series : [
            {
                name: '项目需求占比',
                type: 'pie',
                radius: '90%',
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:data,
                itemStyle: {
                    normal:{
                        color:function(params) {
                            //自定义颜色
                            var colorList = [
                                '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                            ];
                            return colorList[params.dataIndex]
                        },
						shadowBlur:20,
                        shadowColor:'rgba(166,177,188,0.3)'
                    }
                },
				visualMap:{
                	show:false,
					min:0,
					max:10000,
					inRange:{
                		colorLightness:[0,0.5]
					},
					color:['rgb(150,220,230)','rgb(70,170,230)']
				}
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}

function sourceChart(data){
    var nameArray=new Array();
    var ext1Array=new Array();
    var ext2Array=new Array();
    for(var i = 0; i < data.length; i++){
        nameArray[i]=data[i].name;
        ext1Array[i]=data[i].ext1;
        ext2Array[i]=data[i].ext2;
    }
    var myChart = echarts.init(document.getElementById('sourceChart'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '需求来源分布'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '1%',
            right: '1%',
            bottom: '1%',
            containLabel: true
        },
        xAxis: {
            data:nameArray
        },
        yAxis: [
            {
                type: 'value',
                name: '数量',
                axisLabel: {
                    formatter: '{value}'
                }
            }
        ],
        series: [
            {
                name : '进行中',
                type : 'bar',
                data :ext1Array,
                itemStyle: {
                    normal:{
                        color:function(params) {
                            //自定义颜色
                            var colorList = ['#ff7f50','#87cefa', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'];
                            return colorList[params.dataIndex]
                        },
                        shadowBlur:20,
                        shadowColor:'rgba(166,177,188,0.3)'
                    }
                },
                visualMap:{
                    show:false,
                    min:0,
                    max:10000,
                    inRange:{
                        colorLightness:[0,0.5]
                    },
                    color:['rgb(150,220,230)','rgb(70,170,230)']
                }
            },
            {
                name : '已完成',
                type : 'bar',
                data : ext2Array,
                itemStyle: {
                    normal:{
                        color:function(params) {
                            //自定义颜色
                            var colorList = [
                                '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                            ];
                            return colorList[params.dataIndex]
                        },
                        shadowBlur:20,
                        shadowColor:'rgba(166,177,188,0.3)'
                    }
                },
                visualMap:{
                    show:false,
                    min:0,
                    max:10000,
                    inRange:{
                        colorLightness:[0,0.5]
                    },
                    color:['rgb(150,220,230)','rgb(70,170,230)']
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}