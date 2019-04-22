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
								$('#id').val(calEvent.id);
								$('#eventDate').text(
										calEvent.start
												.format('YYYY년 MM월 DD일 HH:mm'));
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
			url : 'selectRes',
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
			$('#calendar').fullCalendar('renderEvent', {
				title : item.emp_Id,
				content : "디자이너 " + item.emp_id + "에게 예약",
				start : item.rsv_date,
				end : item.rsv_date + item.rsv_time,
				allDay : false,
				id : item.reservationseq,
				groupId : item.mem_id,
				backgroundColor : c
			});
		})
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
		var emp_id = $("#emp_id").val();
		var pcd = $("#pcd").val();
		
		if (flag == 0) {
			$.ajax({
				url : 'insertRes',
				data : {
					rsv_date : start,
					emp_id : emp_id,
					pcd : pcd
				},
				type : 'post',
				success : function() {
					$.ajax({
						url: 'currentRes',
						data:{},
						type: 'get',
						success: function(returndata){
							var pSeq = $("#pcd").val();
							$.ajax({
								url: 'insertPI',
								data:{
									procedureseq : pSeq,
									reservationseq : returndata.reservationseq
								},
								type: 'post',
								success: function(){
									window.location.reload();
								}
							});
						}
					});
				}
			});
		}else if (flag == 1) {
			var id = $("#id").val();
			$.ajax({
				url : 'updateRes',
				data : {
					rsv_date : start,
					reservationseq : id,
					emp_id : emp_id
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

		if (confirm("취소하시겠습니까?")) {
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
		$("#designer").html("디자이너 : 디자이너를 선택해주세요.");
		$.ajax({
			url: "dList",
			data:{
				rsv_date : start
			} ,
			type: "post",
			success: function(dList){
				var cont = "";
				cont += "<table id='dTable'>";
				$.each(dList,function(index,item){
					cont += "<a id=" + item.id + " name=" + item.name + " onclick='inputEmp_id(id, name)'>디자이너 "+ item.name + "</a><br>";
				});
				cont += "</table>";
				$("#dList").html(cont);
			}
		});
		$('#writeModal').modal('hide');
	}
	
	function inputEmp_id(id, name){
		$("#emp_id").val(id);
		$("#designer").html("디자이너 : " + name);
		$("#dList").html("");
	}
	
	var BANNER_INDEX = 1;
    // 배너의 위치 : 배너가 움직이려면 LEFT값을 변경해야 하는데 LEFT 값을 계산하려면 배너의 위치가 필요하다.
    var BANNER_LEN = 0;
    //배너의 넓이 : 배너의 넓이는 언제든지 변할 수 있으니 배너의 넓이를 정의하는 변수를 정의한다.
    var BANNER_WIDTH = 102;
    //배너의 개수 : 사용자의 요청에 따라 배너의 개수가 변할 수 있으니 배너의 개수를 정의하는 변수가 필요하다.
    var SHOW_DURATION = 200;
    //슬라이드 속도를 조절할수있다. 200/1000초로 기본 셋을 설정한다.
  $(document).ready(function() {

        bannerInit();

        $("#btn_left").unbind();
        $("#btn_left").bind("click", function() {
            var nIndex = BANNER_INDEX - 1;
            //0의 기점으로 기준점을 맞춰둔다. 
            //nIndex는 기준점이 된다.

            /*if (nIndex < 0) {
                nIndex = BANNER_LEN - 1;
            }*/
            showBannerAt(nIndex);
            //$("#banner_wrapper").stop().animate({left:-103}, 1000);
        });
        $("#btn_right").unbind();
        $("#btn_right").bind("click", function() {
            // 이동할 이전 배너 인덱스 값 구하기.
            var nIndex = BANNER_INDEX + 1;
            /* if (nIndex >= BANNER_LEN) {
                 nIndex = 0;
             }*/
            //alert(BANNER_INDEX);
            // n번째 배너 보이기.
            showBannerAt(nIndex);
            //$("#banner_wrapper").stop().animate({left:103}, 1000);
        });
    });
    // nIndex에 해당하는 배너 보이기.
    function showBannerAt(nIndex) {
        //if(nIndex != BANNER_INDEX){ 
        //배너의 위치가 기준점과 같지 않을 경우, 같을수가 없는 상황인데, 이는 버그를 최소화 하기 위하여 줄인다.
        // alert(nIndex);
        var nPosition = -BANNER_WIDTH * nIndex;
        //슬라이드 시작
        $("#banner_wrapper").stop();
        $("#banner_wrapper").animate({
            left: nPosition
        }, SHOW_DURATION, function() {
            //****************************************여기부터
            // 이전 내용이 없는 경우 마지막 배너 인덱스 값으로 설정하기.
            if (nIndex < 1) {
                nIndex = BANNER_LEN;
                nPosition = -BANNER_WIDTH * nIndex;
                $("#banner_wrapper").css({
                    "left": nPosition + "px"
                });
            }

            // 다음 내용이 없는 경우, 첫 번째 배너 인덱스 값으로 설정하기.
            if (nIndex > BANNER_LEN) {
                nIndex = 1;
                nPosition = -BANNER_WIDTH * nIndex;
                $("#banner_wrapper").css({
                    "left": nPosition + "px"
                });
            }
            //현재 배너 인덱스 업데이트 시키기.
            BANNER_INDEX = nIndex;
        });
        //}
    }

    function bannerInit() { //초기 setting
        BANNER_LEN = $("#banner_wrapper .page").length;
        $("#banner_wrapper").css({
            "left": -BANNER_WIDTH
        });
    }

function proce(id){
	$.ajax({
		url: 'pOne',
		data:{
			procedureseq : id
		},
		type: 'post',
		success: function(returndata){
			$("#procedure").html("시술 : " + returndata.pcd_name);
			$("#pcd").val(returndata.procedureseq);
		}
	});
}

function checkbox() {
    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
    $('input[type="checkbox"][name="checkbox"]').click(function(){
        //클릭 이벤트 발생한 요소가 체크 상태인 경우
        if ($(this).prop('checked')) {
            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
            $('input[type="checkbox"][name="checkbox"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
}

function selectP(id){
	$.ajax({
		url: 'pList',
		data:{
			pcd_setting : id
		},
		type: 'post',
		success: function(returndata){
			var con = "";
			con += '<ul class="testul">';
			$.each(returndata, function(index, item){
				if(item.pcd_price == 0){
					con += '<li class="testli"><input id="' + item.procedureseq + '" name="checkbox" type="checkbox" onclick="proce(this.id)"> <label class="testlabel" for="' + item.procedureseq + '">' + item.pcd_name + '</label><label>' + item.pcd_time + '분 소요 | 무료</label></li>';
				} else {
					con += '<li class="testli"><input id="' + item.procedureseq + '" name="checkbox" type="checkbox" onclick="proce(this.id)"> <label class="testlabel" for="' + item.procedureseq + '">' + item.pcd_name + '</label><label>' + item.pcd_time + '분 소요 | ' + item.pcd_price + '원</label></li>';
				}
			});
			con += '</ul>';
			$("#conte").html(con);
			checkbox();
		}
	});
}
