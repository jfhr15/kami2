<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resevation</title>

	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
	<link href="resources/css/reservation.css" rel="stylesheet" />

	<link href="./resources/fullcalendar-3.10.0/fullcalendar.css" rel="stylesheet" />
	<link href="./resources/fullcalendar-3.10.0/fullcalendar.print.css" rel="stylesheet" media="print" />
	<link rel='stylesheet'href='./resources/bootstrap/dist/css/bootstrap.min2.css' />
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
	<table id="tab1">
		<tr class="vert">
			<td id="td1">
	<div id="viewCal">
	<div id="loading"></div>
	<div id="calendar"></div>

	<!-- Event View Modal -->
	<div class="modal fade" id="viewModal" tabindex="-1" role="dialog"
		aria-labelledby="viewModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
					<h4 class="modal-content" id="viewModalLabel">
<!-- 						<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> -->
						<span id="eventDate"></span><br>
					</h4>
				</div>
				<input type="hidden" id="id" name="id">
				<div class="modal-body" id="viewModalBody"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="deleteBtn"
						name="deleteBtn">취소</button>
					<button type="button" class="btn btn-warning" id="updateBtn"
						name="updateBtn">변경</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Event Write Modal -->
	<div class="modal fade" id="writeModal" tabindex="-1" role="dialog"
		aria-labelledby="writeModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
<!-- 					<h4 class="modal-content"></h4> -->
				</div>
				<div class="modal-body">
					<label class="sr-only" for="content">content</label>
<!-- 					<div class="input-group" id="division"> -->
<!-- 						<div class="input-group-addon"> -->
<!-- 							<span class="glyphicon glyphicon glyphicon-pencil" -->
<!-- 								aria-hidden="true"></span> -->
<!-- 						</div> -->
<!-- 						<input type="text" class="form-control" id="content" -->
<!-- 							placeholder="content" value=""> -->
<!-- 					</div> -->
					<br>
					<div class="input-group">
						<div class="input-group-addon" style="vertical-align: super;">
							<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
							<br>
							<div class="form-inline">
								<label class="sr-only" for="start">start</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon glyphicon-calendar"
											aria-hidden="true"></span>
									</div>
									<input type="text" class="form-control" id="start"
										placeholder="start">
								</div>
								<label class="sr-only" for="shour">shour</label>
								<div class="input-group">
									<select id="shour" class="form-control">
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
									</select>
								</div>
								<label class="sr-only" for="smin">smin</label>
								<div class="input-group">
									<select id="smin" class="form-control">
										<option value="00">00</option>
										<option value="15">15</option>
										<option value="30">30</option>
										<option value="45">45</option>
									</select>
								</div>
							</div>
<!-- 							<br> -->
<!-- 							<div class="form-inline"> -->
<!-- 								<label class="sr-only" for="end">end</label> -->
<!-- 								<div class="input-group"> -->
<!-- 									<div class="input-group-addon"> -->
<!-- 										<span class="glyphicon glyphicon glyphicon-calendar" -->
<!-- 											aria-hidden="true"></span> -->
<!-- 									</div> -->
<!-- 									<input type="text" class="form-control" id="end" -->
<!-- 										placeholder="end"> -->
<!-- 								</div> -->
<!-- 								<label class="sr-only" for="ehour">ehour</label> -->
<!-- 								<div class="input-group"> -->
<!-- 									<select id="ehour" class="form-control"> -->
<!-- 										<option value="10">10 -->
<!-- 										<option value="11">11 -->
<!-- 										<option value="12">12 -->
<!-- 										<option value="13">13 -->
<!-- 										<option value="14">14 -->
<!-- 										<option value="15">15 -->
<!-- 										<option value="16">16 -->
<!-- 										<option value="17">17 -->
<!-- 										<option value="18">18 -->
<!-- 										<option value="19">19 -->
<!-- 										<option value="20">20 -->
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 								<label class="sr-only" for="emin">emin</label> -->
<!-- 								<div class="input-group"> -->
<!-- 									<select id="emin" class="form-control"> -->
<!-- 										<option value="00">00 -->
<!-- 										<option value="15">15 -->
<!-- 										<option value="30">30 -->
<!-- 										<option value="45">45 -->
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" id="moveBtn"
									name="moveBtn">선택</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</td>
			<td id="td2">
	
	<div id="viewReservation">
		<div id="sDate">예약 시간 : 시간을 선택해주세요.</div>
		<div id="designer">디자이너 : 디자이너를 선택해주세요.</div>
		<div id="procedure">시술 : 시술을 선택해주세요.</div>
		<input type="hidden" id="hStart">
		<input type="hidden" id="emp_id">
		<input type="hidden" id="pcd">
		<input type="hidden" id="pictureSeq" value="${pictureSeq}">
		
		<div id="dList"></div>
		
	    <div class="btnA" id="btn_left"><img class="imgA" src="resources/img/visual_btn_left.png"></div>
		<div id="banner_container" style="height:50px;overflow:hidden;">
		    <div id="banner_wrapper">
				<div class="testA" id="커트" onclick="selectP(this.id)">커트</div>
				<div class="testA" id="펌" onclick="selectP(this.id)">펌</div>
				<div class="testA" id="염색" onclick="selectP(this.id)">염색</div>
				<div class="testA" id="클리닉" onclick="selectP(this.id)">클리닉</div>
				<div class="testA" id="스타일링" onclick="selectP(this.id)">스타일링</div>
		    </div>
		</div>
		<div class="btnA" id="btn_right"><img class="imgA" src="resources/img/visual_btn_right.png"></div>
		<div id="i1">
		</div>
	
		<div class="options">
<!--         <ul class="testul"> -->
<!--             <li class="testli"><input id="checkbox1" name="checkbox" type="checkbox"> <label class="testlabel" for="checkbox1">A</label></li> -->
<!--             <li><input id="checkbox2" name="checkbox" type="checkbox"> <label class="testlabel" for="checkbox2">B</label></li> -->
<!--             <li><input id="checkbox3" name="checkbox" type="checkbox"> <label class="testlabel" for="checkbox3">C</label></li> -->
<!--         </ul> -->
   		</div>
   		
		<div id="conte"></div>
		<button type="button" id="saveBtn"
		name="saveBtn">예약 하기</button>
	</div>
	</td>
		</tr>
	</table>
	
	<!-- footer 시작 -->
	
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
    
	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/lib/moment.min.js"></script>
<!-- 	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/lib/jquery.min.js"></script> -->
	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/fullcalendar.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/gcal.js"></script>
	<script src='./resources/bootstrap/dist/js/bootstrap.min.js'></script>
	<script type="text/javascript" src="./resources/fullcalendar-3.10.0/locale/ko.js"></script>
    <script type="text/javascript" src="resources/js/reservation.js"></script>
</body>
</html>