<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
	
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
    
    <link rel="stylesheet" href="resources/css/board.css">
    
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

<div id="wrapper">

<h2>[ 게시판 글 목록 ]</h2>
<div class="home">

	<!-- 특정 글 검색 -->
	<form id="search" action ="boardList" method="GET" >
	<select name="searchItem"> 
		<option value="title"   ${searchItem =='title'  ? 'selected' : ''} >제목</option>
		<option value="userid"  ${searchItem =='userid' ? 'selected' : ''}>작성자</option>
		<option value="content" ${searchItem =='content'? 'selected' : ''}>내용</option>
	</select>
	<input type="text" name="searchWord" value="${searchWord}" /> 
	<input class="btn" type="submit" value="검색" />
	</form>
</div>
<!-- 게시글 목록 시작 -->
<table border='1'>
	<tr>
		<th>번호</th>
		<th class="title">글제목</th>
		<th>글쓴날</th>
		<th>글쓴이</th>
	
	</tr>
	
	<!-- 게시글 출력 반복 -->
	<c:forEach var="board" items="${boardList}">
		<tr>
			<td>${board.boardseq}</td>
			<td><a href="boardDetail?boardseq=${board.boardseq}">${board.brd_title}</a></td>
			<td>${board.brd_date}</td>
			<td>${board.id }</td>
			
		</tr>
	</c:forEach>
</table>
<c:if test="${not empty sessionScope.loginId}">
	<div class="write"><a class="btn" href="goBoardRegist">글쓰기</a></div>
</c:if>
<!-- Paging 출력 부분 -->
<div id="navigator">

<a href="">◁◁</a>
<a href="">◀</a>
&nbsp;&nbsp;
<span class="numbox">

<c:forEach var="page" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
	
 	<c:if test="${page != navi.currentPage }">
 		<a href="boardList?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}" class="num">${page}</a> &nbsp;
	</c:if>
 	<c:if test="${page == navi.currentPage }">
 		<span class="selected">${page}</span> &nbsp;
	</c:if>	
	
</c:forEach>

</span>
&nbsp;&nbsp;

<a href="">▶ </a> 
<a href="">▷▷</a>

</div>
</div>

	<!-- ##### All Javascript Script ##### -->
    <script src="resources/cryptos-master/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/popper.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/cryptos-master/js/plugins/plugins.js"></script>
    <script src="resources/cryptos-master/js/active.js"></script>
	
	<script src="resources/js/board.js"></script>
</body>
</html>