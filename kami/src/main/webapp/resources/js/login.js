$(function(){
	$("#is").on('click',idSearch);
	$("#ip").on('click',ipSearch);
	
	function idSearch(){
		$("#idPwSel").val(0);
		window.open("goSearchPopup","아이디 찾기","top=100,left=200,width=650,height=370,toolbar=0,status=0,scrollbars=1,resizable=0");
	}
	function ipSearch(){
		$("#idPwSel").val(1);
		window.open("goSearchPopup","비밀번호찾기 찾기","top=100,left=200,width=650,height=370,toolbar=0,status=0,scrollbars=1,resizable=0");
	}
});
