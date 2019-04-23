<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- ##### All Javascript Script ##### -->
    <!-- <script src="resources/cryptos-master/js/jquery/jquery-2.2.4.min.js"></script> -->
    <!-- <script src="resources/cryptos-master/js/bootstrap/popper.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/cryptos-master/js/plugins/plugins.js"></script>
    <script src="resources/cryptos-master/js/active.js"></script> -->
    
    
	<script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script src=" <c:url value = "/resources/js/sb-admin-2.min.js"/>"></script>
	
	<script src='./resources/bootstrap/dist/js/bootstrap.min.js'></script>

<script type="text/javascript">
$(function() {
    init();
    
 }); 

 function init() {
    // Code here 
    $.ajax({
       type : 'POST'
       ,url : "selectttOrders"
       ,success : function(resp){
    	  output(resp);
          }
       });
 }

 // 출력 코드
 function output(resp) {
	 var sum = 0;
     var cont = "";
     if (resp == null){
		  cont += "<tr><td>구입하신 상품이 없습니다.</th></tr>";
		  
		  $("#warning").html(cont);
	   } else {

		    $.each(resp,function(index,item){
			    cont += "<tr><td>"+item.BILLSEQ+"</th>";
			    cont += "<td>"+item.PRD_NAME+"</th>";
			    cont += "<td>"+item.ORD_DATE+"</th>";
			    cont += "<td>"+item.ORD_AMOUNT+"</th>";
			    cont += "<td>"+item.ORD_QUANTITY+"</th>";
			    cont += "<td><a href='"+item.RECEIPT_URL+"'><img src='resources/img/Receipt-3-icon.png' alt></a></th></tr>";
			    sum = sum+item.ORD_AMOUNT;
		    });
		    
		    cont += "<tr><td></th>";
		    cont += "<td></th>";
		    cont += "<td></th>";
		    cont += "<td></th>";
		    cont += "<td>"+sum+"</th>";
		    cont += "<td></th></tr>"; 
		    $("#myList").html(cont);
		   
	   }
 }
</script>

<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">

	<link href="resources/css/menew.css" rel="text/css" />
	
	 <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/chart.css" rel="stylesheet">

  <!-- Calendar -->
  	<link href="./resources/fullcalendar-3.10.0/fullcalendar.css" rel="stylesheet" />
	<link href="./resources/fullcalendar-3.10.0/fullcalendar.print.css" rel="stylesheet" media="print" />
	<link rel='stylesheet'href='./resources/bootstrap/dist/css/bootstrap.min3.css' />
<style type="text/css">

table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}

table.type11 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type11 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

</style>

</head>

<body id="page-top">
	<!-- ##### Preloader ##### -->
    <!-- <div id="preloader">
        <i class="circle-preloader"></i>
    </div> -->

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
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

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
    
    <!-- <h4>나의 주문 정보</h4> -->
<table class="type11">
    <thead>
    <tr>
        <th scope="cols">주문번호</th>
        <th scope="cols">상품이름</th>
        <th scope="cols">구입날짜</th>
        <th scope="cols">수량</th>
        <th scope="cols">총 금액</th>
        <th scope="cols">영수증</th>
    </tr>
    </thead>
    <tbody id="myList">
    
    </tbody>
    
    
</table>
<div id="warning">

</div>
</body>
</html>