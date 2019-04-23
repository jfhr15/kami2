<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="sub entryhide js no-touch csstransforms csstransforms3d csstransitions">
<head>
<meta charset="UTF-8">
<title>perm</title>
	
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
    
	<link href="resources/css/cut.css" rel="stylesheet" />
	<link rel="stylesheet" href="resources/css/home.css">
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
					<span id="searchList_title"><h2 title="PERM" class="ArticleTitle">PERM</h2></span>
					<ol>
						<li>
							<div class="item">
								<div id="post_thumb/260?category=662142" class="post_thumb">
									<span class="thumb">
										<a class="list_url" href="/260?category=662142" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/995CEA405C7738253A) !important"></a>
									</span>
								</div>
								<div class="post_thumb_content">
									<div class="list_category">Cut</div>
									<div class="list_title"><a class="ellipsis" href="/260?category=662142">aaa</a></div>
									<div class="list_article"><a href="/260?category=662142" class="article_desc">~~~설명~~~</a></div>
									<div class="list_date">남는거</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item">
								<div id="post_thumb/248?category=662142" class="post_thumb">
									<span class="thumb">
										<a class="list_url" href="/248?category=662142" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/99FE623C5BB586EF01) !important"></a>
									</span>
								</div>
								<div class="post_thumb_content">
									<div class="list_category">Cut</div>
									<div class="list_title"><a class="ellipsis" href="/260?category=662142">aaa</a></div>
									<div class="list_article"><a href="/260?category=662142" class="article_desc">~~~설명~~~</a></div>
									<div class="list_date">남는거</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item">
								<div id="post_thumb/247?category=662142" class="post_thumb">
									<span class="thumb">
										<a class="list_url" href="/247?category=662142" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/992AD4355BB5860135) !important"></a>
									</span>
								</div>
								<div class="post_thumb_content">
									<div class="list_category">Cut</div>
									<div class="list_title"><a class="ellipsis" href="/260?category=662142">aaa</a></div>
									<div class="list_article"><a href="/260?category=662142" class="article_desc">~~~설명~~~</a></div>
									<div class="list_date">남는거</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item">
								<div id="post_thumb/246?category=662142" class="post_thumb">
									<span class="thumb">
										<a class="list_url" href="/246?category=662142" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/996FBB3F5BB5857131) !important"></a>
									</span>
								</div>
								<div class="post_thumb_content">
									<div class="list_category">Cut</div>
									<div class="list_title"><a class="ellipsis" href="/260?category=662142">aaa</a></div>
									<div class="list_article"><a href="/260?category=662142" class="article_desc">~~~설명~~~</a></div>
									<div class="list_date">남는거</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item">
								<div id="post_thumb/245?category=662142" class="post_thumb">
								<span class="thumb">
									<a class="list_url" href="/245?category=662142" style="background-image:url(https://t1.daumcdn.net/cfile/tistory/99AF6E385BB5849A2B) !important"></a>
								</span>
								</div>
									<div class="post_thumb_content">
									<div class="list_category">Cut</div>
									<div class="list_title"><a class="ellipsis" href="/260?category=662142">aaa</a></div>
									<div class="list_article"><a href="/260?category=662142" class="article_desc">~~~설명~~~</a></div>
									<div class="list_date">남는거</div>
								</div>
							</div>
						</li>
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
	
	<!-- ##### Footer Area Start ##### -->
    <footer class="footer-area" id="fa">
        <!-- Main Footer Area -->
        <div class="main-footer-area section-padding-100-0 bg-img bg-overlay" >
            <div class="container">
                <div class="row">
					<div class="footerV1">
						<div class="w4" id="im1">
                        	<img class="w5" src="resources/img/ajax.jpg" alt="">
                        </div>
                        <div class="w4" id="im2">
                        	<img class="w5" src="resources/img/spring.png" alt="">
                        </div>
                        <div class="w4" id="im3">
                        	<img class="w5" src="resources/img/tom.png" alt="">
                        </div>
                        <div class="w4" id="im4">
                        	<img class="w5" src="resources/img/git.png" alt="">
                        </div>
                        <div class="w4" id="im5">
                        	<img class="w5" src="resources/img/jquery.png" alt="">
                        </div>
                        <div class="w4" id="im6">
                        	<img class="w5" src="resources/img/java.jpg" alt="">
                        </div>
					</div>
                    <!-- Footer Widget Area -->
                    <div class="footerV2">
                        <div class="footerW">
                            <div class="w1" id="iw1">
                                <a href="#"><img src="resources/cryptos-master/img/core-img/logo.png" alt=""></a>
                            </div>
                            <div class="w1" id="iw2">
                            <p class="w3">
							주소 : 서울 강남구 영동대로 513 삼성동 159 코엑스 4층<br>
							사업자 등록번호 : 102-93-48576<br>
							</p>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bottom Footer Area -->
        <div class="bottom-footer-area">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center">
                    <div class="col-12">
                        <p>
							Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
						</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->
	
	<!-- ##### All Javascript Script ##### -->
    <script src="resources/cryptos-master/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/popper.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/cryptos-master/js/plugins/plugins.js"></script>
    <script src="resources/cryptos-master/js/active.js"></script>
	
</body>
</html>