<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	 $('#myfile').change(function(e){
	 //파일 오브젝트를 취득
    var file = e.target.files[0];
    var reader = new FileReader();
    
  //이미지 파일이 아닐 경우, 종료 처리
    if(file.type.indexOf("image") < 0){
      alert("이미지 파일을 지정해 주세요");
      return false;
    }
  //업로드한 이미지를 지정
    reader.onload = (function(file){
      return function(e){
        $("#img1").attr("src", e.target.result);
        $("#img1").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
	  });
	 
	
	 
});




</script>
</head>
<body>
<div id="wrapper">
<form action="insertProcedure" method="post" enctype="multipart/form-data">
<table id="regist" >
	<tr>
		<th>시술 이름</th>
		<td>
			<input id="pcd_name" type="text" name="pcd_name"  />
		</td>
	</tr>
	
	<tr>
		<th>시술 종류</th>
		<td>
		<select id="pcd_setting" name="pcd_setting" >
			<option value="커트" >커트</option>
			<option value="펌" >펌</option>
			<option value="염색" >염색</option>
			<option value="클리닉" >클리닉</option>
			<option value="스타일링" >스타일링</option>
		</select>
		</td>
	</tr>
	
	
	<tr>
		<th>가격</th>	
		<td>
			<input id="pcd_price" type="text" name="pcd_price" value="${procedure.pcd_price}" />
		</td>
	</tr>
	<tr>	
		<th>소요시간</th>
		<td>
			<input id="pcd_time" type="text" name="pcd_time" value="${procedure.pcd_time}" />
		</td>
	</tr>
	<td colspan="2">
	
	<input type="file" id="myfile" name="uploadFile">
	<br>
	
				<input id="procedureRegist" type="submit" value="독서평 등록" />
			<input id="cancel" type="reset" value="취소" />
		</td>
	</tr>
</table>
</form>
<br>
<form action="goPicture">
<input type="submit" value="사진등록">
</form>
</div>
</body>
</html>