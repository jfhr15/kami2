var ListH = null;
var ListV = null;
var H = null;
var pieN = null;
var pieV = null;
var areaH = null;
var areaV = null;
$(function() {
	
	init();

	$('#myBarChart').on('click', BarChartClick);
});

function init(H) {

	// 바 차트 값가져오기
	var clickId = H;
	var userid = '${sessionScope.loginId}';
	$.ajax({
		url : 'chartListH',
		data : {},
		type : 'post',
		success : function(List) {
			ListH = List;

			$.ajax({
				url : 'chartListV',
				data : {},
				type : 'post',
				success : function(List) {
					ListV = List;

					Barchart();
				}
			});
		}
	});

	// 파이 차트 값가져오기
	$.ajax({

		url : 'pieChartN',
		data : {
			clickId : clickId
		},
		type : 'post',
		success : function(List) {
			pieN = List;

			$.ajax({
				url : 'pieChartV',
				data : {
					clickId : clickId
				},
				type : 'post',
				success : function(List) {
					pieV = List;

					Piechart();
				}
			});
		}
	});

	// 월별 차트 값가져오기
	$.ajax({
		url : 'areaChartH',
		data : {
			clickId : clickId

		},
		type : 'post',
		success : function(List) {
			areaH = List;

			$.ajax({
				url : 'areaChartV',
				data : {
					clickId : clickId

				},
				type : 'post',
				success : function(List) {
					areaV = List;

					Areachart();
				}
			});
		}
	});

}

// 바차트 클릭처리 함수
function BarChartClick() {

	init(H);
}

// 바 차트 넣기
function Barchart() {

	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(
			ctx,
			{
				type : 'bar',
				data : {
					labels : ListH,
					datasets : [ {
						label : "Revenue",
						backgroundColor : "#4e73df",
						hoverBackgroundColor : "#2e59d9",
						borderColor : "#4e73df",
						data : ListV,
					} ],
				},
				options : {
					maintainAspectRatio : false,
					layout : {
						padding : {
							left : 10,
							right : 25,
							top : 25,
							bottom : 0
						}
					},
					scales : {
						xAxes : [ {
							time : {
								unit : 'month'
							},
							gridLines : {
								display : false,
								drawBorder : false
							},
							ticks : {
								maxTicksLimit : 6
							},
							maxBarThickness : 25,
						} ],
						yAxes : [ {
							ticks : {
								min : 0,
								max : 15000,
								maxTicksLimit : 5,
								padding : 10,
								// Include a dollar sign in the ticks
								callback : function(value, index, values) {

									return number_format(value);
								}
							},
							gridLines : {
								color : "rgb(234, 236, 244)",
								zeroLineColor : "rgb(234, 236, 244)",
								drawBorder : false,
								borderDash : [ 2 ],
								zeroLineBorderDash : [ 2 ]
							}
						} ],
					},
					legend : {
						display : false
					},
					tooltips : {
						titleMarginBottom : 10,
						titleFontColor : '#6e707e',
						titleFontSize : 14,
						backgroundColor : "rgb(255,255,255)",
						bodyFontColor : "#858796",
						borderColor : '#dddfeb',
						borderWidth : 1,
						xPadding : 15,
						yPadding : 15,
						displayColors : false,
						caretPadding : 10,
						callbacks : {
							label : function myBarChart(tooltipItem, chart) {
								var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
										|| '';

								H = tooltipItem.xLabel;
								return number_format(tooltipItem.yLabel);
							}

						}
					},
				}
			});
}

// 파이 차트 넣기
function Piechart() {

	// Pie Chart Example

	var ctx = document.getElementById("myPieChart");

	var myPieChart = new Chart(ctx, {
		type : 'doughnut',
		data : {

			labels : pieN,

			datasets : [ {

				data : pieV,

				backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ],
				hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ],
				hoverBorderColor : "rgba(234, 236, 244, 1)",
			} ],
		},
		options : {
			maintainAspectRatio : false,
			tooltips : {
				backgroundColor : "rgb(255,255,255)",
				bodyFontColor : "#858796",
				borderColor : '#dddfeb',
				borderWidth : 1,
				xPadding : 15,
				yPadding : 15,
				displayColors : false,
				caretPadding : 10,
			},
			legend : {
				display : false
			},
			cutoutPercentage : 80,
		},
	});
}

// 월별 차트넣기
function Areachart() {
	var ctx = document.getElementById("myAreaChart");

	var myLineChart = new Chart(
			ctx,
			{
				type : 'line',
				data : {
					labels : areaH,
					datasets : [ {
						label : "Earnings",
						lineTension : 0.3,
						backgroundColor : "rgba(78, 115, 223, 0.05)",
						borderColor : "rgba(78, 115, 223, 1)",
						pointRadius : 3,
						pointBackgroundColor : "rgba(78, 115, 223, 1)",
						pointBorderColor : "rgba(78, 115, 223, 1)",
						pointHoverRadius : 3,
						pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
						pointHoverBorderColor : "rgba(78, 115, 223, 1)",
						pointHitRadius : 10,
						pointBorderWidth : 2,
						data : areaV,
					} ],
				},
				options : {
					maintainAspectRatio : false,
					layout : {
						padding : {
							left : 10,
							right : 25,
							top : 25,
							bottom : 0
						}
					},
					scales : {
						xAxes : [ {
							time : {
								unit : 'date'
							},
							gridLines : {
								display : false,
								drawBorder : false
							},
							ticks : {
								maxTicksLimit : 7
							}
						} ],
						yAxes : [ {
							ticks : {
								maxTicksLimit : 5,
								padding : 10,
								// Include a dollar sign in the ticks
								callback : function(value, index, values) {
									return '$' + number_format(value);
								}
							},
							gridLines : {
								color : "rgb(234, 236, 244)",
								zeroLineColor : "rgb(234, 236, 244)",
								drawBorder : false,
								borderDash : [ 2 ],
								zeroLineBorderDash : [ 2 ]
							}
						} ],
					},
					legend : {
						display : false
					},
					tooltips : {
						backgroundColor : "rgb(255,255,255)",
						bodyFontColor : "#858796",
						titleMarginBottom : 10,
						titleFontColor : '#6e707e',
						titleFontSize : 14,
						borderColor : '#dddfeb',
						borderWidth : 1,
						xPadding : 15,
						yPadding : 15,
						displayColors : false,
						intersect : false,
						mode : 'index',
						caretPadding : 10,
						callbacks : {
							label : function(tooltipItem, chart) {
								var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
										|| '';
								return datasetLabel + ': $'
										+ number_format(tooltipItem.yLabel);
							}
						}
					}
				}
			});
}