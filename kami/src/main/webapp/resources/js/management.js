$(function(){
	
	$("#procedureBtn").on('click',function() {
		$("#insertProcedureModal").show();
	});
	$("#procedureListBtn").on('click',selectProcedure);
	
	$("#confirmBtn3").on('click',addProcedure);
	$("#closeBtn3").on('click',function() {
		$("#insertProcedureModal").hide();
	});
	$("#confirmBtn4").on('click',function() {
		$("#selectProcedureModal").hide();
		window.location.reload();
	});
	$("#closeBtn4").on('click',function() {
		$("#selectProcedureModal").hide();
		window.location.reload();
	});
});

function addProcedure(){
	var pcd_name = $("#pcd_name").val();
	var pcd_time = $("#pcd_time").val();
	var pcd_price = $("#pcd_price").val();
	
	$.ajax({
		url: "insertProcedure",
		data:{
			pcd_name : pcd_name,
			pcd_time : pcd_time,
			pcd_price : pcd_price
		},
		type: "post",
		success: function(){
			$("#insertProcedureModal").hide();
		}
	});
}

function selectProcedure(){
	$("#selectProcedureModal").show();
	$.ajax({
		url: "selectProcedure",
		data:{},
		type: "get",
		success: function(pList){
			var content="";
			var count = 1;
			content += "<table>";
			content += "<tr><td>번호</td><td>시술명</td><td>소요 시간</td><td>금액</td></tr>";
			$.each(pList,function(index, item){
				content += "<tr><td id="+item.procedureseq+">"+count+"</td><td>"+item.pcd_name+"</td><td>"+item.pcd_time+"</td><td>"+item.pcd_price+"</td></tr>";
				count++;
			})
			content += "</table>";
			$("#selectProcedureContent").html(content);
		}
	});
}