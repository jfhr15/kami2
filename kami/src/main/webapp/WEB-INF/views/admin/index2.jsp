<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>

	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/chart.css"
	rel="stylesheet">

<!-- Calendar -->
<link href="./resources/fullcalendar-3.10.0/fullcalendar.css"
	rel="stylesheet" />
<link href="./resources/fullcalendar-3.10.0/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<link rel='stylesheet'
	href='./resources/bootstrap/dist/css/bootstrap.min3.css' />
<link rel="stylesheet" href="resources/css/home.css">
<title>MyPage</title>

</head>

<body id="page-top">
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


	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Nav Item - Charts -->
			 <li class="nav-item active">
        <a class="nav-link" href="goIndex">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="goIndex2">
          <i class="fas fa-fw fa-table"></i>
          <span>Calendar</span></a>
      </li>
	  
	  <li class="nav-item">
      	<a class="nav-link" href="goIndex5"> 
      		<i class="fas fa-fw fa-address-book"></i> 
      		<span>Career</span></a>
      </li>
	  
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div class='bar'>
				<div class='bar1'>
					<table class='table1'>
						<tr>
							<td class='bar2'><label> <input type='checkbox'
									class='sBar1'
									onChange='scheduleChoice(0, "ko.south_korea#holiday@group.v.calendar.google.com", "usaHolidays", "#FF0000", "#FFFFFF");'
									checked /> &nbsp;공휴일
							</label></td>
							<td class='bar3'><label> <input type='checkbox'
									class='sBar2'
									onChange='scheduleChoice(0, "ko.south_korea#holiday@group.v.calendar.google.com", "usaHolidays", "#FF0000", "#FFFFFF");'
									checked /> &nbsp;미승인
							</label></td>
							<td class='bar4'><label> <input type='checkbox'
									class='sBar3'
									onChange='scheduleChoice(0, "ko.south_korea#holiday@group.v.calendar.google.com", "usaHolidays", "#FF0000", "#FFFFFF");'
									checked /> &nbsp;승인
							</label></td>
						</tr>
					</table>
				</div>
			</div>
			<div id='loading'></div>
			<div id='calendar'></div>
			<!-- Event View Modal -->
			<div class='modal fade' id='viewModal' tabindex='-1' role='dialog'
				aria-labelledby='viewModalLabel'>
				<div class='modal-dialog' role='document'>
					<div class='modal-content'>
						<div class='modal-header'>
							<button type='button' class='close' data-dismiss='modal'
								aria-label='Close'>
								<span aria-hidden='true'>&times;</span>
							</button>
							<h4 class='modal-content' id='viewModalLabel'>
								<span class='glyphicon glyphicon-calendar' aria-hidden='true'></span>
								<span id='eventDate'></span><br>
							</h4>
						</div>
						<input type='hidden' id='id' name='id'>
						<div class='modal-body' id='viewModalBody'></div>
						<div class='modal-footer' id='modal-footer-btn'>
							<button type='button' class='btn btn-warning' id='deleteBtn'
								name='deleteBtn'>삭제</button>
							<button type='button' class='btn btn-warning' id='updateBtn'
								name='updateBtn'>수정</button>
							<button type='button' class='btn btn-default'
								data-dismiss='modal'>닫기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Event Write Modal -->
			<div class='modal fade' id='writeModal' tabindex='-1' role='dialog'
				aria-labelledby='writeModalLabel'>
				<div class='modal-dialog' role='document'>
					<div class='modal-content'>
						<div class='modal-header'></div>
						<div class='modal-body'>
							<label class='sr-only' for='content'>content</label>
							<div class='input-group' id='division'></div>
							<br>
							<div class='input-group'>
								<div class='input-group-addon' style='vertical-align: super;'>
									<span class='glyphicon glyphicon-time' aria-hidden='true'></span>
									<br>
									<div class='form-inline'>
										<label class='sr-only' for='start'>start</label>
										<div class='input-group'>
											<div class='input-group-addon'>
												<span class='glyphicon glyphicon glyphicon-calendar'
													aria-hidden='true'></span>
											</div>
											<input type='text' class='form-control' id='start'
												placeholder='start'>
										</div>
										<label class='sr-only' for='shour'>shour</label>
										<div class='input-group'>
											<select id='shour' class='form-control'>
												<option value='09' selected=''>09</option>
												<option value='10'>10</option>
												<option value='11'>11</option>
												<option value='12'>12</option>
												<option value='13'>13</option>
												<option value='14'>14</option>
												<option value='15'>15</option>
												<option value='16'>16</option>
												<option value='17'>17</option>
												<option value='18'>18</option>
												<option value='19'>19</option>
												<option value='20'>20</option>
												<option value='21'>21</option>
											</select>
										</div>
										<label class='sr-only' for='smin'>smin</label>
										<div class='input-group'>
											<select id='smin' class='form-control'>
												<option value='00'>00</option>
												<option value='15'>15</option>
												<option value='30'>30</option>
												<option value='45'>45</option>
											</select>
										</div>
									</div>
									<br>
									<div class='form-inline'>
										<label class='sr-only' for='end'>end</label>
										<div class='input-group'>
											<div class='input-group-addon'>
												<span class='glyphicon glyphicon glyphicon-calendar'
													aria-hidden='true'></span>
											</div>
											<input type='text' class='form-control' id='end'
												placeholder='end'>
										</div>
										<label class='sr-only' for='ehour'>ehour</label>
										<div class='input-group'>
											<select id='ehour' class='form-control'>
												<option value='09' selected=''>09</option>
												<option value='10'>10</option>
												<option value='11'>11</option>
												<option value='12'>12</option>
												<option value='13'>13</option>
												<option value='14'>14</option>
												<option value='15'>15</option>
												<option value='16'>16</option>
												<option value='17'>17</option>
												<option value='18'>18</option>
												<option value='19'>19</option>
												<option value='20'>20</option>
												<option value='21'>21</option>
											</select>
										</div>
										<label class='sr-only' for='emin'>emin</label>
										<div class='input-group'>
											<select id='emin' class='form-control'>
												<option value='00'>00</option>
												<option value='15'>15</option>
												<option value='30'>30</option>
												<option value='45'>45</option>
											</select>
										</div>
									</div>
									<br>
									<div class='modal-footer'>
										<button type='button' class='btn btn-warning' id='saveBtn'
											name='saveBtn'>신청</button>
										<button type='button' class='btn btn-default'
											data-dismiss='modal'>닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

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
    
	<script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script src=" <c:url value = "/resources/js/sb-admin-2.min.js"/>"></script>
	<script src=" <c:url value = "/resources/vendor/chart.js/Chart.min.js"/>"></script>


	<script src=" <c:url value = "/resources/js/demo/chart-area-demo.js"/>"></script>
	<script src=" <c:url value = "/resources/js/demo/chart-pie-demo.js"/>"></script>
	<script src="<c:url value = "/resources/js/demo/chart-bar-demo.js"/>"></script>

	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/lib/moment.min.js"></script>
	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/fullcalendar.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/gcal.js"></script>
	<script src='./resources/bootstrap/dist/js/bootstrap.min.js'></script>
	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/locale/ko.js"></script>
	<script type="text/javascript" src="./resources/js/offCal.js"></script>
</body>
</html>