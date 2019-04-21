$(function() {
	$('#boardReg').on('click', boardRegist);
});

function boardRegist(){
	var brd_title = $("#brd_title").val();
	var brd_content = $("#brd_content").val();

	$.ajax({
		url: "boardRegist",
		data: {
			brd_title : brd_title,
			brd_content : brd_content
		},
		type: "post",
		success: function(){
			alert("!!");
		}
	});
}