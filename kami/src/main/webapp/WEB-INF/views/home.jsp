<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>

    <link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
    
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

    <!-- ##### Hero Area Start ##### -->
<!--     <section class="hero-area"> -->
<!--         <div class="hero-slides owl-carousel"> -->
<!--             Single Hero Slide -->
<!--             <div class="single-hero-slide"> -->
<!--                 <div class="container h-100"> -->
<!--                     <div class="row h-100 align-items-center"> -->
<!-- 						<img src="resources/img/oil-discharge.jpg" alt=""> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

<!--             <div class="single-hero-slide"> -->
<!--                 <div class="container h-100"> -->
<!--                     <div class="row h-100 align-items-center"> -->
<!-- 						<img src="resources/img/woman4.jpg" alt=""> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
<!--     ##### Hero Area End ##### -->
	<div class="megamenu-slides owl-carousel">
		<img src="resources/img/oil-discharge.jpg" alt="">
		<img src="resources/img/woman4.jpg" alt="">
		<img src="resources/img/woman3.jpg" alt="">
	</div>
    <!-- ##### Course Area Start ##### -->
    <div class="cryptos-feature-area section-padding-100-0">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center mx-auto">
                        <h3>New Arrival</h3>
                    </div>
                </div>
            </div>
            
            <div id="arrival_zone">
            <div id="best_bg">
		      <ul>
		      
		    	<c:forEach items="${picture}" var="picture">
		    	 <li class="tt"><a id="${picture.pictureSeq}" href="goDetailHair?pictureSeq=${picture.pictureSeq}"><img src="img/${picture.savfile}" alt="" /></a></li>
		    	</c:forEach>
		      </ul>
		      <p class="prev_btn">
		         <a href="#">
		         <img src="resources/img/bestbook_btn_left.png" alt="이전으로 이동" />
		         </a>
		      </p>
		      <p class="next_btn">
		         <a href="#">
		         <img src="resources/img/bestbook_btn_right.png" alt="다음으로 이동" />
		         </a>
		      </p>
		   </div>
           </div>
            
        </div>
    </div>
    <!-- ##### Course Area End ##### -->
    
    <!-- ##### Course Area Start ##### -->
    <div class="cryptos-feature-area section-padding-100-0">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center mx-auto">
                        <h3>New Arrival</h3>
                    </div>
                </div>
            </div>
            
            <div id="arrival_zone2">
            <div id="best_bg2">
		      <ul>
		      
		    	<c:forEach items="${product}" var="product">
		    	 <li class="tt"><a href="#"><img src="img/${product.prd_ognfile}" alt="" /></a></li>
		    	</c:forEach>
		      </ul>
		      <p class="prev_btn2">
		         <a href="#">
		         <img src="resources/img/bestbook_btn_left.png" alt="이전으로 이동" />
		         </a>
		      </p>
		      <p class="next_btn2">
		         <a href="#">
		         <img src="resources/img/bestbook_btn_right.png" alt="다음으로 이동" />
		         </a>
		      </p>
		   </div>
           </div>
            
        </div>
    </div>
    <!-- ##### Course Area End ##### -->

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
    
    <script type="text/javascript" src="resources/js/swipe.js"></script>
    <script type="text/javascript" src="resources/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>
    
</body>

</html>
