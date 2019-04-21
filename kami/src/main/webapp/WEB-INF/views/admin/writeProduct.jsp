<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
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



<c:if test="${product==null}">
	<form action="writeProduct" method="post" enctype="multipart/form-data">
</c:if>

<c:if test="${product!=null}">
	<form action="updateProduct" method="post" enctype="multipart/form-data">
	<input type="hidden" name="productseq" value="${product.productseq}">
</c:if>

등록상품구분 : 
<select name="kindseq">
<c:forEach var="pk" items="${pList}">
    <option value="${pk.kindseq}">${pk.productkind}</option>
</c:forEach>
</select><br>
상품명 : <input type="text" name="prd_name" value="${product.prd_name}"><br>
상품원가 : <input type="number" name="prd_price1" value="${product.prd_price1}"><br>
상품판매가 : <input type="number" name="prd_price2" value="${product.prd_price2}"><br>
상품설명 : <textarea name="prd_content">${product.prd_content}</textarea><br>
상품수량 : <input type="number" name="prd_quantity" value="${product.prd_quantity}"><br>
<input type="file" id="myfile" name="uploadFile" value="${product.prd_ognfile}"><br>
<img id="img1" style="width:300px;height:300px;" />
<button>write</button>
</form>

</body>
</html>