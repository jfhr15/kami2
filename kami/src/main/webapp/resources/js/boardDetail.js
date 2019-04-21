$(function() {
	init();
	$('#commentRegist').on('click', commentRegist);
}); 

function boardDelete() {
	location.href="boardDelete?boardseq=${board.boardseq}";
}
function boardUpdate() {
	location.href="boardUpdate?boardseq=${board.boardseq}";
}

//초기화
function init() {
	// Code here
	var userid = '${sessionScope.loginId}';
	var boardseq = $("#boardseq").val();
	$.ajax({
		url: 'list',
		data: {
			boardseq : boardseq
		},
		type: 'post',
		success: function(commentList){
			output(commentList);	
		}
	});
	
}

function output(resp){
	
	var content ='';
	
	if(resp != ""){
		$.each(resp, function(index, item){
			content += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
			content += '<div class="commentInfo'+item.reveiwseq+'">'+'댓글번호 : '+item.reveiwseq+' / 작성자 : '+item.id;
			content += '<a onclick="commentUpdate('+item.reveiwseq+',\''+item.rvw_content+'\');"> 수정 </a>';
			content += '<a onclick="commentDelete('+item.reveiwseq+');"> 삭제 </a> </div>';
			content += '<div class="commentContent'+item.reveiwseq+'"> <p> 내용 : '+item.rvw_content +'</p>';
			content += '</div></div>';


		});
		$(".commentList").html(content);
	}
}

//댓글 등록
function commentRegist(){
	var boardseq = $("#boardseq").val();
	var content = $("#content").val();
	
	$.ajax({
		
		 url : 'insert'
		, data : 
			{
			boardseq : boardseq,
			content : content
			}
		, type : 'post' 		
		,success : function(resp) {
			reset();
			init();
		}
	});
}

//초기화
function reset(){
	$("#comment").val("");
	
}