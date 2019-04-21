<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="./resources/vendor/jquery/jquery.js"></script>
<script src="./resources/js/search.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
</head>
<body>
	<input type="hidden" id="sec">
	<ul id="popupHeader">
		<li class="headerLi"><a class="headerA" href="#" id="idSearchPage">아이디 찾기</a></li>
		<li class="headerLi"><a class="headerA" href="#" id="pwSearchPage">비밀번호 찾기</a></li>
	</ul>
	<div id="head"></div>
	<div id="sel"></div>
</body>
</html>