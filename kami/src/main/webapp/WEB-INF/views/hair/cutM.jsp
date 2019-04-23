<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="sub entryhide js no-touch csstransforms csstransforms3d csstransitions">
<head>
<title>cut</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
    
	<link href="resources/css/menew.css" rel="stylesheet" />
	<link href="resources/css/style.css" rel="stylesheet" />
	<link href="resources/css/cut.css" rel="stylesheet" />
	
	<link href="resources/test/onenaver.css" rel="stylesheet" />
	
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
    
    



<div id="overLay"></div>
<div id="side_menu" class='menu-bar'>
  <ul class="menu">
    <li class="ba" id="ba1"><a href="#" id="baW">여자</a>
    	<ul>
		    <li><div id="ba11" data-name="여자" onclick="onClickSettingG(this)" >전체</div></li>
		    <li><div id="ba12" data-name="여자/롱" onclick="onClickSettingG(this)" >롱</div></li>
		    <li><div id="ba13" data-name="여자/미디엄" onclick="onClickSettingG(this)" >미디엄</div></li>
	   	    <li><div id="ba14" data-name="여자/단발" onclick="onClickSettingG(this)" >단발</div></li>
	   	    <li><div id="ba15" data-name="여자/숏" onclick="onClickSettingG(this)" >숏</div></li>
	
		  
	    </ul>
    </li>
    <li class="ba" id="ba2"><a href="#" id="baM">남자</a>
    	<ul>
    	
    	
    		<li><div id="ba21" data-name="남자" onclick="onClickSetting(this)" >전체</div></li>
		    <li><div id="ba22" data-name="남자/미디엄" onclick="onClickSetting(this)" >미디엄</div></li>
	   	    <li><div id="ba23" data-name="남자/숏" onclick="onClickSetting(this)" >숏</div></li>
	   	    
		  <!--   <li><a href="#">전체</a></li>
		    <li><a href="#">미디엄</a></li>
		    <li><a href="#">숏</a></li> -->
	    </ul>
    </li>
  </ul>
  <div id="btn">◀</div>
</div>


</div>
	<div id="container">
		<div id="contents">
			<div>
				<div id="searchList" class="nonEntry">
					<span id="searchList_title"><h2 title="CUT" class="ArticleTitle">CUT</h2></span>
					
				</div>
			</div>
			
			
			
			<!-- 네이버 테스트 -->

<div id="wrap" class="main">

	<div id="header">
		<div class="Ngnb_wrap">
		    
		    <div class="Nlnb" id="Nlnb">
		        <div class="Nlnb_inner">
		            <ul class="Nnav">
		            <!--[D] 선택메뉴에 Nnav_item_active 추가-->
		            <li class="Nnav_cell"><div id="id1" data-name="컷" onclick="onClick(this)" class="Nnav_item">전체</div></li>
		         	<li class="Nnav_cell"><div id="id2" data-name="댄디컷" onclick="onClick(this)" class="Nnav_item">댄디컷</div></li>
		         	<li class="Nnav_cell"><div id="id3" data-name="레이어드컷" onclick="onClick(this)" class="Nnav_item">레이어드컷</div></li>
		         	<li class="Nnav_cell"><div id="id4" data-name="리젠트컷" onclick="onClick(this)" class="Nnav_item">리젠트컷</div></li>
		         	<li class="Nnav_cell"><div id="id5" data-name="샤기컷" onclick="onClick(this)" class="Nnav_item">샤기컷</div></li>
		           	<li class="Nnav_cell"><div id="id6" data-name="스왓컷" onclick="onClick(this)" class="Nnav_item">스왓컷</div></li>
		         	<li class="Nnav_cell"><div id="id7" data-name="투블럭컷" onclick="onClick(this)" class="Nnav_item">투블럭컷</div></li>
		         	<li class="Nnav_cell"><div id="id8" data-name="포마드컷" onclick="onClick(this)" class="Nnav_item">포마드컷</div></li>
		         	<li class="Nnav_cell"><div id="id9" data-name="모히칸컷" onclick="onClick(this)" class="Nnav_item">모히칸컷</div></li>
		            <li class="Nnav_cell"><div id="id10" data-name="크롭컷" onclick="onClick(this)" class="Nnav_item">크롭컷</div></li>
		         	<li class="Nnav_cell"><div id="id11" data-name="슬릭백언더컷" onclick="onClick(this)" class="Nnav_item">슬릭백언더컷</div></li>
		         	<li class="Nnav_cell"><div id="id12" data-name="버즈컷" onclick="onClick(this)" class="Nnav_item">버즈컷</div></li>
		         	<li class="Nnav_cell"><div id="id13" data-name="페이드컷" onclick="onClick(this)" class="Nnav_item">페이드컷</div></li>
		            </ul>
		        </div>
		    </div>
		</div>
		
	</div>
	
    
</div>
<script>
$(function(){
	
	var setting = "${setting}";
 	var hashtag = "${hashtag}";
	
 	
    $("#hashtag").val(hashtag);
    $("#setting").val(setting);

});
</script>

<form id="target"action="goCutM">
<input type="hidden" id ="setting" name="setting">
<input type="hidden" id="hashtag" name="hashtag">
 </form>
 
 <form id="targetG"action="goCut">
 <input type="hidden" id ="settingG" name="setting">
</form>
<!-- 네이버 테스트 -->
<script>



function onClick(e){

	var id = e.getAttribute("id");
 	var hashtag = e.getAttribute("data-name");

    $("#hashtag").val(hashtag); 
    $("#target").submit();
 	
  
}

function onClickSetting(e){


 	var setting = e.getAttribute("data-name");
	
 	$("#setting").val(setting); 
    
    $("#target").submit();
 	
}


function onClickSettingG(e){


 	var setting = e.getAttribute("data-name");
 	
 	$("#settingG").val(setting); 
    
    $("#targetG").submit();
 	
  
    
}



</script>
			
			<div id="wrapper">
			<div id="columns">
				
				
				<c:forEach items="${picture}" var="picture">
					<div class="card">
						<a id="${picture.pictureSeq}" href="goDetailHair?pictureSeq=${picture.pictureSeq}"><img src="img/${picture.savfile}" /></a>	
						<p>${picture.hashtag}</p>
					</div>
				</c:forEach>
			</div>
		</div>
			
			
		<!-- 하단 번호 -->
			<div id="paging">
				<a class="#" id="prevPage">이전</a>
				<span class="numbox">

<c:forEach var="page" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
	
 	<c:if test="${page != navi.currentPage }">
 		<a href="goCut?currentPage=${page}&hashtag=${hashtag}&setting=${setting}" class="num"><span>${page}</span></a> 
	</c:if>
 	<c:if test="${page == navi.currentPage }">
 		<a class="num"> <span class="selected">${page}</span> </a> 
	</c:if>	
	
</c:forEach>


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