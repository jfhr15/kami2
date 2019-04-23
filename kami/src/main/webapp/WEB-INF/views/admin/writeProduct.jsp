<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
	
	<!-- Custom fonts for this template-->
	<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/chart.css" rel="stylesheet">
	
	<link rel="stylesheet" href="resources/css/writePrd.css">
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


<c:if test="${product==null}">
	<form action="writeProduct" method="post" enctype="multipart/form-data">
</c:if>

<c:if test="${product!=null}">
	<form action="updateProduct" method="post" enctype="multipart/form-data">
	<input type="hidden" name="productseq" value="${product.productseq}">
</c:if>

등록상품구분 : 
<select name="kindseq">
<c:forEach var="pk" items="${pList}">
    <option value="${pk.kindseq}">${pk.productkind}</option>
</c:forEach>
</select><br>
상품명 : <input type="text" name="prd_name" value="${product.prd_name}"><br>
상품원가 : <input type="number" name="prd_price1" value="${product.prd_price1}"><br>
상품판매가 : <input type="number" name="prd_price2" value="${product.prd_price2}"><br>
상품설명 : <textarea name="prd_content">${product.prd_content}</textarea><br>
상품수량 : <input type="number" name="prd_quantity" value="${product.prd_quantity}"><br>
<input type="file" id="myfile" name="uploadFile" value="${product.prd_ognfile}"><br>
<img id="img1" style="width:300px;height:300px;" />
<button>write</button>
</form>
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
	 $('#myfile').change(function(e){
	 //파일 오브젝트를 취득
    var file = e.target.files[0];
    var reader = new FileReader();
    
  //이미지 파일이 아닐 경우, 종료 처리
    if(file.type.indexOf("image") < 0){
      alert("이미지 파일을 지정해 주세요");
      return false;
    }
  //업로드한 이미지를 지정
    reader.onload = (function(file){
      return function(e){
        $("#img1").attr("src", e.target.result);
        $("#img1").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
	  });
});
</script>
</body>
</html>