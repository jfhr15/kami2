<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="sub entryhide js no-touch csstransforms csstransforms3d csstransitions">
<head>
<meta charset="UTF-8">
<title>color</title>
	
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">

	<link href="resources/css/hairColor.css" rel="stylesheet" />
	
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
	
	<div id="container">
		<div id="contents">
			<div>
				<div id="searchList" class="nonEntry">
					<span id="searchList_title"><h2 title="COLOR" class="ArticleTitle">COLOR</h2></span>
				</div>
			</div>
		</div>	
		
<!-- 		<div class="slideshow-container"> -->
<!-- 			<div class="mySlides fade"> -->
<!-- 				<img class="imgOp" src="./resources/img/wella1.png"> -->
<!-- 			</div> -->
<!-- 			<div class="mySlides fade"> -->
<!-- 				<img class="imgOp" src="./resources/img/wella2.jpg"> -->
<!-- 			</div> -->
<!-- 			<div class="mySlides fade"> -->
<!-- 				<img class="imgOp" src="./resources/img/wella3_1.png"> -->
<!-- 			</div> -->
<!-- 			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> -->
<!-- 			<a class="next" onclick="plusSlides(1)">&#10095;</a> -->
<!-- 			<br> -->
<!-- 			<div id="slide_footer"> -->
<!-- 				<span id="te" class="dot" onclick="currentSlide(1)"></span>  -->
<!-- 				<span class="dot" onclick="currentSlide(2)"></span>  -->
<!-- 				<span class="dot" onclick="currentSlide(3)"></span>  -->
<!-- 			</div> -->
<!-- 		</div> -->

		<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="0" data-cycle-prev="#prev" data-cycle-next="#next" data-cycle-auto-height="927:580">
			<img class="cycle-slideshowimg" src="./resources/img/wella1.png">
			<img class="cycle-slideshowimg" src="./resources/img/wella2.jpg">
			<img class="cycle-slideshowimg" src="./resources/img/wella3_1.png">
			<img class="cycle-slideshowimg" src="./resources/img/wella3_2.png">
			<img class="cycle-slideshowimg" src="./resources/img/wella4.jpg">
			<img class="cycle-slideshowimg" src="./resources/img/wella5.jpg">
			<img class="cycle-slideshowimg" src="./resources/img/wella6.jpg">
			<div class="slidebutton">
				<a href=# id="prev"><img src="resources/img/visual_btn_left.png" alt="이전 배너"></a>
				<a href=# id="next"><img src="resources/img/visual_btn_right.png" alt="다음 배너"></a>
			</div>
		</div>
	</div>
	
	<!-- ##### All Javascript Script ##### -->
    <script src="resources/cryptos-master/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/popper.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/cryptos-master/js/plugins/plugins.js"></script>
    <script src="resources/cryptos-master/js/active.js"></script>
    
    <script type="text/javascript" src="resources/js/hairColor.js"></script>
    <script type="text/javascript" src="http://malsup.github.com/jquery.cycle2.js"></script>
</body>
</html>