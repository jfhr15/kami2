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
<!--                <button type="button" class="close" data-dismiss="modal" -->
<!--                   aria-label="Close"> -->
<!--                   <span aria-hidden="true">&times;</span> -->
<!--                </button> -->
               <h4 class="modal-content" id="viewModalLabel">
<!--                   <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> -->
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
<!--                <button type="button" class="close" data-dismiss="modal" -->
<!--                   aria-label="Close"> -->
<!--                   <span aria-hidden="true">&times;</span> -->
<!--                </button> -->
<!--                <h4 class="modal-content"></h4> -->
            </div>
            <div class="modal-body">
               <label class="sr-only" for="content">content</label>
<!--                <div class="input-group" id="division"> -->
<!--                   <div class="input-group-addon"> -->
<!--                      <span class="glyphicon glyphicon glyphicon-pencil" -->
<!--                         aria-hidden="true"></span> -->
<!--                   </div> -->
<!--                   <input type="text" class="form-control" id="content" -->
<!--                      placeholder="content" value=""> -->
<!--                </div> -->
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
<!--                      <br> -->
<!--                      <div class="form-inline"> -->
<!--                         <label class="sr-only" for="end">end</label> -->
<!--                         <div class="input-group"> -->
<!--                            <div class="input-group-addon"> -->
<!--                               <span class="glyphicon glyphicon glyphicon-calendar" -->
<!--                                  aria-hidden="true"></span> -->
<!--                            </div> -->
<!--                            <input type="text" class="form-control" id="end" -->
<!--                               placeholder="end"> -->
<!--                         </div> -->
<!--                         <label class="sr-only" for="ehour">ehour</label> -->
<!--                         <div class="input-group"> -->
<!--                            <select id="ehour" class="form-control"> -->
<!--                               <option value="10">10 -->
<!--                               <option value="11">11 -->
<!--                               <option value="12">12 -->
<!--                               <option value="13">13 -->
<!--                               <option value="14">14 -->
<!--                               <option value="15">15 -->
<!--                               <option value="16">16 -->
<!--                               <option value="17">17 -->
<!--                               <option value="18">18 -->
<!--                               <option value="19">19 -->
<!--                               <option value="20">20 -->
<!--                            </select> -->
<!--                         </div> -->
<!--                         <label class="sr-only" for="emin">emin</label> -->
<!--                         <div class="input-group"> -->
<!--                            <select id="emin" class="form-control"> -->
<!--                               <option value="00">00 -->
<!--                               <option value="15">15 -->
<!--                               <option value="30">30 -->
<!--                               <option value="45">45 -->
<!--                            </select> -->
<!--                         </div> -->
<!--                      </div> -->
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
   
    <div class="footer">
       <div class="inner">
          <strong><img src="resources/logo.png" alt="kamikami"></strong>
          <p class="address">서울 강남구 영동대로 513 삼성동 159 코엑스 4층 kamikami
          <br>
          대표자 : aaa &emsp;&emsp;&emsp; phone : 010-1234-5678</p>
       </div>
    </div>
    
    <!-- ##### All Javascript Script ##### -->
    <script src="resources/cryptos-master/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/popper.min.js"></script>
    <script src="resources/cryptos-master/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/cryptos-master/js/plugins/plugins.js"></script>
    <script src="resources/cryptos-master/js/active.js"></script>
    
   <script type="text/javascript" src="./resources/fullcalendar-3.10.0/lib/moment.min.js"></script>
<!--    <script type="text/javascript" src="./resources/fullcalendar-3.10.0/lib/jquery.min.js"></script> -->
   <script type="text/javascript" src="./resources/fullcalendar-3.10.0/fullcalendar.js" charset="UTF-8"></script>
   <script type="text/javascript" src="./resources/fullcalendar-3.10.0/gcal.js"></script>
   <script src='./resources/bootstrap/dist/js/bootstrap.min.js'></script>
   <script type="text/javascript" src="./resources/fullcalendar-3.10.0/locale/ko.js"></script>
    <script type="text/javascript" src="resources/js/reservation.js"></script>
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <script type="text/javascript">
   
   $("#saveBtn").on("click",function(){
      alert("선결제 10,000원이 청구됩니다.\n남은 금액은 현장결제하시기 바랍니다.");
      payment()
   });
   
   
   function payment(){
      var IMP = window.IMP; // 생략가능
       IMP.init('imp53829632');  // 가맹점 식별 코드
       IMP.request_pay({

          pg : 'kakaopay', // 결제방식
           pay_method : 'card',   // 결제 수단
           merchant_uid : 'merchant_' + new Date().getTime(),
           /*
           merchant_uid는
           https:docs.iamport.kr/implementation/payment에서 넣을 수 있는 방법 참고.
           */
           name : "예약 test",   // order 테이블에 들어갈 주문명 혹은 주문 번호
           amount : 100,   // 결제 금액
           buyer_name : '황의선',   // 구매자 이름
           buyer_tel : '010-5542-2334'   // 구매자 전화번호
       }, function(rsp) {

          console.log("3rd");
          if ( rsp.success ) {
              //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
               jQuery.ajax({
                 url: "ReservationAction", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
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
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
       
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
                     var emp_id = $("#emp_id").val();
                     var rsv_date = $("#hStart").val();
                     var pcd = $("#pcd").val();
                     
                     $.ajaxSettings.traditional = true;
                     $.ajax({
                        url : 'ReservationFinish',
                        type : 'POST',
                        data : {
                           paymentNum : paymentNum,
                           emp_id : emp_id,
                           rsv_date : rsv_date,
                           pcd : pcd
                        },

                        success : function(rsp) {
                           console.log("rsp after finish : " + JSON.stringify(rsp));
                           location.href="goReservation";
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
       });
   }
   
   
   </script>
</body>
</html>