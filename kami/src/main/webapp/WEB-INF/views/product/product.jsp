<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>product</title>

	<link rel="icon" href="http://www.templatemonster.com/favicon.ico">
    <link rel="stylesheet" href="resources/cryptos-master/style.css">
	
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
    
    
    <div id="container">
      <div id="contents">
         <div>
            <div id="searchList" class="nonEntry">
               <span id="searchList_title"><h2 title="COLOR" class="ArticleTitle">PRODUCT</h2></span>
               <ol id="product">
               
               </ol>
               <input type='number' id='quantity' name='myProduct_quantity'>
               <input type='submit' id='buyProduct' name='buyProduct'>
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


	<script src="resources/cryptos-master/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/popper.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/cryptos-master/js/plugins/plugins.js"></script>
    <script src="resources/cryptos-master/js/active.js"></script>

   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">

    $(function() {
       init();
       
    }); 

    function init() {
       // Code here 
       $.ajax({
          type : 'POST'
          ,url : "selectAll"
          ,success : function(resp){
                output(resp);
             }
          });
    }

    // 출력 코드
    function output(resp) {
       // Code here
        var cont = "";
       $.each(resp,function(index,item){
       cont+="<li><div class='item'><div id='post_thumb/"+item.productseq+"?category=662142' class='post_thumb'>";
       cont+="<span class='thumb'><a class='list_url' style='background-image:url(<c:url value='img/" + item.prd_ognfile + "'/>) !important'></a>";
       cont+="</span></div>";
       cont+="<div class='post_thumb_content'>";
      /*  cont+="<div class='list_category'>"+item.kindseq+"</div>"; */  //종류별 분류값
       cont+="<div class='list_title'><a class='ellipsis' >"+item.prd_name+"</a></div>";
       cont+="<div class='list_article'><a  class='article_desc'>"+item.prd_content+"</a></div>";
       cont+="<div class='list_date'>"+item.prd_price2+"원</div><br>";
       cont+="<input type='number' id='quantity" + index + "' class='quantity' name='myProduct_quantity'>";
       cont+="<input type='submit' class='buyProduct' value='구매' data-sno='"+item.productseq+"' data-value='" + index + "'>";
       cont+="<input type='hidden' id='prd_price2" + index + "'class='prd_price2' value='"+item.prd_price2+"'>";
       cont+="<input type='hidden' id='prd_name" + index + "'class='prd_name' value='"+item.prd_name+"'>";
       cont+="</div></div></li>";
   
       //<img src="<c:url value="resources/img/' + item.prd_ognfile + '"/>">
      
    /*    cont+="<td class = 'bookreview'>"+item.bookreview+"</td>";
       cont+="<td class = 'upt'><button class='delete' data-value ='"+item.booknum+"'>삭제</button><br>";
       cont+="<button class='update' data-value ='"+item.booknum+"'>수정</button></td>"; */
    /*      cont+="<input type='submit' class='delete' value='삭제' data-sno='"+item.seq+"'>";
        cont+="<input type='submit' class='update' value='수정'  data-sno='"+item.seq+"'>"; */
       });
        
       $("#product").html(cont);
       $(".buyProduct").on("click",function(){
    	   var index = $(this).attr("data-value");
    	   
         var msg="";
          var quantity = $("#quantity" + index).val();
          var prd_price2 = $("#prd_price2" + index).val();
          var prd_name = $("#prd_name" + index).val();
          var productseq = $(this).attr("data-sno");
          msg += "제품명 : "+prd_name;
         msg += "\n구매수량 : "+quantity;
         msg += "\n총 금액 : "+prd_price2*quantity;
         msg += "\n구매하시겠습니까?";
         alert(msg);
         console.log("aaa");
         
          $.ajax({
             type : 'POST'
             ,url : "searchProduct"
             ,data : {
                quantity : quantity
                , productseq : productseq
             }
             ,success : function(resp){
            	 var loginId= '${sessionScope.loginId}';
 				console.log(loginId);
             	 if (loginId===""){
             	 	alert("로그인 해주세요.");
             	 	location.href="goLogin";
             	 } else {
             	 	payment(resp);
             	 }
                }
             });
         
         
         
    }); 
    }
    
    function payment(data) {
    	
    	var productseq = data.product.productseq;
    	var mem_id = data.idinfo.id;
    	var ord_amount = data.price;
    	var ord_quantity = data.quantity;
    	var ord_status = '주문완료';
    	
		console.log("2nd");
    	var IMP = window.IMP; // 생략가능
    	IMP.init('imp53829632');  // 가맹점 식별 코드
    	console.log("data.product.prd_name : " + data.product.prd_name);
    	console.log("data.price : " + data.price);
    	IMP.request_pay({

    	   pg : 'kakaopay', // 결제방식
    	    pay_method : 'card',	// 결제 수단
    	    merchant_uid : 'merchant_' + new Date().getTime(),
    	    /*
    	    merchant_uid는
    	    https:docs.iamport.kr/implementation/payment에서 넣을 수 있는 방법 참고.
    	    */
    	    name : data.product.prd_name,	// order 테이블에 들어갈 주문명 혹은 주문 번호
    	    amount : data.price,	// 결제 금액
    	    buyer_name : data.idinfo.id,	// 구매자 이름
    	    buyer_tel : data.idinfo.phone	// 구매자 전화번호
    	}, function(rsp) {

    		console.log("3rd");
    		if ( rsp.success ) {
    	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	    	jQuery.ajax({
    	    		url: "action", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    	    		type: 'POST',
    	    		dataType: 'json',
    	    		data: {
    		    		imp_uid : rsp.imp_uid
    	    		},
					error : function(error) {
						alert(JSON.stringify(error));
						console.log(JSON.stringify(error));
					}
    	    	}).done(function(data){
    	    			console.log(data);
    	    			console.log(JSON.stringify(data));
    	    			
    	    			
    	    			//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    	        		if ( rsp.success ) {
    	        			console.log("rsp after done : " + JSON.stringify(rsp));
    	        			var msg = '결제가 완료되었습니다.';
    	        			msg += '\n고유ID : ' + rsp.imp_uid;
    	        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    	        			msg += '\결제 금액 : ' + rsp.paid_amount;
    	        			msg += '카드 승인번호 : ' + rsp.apply_num;
    	
    	        			alert(msg);

							
							var today = new Date();
							var result = today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate()+" ";
							
							// Create a new JavaScript Date object based on the timestamp
							// multiplied by 1000 so that the argument is in milliseconds, not seconds.
							var date = new Date(rsp.paid_at*1000);
							// Hours part from the timestamp
							var hours = date.getHours();
							// Minutes part from the timestamp
							var minutes = "0" + date.getMinutes();
							// Seconds part from the timestamp
							var seconds = "0" + date.getSeconds();

							// Will display time in 10:30:23 format
							var formattedTime = hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);
							result += formattedTime;
							
							var paymentNum = rsp.imp_uid;
							var issucess = rsp.success;
							var meansofpayment = rsp.pay_method;
							var resultcode = rsp.status;
							var totprice = rsp.paid_amount;
							var indate = result;
							var receipt_url = rsp.receipt_url;
							
							$.ajaxSettings.traditional = true;
							$.ajax({
								url : 'finish',
								type : 'POST',
								data : {
									productseq : productseq,
							    	mem_id  : mem_id,
							    	ord_amount  : ord_amount,
							    	ord_quantity  : ord_quantity,
							    	ord_status  : ord_status,
							    	paymentNum  : paymentNum,
									issucess  : issucess,
									meansofpayment  : meansofpayment,
									resultcode  : resultcode,
									totprice  : totprice,
									indate  : indate,
									receipt_url  : receipt_url,
								},
								
								success : function(rsp) {
									console.log("rsp after finish : " + JSON.stringify(rsp));
									alert("결제가 완료되었습니다.");
									location.href="complete";
								}
							});
	   	        		} else {
	  	        			var msg = '결제에 실패하였습니다.';
	   	           	        msg += '에러내용 : ' + rsp.error_msg;
	   	           	
	   	           	        alert("222"+msg);
	   	           	   		//[3] 아직 제대로 결제가 되지 않았습니다.
	   	        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	   	        		}
	   	    		}).fail(function(result) {
	   	                alert("요청 실패");
	   	            })
	   			}
	   	    		/* error : function() {
	   	    			alert("An error occured");
	   	    		} */
	   	    });
	    }
   </script>
</body>
</html>
