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

});
</script>
</head>
<body>



상품명 : ${product.prd_name} <br>
상품매입가격 : ${product.prd_price1}<br>
상품판매가격 : ${product.prd_price2}<br>
상품설명 :  ${product.prd_content}<br>
수량 : ${product.prd_quantity}<br>
등록일 : ${product.prd_indate}<br>

<%-- <img src="<c:url value="resources/img/${product.prd_ognfile}"/>"> --%>
<img src="img/${product.prd_ognfile}"/>
<form action="goProductManage">
<button>메뉴 돌아가기</button>
</form>

<form action="goUpdateProduct" method="get">
<input type="hidden" name="productseq" value="${product.productseq}">
<button>수정</button>
</form>


</body>
</html>

