<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product regist</title>
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
	
	<!-- Custom fonts for this template-->
	<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/chart.css" rel="stylesheet">
	
	<link rel="stylesheet" href="resources/css/prdManage.css">
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
    
    <div id="wrapper">
    <!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

	<!-- Nav Item - Charts -->
      <li class="nav-item active">
        <a class="nav-link" href="goManagement">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="goIndex4">
          <i class="fas fa-fw fa-table"></i>
          <span>Calendar</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="goProcedureManage">
          <i class="fas fa-fw fa-table"></i>
          <span>Procedure</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="goProductManage">
          <i class="fas fa-fw fa-prescription-bottle-alt"></i>
          <span>Product</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="goPicture">
          <i class="fas fa-fw fa-table"></i>
          <span>Picture</span></a>
      </li>

		</ul>
		<!-- End of Sidebar -->
		<div class="container-fluid">
		<div class="co1">
<h1>상품관리</h1>

<div>
상품 종류 : <input class="sub"  type="text" name="productkind" id="productkind">
<input class="sub" type="button" value="등록" id="insertkind">
</div>
<br><br>
상품목록
<br>
<div class="kindListDiv"></div>

<br><br>
<form action="goProductInsert">
<input class="sub" type="submit" value="상품등록">
</form>
<br><br>

<div class="ProductListDiv"></div>
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
    
    <script src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script src=" <c:url value = "/resources/js/sb-admin-2.min.js"/>"></script>
	
	<script>
$(function(){
	$("#insertkind").on('click', regist);
	initpk();
	initProduct();
});

//상품종류등록
function regist(){
	var pk = $("#productkind").val();
	$.ajax({
		url : "insertproduct",
		type : "post",
		data : {pk:pk},
		success : function(data){
			initpk();
			$("#productkind").val("");
		}
	});
}

//상품종류전체목록출력
function initpk() {
	$.ajax({
		url : "selectproductlist",
		type : "post",
		success:function(data){
			output(data);
		}
	});
}

//상품전체목록출력
function initProduct() {
	$.ajax({
		url : "selectAllproduct",
		type : "post",
		success:function(data){
			outputProduct(data);
		}
	});
}

//상품종류 전체목록출력-text
function output(resp) {
	var data = "";
	data+="<table class='plist'>";
	$.each(resp, function(index, item){
		data+="<tr>";
		data += "<td class='p1'>"+(item.productkind)+"</td>";
		data += "<td><input class='sub' type='button' data-sno='"+item.kindseq +"' value='삭제' class='deletebutton'></td>";
		data+="</tr>";
	});
	data+="</table>";
	$(".kindListDiv").html(data);
	$(".deletebutton").on("click",del);
	
}



//상품 전체목록출력-text
function outputProduct(resp) {
	var data = "";
	var test = 1;
	$.each(resp, function(index, item){
		test +=1;
		data += '<br><a href="godetailProduct?productseq='+item.productseq+'"><img src="img/' + item.prd_ognfile + '">' ;
		data += '<br>'+item.prd_name+'</a>';
	});
	$(".ProductListDiv").html(data);
	
}


//상품종류 삭제
function del() {
	var seq = $(this).attr('data-sno');
	$.ajax({
		url : "deleteproduct",
		type : "get",
		data : {seq:seq},
		success:function(data){
			initpk();
		}
	});
}

</script>
</body>
</html>