$(function(){
	careerList();
	$("#insertBtn").on('click',saveCareer);
	$("#saveBtn").on('click',insertCareer);
	$("#updateBtn").on('click',updateCareer);
	$("#deleteBtn").on('click',deleteCareer);
});

function careerList(){
	$.ajax({
		url: 'careerList',
		type: 'get',
		success: function(returndata){
			var cList = returndata;
			var cont = "";
			if(cList == ""){
				cont += "아직 경력이 없습니다.";
			} else{
				var seq = 1;
				cont += "<table id='listTable'>";
				cont += "<tr>";
				cont += "<th class='th'></th>";
				cont += "<th class='th'>내용</th>";
				cont += "<th class='th'>날짜</th>";
				cont += "</tr>";
				$.each(cList,function(index,item){
					cont += "<tr id=" + item.careeaseq + " onclick='selectOne(this.id)'>";
					cont += "<td class='td1'>" + seq + "</td>";
					cont += "<td class='td2'>" + item.care_content + "</td>";
					cont += "<td class='td3'>" + item.care_date + "</td>";
					cont += "</tr>";
					seq++;
				});
				cont += "</table>";
			}
			$("#careerList").html(cont);
		}
	});
}

function saveCareer(){
	$('#writeModal').modal('show');
}

function insertCareer(){
	var content = $("#care_content").val();
	var date = $("#care_date").val();

	$.ajax({
		url: 'insertCareer',
		data: {
			care_content : content,
			care_date : date
		},
		type: 'post',
		success: function(){
			$('#writeModal').modal('hide');
			careerList();
		}
	});
}

var seq = 0;

function selectOne(id){
	seq=id;
	
	$.ajax({
		url: 'selectCareer',
		data: {
			careeaseq : seq,
		},
		type: 'post',
		success: function(returndata){
			$("#care_content2").val(returndata.care_content);
			$("#care_date2").val(returndata.care_date);
			$('#writeModal2').modal('show');
		}
	});
}

function updateCareer(){
	var content = $("#care_content2").val();
	var date = $("#care_date2").val();
	
	$.ajax({
		url: 'updateCareer',
		data: {
			careeaseq : seq,
			care_content : content,
			care_date : date
		},
		type: 'post',
		success: function(){
			$('#writeModal2').modal('hide');
			careerList();
		}
	});
}

function deleteCareer(){
	$.ajax({
		url: 'deleteCareer',
		data: {
			careeaseq : seq,
		},
		type: 'post',
		success: function(){
			$('#writeModal2').modal('hide');
			careerList();
		}
	});
}