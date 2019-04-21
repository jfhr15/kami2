<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="sub entryhide js no-touch csstransforms csstransforms3d csstransitions">
<head>
<meta charset="UTF-8">



<title>product</title>
	<link href="resources/css/cut.css" rel="stylesheet" />
	<link href="resources/styles/reset.css" rel="stylesheet" /> 
	<link rel="stylesheet" type="text/css" media="all" href="resources/styles/styles.css">
	<meta name="author" content="Jake Rocheleau">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
	<link rel="shortcut icon" href="http://www.templatemonster.com/favicon.ico">
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
	<script type="text/javascript" src="resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="resources/js/swipe.js"></script>
	<script type="text/javascript" src="resources/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>
    
    <script type="text/javascript">

    $(function() {
    	init();
    	
    }); 

    function init() {
    	// Code here 
    	$.ajax({
    		type : 'POST'
    		,url : "selectAll"
    		,success : function(resp){
    				output(resp);
    			}
    		});
    	//$("#bookRegist").attr("value","독서평 등록");
    }

	 // 출력 코드
	 function output(resp) {
	 	// Code here
	 	 var cont = "";
	 	$.each(resp,function(index,item){
	 	cont+="<li><div class='item'><div id='post_thumb/"+item.productseq+"?category=662142' class='post_thumb'>";
	 	cont+="<span class='thumb'><a class='list_url' href='/"+item.productseq+"?category=662142' style='background-image:url(<c:url value='img/" + item.prd_ognfile + "'/>) !important'></a>";
	 	cont+="</span></div>";
	 	cont+="<div class='post_thumb_content'>";
	 	cont+="<div class='list_category'>"+item.kindseq+"</div>";
	 	cont+="<div class='list_title'><a class='ellipsis' href='/"+item.productseq+"?category=662142'>"+item.prd_name+"</a></div>";
	 	cont+="<div class='list_article'><a href='/"+item.productseq+"?category=662142' class='article_desc'>"+item.prd_content+"</a></div>";
	 	cont+="<div class='list_date'>"+item.prd_price2+"원</div>";
	 	cont+="</div></div></li>";
	
	 	//<img src="<c:url value="resources/img/' + item.prd_ognfile + '"/>">
		
	 /* 	cont+="<td class = 'bookreview'>"+item.bookreview+"</td>";
	 	cont+="<td class = 'upt'><button class='delete' data-value ='"+item.booknum+"'>삭제</button><br>";
	 	cont+="<button class='update' data-value ='"+item.booknum+"'>수정</button></td>"; */
	 /*  	 cont+="<input type='submit' class='delete' value='삭제' data-sno='"+item.seq+"'>";
	 	 cont+="<input type='submit' class='update' value='수정'  data-sno='"+item.seq+"'>"; */
	 	});
	 	 
	 	$("#product").html(cont);
	 	$(".delete").on("click",bookdelete);
	 	$(".update").on("click",bookupdate); 
	 }

    </script>
    
</head>
<body>
	<header>
		<div class="header_wrap">
			<div class="header_inner">
				<div id="skipNavi"><a href="#container">본문바로가기</a></div>
				<dl class="topMenu">
				<dt class="blind">탑메뉴</dt>
				<c:if test="${sessionScope.loginId != null}">
 					<dd><a href="logout"id="loginForm">Logout</a></dd>
					<dd><a href="goIndex"id="loginForm">MyPage</a></dd>
				</c:if>
				<c:if test="${sessionScope.loginId == null}">
					<dd><a href="goLogin"id="loginForm">Login</a></dd>
					<dd class="signup"> <a href="goSignup" id="signForm">SignUp</a></dd>
				</c:if>
				</dl>
			</div>

 			<h1><a href="goHome" id="mainForm"><img src="resources/logo.png" alt="kamikami"/></a></h1>

 			<nav class="gnb">
 			<h2 class="blind">주메뉴</h2>
 			<ul>
				<li><a href="#"><h3 class="gnbtit">About</h3></a></li>
				<li><a href="#"><h3 class="gnbtit">Hair</h3></a>
			<ul>
				<li><a href="#">New Arrival</a>
			<ul>
				<li><a href="goCut">Cut</a></li>
				<li><a href="goPerm">Perm</a></li>
				<li><a href="goColor">Color</a></li>
			</ul>
			</li>
			</ul>
 			</li>
				<li><a href="goReservation"><h3 class="gnbtit">Reservation</h3></a></li>
				<li><a href="goProduct"><h3 class="gnbtit">Product</h3></a></li>
				<li><a href="#"><h3 class="gnbtit">Community</h3></a></li>
			</ul>
			</nav>
		</div>
	</header>








	<!--header 끝-->
	<div id="container">
		<div id="contents">
			<div>
				<div id="searchList" class="nonEntry">
					<span id="searchList_title"><h2 title="COLOR" class="ArticleTitle">PRODUCT</h2></span>
					<ol id="product">
					</ol>
				</div>
			</div>
		<!-- 하단 번호 -->
			<div id="paging">
				<a class="#" id="prevPage">이전</a>
				<span class="numbox">
					<a class="num"> <span class="selected">1</span></a>
					<a href="#" class="num"> <span>2</span></a>
					<a href="#" class="num"> <span>3</span></a>
					<a href="#" class="num"> <span>4</span></a>
					<a href="#" class="num"> <span>5</span></a>
				</span>
				<a href="#" class="" id="nextPage">다음</a>
			</div>
		</div>	
	</div>
</body>
</html>
</body>
</html>