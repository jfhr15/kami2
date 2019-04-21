<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Product</title>

	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
	<link href="resources/css/cut.css" rel="stylesheet" />
    
</head>
<body>
	<!-- ##### Preloader ##### -->
    <div id="preloader">
        <i class="circle-preloader"></i>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

        <!-- Top Header Area -->
        <div class="top-header">
            <div class="container h-100">
                <div class="row h-100">
                    <div class="col-12 h-100">
                        <div class="top-header-content h-100 d-flex align-items-center justify-content-between">
                            <!-- Top Headline -->
                            <div class="top-headline">
                                <p>Welcome to <span>Kamikami</span></p>
                            </div>
                            <div class="login-faq-earn-money">
                                <c:if test="${sessionScope.loginId != null}">
 									<a href="logout">Logout</a>
 									<c:if test="${sessionScope.empType != null}">
	 									<c:if test="${sessionScope.empType == 0}">
	 										<a href="goManagement">Management</a>
	 									</c:if>
	 									<c:if test="${sessionScope.empType != 0}">
											<a href="goIndex">MyPage</a>
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${sessionScope.loginId == null}">
                              		<a href="goLogin">Login</a>
                               		<a href="goSignup">Register</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navbar Area -->
        <div class="cryptos-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="cryptosNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="goHome"><img src="resources/cryptos-master/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="goHome">Home</a></li>
                                    <li><a href="#">Hair</a>
                                        <ul class="dropdown">
                                            <li><a href="goCut">Cut</a></li>
                                            <li><a href="goPerm">Perm</a></li>
                                            <li><a href="goColor">Color</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="goProduct">Product</a></li>
                                    <c:choose>
					 					<c:when test="${sessionScope.memType != null}">
					 						<li><a href="goReservation">Reservation</a></li>
					 					</c:when>
					 					<c:when test="${sessionScope.empType != null}">
					 						<li><a href="goReservationList">Reservation</a></li>
					 					</c:when>
					 					<c:otherwise>
					 						<li><a href="goReservation">Reservation</a></li>
					 					</c:otherwise>
					 				</c:choose>
                                    <li><a href="goBoard">Community</a></li>
                                </ul>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

	<div id="contain">
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
	
	    <!-- ##### All Javascript Script ##### -->
    <script src="resources/cryptos-master/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/popper.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/cryptos-master/js/plugins/plugins.js"></script>
    <script src="resources/cryptos-master/js/active.js"></script>
    
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
// 	 	$(".delete").on("click",bookdelete);
// 	 	$(".update").on("click",bookupdate); 
	 }

    </script>
</body>
</html>
