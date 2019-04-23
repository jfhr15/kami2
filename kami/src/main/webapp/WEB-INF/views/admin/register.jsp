<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>Register</title>

    <link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style2.css">
    <link href="resources/css/signup.css" rel="stylesheet" />
    
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
	<div id="cont">
  <div class="contain">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <!-- Nested Row within Card Body -->
          <div class="wrap1">
              <div class="center">
                <h1 class="h4 text-gray-900 mb-4">회원 가입</h1>
              </div>
              <form action="insertHuman" method="post" id="user" class="user">
                <div class="bolder">
                <table>
                	<tr>
                		<td class="td1">아이디</td><td class="td2"><input type="text" class="form-control form-control-user" name="id" id="id"></td>
                	</tr>
                </table>
                <div id="duplicatemessage" class="check"></div>
                <table>
                	<tr>
                		<td class="td1">비밀번호</td><td class="td2"><input type="password" class="form-control form-control-user" name="pw" id="pw"></td>
                	</tr>
                </table>
                <div id="pwmessage1" class="check"></div>
                <table>
                	<tr>
                		<td class="td1">비밀번호 확인</td><td class="td2"><input type="password" class="form-control form-control-user" name="pw_check" id="pw_check"></td>
                	</tr>
                </table>
                <div id="pwmessage2" class="check"></div>
                <table>
                	<tr>
                		<td class="td1">이름</td><td class="td2"><input type="text" class="form-control form-control-user" name="name" id="name"></td>
                	</tr>
                </table>
                <div id="name_check" class="col-sm-6 mb-3 mb-sm-0"></div>
                <table>
                	<tr>
                		<td class="td1">생년월일</td><td class="td2"><input type="date" class="form-control form-control-user" name="birthday" id="birthday"></td>
                	</tr>
                </table>
                <div id="birth_check" class="col-sm-6"></div>
                     성별<br>
                <table class="selectGenderTable">
					<tr>
						<td>남자</td>
						<td class="td1"><input type="radio" name="gender" value="남자" checked="checked" class="radio1"></td>
						<td>여자</td>
						<td class="td1"><input type="radio" name="gender" value="여자" class="radio1"></td>
					</tr>
				</table>
				<table>
                	<tr>
                		<td class="td1">이메일</td><td class="td2"><input type="email" class="form-control form-control-user" name="email" id="email"></td>
                	</tr>
                </table>
                <div id="email_check" class="check"></div>
                  	주소<input type="hidden" class="form-control form-control-user" name="address" id="address">
                	<br>
                	<table class="addtable">
                		<tr><td><input type="text" class="form-control form-control-user" id="sample6_postcode" placeholder="우편번호"></td>
                		<td><button type="button" class="btn btn-primary btn-user btn-block" id="addbtn">우편번호 찾기</button><br></td></tr>
                	</table>
                	<table class="addresstable">
                		<tr><td><input type="text" class="form-control form-control-user" id="sample6_address" placeholder="주소"><br></td></tr>
                	</table>
                	<table class="addresstable">
                		<tr><td><input type="text" class="form-control form-control-user" id="sample6_detailAddress" placeholder="상세주소"></td>
                		<td><input type="text" class="form-control form-control-user" id="sample6_extraAddress" placeholder="참고항목"></td></tr>
                	</table>
                <div id="address_check" class="check"></div>
                <table>
                	<tr>
                		<td class="td1">전화번호</td><td class="td2"><input type="text" class="form-control form-control-user" name="phone" id="phone" placeholder="-를 제외하고 입력해주세요."></td>
                	</tr>
                </table>
                <div id="phone_check" class="check"></div>
              </div>
              <br>
              	<input type="hidden" id="division" name="division" value="2">
              	<table class="btnTable">
              		<tr>
              			<td class="tdtd">
                  			<button type="button" id="employeeBtn" value="0" class="btns">직원 등록</button>
                  		</td>
                  		<td class="tdtd">
                  			<button type="button" id="memberBtn" value="1" class="btns">회원 등록</button>
                  		</td>
                  	</tr>
               	</table>
              <hr>
              </form>
          </div>
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
    
	<script type="text/javascript" src="./resources/js/signup.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
</body>

</html>
