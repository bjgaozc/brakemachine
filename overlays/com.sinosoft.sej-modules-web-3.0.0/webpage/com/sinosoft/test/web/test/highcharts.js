$(function () {
	test1();
	test5();
});






function test7(){
	initHighcharts({
//		id:'#highchartsContainerId',
		js:'highcharts-more,modules/exporting',
        chart: {
            backgroundColor: 'white',
            events: {
                load: function () {

                    // Draw the flow chart
                    var ren = this.renderer,
                        colors = Highcharts.getOptions().colors,
                        rightArrow = ['M', 0, 0, 'L', 100, 0, 'L', 95, 5, 'M', 100, 0, 'L', 95, -5],
                        leftArrow = ['M', 100, 0, 'L', 0, 0, 'L', 5, 5, 'M', 0, 0, 'L', 5, -5];



                    // Separator, client from service
                    ren.path(['M', 120, 40, 'L', 120, 330])
                        .attr({
                            'stroke-width': 2,
                            stroke: 'silver',
                            dashstyle: 'dash'
                        })
                        .add();

                    // Separator, CLI from service
                    ren.path(['M', 420, 40, 'L', 420, 330])
                        .attr({
                            'stroke-width': 2,
                            stroke: 'silver',
                            dashstyle: 'dash'
                        })
                        .add();

                    // Headers
                    ren.label('Web client', 20, 40)
                        .css({
                            fontWeight: 'bold'
                        })
                        .add();
                    ren.label('Web service / CLI', 220, 40)
                        .css({
                            fontWeight: 'bold'
                        })
                        .add();
                    ren.label('Command line client', 440, 40)
                        .css({
                            fontWeight: 'bold'
                        })
                        .add();

                    // SaaS client label
                    ren.label('SaaS client<br/>(browser or<br/>script)', 10, 82)
                        .attr({
                            fill: colors[0],
                            stroke: 'white',
                            'stroke-width': 2,
                            padding: 5,
                            r: 5
                        })
                        .css({
                            color: 'white'
                        })
                        .add()
                        .shadow(true);

                    // Arrow from SaaS client to Phantom JS
                    ren.path(rightArrow)
                        .attr({
                            'stroke-width': 2,
                            stroke: colors[3]
                        })
                        .translate(95, 95)
                        .add();

                    ren.label('POST options in JSON', 90, 75)
                        .css({
                            fontSize: '10px',
                            color: colors[3]
                        })
                        .add();

                    ren.label('PhantomJS', 210, 82)
                        .attr({
                            r: 5,
                            width: 100,
                            fill: colors[1]
                        })
                        .css({
                            color: 'white',
                            fontWeight: 'bold'
                        })
                        .add();

                    // Arrow from Phantom JS to Batik
                    ren.path(['M', 250, 110, 'L', 250, 185, 'L', 245, 180, 'M', 250, 185, 'L', 255, 180])
                        .attr({
                            'stroke-width': 2,
                            stroke: colors[3]
                        })
                        .add();

                    ren.label('SVG', 255, 120)
                        .css({
                            color: colors[3],
                            fontSize: '10px'
                        })
                        .add();

                    ren.label('Batik', 210, 200)
                        .attr({
                            r: 5,
                            width: 100,
                            fill: colors[1]
                        })
                        .css({
                            color: 'white',
                            fontWeight: 'bold'
                        })
                        .add();

                    // Arrow from Batik to SaaS client
                    ren.path(['M', 235, 185, 'L', 235, 155, 'C', 235, 130, 235, 130, 215, 130,
                              'L', 95, 130, 'L', 100, 125, 'M', 95, 130, 'L', 100, 135])
                        .attr({
                            'stroke-width': 2,
                            stroke: colors[3]
                        })
                        .add();

                    ren.label('Rasterized image', 100, 110)
                        .css({
                            color: colors[3],
                            fontSize: '10px'
                        })
                        .add();

                    // Browser label
                    ren.label('Browser<br/>running<br/>Highcharts', 10, 180)
                        .attr({
                            fill: colors[0],
                            stroke: 'white',
                            'stroke-width': 2,
                            padding: 5,
                            r: 5
                        })
                        .css({
                            color: 'white',
                            width: '100px'
                        })
                        .add()
                        .shadow(true);



                    // Arrow from Browser to Batik
                    ren.path(rightArrow)
                        .attr({
                            'stroke-width': 2,
                            stroke: colors[1]
                        })
                        .translate(95, 205)
                        .add();

                    ren.label('POST SVG', 110, 185)
                        .css({
                            color: colors[1],
                            fontSize: '10px'
                        })
                        .add();

                    // Arrow from Batik to Browser
                    ren.path(leftArrow)
                        .attr({
                            'stroke-width': 2,
                            stroke: colors[1]
                        })
                        .translate(95, 215)
                        .add();

                    ren.label('Rasterized image', 100, 215)
                        .css({
                            color: colors[1],
                            fontSize: '10px'
                        })
                        .add();

                    // Script label
                    ren.label('Script', 450, 82)
                        .attr({
                            fill: colors[2],
                            stroke: 'white',
                            'stroke-width': 2,
                            padding: 5,
                            r: 5
                        })
                        .css({
                            color: 'white',
                            width: '100px'
                        })
                        .add()
                        .shadow(true);

                    // Arrow from Script to PhantomJS
                    ren.path(leftArrow)
                        .attr({
                            'stroke-width': 2,
                            stroke: colors[2]
                        })
                        .translate(330, 90)
                        .add();

                    ren.label('Command', 340, 70)
                        .css({
                            color: colors[2],
                            fontSize: '10px'
                        })
                        .add();

                    // Arrow from PhantomJS to Script
                    ren.path(rightArrow)
                        .attr({
                            'stroke-width': 2,
                            stroke: colors[2]
                        })
                        .translate(330, 100)
                        .add();

                    ren.label('Rasterized image', 330, 100)
                        .css({
                            color: colors[2],
                            fontSize: '10px'
                        })
                        .add();


                }
            }
        },
        title: {
            text: 'Highcharts export server overview',
            style: {
                color: 'black'
            }
        }

    });
}

function test6(){
	initHighcharts({
//		id:'#highchartsContainerId',
		js:'highcharts-more',
        chart: {
            polar: true
        },
        title: {
            text: 'Highcharts Polar Chart'
        },
        pane: {
            startAngle: 0,
            endAngle: 360
        },
        xAxis: {
            tickInterval: 45,
            min: 0,
            max: 360,
            labels: {
                formatter: function () {
                    return this.value + '°';
                }
            }
        },
        yAxis: {
            min: 0
        },
        plotOptions: {
            series: {
                pointStart: 0,
                pointInterval: 45
            },
            column: {
                pointPadding: 0,
                groupPadding: 0
            }
        },
        series: [{
            type: 'column',
            name: 'Column',
            data: [8, 7, 6, 5, 4, 3, 2, 1],
            pointPlacement: 'between'
        }, {
            type: 'line',
            name: 'Line',
            data: [1, 2, 3, 4, 5, 6, 7, 8]
        }, {
            type: 'area',
            name: 'Area',
            data: [1, 8, 2, 7, 3, 6, 4, 5]
        }]
    });
}

function test5(){
	initHighcharts({
		id:'#highchartsContainerId5',
		js:'highcharts-3d,highcharts-more',
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 10,
                viewDistance: 25,
                depth: 40
            },
            marginTop: 80,
            marginRight: 40
        },
        title: {
            text: '护照数据上报统计一览'
        },
        xAxis: {
            categories: ['第1周', '第2周', '第3周', '第4周', '第5周']
        },
        yAxis: {
            allowDecimals: false,
            min: 0,
            title: {
                text: '每次同步记录数'
            }
        },
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                depth: 40
            }
        },
        series: [{
            name: '成功',
            data: [5, 3, 4, 7, 2],
            stack: 'male'
        }, {
            name: '网络错误',
            data: [3, 4, 4, 2, 5],
            stack: 'male'
        }, {
            name: 'xml格式错误',
            data: [2, 5, 6, 2, 1],
            stack: 'female'
        }, {
            name: '授权id验证错误',
            data: [3, 0, 4, 4, 3],
            stack: 'female'
        }]
    });
}

function test4(){
	$('body').append('<script src="plug-in/highcharts/js/highcharts.js"></script>');
	$('body').append('<script src="plug-in/highcharts/js/highcharts-3d.js"></script>');
    // Set up the chart
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'highchartsContainerId',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        credits:{enabled:false},
        title: {
            text: 'Chart rotation demo'
        },
        subtitle: {
            text: 'Test options by dragging the sliders below'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        series: [{
            data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        }]
    });

    function showValues() {
        $('#R0-value').html(chart.options.chart.options3d.alpha);
        $('#R1-value').html(chart.options.chart.options3d.beta);
    }

    // Activate the sliders
    $('#R0').on('change', function () {
        chart.options.chart.options3d.alpha = this.value;
        showValues();
        chart.redraw(false);
    });
    $('#R1').on('change', function () {
        chart.options.chart.options3d.beta = this.value;
        showValues();
        chart.redraw(false);
    });

    showValues();
}

function test3(){
	var o = {
//		js:'modules/exporting',
		jsAll:true,
        xAxis: {
            categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
        },
        labels: {
            items: [{
                html: 'Total fruit consumption',
                style: {
                    left: '50px',
                    top: '18px',
                    color: 'black'
                }
            }]
        },
        series: [{
            type: 'column',
            name: 'Jane',
            data: [3, 2, 1, 3, 4]
        }, {
            type: 'column',
            name: 'John',
            data: [2, 3, 5, 7, 6]
        }, {
            type: 'column',
            name: 'Joe',
            data: [4, 3, 3, 9, 0]
        }, {
            type: 'spline',
            name: 'Average',
            data: [3, 2.67, 3, 6.33, 3.33],
            marker: {
                lineWidth: 2,
                lineColor: 'blue',
                fillColor: 'white'
            }
        }, {
            type: 'pie',
            name: 'Total consumption',
            data: [{
                name: 'Jane',
                y: 13,
                color: 'red' // Jane's color
            }, {
                name: 'John',
                y: 23,
                color: 'green' // John's color
            }, {
                name: 'Joe',
                y: 19,
                color: 'gray' // Joe's color
            }],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
        }]
    };
	
	initHighcharts(o);
}

function test2(){
	var r = ajax("testAllController.do?getHighchartsData");
	if(r){
		var c = eval("("+r+")");
		log(c);
		$('#container').highcharts(c);
	}
}


function test1(){
	initHighcharts({
		title: {
            text: '每月平均气温',
            x: -20 //center
        },
        subtitle: {
            text: '数据源: WorldClimate.com',
            x: -20
        },
        xAxis: {
            categories: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月']
        },
        yAxis: {
            title: {
                text: '温度 (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: '东京',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: '纽约',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: '柏林',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: '伦敦',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });
}
