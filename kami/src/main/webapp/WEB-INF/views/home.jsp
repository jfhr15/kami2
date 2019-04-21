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
		        <li class="tt"><a href="#"><img src="resources/img/beautiful.jpg" alt="" /></a></li>
		    	<c:forEach items="${picture}" var="picture">
		    	 <li class="tt"><a href="#"><img src="img/${picture.savfile}" alt="" /></a></li>
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
		        <li class="tt"><a href="#"><img src="resources/img/beautiful.jpg" alt="" /></a></li>
		    	<c:forEach items="${picture}" var="picture">
		    	 <li class="tt"><a href="#"><img src="img/${picture.savfile}" alt="" /></a></li>
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
    <footer class="footer-area">
        <!-- Main Footer Area -->
        <div class="main-footer-area section-padding-100-0 bg-img bg-overlay" style="background-image: url(resources/cryptos-master/img/bg-img/bg-1.jpg);">
            <div class="container">
                <div class="row">

                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="footer-widget mb-100">
                            <div class="widget-title">
                                <a href="#"><img src="resources/cryptos-master/img/core-img/logo2.png" alt=""></a>
                            </div>
                            <p>Morbi vel arcu gravida, iaculis lacus vel, posuere ipsum. Sed faucibus mauris vitae urna consectetur, sit amet maximus nisl sagittis. Ut in iaculis enim, et pulvinar mauris. Etiam tristique magna eget velit consectetur, a tincidunt velit dictum.</p>
                            <div class="footer-social-info">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="footer-widget mb-100">
                            <div class="widget-title">
                                <h6>Recent Posts</h6>
                            </div>
                            <!-- Single Blog Post -->
                            <div class="single--blog-post">
                                <a href="#">
                                    <p>Aliquam ac eleifend metus</p>
                                </a>
                                <span>March 10, 2018</span>
                            </div>
                            <!-- Single Blog Post -->
                            <div class="single--blog-post">
                                <a href="#">
                                    <p>Donec in libero sit amet mi vulputate</p>
                                </a>
                                <span>March 10, 2018</span>
                            </div>
                            <!-- Single Blog Post -->
                            <div class="single--blog-post">
                                <a href="#">
                                    <p>Aliquam ac eleifend metus</p>
                                </a>
                                <span>March 10, 2018</span>
                            </div>
                        </div>
                    </div>

                    <!-- Footer Widget Area -->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="footer-widget mb-100">
                            <div class="widget-title">
                                <h6>Quick Links</h6>
                            </div>
                            <nav>
                                <ul class="useful-links d-flex justify-content-between flex-wrap">
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">Faq</a></li>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="#">Terms &amp; Conditions</a></li>
                                    <li><a href="#">Services</a></li>
                                    <li><a href="#">Careers</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Newsletter &amp; Exchange</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">Exchange</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </nav>
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
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
