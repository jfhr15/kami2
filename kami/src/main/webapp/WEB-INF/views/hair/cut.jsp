<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="sub entryhide js no-touch csstransforms csstransforms3d csstransitions">
<head>
<title>cut</title>
	
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
    
	<link href="resources/css/menew.css" rel="stylesheet" />
	
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
    
    
<div id="cont">



<div class='menu-bar'>
	<ul class="menu">
	    <li><a href="#1">1번 메뉴</a>
	    	<ul>
		        <li><a href="#1A">1-A 메뉴</a></li>
		        <li><a href="#1B">1-B 메뉴</a></li>
	    	</ul>
	    </li>
	    <li><a href="#2">2번 메뉴</a>
	    	<ul>
	    		<li><a href="#2A">2-A 메뉴</a></li>
	        	<li><a href="#2B">2-B 메뉴</a>
		          	<ul>
		            	<li><a href="#2B1">2-B-1 메뉴</a></li>
		            	<li><a href="#2B2">2-B-2 메뉴</a></li>
		          	</ul>
	       		</li>
		        <li><a href="#2C">2-C 메뉴</a></li>
		        <li><a href="#2D">2-D 메뉴</a>
		        	<ul>
		        		<li><a href="#2D1">2-D-1 메뉴</a></li>
			            <li><a href="#2D2">2-D-2 메뉴</a></li>
			            <li><a href="#2D3">2-D-3 메뉴</a></li>
		        	</ul>
	        	</li>
	    	</ul>
	    </li>
	    <li><a href="#3">3번 메뉴</a>
	    	<ul>
		        <li><a href="#3A">3-A 메뉴</a></li>
		        <li><a href="#3B">3-B 메뉴</a></li>
	    	</ul>
	    </li> 
	    <li><a href="#4">4번 메뉴</a>
	    	<ul>
		        <li><a href="#4A">4-A 메뉴</a></li>
		        <li><a href="#4B">4-B 메뉴</a></li>
	    	</ul>
	    </li> 
	</ul>
</div>



<div id="container0">

	 <div class="button-1">
    <div class="eff-1"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-4">
    <div class="eff-4"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-2">
    <div class="eff-2"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-3">
    <div class="eff-3"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-5">
    <div class="eff-5"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-6">
    <div class="eff-6"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-7">
    <div class="eff-7"></div>
    <a href="#"> Touch me </a>
  </div>
  <div class="button-8">
    <div class="eff-8"></div>
    <a href="#"> Touch me </a>
  </div>
</div>	
</div>
	<div id="container">
		<div id="contents">
			<div>
				<div id="searchList" class="nonEntry">
					<span id="searchList_title"><h2 title="CUT" class="ArticleTitle">CUT</h2></span>
					
				</div>
			</div>
			<div id="wrapper">
			<div id="columns">
				<div class="card">
					<img src="resources/img/beautiful.jpg">							
					<p>Roasted chicken breast with sage and spinach </p>
				</div>
				<div class="card">
					<img src="resources/img/beautiful2.jpg">		
					<p>Colorful Italian cuisine ingredients</p>
				</div>
				<div class="card">
					<img src="resources/img/beautiful3.jpg">				
					<p>Beef steaks </p>
				</div>
				<div class="card">
					<img src="resources/img/beautiful4.jpg">			
					<p>Beef burger takeaway</p>
				</div>	
				<div class="card">
					<img src="resources/img/beautiful5.jpg">		
					<p>Funny quail egg breakfast </p>
				</div>
				<div class="card">
					<img src="images/pic6.jpg">		
					<p>Fresh oranges</p>
				</div>
				<div class="card">
					<img src="images/pic7.jpg">				
					<p>Pumpkin soup</p>
				</div>
				<div class="card">
					<img src="images/pic8.jpg">			
					<p>Homemade chicken broth with vegetables </p>
				</div>	
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
    
    <script src="resources/js/cut.js"></script>
</body>
</html>