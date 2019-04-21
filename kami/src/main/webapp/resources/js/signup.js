$(function() {
	$("#id").on("keyup", idcheck);// 아이디 중복체크 및 글자 길이
	$("#pw").on("keyup", length);// 비밀번호 길이
	$("#pw_check").on("keyup", pwcheck);// 비밀번호 확인
	$("#name").on("keyup", hangl);// 한글 유효성검사
	$("#email").on("keyup", echeck);// 이메일 형식 확인
	$("#address").on("keyup", addresscheck);// 이메일 형식 확인
	$("#phone").on("keyup", phonecheck);// 이메일 형식 확인
	$("#employeeBtn").on("click", goInsertEmployee);
	$("#memberBtn").on('click', goInsertMember);
	$("#addbtn").on('click', execDaumPostcode);
});

function address() {
	var add1 = $("#sample6_address").val();
	var add2 = $("#sample6_detailAddress").val();
	var add3 = $("#sample6_extraAddress").val();
	var add4 = $("#sample6_postcode").val();
	if (add2 == "") {

	} else {
		$("#address").val(add1 + add2 + add3 + add4);
	}
}

function goInsertEmployee() {
	idcheck();
	if ($("#duplicatemessage").html() == "등록가능") {
		length();
		if ($("#pwmessage1").html() == "") {
			pwcheck();
			if ($("#pwmessage2").html() == "") {
				hangl();
				if ($("#name_check").html() == "") {
					birthdaycheck();
					if ($("#birth_check").html() == "") {
						echeck();
						if ($("#email_check").html() == "") {
							address();
							addresscheck();
							if ($("#address_check").html() == "") {
								phonecheck();
								if ($("#phone_check").html() == "") {
									$("#division").val(0);
									$("#user").submit();
								}
							}
						}
					}
				}
			}
		}
	}
}

function goInsertMember() {
	idcheck();
	length();
	if ($("#pwmessage1").html() == "") {
		pwcheck();
		if ($("#pwmessage2").html() == "") {
			hangl();
			if ($("#name_check").html() == "") {
				birthdaycheck();
				if ($("#birth_check").html() == "") {
					echeck();
					if ($("#email_check").html() == "") {
						address();
						addresscheck();
						if ($("#address_check").html() == "") {
							if ($("#email_check").val() == null) {
								address();
								addresscheck();
								if ($("#address_check").val() == null) {
									phonecheck();
									if ($("#phone_check").html() == "") {
										$("#division").val(1);
										$("#user").submit();
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

	function idcheck() {// 아이디 유효성검사
		var id = $("#id").val();
		$.ajax({
			url : "idcheck",
			type : "get",
			data : {
				id : id
			},
			success : function(data1) {
				if (id.length <= 10 && id.length >= 3) {
					if (data1 == "duplicated") {
						$("#duplicatemessage").html("email중복");
					} else {
						$("#duplicatemessage").html("등록가능");
						$("#duplicatemessage").css('color', 'green')
					}
				} else {
					$("#duplicatemessage").html("ID는 3글자이상10글자이하를 적어주세요");
				}
			}
		});
	}

	function length() {// pw의 길이 유효성검사
		var pw = $("#pw").val();
		if (pw.length > 16 || pw.length < 8) {
			$("#pwmessage1").html("8이상16이하를 적어주세요");
		} else {
			$("#pwmessage1").html("");
		}
	}

	function pwcheck() {// pw 확인
		var pw_check = $("#pw_check").val();
		var pw = $("#pw").val();
		if (pw_check != pw) {
			$("#pwmessage2").html("비밀번호가 일치하지 않습니다.");
		} else {
			$("#pwmessage2").html("");
		}
	}

	function hangl() {// 한글 유효성검사
		var name = $("#name").val();
		var han = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if (han.test(name) == false) {
			$("#name_check").html("한글을 적어주세요");
			return false;
		} else {
			$("#name_check").html("");
		}
	}

	function echeck() {
		var email = $("#email").val();
		var e = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if (e.test(email) == false) {
			$("#email_check").html("이메일 형식에 맞게 적어주세요.");
			return false;
		} else {
			$("#email_check").html("");
		}
	}

	function addresscheck() {
		var address = $("#address").val();
		if (address == "") {
			alert(address);
			if (address == null) {
				$("#address_check").html("주소를 입력해주세요.");
				return false;
			} else {
				$("#address_check").html("");
			}
		}
	}

		function phonecheck() {
			var phone = $("#phone").val();
			if (phone.length != 11 && phone.length != 10) {
				$("#phone_check").html("형식에 맞지 않는 번호입니다.");
				return false;
			} else {
				$("#phone_check").html("");
			}
		}

		function birthdaycheck() {
			var birthday = $("#birthday").val();
			if (birthday == "") {
				$("#birth_check").html("생년월일을 입력해주세요.");
			} else {
				$("#birth_check").html("");
			}
		}

		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명
																	// 주소를 선택했을
																	// 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open({});
		}
 
