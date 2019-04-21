<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	 
	


	 
	 //체크숫자 5개 제한
	 $("input[name=chk]:checkbox").change(function() {// 체크박스들이 변경됬을때
	        var cnt = 5;
	        if( cnt==$("input[name=chk]:checkbox:checked").length ) {
	            $(":checkbox:not(:checked)").attr("disabled", "disabled");
	        } else {
	            $("input[name=chk]:checkbox").removeAttr("disabled");
	        }
	
	        var checkBoxArr = [];
			
	   	 $("input[name=chk]:checked").each(function(i){

	   	 checkBoxArr.push($(this).val());

	   	 });
		/* 	alert(checkBoxArr); */
			var result = "";
			for (var i = 0; i < checkBoxArr.length; i++) {
				if(i==(checkBoxArr.length-1)){
					result += checkBoxArr[i]
				}else{
					result += checkBoxArr[i]+"/"
				}
				
			}
			
			$('#name').val(checkBoxArr[0]);
			 $('#hashtag').val(result);
			
	    });
	 
	 
	
});








</script>
</head>
<body>
<div id="wrapper">
<form action="insertPicture" method="post" enctype="multipart/form-data">
<table id="regist" >
	<tr>
		<th>이름</th>
		<td>
			<input id="name" type="text" name="name"  />
		</td>
	</tr>
	
	
	<tr>
	<td>남자</td>
	</tr>
	<tr>
	<td>커트</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck1" name="chk" value="댄디컷">댄디컷
	</td><td>
	<input type="checkbox" id="ck2"  name="chk" value="레이어드컷">레이어드컷
	</td><td>
	<input type="checkbox" id="ck3" name="chk" value="리젠트컷">리젠트컷
	</td><td>
	<input type="checkbox" id="ck4" name="chk" value="샤기컷">샤기컷
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck5" name="chk" value="스왓컷">스왓컷
	</td><td>
	<input type="checkbox" id="ck6" name="chk" value="투블럭컷">투블럭컷
	</td><td>
	<input type="checkbox" id="ck7" name="chk" value="포마드컷">포마드컷
	</td><td>
	<input type="checkbox" id="ck8" name="chk" value="모히칸컷">모히칸컷
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck9" name="chk" value="크롭컷">크롭컷
	</td><td>
	<input type="checkbox" id="ck10" name="chk" value="슬릭백언더컷">슬릭백언더컷
	</td><td>
	<input type="checkbox" id="ck11" name="chk" value="버즈컷컷">버즈컷컷
	</td><td>
	<input type="checkbox" id="ck12" name="chk" value="페이드컷">페이드컷
	</td>
	</tr>
	<tr>
	<td>펌</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck13" name="chk" value="가르마펌">가르마펌
	</td><td>
	<input type="checkbox" id="ck14" name="chk" value="내츄럴펌">내츄럴펌
	</td><td>
	<input type="checkbox" id="ck15" name="chk" value="다운펌">다운펌
	</td><td>
	<input type="checkbox" id="ck16" name="chk" value="댄디펌">댄디펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck17" name="chk" value="러블리펌">러블리펌
	</td><td>
	<input type="checkbox" id="ck18" name="chk" value="리젠트펌">리젠트펌
	</td><td>
	<input type="checkbox" id="ck19" name="chk" value="베이버펌">베이버펌
	</td><td>
	<input type="checkbox" id="ck20" name="chk" value="볼륨펌">볼륨펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck21" name="chk" value="쉐도우펌">쉐도우펌
	</td><td>
	<input type="checkbox" id="ck22" name="chk" value="스왈로펌">스왈로펌
	</td><td>
	<input type="checkbox" id="ck23" name="chk" value="아이롱펌">아이롱펌
	</td><td>
	<input type="checkbox" id="ck24" name="chk" value="텍스쳐펌">텍스쳐펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck25" name="chk" value="투블럭펌">투블럭펌
	</td><td>
	<input type="checkbox" id="ck26" name="chk" value="포마드펌">포마드펌
	</td><td>
	<input type="checkbox" id="ck27" name="chk" value="호일펌">호일펌
	</td><td>
	<input type="checkbox" id="ck28" name="chk" value="쉼표머리">쉼표머리
	</td><td>
	<input type="checkbox" id="ck29" name="chk" value="특수머리">특수머리
	</td>
	</tr>
	<tr>
	<td>여자</td>
	</tr>
	<tr>
	<td>커트</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck30" name="chk" value="레이어드컷">레이어드컷
	</td><td>
	<input type="checkbox" id="ck31" name="chk" value="뱅헤어">뱅헤어
	</td><td>
	<input type="checkbox" id="ck32" name="chk" value="비대칭컷">비대칭컷
	</td><td>
	<input type="checkbox" id="ck33" name="chk" value="샤기컷">샤기컷
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck34" name="chk" value="보브컷">보브컷
	</td><td>
	<input type="checkbox" id="ck35" name="chk" value="원랭스컷">원랭스컷
	</td><td>
	<input type="checkbox" id="ck36" name="chk" value="머쉬룸컷">머쉬룸컷
	</td><td>
	<input type="checkbox" id="ck37" name="chk" value="픽시컷">픽시컷
	</td>
	</tr>
	<tr>
	<td>펌</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck38" name="chk" value="C컬펌">C컬펌
	</td><td>
	<input type="checkbox" id="ck39" name="chk" value="S컬펌">S컬펌
	</td><td>
	<input type="checkbox" id="ck40" name="chk" value="내츄럴펌">내츄럴펌
	</td><td>
	<input type="checkbox" id="ck41" name="chk" value="글램펌">글램펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck42" name="chk" value="디지털펌">디지털펌
	</td><td>
	<input type="checkbox" id="ck43" name="chk" value="볼륨펌">볼륨펌
	</td><td>
	<input type="checkbox" id="ck44" name="chk" value="아이롱펌">아이롱펌
	</td><td>
	<input type="checkbox" id="ck45" name="chk" value="러블리펌">러블리펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck46" name="chk" value="루즈펌">루즈펌
	</td><td>
	<input type="checkbox" id="ck47" name="chk" value="물결펌">물결펌
	</td><td>
	<input type="checkbox" id="ck48" name="chk" value="바디펌">바디펌
	</td><td>
	<input type="checkbox" id="ck49" name="chk" value="발롱펌">발롱펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck50" name="chk" value="텍스쳐펌">텍스쳐펌
	</td><td>
	<input type="checkbox" id="ck51" name="chk" value="베이비펌">베이비펌
	</td><td>
	<input type="checkbox" id="ck52" name="chk" value="볼륨매직">볼륨매직
	</td><td>
	<input type="checkbox" id="ck53" name="chk" value="셋팅펌">셋팅펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck54" name="chk" value="믹스펌">믹스펌
	</td><td>
	<input type="checkbox" id="ck55" name="chk" value="퍼피베이비펌">퍼피베이비펌
	</td><td>
	<input type="checkbox" id="ck56" name="chk" value="쿠션펌">쿠션펌
	</td><td>
	<input type="checkbox" id="ck57" name="chk" value="볼드펌">볼드펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck58" name="chk" value="히피펌">히피펌
	</td><td>
	<input type="checkbox" id="ck59" name="chk" value="지젤펌">지젤펌
	</td><td>
	<input type="checkbox" id="ck60" name="chk" value="레이어드펌">레이어드펌
	</td><td>
	<input type="checkbox" id="ck61" name="chk" value="빌드펌">빌드펌
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck62" name="chk" value="에어펌">에어펌
	</td><td>
	<input type="checkbox" id="ck63" name="chk" value="젤리펌">젤리펌
	</td><td>
	<input type="checkbox" id="ck64" name="chk" value="특수머리">특수머리
	</td>
	</tr>
	<tr>
	<td>염색</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck65" name="chk" value="다크브라운">다크브라운
	</td><td>
	<input type="checkbox" id="ck66" name="chk" value="레드브라운">레드브라운
	</td><td>
	<input type="checkbox" id="ck67" name="chk" value="밀크브라운">밀크브라운
	</td><td>
	<input type="checkbox" id="ck68" name="chk" value="카키브라운">카키브라운
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck69" name="chk" value="쿠퍼브라운">쿠퍼브라운
	</td><td>
	<input type="checkbox" id="ck70" name="chk" value="초코브라운">초코브라운
	</td><td>
	<input type="checkbox" id="ck71" name="chk" value="베이지브라운">베이지브라운
	</td><td>
	<input type="checkbox" id="ck72" name="chk" value="오렌지브라운">오렌지브라운
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck73" name="chk" value="올리브브라운">올리브브라운
	</td><td>
	<input type="checkbox" id="ck74" name="chk" value="골드브라운">골드브라운
	</td><td>
	<input type="checkbox" id="ck75" name="chk" value="핑크브라운">핑크브라운
	</td><td>
	<input type="checkbox" id="ck76" name="chk" value="레드와인">레드와인
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck77" name="chk" value="블루블랙">블루블랙
	</td><td>
	<input type="checkbox" id="ck78" name="chk" value="애쉬브라운">애쉬브라운
	</td><td>
	<input type="checkbox" id="ck79" name="chk" value="애쉬그레이">애쉬그레이
	</td><td>
	<input type="checkbox" id="ck80" name="chk" value="애쉬베이지">애쉬베이지
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck81" name="chk" value="애쉬블론드">애쉬블론드
	</td><td>
	<input type="checkbox" id="ck82" name="chk" value="애쉬카키">애쉬카키
	</td><td>
	<input type="checkbox" id="ck83" name="chk" value="애쉬블루">애쉬블루
	</td><td>
	<input type="checkbox" id="ck84" name="chk" value="애쉬바이올렛">애쉬바이올렛
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck85" name="chk" value="애쉬퍼플">애쉬퍼플
	</td><td>
	<input type="checkbox" id="ck86" name="chk" value="퍼플그레이">퍼플그레이
	</td><td>
	<input type="checkbox" id="ck87" name="chk" value="로즈골드">로즈골드
	</td><td>
	<input type="checkbox" id="ck88" name="chk" value="옴브레">옴브레
	</td>
	</tr>
	<tr>
	<td>
	<input type="checkbox" id="ck89" name="chk" value="마르살라">마르살라
	</td><td>
	<input type="checkbox" id="ck90" name="chk" value="마호가니">마호가니
	</td><td>
	<input type="checkbox" id="ck91" name="chk" value="파스텔">파스텔
	</td><td>
	<input type="checkbox" id="ck92" name="chk" value="브릿지">브릿지
	</td>
	</tr>
	
		<tr>
		<th>성별/머리길이 </th>
		<td>
		<select id="setting" name="setting" >
			<option value="남자/미디엄" >남자/미디엄</option>
			<option value="남자/숏" >남자/숏</option>
			<option value="여자/롱" >여자/롱</option>
			<option value="여자/미디엄" >여자/미디엄</option>
			<option value="여자/단발" >여자/단발</option>
			<option value="여자/숏" >여자/숏</option>
		</select>
		</td>
			<th>모량 </th>
		<td>
		<select id="conditionM" name="conditionM" >
			<option value="M" >모량 무관</option>
			<option value="Ms" >모량 적음</option>
			<option value="Mm" >모량 보통</option>
			<option value="Mb" >모량 많음</option>
			
		</select>
		</td>
			<th>모발굵기 </th>
		<td>
		<select id="conditionG" name="conditionG" >
			<option value="G" >모발굵기 무관</option>
			<option value="Gs" >모발굵기 얇음</option>
			<option value="Gm" >모량굵기 보통</option>
			<option value="Gb" >모량굵기 두꺼움</option>
			
		</select>
		</td>
			<th>머리 형태 </th>
		<td>
		<select id="conditionH" name="conditionH" >
			<option value="H" >곱슬 무관</option>
			<option value="Hs" >직모</option>
			<option value="Hm" >약 곱슬</option>
			<option value="Hb" >곱슬</option>
			
		</select>
		</td>
		
		<th>머리 손상도 </th>
		<td>
		<select id="conditionD" name="conditionD" >
			<option value="D" >손상 무관</option>
			<option value="Dm" >일부 손상</option>
			<option value="Db" >심한 손상</option>
			
		</select>
		</td>
			<th>형굴형 </th>
		<td>
		<select id="conditionF" name="conditionF" >
			<option value="F" >얼굴형 무관</option>
			<option value="Fo" >계란형 얼굴</option>
			<option value="Fr" >둥근 얼굴</option>
			<option value="Fl" >긴 얼굴</option>
			<option value="Fs" >각진 얼굴</option>
			
		</select>
		</td>
		
	</tr>
	
	<td colspan="2">
	
	<input type="file" id="myfile" name="uploadFile">
	<br>
	
				<input id="procedureRegist" type="submit" value="독서평 등록" />
			<input id="cancel" type="reset" value="취소" />
		</td>
		
		
		
		
	
</table>
<input type="text" id="hashtag" name="hashtag">

</form>
<br>

</div>
</body>
</html>