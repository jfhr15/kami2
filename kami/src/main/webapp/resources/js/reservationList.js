$(function() {
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
								left : 'today prev',
								center : 'title',
								right : 'next'
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
// 								var qwe = "";
// 								qwe += "<div class='input-group-addon'>";
// 								qwe += "<span class='glyphicon glyphicon glyphicon-pencil' aria-hidden='true'></span>";
// 								qwe += "</div>";
// 								qwe += "<input type='text' class='form-control' id='content' placeholder='content' value=''>";
								$('#start').val(date.format('YYYY-MM-DD'))
								$('#shour').val(date.format('HH'))
								$('#smin').val(date.format('mm'))
								$('#end').val(date.format('YYYY-MM-DD'))
								$('#ehour').val(date.format('HH'))
								$('#emin').val(date.format('mm'))
								$('#content').val("");
								$(".modal-header").html("예약 하기");
								$("#division").html("");
								$('#writeModal').modal('show')
							},
							eventClick : function(calEvent, jsEvent, view) {
								var nai = "";
								nai += '<h4 class="modal-content" id="viewModalLabel">';
								nai += '<span id="eventDate"></span><br>';
								nai += '</h4>';
								$(".modal-header").html(nai);
								$('#viewModalBody').text(calEvent.content);
//								$('#id').val(calEvent.id);
								if(calEvent.groupId == null){
									$('#eventDate').text(
											calEvent.start
											.format('YYYY년 MM월 DD일 HH:mm')+'~'+calEvent.end
											.format('YYYY년 MM월 DD일 HH:mm'));
									var ca = "";
									ca+='<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>';
									$("#mf").html(ca);
								} else{
									$('#eventDate').text(
											calEvent.start
											.format('YYYY년 MM월 DD일 HH:mm'));
									var ca = "";
									ca+='<button type="button" class="btn btn-warning" id="'+calEvent.id+'" name="cusBtn" onclick="location.href=\'goResCon?reservationseq='+calEvent.id+'\'">고객 정보</button>';
									ca+='<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>';
									$("#mf").html(ca);
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
		$("#moveBtn").on('click', move);
		$("#saveBtn").on('click', insert);
		$("#deleteBtn").on('click', del);
		$("#updateBtn").on('click', update);
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
		schedule();
	}
	
	function approval() {
		if ($(".sBar2").eq(0).is(":checked")) {
			if($(".sBar3").eq(0).is(":checked")) {
				sch();
			} else {
				$('#calendar').fullCalendar( 'removeEvents');
				schedule();
			}
		} else {
			if($(".sBar3").eq(0).is(":checked")) {
				$('#calendar').fullCalendar( 'removeEvents');
				schedule();
			} else {
				$('#calendar').fullCalendar( 'removeEvents');
			}
		}
	}
	function schedule() {
		$.ajax({
			url : 'selectResEmp',
			data : {
			},
			type : 'get',
			success : function(cList) {
				output(cList);
			}
		});
	}

	function output(cList) {
		var c = '#5fd14b';
		$.each(cList, function(index, item) {
			$.ajax({
				url : 'selName',
				data : {
					id : item.mem_id
				},
				type : 'post',
				success : function(result) {
					$.ajax({
						url : 'selProcedure',
						data : {
							reservationseq : item.reservationseq
						},
						type : 'post',
						success : function(pcd_name) {
							$('#calendar').fullCalendar('renderEvent', {
								content : result + " 님 예약(" + pcd_name + ")",
								start : item.rsv_date,
								end : item.rsv_date + item.rsv_time,
								allDay : false,
								id : item.reservationseq,
								groupId : item.mem_id,
								backgroundColor : c
							});
						}
					});
				}
			});
		});
		$.ajax({
			url : 'yasumi',
			data : {
			},
			type : 'get',
			success : function(oList) {
				var d = "#4b68d1";
				$.each(oList, function(index, item) {
					$('#calendar').fullCalendar('renderEvent', {
						content : "휴무일",
						start : item.off_startdate,
						end : item.off_enddate,
						allDay : false,
						id : item.off_scheduleseq,
						backgroundColor : d
					});
				});
			}
		});
	}	
	
	var flag = 0;
	
	function update() {
		flag = 1;
		var id = $('#id').val();
		$('#viewModal').modal('hide');
		$.ajax({
			url : 'selectResOne',
			data : {
				reservationseq : id
			},
			type : 'post',
			success : function(result) {
				var res = result;
				var s = res.rsv_date;
				var start = s.split(" ");
				var stime = start[1].split(":");
				var t = res.rsv_time;
				var time = t.split(":");
				$(".modal-header").html("일정 수정");
				$("#division").html("");
				$('#writeModal').modal('show');
				$("#start").val(start[0]);
				$("#shour").val(stime[0]);
				$("#smin").val(stime[1]);
			}
		});
	}

	function insert() {
		var start = $("#hStart").val();
		if (flag == 0) {
			$.ajax({
				url : 'insertRes',
				data : {
					rsv_date : start
				},
				type : 'post',
				success : function() {
					window.location.reload();
				}
			});
		}else if (flag == 1) {
			var id = $("#id").val();
			$.ajax({
				url : 'updateRes',
				data : {
					rsv_date : start,
					reservationseq : id
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
		var reservationseq = $('#id').val();

		if (confirm("삭제하시겠습니까?")) {
			$.ajax({
				url : 'deleteRes',
				data : {
					reservationseq : reservationseq
				},
				type : 'post',
				success : function() {
					$('#viewModal').modal('hide');
					window.location.reload();
				}
			});
		}
	}
	
	function move(){
		var start = $('#start').val();
		start += " " + $('#shour').val() + ":" + $('#smin').val();
		$("#hStart").val(start);
		$("#sDate").html("예약 시간 : " + start);
		$('#writeModal').modal('hide');
	}
