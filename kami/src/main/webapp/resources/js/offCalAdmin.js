$(function(){
	$("#calendar")
	.fullCalendar(
			{
				defaultDate : new Date() // 오늘
			,
			lang : "ko" // 한국어
				,
				navLinks : false // 주별, 월별.. 
				,
				editable : false // 마우스로 일정 늘리기 가능
				,
				eventLimit : true // 일정 많으면 more
				,
				timeFormat : 'HH:mm',
				header : {
					left : 'today prev,next',
					center : 'title',
					right : 'month,agendaWeek,listWeek'
				},
				googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",
				eventSources : [ // 대한민국 공휴일
					{
						googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
						className : "koHolidays",
						color : "#FF0000",
						textColor : "#FFFFFF"
					} ],
					loading : function(bool) {
						$("#loading").toggle(bool);
					},
					dayClick : function(date, jsEvent, view) {
//										var qwe = "";
//										qwe += "<div class='input-group-addon'>";
//										qwe += "<span class='glyphicon glyphicon glyphicon-pencil' aria-hidden='true'></span>";
//										qwe += "</div>";
//										qwe += "<input type='text' class='form-control' id='content' placeholder='content' value=''>";
						$('#start').val(date.format('YYYY-MM-DD'))
						$('#shour').val(date.format('HH'))
						$('#smin').val(date.format('mm'))
						$('#end').val(date.format('YYYY-MM-DD'))
						$('#ehour').val(date.format('HH'))
						$('#emin').val(date.format('mm'))
						$('#content').val("");
						$("#division").html("");
						$('#writeModal').modal('show')
						$("#shour option:eq(0)").prop("selected", true);
						$("#ehour option:eq(0)").prop("selected", true);
					},
					eventClick : function(calEvent, jsEvent, view) {
						$('#viewModalBody').text(calEvent.content);
						$('#id').val(calEvent.id);
						$('#eventDate').text(
								calEvent.start
								.format('YYYY년 MM월 DD일 HH:mm'));
						if (calEvent.end != null
								&& (calEvent.start
										.format('YYYY년 MM월 DD일 HH:mm') != calEvent.end
										.format('YYYY년 MM월 DD일 HH:mm'))) {
							$('#eventDate')
							.text(
									$('#eventDate').text()
									+ ' ~ '
									+ calEvent.end
									.format('YYYY년 MM월 DD일 HH:mm'));
						}
						if(calEvent.title == "휴무 신청 중"){
							var tt = "";
							tt += "<button type='button' class='btn btn-warning' id='deleteBtn' name='deleteBtn'>삭제</button>";
							tt += "<button type='button' class='btn btn-default' data-dismiss='modal'>닫기</button>";
							$("#modal-footer-btn").html(tt);
						} else {
							var tt = "";
							tt += "<button type='button' class='btn btn-default' data-dismiss='modal'>닫기</button>";
							$("#modal-footer-btn").html(tt);
						}
						$('#viewModal').modal('show')
					},
					displayEventEnd : true,
			});
	sch();
	$(".fc-today-button").on('click', sch);
	$(".fc-prev-button").on('click', sch);
	$(".fc-next-button").on('click', sch);
	$(".fc-agendaweek-button").on('click', sch);
	$(".fc-listweek-button").on('click', sch);
	$(".fc-month-button").on('click', sch);
	$("#saveBtn").on('click', insert);
	$("#deleteBtn").on('click', del);
	$("#updateBtn").on('click', update);
	$("#approvalBtn").on('click', updateOffCheck);
});
function scheduleChoice(num, id, distinct, color, text) {
	if ($(".sBar1").eq(num).is(":checked")) {
		approval();
		$("#calendar").fullCalendar("addEventSource", {
			googleCalendarId : id,
			className : distinct,
			color : color,
			textColor : text
		});
	} else {
		$("#calendar").fullCalendar("removeEventSource", {
			googleCalendarId : id
		});
	}
	$(".koHolidays").attr("href", "javascript:;")
}

function sch() {
	$('#calendar').fullCalendar( 'removeEvents');
	schedule(0);
	schedule(1);
}

function approval() {
	if ($(".sBar2").eq(0).is(":checked")) {
		if($(".sBar3").eq(0).is(":checked")) {
			sch();
		} else {
			$('#calendar').fullCalendar( 'removeEvents');
			schedule(0);
		}
	} else {
		if($(".sBar3").eq(0).is(":checked")) {
			$('#calendar').fullCalendar( 'removeEvents');
			schedule(1);
		} else {
			$('#calendar').fullCalendar( 'removeEvents');
		}
	}
}
function schedule(num) {
	$.ajax({
		url : 'selectOff',
		data : {
			num : num
		},
		type : 'get',
		success : function(cList) {
			output(num, cList);
		}
	});
}

function output(num, cList) {
	var c = '';
	if(num == 0){
		c = '#5fd14b';
		
		$.each(cList, function(index, item) {
			$('#calendar').fullCalendar('renderEvent', {
				title : "휴무 신청 중",
				content : "디자이너 "+item.emp_id+" 휴무 신청 중",
				start : item.off_startdate,
				end : item.off_enddate,
				allDay : false,
				id : item.off_scheduleseq,
				groupId : item.emp_id,
				backgroundColor : c
			});
		})
	} else if(num == 1) {
		c = '#4b68d1';
		
		$.each(cList, function(index, item) {
			$('#calendar').fullCalendar('renderEvent', {
				title : "휴무 승인",
				content : "디자이너 "+item.emp_id+"휴무 승인",
				start : item.off_startdate,
				end : item.off_enddate,
				allDay : false,
				id : item.off_scheduleseq,
				groupId : item.emp_id,
				backgroundColor : c
			});
		})
	}
}	

var flag = 0;

function update() {
	flag = 1;
	var id = $('#id').val();
	$('#viewModal').modal('hide');
	$.ajax({
		url : 'selectOffOne',
		data : {
			off_scheduleseq : id
		},
		type : 'post',
		success : function(result) {
			var off = result;
			var s = off.off_startdate;
			var start = s.split(" ");
			var stime = start[1].split(":");
			var e = off.off_enddate;
			var end = e.split(" ");
			var etime = end[1].split(":");
			$(".modal-header").html("일정 수정");
			$("#division").html("");
			$('#writeModal').modal('show');
			$("#start").val(start[0]);
			$("#shour").val(stime[0]);
			$("#smin").val(stime[1]);
			$("#end").val(end[0]);
			$("#ehour").val(etime[0]);
			$("#emin").val(etime[1]);
			//$("#content").val(cal.content);
		}
	});
}

function insert() {

	// 		var content = $('#content').val();
	// 		if (content == '') {
	// 			alert('내용을 입력하세요');
	// 			return;
	// 		}
	var start = $('#start').val();
	var end = $('#end').val();

	if (!$('#allDay').is(":checked")) {
		start += " " + $('#shour').val() + ":" + $('#smin').val();
		end += " " + $('#ehour').val() + ":" + $('#emin').val();
	} else {
		end = moment($('#end').val()).add(1, 'days').format('YYYY-MM-DD');
	}
	if (flag == 0) {
		$.ajax({
			url : 'insertOff',
			data : {
				off_startdate : start,
				off_enddate : end,
			// 	content : content
			},
			type : 'post',
			success : function() {
				$('#writeModal').modal('hide');
				window.location.reload();
			}
		});
	} else if (flag == 1) {
		var id = $("#id").val();
		$.ajax({
			url : 'updateOff',
			data : {
				off_startdate : start,
				off_enddate : end,
//					content : content,
				off_scheduleseq : id
			},
			type : 'post',
			success : function() {
				flag = 0;
				$('#writeModal').modal('hide');
				window.location.reload();
			}
		});
	}
}
function del() {
	var off_scheduleseq = $('#id').val();

	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url : 'deleteOff',
			data : {
				off_scheduleseq : off_scheduleseq
			},
			type : 'post',
			success : function() {
				$('#viewModal').modal('hide');
				window.location.reload();
			}
		});
	}
}

function updateOffCheck(){
	var id = $('#id').val();
	$.ajax({
		url : 'updateOffCheck',
		data : {
			off_scheduleseq : id
		},
		type : 'post',
		success : function() {
			flag = 0;
			$('#viewModal').modal('hide');
			window.location.reload();
		}
	});
}