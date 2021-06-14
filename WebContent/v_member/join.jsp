<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- css -->
<link rel="stylesheet" href="${path}/v_css/join.css" />
<!-- 다음 주소 api -->
<span id="guide" style="color:#999"></span>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}
</script>

<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function winopen() {
	   //회원가입시 id입력란에 아이디를 입력하지 않았을 때 
	   if(document.join.id.value == ""){
	      alert("아이디를 입력하세요.");
	      document.join.id.focus();
	      return; //아래 문장 실행 안되게 하는 것
	   }
	   
	   //작은 창 열기 join_IDCheck.jsp width=400, height=200
	   var jid = document.join.id.value;
	   window.open("member/join_IDCheck.jsp?userid="+jid, "" , "width=400, height=200");
	}
	
function checkValue(){
    var join = document.join;
    
    if(!join.id.value){
       alert("아이디를 입력하세요.");
       return false;
    }
    
     if(!join.name.value){
         alert("이름을 입력하세요.");
         return false;
     }
   
     if(!join.phone.value){
         alert("연락처를 입력하세요.");
         return false;
     }
     alert("회원가입을 축하합니다. 로그인 후 쿠폰함을 확인해주세요.^^");
 }
	
	$(function() {
		
		// 아이디 중복체크
		$("#id").keyup(function() {

			if($(this).val()=="") {
				$("#idCheck").html("");
				return;	
			}
			
			$.ajax({
				url:"${path}/idCheck",
				datatype:"text",
				type:"post",
				data:{id:$(this).val()},
				success:function(result) {
					$("#idCheck").text(result);
				},
				error:function(err) {
					alert(err+"아이디 조회 에러.");
				}
			});
		});
		
		// 비밀번호 일치체크
		$("#pwc").keyup(function() {
			if($(this).val()==""){
				$("#pwCheck").html("");
				return;
			}
			
			$.ajax({
				url:"${path}/pwCheck",
				datatype:"text",
				type:"post",
				data:{pwc:$(this).val(),pw:$("#pw").val()},
				success:function(result) {
					$("#pwCheck").text(result);
				},
				error:function(err) {
					alert(err+"비밀번호 조회 에러.");
				}
			});		
		});	
	}); // jQuery 끝.
	
</script>
</head>
<body>
<!--================ Header 시작. =================-->
  <jsp:include page="../header.jsp" />
  <!--================ Header 끝. =================-->

	
	<!-- S:타이틀 -->
   <div id="Tit_NewMembe">
      <h1>
         <img
            src="https://sslimage.interpark.com/_nip/Newmember/tit_memjoin.png"
            alt="회원가입">
      </h1>
   </div>
   <!-- E:타이틀 -->




   <!-- S:입력폼 -->
   <form action="${path}/front?key=member&methodName=memberJoin" id="join" method="post" name="join" onsubmit="return checkValue()">
   <div id="NewMemberwarp">
    <div class="NewMember">
        <!-- 필수입력사항 -->
        <div id="necessary">
            <h2><img src="https://sslimage.interpark.com/_nip/Newmember/tit_newmem1.gif" alt="필수입력"></h2>

            <div class="join_mem">
                <div class="join_cont1">


                     <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <colgroup>
                           <col width="156">
                           <col width="">
                        </colgroup>


                        <tbody>
                           <!-- 아이디 입력 칸 -->
                           <tr>
                              <th><span class="titR">*</span> 아이디</th>
                              <td><input type="text" id="id" name="id" placeholder="아이디를 입력하세요."
                                 maxlength="20" class="memtxt" style="width: 338px;" onkeydown="inputIdChk()">
                                   <span id="idCheck" class="txtR"></span>
                                 </td>
                               
                           </tr>


                           <!-- 비밀번호 입력칸 -->
                           <tr>
                              <th><span class="titR">*</span> 비밀번호 입력</th>
                              <td><input type="password" class="memtxt" name="pw"
                                 value="" maxlength="12" id="pw"
                                 style="width: 338px; ime-mode: disabled;"> <span
                                 class="txtR">영문, 숫자, 특수문자 조합 8~12자</span></td>
                           </tr>

                           <!-- 비밀번호 재입력칸 -->
                           <tr>
                              <th><span class="titR">*</span> 비밀번호 확인</th>
                              <td>
                              <input type="password" class="memtxt" name="pwc" value="" maxlength="12"
                                 style="width: 338px; ime-mode: disabled;" id="pwc"> 
                                 <span id="pwCheck" class="txtR"></span></td>
                           </tr>
                           <!-- 이름 -->
                           <tr>
                              <th><span class="titR">*</span> 이름</th>
                              <td><input type="text" name="name" value=""
                                 class="memtxt" style="width: 338px; ime-mode: active;"
                                  maxlength="20"></td>
                           </tr>
                           
                           <!-- 이메일 -->
                           <tr>
                           	   <th><span class="titR">*</span> 이메일</th>
                           	   <td><input type="email" class="memtxt" name="email"></td>
               			   </tr>
                                 
                           <!-- 연락처 -->
                                 <tr>
                                    <th><span class="titR">*</span> 연락처</th>
                                    <td><input type="text" name="phone" id="phone" value=""
                                       class="memtxt" style="width: 338px; ime-mode: active;"
                                       minlength="4" maxlength="20"></td>
                                 </tr>      

                           <!-- 주소-->
                        <tr>
                     <th><span class="titR">*</span> 주소</th>
                    <td><script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<input type="text" class="memtxt" id="sample4_postcode" name="address1" class="mini" placeholder="우편번호" > 
					<input type="text" class="memtxt" id="sample4_roadAddress" name="address2" placeholder="도로명주소">
					<input type="text" class="memtxt" id="sample4_jibunAddress" name="address3" placeholder="지번주소">
					<input type="button" class="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					싱세주소 : <input type="text" name="addr2" class="memtxt"> <p>
					<div class="chbox"><input type="checkbox" class="cbox" id="default_flag" name="default_flag" value="y">
					<label for="default_flag">기본배송지 설정</label>
					</div>
				</td>
				
                        </tr>

                        </tbody>

                     </table>


                  </div>
            </div>
        </div>
        <!-- // 필수입력사항 -->

        <!-- 필수항목동의 -->
      
        <!-- //필수항목동의 -->

        
      <!-- // 160926 수정 -->

        <!-- 회원가입 버튼 -->
        <div class="btn_join">
            <input type="submit" class="button" value="확인" class="submit">
            <input type="reset" class="button" value="취소" class="cancel">
        </div>
        <!-- //회원가입 버튼 -->

    </div>
</div>

</form>
<!-- E:입력폼 -->
	
	
	
<%-- 	<section>
		<div style="margin:auto;text-align:center;">
		<form action="${path}/front?key=member&methodName=memberJoin" method=post>
			아이디 :<input type="text" name="id" id="id"><span id="idCheck"></span> <p>
			비밀번호 : <input type="password" name="pw" id="pw"> <p>
		    비밀번호확인 : <input type="password" name="pwc" id="pwc"> <span id="pwCheck"></span><p> 
		    이름 : <input type="text" name="name"> <p>
		    집주소 : <input type="text" name="addr1"> <p>
		    
		    휴대폰 : <input type="text" name="phone"> <p>
		    이메일 : <input type="text" name="email"> <p>
		    <input type="submit" value="확인">
		    <input type="reset" value="취소">
		    </table> 
		</form>		
		</div>
	</section> --%>
	
	 <!--================ start footer Area  =================-->
  <jsp:include page="../footer.jsp"/>
  <!--================ End footer Area  =================-->
	
</body>
</html>