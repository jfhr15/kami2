$(function() {
	var sec = $("#idPwSel", opener.document).val();
	if(sec == 0){
		act1();
	}
	else if(sec == 1){
		act2();
	}
	$("#idSearchPage").on('click', act1);
	$("#pwSearchPage").on('click', act2);
});

var hid = "";

function act1(){
	$("#head").html("아이디 찾기");
	hid+='<form id="idTableForm">';
	hid+='<table id="idPopupTable">';
	hid+='	<tr><td class="popup_text">이름</td>';
	hid+='	<td><input type="text" id="is_name" name="is_name" class="popup_input"></td></tr>';
	hid+='	<tr><td class="popup_text">전화번호</td>';
	hid+='	<td><input type="text" id="is_phone" name="is_phone" class="popup_input"></td></tr>';
	hid+='	<tr><td class="popup_text">이메일</td>';
	hid+='	<td><input type="email" id="is_email" name="is_email" class="popup_input"></td></tr>';
	hid+='</table>';
	hid+='	<input type="button" id="idBtn" name="idBtn" value="찾기" class="popup_btn">';
	hid+='</form>';
	$("#sel").html(hid);
	$('#idBtn').on('click', actId);
	hid="";
}

function act2(){
	$("#head").html("비밀번호 찾기");
	hid+='<form id="pwTableForm">';
	hid+='<table id="pwPopupTable">';
	hid+='	<tr><td class="popup_text">아이디</td>';
	hid+='	<td><input type="text" id="is_id" name="is_id" class="popup_input"></td></tr>';
	hid+='	<tr><td class="popup_text">전화번호</td>';
	hid+='	<td><input type="text" id="is_phone" name="is_phone" class="popup_input"></td></tr>';
	hid+='	<tr><td class="popup_text">이메일</td>';
	hid+='	<td><input type="email" id="is_email" name="is_email" class="popup_input"></td></tr>';
	hid+='</table>';
	hid+='	<input type="button" id="pwBtn" name="pwBtn" value="찾기" class="popup_btn">';
	hid+='</form>';
	$("#sel").html(hid);
	$('#pwBtn').on('click', actPw);
	hid="";
}

function actId(){
	var is_name = $("#is_name").val();
	var is_phone = $("#is_phone").val();
	var is_email = $("#is_email").val();
	
	$.ajax({
		url: 'idSearch',
		data: {
			is_name : is_name,
			is_phone : is_phone,
			is_email : is_email
		},
		type: 'post',
		success: function(returnData){
			idResult(returnData.id);
		}
	});
}

function idResult(id){
	hid+='<div id="searchText">회원님의 정보와 일치하는 아이디 목록입니다.</div>';
	hid+='<h2 id="searchResult">'+id+'</h2>';
	hid+='<input type="button" id="clBtnId" name="clBtnId" value="로그인하러 가기" class="popup_btn2">';
	hid+='<input type="button" id="pwBtn2" name="pwBtn2" value="비밀번호 찾기" class="popup_btn2">';
	$("#sel").html(hid);
	hid="";
	$("#clBtn").on('click',cls);
	$("#pwBtn2").on('click',act2);
}

function actPw(){
	var is_id = $("#is_id").val();
	var is_phone = $("#is_phone").val();
	var is_email = $("#is_email").val();
	
	$.ajax({
		url: 'pwSearch',
		data: {
			is_id : is_id,
			is_phone : is_phone,
			is_email : is_email
		},
		type: 'post',
		success: function(returnData){
			pwResult(returnData.pw);
		}
	});
}

function pwResult(pw){
	hid+='<div id="searchText">회원님의 비밀번호입니다.</div>';
	hid+='<h2 id="searchResult">'+pw+'</h2>';
	hid+='<input type="button" id="clBtnPw" name="clBtnPw" value="로그인하러 가기" class="popup_btn2">';
	$("#sel").html(hid);
	hid="";
	$("#clBtnPw").on('click',cls);
	$("#pwBtn2").on('click',act2);
}

function cls(){
	window.close();
	return false;
}