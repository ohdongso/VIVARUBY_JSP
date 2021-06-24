<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="${path}/img/favicon.png" type="image/png" />
    <title>장바구니</title>
    <link rel="stylesheet" href="${path}/v_css/join.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${path}/css/bootstrap.css" />
    <link rel="stylesheet" href="${path}/vendors/linericon/style.css" />
    <link rel="stylesheet" href="${path}/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${path}/css/themify-icons.css" />
    <link rel="stylesheet" href="${path}/vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="${path}/vendors/lightbox/simpleLightbox.css" />
    <link rel="stylesheet" href="${path}/vendors/nice-select/css/nice-select.css" />
    <link rel="stylesheet" href="${path}/vendors/animate-css/animate.css" />
    <link rel="stylesheet" href="${path}/vendors/jquery-ui/jquery-ui.css" />
    <!-- main css -->
    <link rel="stylesheet" href="${path}/css/style.css" />
    <link rel="stylesheet" href="${path}/css/responsive.css" />
    <style type="text/css">
    
    #wish{
    	width: 100px; 
    	height: 100px;
    }
        
     tr, td{
    	height: 10px;
     }
    
    .main_btn {
     	margin-top: 3px;
    }
    
    #join{
    	margin-left: -310px;
    }
    
    </style>

<!-- 다음 주소 api -->
<span id="guide" style="color:#999"></span>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	
	$(function() {
		// 결제하기 기능
		$("#order").click(function() {
			
			// 결제정보에 따라서 1번이면 무통장, 2번이면 카카오페이 결제.
			var flag = 0;
			if($("input:radio[id='cash1']").is(":checked")) {
				flag = 1;
			} else if($("input:radio[id='cash2']").is(":checked")) {
				flag = 2;
			} else {
				flag = 3;
			}
			
			if(flag == 3) {
				alert("결제방법을 선택해주세요.");
				return false;
			}
			
			// 이용약관 동의 유효성 검사.
			if($("input:checked[id='check']").is(":checked")){} 
			else {
				alert("이용약관에 동의해주세요.");
				return false;
			}
			
			// location.href="${path}/front?key=product&methodName=selectAll";
			// 여기서 결제 방법에 따라서 다시 한번 나눠줘야 한다.
			if(flag == 1) {
				alert("선택하신 통장으로 입금해주세요. 이용해주셔서 감사합니다.");
				location.href="${path}/front?key=order&methodName=cashOne&couponCode="+$("#couponSelect").val()
						+"&productCode="+$("#productCode").val();     
			} else if(flag == 2) {// name, email, phone, address, totalPrice
				var name = $("#name").val();
// 				alert(name);
				
				var email = $("#email").val();
// 				alert(email);
				
				var phone = $("#phone").val();
// 				alert(phone);
				
				var address = $("#address").val();
// 				alert(address);
				
				var totalPrice = $("#totalPrice").val();
// 				alert(totalPrice);
				
				// &name="+name+"&email="+email+"&phone="+phone+"&address="+address+"&totalPrice="+totalPrice;
				location.href="${path}/v_payment/kakao.jsp?name="+name+"&email="+email+"&phone="+phone+"&address="+address+"&totalPrice="+totalPrice;
			}

		}); // 결제하기 끝.
	
		$("#couponSelect").change(function() {
			$.ajax({
				url:"${path}/discountPrice",
				datatype:"json",
				type:"post",
				data:{couponCode:$(this).val()},
				success:function(result) {
// 					alert(result);
// 					$("#discountPrice").text(result);
				
					$.each($.parseJSON(result), function(index, item) {
						if(index == 0) {
							var discountPrice = numberWithCommas(item) + "원";
							$("#discountPrice").text(discountPrice);
						} else if(index == 1) {
							var totalPrice = numberWithCommas(item) + "원";
		 					$("#resultPrice").text(totalPrice);
		 					$("#finalPrice").text(totalPrice);
						}		
					});
	
				},
				error:function(err) {
					alert(err+"쿠폰적용 에러.");
				}
			});
		});
		

	}); // jQuery 끝.

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

</head>
<body>
	<!--================ Header 시작. =================-->
  	<jsp:include page="../header.jsp"/>
    <!--================ 헤더 끝. =================-->
    
    <div id="Tit_NewMembe">
      <h1 style="color: white;">
     	<strong>주문결제</strong>
      </h1>
   	</div>
   	
   	
   	<!-- 주문 리스트, 1개 들어올 때, 다수 들어올 때 -->
	<!--================Cart Area =================-->
    <section class="cart_area">
       
      <!-- 여기서부터 인식한다. -->
      <div class="container">
      
      	<!-- 주문리스트 -->
        <h2><strong>주문리스트</strong></h2>
        
        <hr style="border: solid 1px black;">
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
            	
              <c:forEach items="${productList}" var="productDTO" varStatus="state">
              <thead>
                <tr>
                  <th scope="col">${state.count}.상품</th>
                  <th scope="col">상품명</th>
                  <th scope="col">수량</th>
                  <th scope="col">Total Price</th>
                </tr>
              </thead>
              
              <tbody>
                <tr>
                  <!-- 상품이미지 -->
                  <td>
                    <div class="media">
                      <div class="d-flex">
                      
                      
                      
<!--                         <img id="wish" -->
<%--                           src="${path}/v_img/womanPerfume/${productDTO.productImg}"; --%>
<!--                           alt="" -->
<!--                         /> -->
                        
                        <c:if test="${productDTO.productCategory==1}" >
                      		<img id="wish" src="${path}/v_img/womanPerfume/${productDTO.productImg}" />
                      	</c:if>
                      	
                		<c:if test="${productDTO.productCategory==2}" >
                			<img id="wish" src="${path}/v_img/manPerfume/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==3}" >
                			<img id="wish" src="${path}/v_img/mvPerfume/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==4}" >
                			<img id="wish" src="${path}/v_img/perfumeBottle/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==5}" >
                			<img id="wish" src="${path}/v_img/giftSet/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==6}" >
                			<img id="wish" src="${path}/v_img/bodyCare/${productDTO.productImg}" />
                		</c:if>
                		
                		<c:if test="${productDTO.productCategory==7}" >
                			<img id="wish" src="${path}/v_img/cosmetics/${productDTO.productImg}" />
                		</c:if>
                        
                        
                        <input type="hidden" id="productCode" value="${productDTO.productCode}">
                      </div>
                       </div>
                       </td>
                          
                       <!-- 상품이름 -->
                       <td>
                      <div class="media">
                      <div class="media-body">
                        <p>${productDTO.productName}</p>
                      </div>
                    </div>
                  </td>
                  
                  <!-- 총 수량 -->
                  <td>
                 	${productDTO.cartQty}개
                  </td>
                  
                  <!-- 총가격 -->
                  <td>
                  	<h5><fmt:formatNumber value="${productDTO.totalPrice}" />원</h5>
                  </td>     
                </tr>
                </tbody>                
              </c:forEach>                   
              </tbody>
            </table>  
          </div>
        </div>
        <hr>
        
        <!-- 주문자정보 -->
        <br>
        <h2><strong>주문자정보</strong></h2>
        <hr style="border: solid 1px black;">
      
   <!-- S:입력폼 -->
   <form action="${path}/front?key=member&methodName=memberJoin" id="join" method="post" name="join" onsubmit="return checkValue()">
   <div id="NewMemberwarp">
    <div class="NewMember">
        <!-- 필수입력사항 -->
        <div id="necessary">
            

            <div class="join_mem">
                <div class="join_cont1">

                     	<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <colgroup>
                           <col width="156">
                           <col width="">
                        </colgroup>


                        <tbody>                     
                           <!-- 이름 -->
                           <tr>
                              <th><span class="titR"></span> 이름</th>
                              <td><input type="text" name="name" value="${memberDTO.name}"
                                 class="memtxt" style="width: 338px; ime-mode: active;"
                                  maxlength="20">
                                  
                               <input type="hidden" id="name" name="name" value="${memberDTO.name}">
                               <input type="hidden" id="phone" name="phone" value="${memberDTO.phone}">
                               <input type="hidden" id="address" name="address" value="${memberDTO.addr}">
                               <input type="hidden" id="email" name="email" value="${memberDTO.email}">       
                               <input type="hidden" id="totalPrice" name="totalPrice" value="${applicationScope.totalPrice}">
                               
                               </td>
                           </tr>
                           
                           <!-- 이메일 -->
                           <tr>
                           	   <th><span class="titR"></span> 이메일</th>
                           	   <td><input type="email" class="memtxt" name="email" value="${memberDTO.email}"></td>
               			   </tr>
                                 
                           <!-- 연락처 -->
                           <tr>
                              <th><span class="titR"></span> 연락처</th>
                                  <td><input type="text" name="phone" id="phone" value="${memberDTO.phone}"
                                      class="memtxt" style="width: 338px; ime-mode: active;"
                                      minlength="4" maxlength="20"></td>
                  	       </tr>      
                        </tbody>
                     </table>


                  </div>
            </div>
        </div>



    </div>
</div>

</form>
<!-- E:입력폼 -->
<hr>
      	
     <!-- 배송정보 -->
     <br>
     <h2><strong>배송정보</strong></h2>
     <hr style="border: solid 1px black;"> 	
     
   <!-- S:입력폼 -->
   <form action="${path}/front?key=member&methodName=memberJoin" id="join" method="post" name="join" onsubmit="return checkValue()">
   <div id="NewMemberwarp">
    <div class="NewMember">
        <!-- 필수입력사항 -->
        <div id="necessary">
            

            <div class="join_mem">
                <div class="join_cont1">

                     	<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <colgroup>
                           <col width="156">
                           <col width="">
                        </colgroup>


                        <tbody>                     
                           <!-- 이름 -->
                           <tr>
                              <th><span class="titR"></span> 이름</th>
                              <td><input type="text" name="name" value="${memberDTO.name}"
                                 class="memtxt" style="width: 338px; ime-mode: active;"
                                  maxlength="20"></td>
                           </tr>
                           
                           <!-- 연락처 -->
                           <tr>
                              <th><span class="titR"></span> 연락처</th>
                              <td><input type="text" name="name" value="${memberDTO.phone}"
                                 class="memtxt" style="width: 338px; ime-mode: active;"
                                  maxlength="20"></td>
                           </tr>
							
						   <!-- 배송지 선택 -->
                           <tr>
                           	   <th><span class="titR"></span>기존 배송지</th>                        	        	   
                           	   <td>                        	   
 									${memberDTO.addr}	                  
                           	   </td>
               			   </tr>
					 	   
					<tr>
                    <th><span class="titR"></span> 주소</th>
                    <td><script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<input type="text" class="memtxt" id="sample4_postcode" name="address1" class="mini" placeholder="우편번호" > 
					<input type="text" class="memtxt" id="sample4_roadAddress" name="address2" placeholder="도로명주소">
					<input type="text" class="memtxt" id="sample4_jibunAddress" name="address3" placeholder="지번주소">
					<input type="button" class="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="addr2" class="memtxt" placeholder="상세주소"> <p>
					
					<div class="chbox"><input type="checkbox" class="cbox" id="default_flag" name="default_flag" value="1">
					<label for="default_flag">기본배송지 설정</label>
					</div>
					</td>
                   	</tr>
                                 

                           <!-- 주문메세지 -->
                           <tr>
                              <th><span class="titR"></span> 주문메세지(100자내외)</th>
                                  <td>
                                  <textarea name="content" placeholder="내용"
                                  onfocus="this.placeholder = ''"
								  onblur="this.placeholder = '내용'" required=""
								  style="width: 300px; height: 100px;">
								  </textarea>
                                  </td>
                  	       </tr>
                  	       
                  	       <!-- 무통장 입금자명 -->
                           <tr>
                           	   <th><span class="titR"></span>무통장 입금자명</th>                        	        	   
                           	   <td>                        	   
 									<input type="text" value="">&nbsp;&nbsp;(주문자와 같을경우 생략 가능)       
                           	   </td>
               			   </tr>
                  	             
                        </tbody>
                     </table>
					 
					 

                  </div>
            </div>
        </div>
    </div>
</div>
</form>	

     <hr>
     <!-- 주문상품 할인적용 -->
     <br>
     <h2><strong>주문상품 할인적용</strong></h2>
     <hr style="border: solid 1px black;"> 	
     
     <table class="table">
     <c:forEach items="${productList}" var="productDTO" varStatus="state">
              <thead>
                <tr>
                  <th scope="col">상품금액</th>
                  <th scope="col">배송비</th>
                  <th scope="col">할인금액</th>
                  <th scope="col">추가금액</th>
                  <th scope="col">결제 예정금액</th>
                </tr>
              </thead>
              <tbody>
                <tr>
    
    			  <!-- 상품금액 -->                  
                  <td>
                  <fmt:formatNumber value="${productDTO.totalPrice}"/>원
                  </td>
                  
                  <!-- 배송비 -->
                  <td>
                  	무료
                  </td>
                  
                  <!-- 할인금액 -->
                  <td>
       				 <div id="discountPrice" style="color: blue">
       				 
       				 </div>
                  </td>
                  
                  <!-- 추가금액 -->
                  <td>
                  	0원
                  </td>
                  
                  <!-- 결제 예정금액 -->
                  <td>   	
                  	  <div id="resultPrice" style="color: red;">
                  	  
                  	  </div>
                  </td>
                </tr>
                
                <tr>
                  <td colspan="5">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  쿠폰 사용
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
                
                  <select id="couponSelect" >
                  	<option value="0">선택</option>
                  	<option value="${couponList[0].couponCode}">${couponList[0].couponName}</option>
                  	<option value="${couponList[1].couponCode}">${couponList[1].couponName}</option>
                  </select>
                  
                  <input type="button" value="쿠폰적용" class="main_btn">
                  </td>
                </tr>
                 
                </tbody>                
              </c:forEach>
     		  </table>  
     
     <hr>
     <!-- 결제정보 -->
     <br>
     <h2><strong>결제정보</strong></h2>
     <hr style="border: solid 1px black;"> 	  
     <table class="table">
     	<tr>
     		<td><h6><strong>결제방법</strong></h6></td>
     		<td>
     			<input type="radio" name="cach" id="cash1" value="1">&nbsp;&nbsp;무통장입금
     			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     			<select>
     				<option value="0">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
     				<option value="1">농협은행 302-5068-4227-61(예금주:황재원)</option>
     				<option value="2">국민은행 676901-01-197536(예금쥐황재원)</option>
     			</select>
     			<br>
     			<input type="radio" name="cach" id="cash2" value="2">&nbsp;&nbsp;카카오페이
     			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     			
     		</td>
     	</tr>
     
     </table>
     
     
     <hr>
     <!-- 주문자 동의 -->
     <br>
     <h2><strong>주문자 동의</strong></h2>
     <hr style="border: solid 1px black;">  
     <h6>
     <strong>주문동의</strong>
     <input type="checkbox" value="" id="check" style="margin-left: 100px;">
     <span style="text-decoration: underline;">상기 결제정보를 확인하였으며, 구매진행에 동의합니다.</span> 
     </h6>
     
     
     <hr>
     <!-- 최종금액 -->
     <br>
     <h2><strong>최종금액</strong></h2>
     <hr style="border: solid 1px black;"> 
      
     <h1 style="color: red" id="finalPrice">

	</h1>
     
     <hr>
     <!-- 주문하기, 주문취소버튼 -->
     <div align="center">
     <input type="button" id="order" class="main_btn" value="결제하기">
     <input type="button" id="back" class="main_btn" value="뒤로가기" onclick="history.back(-1);">
     </div> 
    </section>
    <!--================End Cart Area =================-->
   
   
    
    <!-- 장바구니 2번째 시작부분. -->
     
    <!--================ start footer Area  =================-->
  	<jsp:include page="../footer.jsp"/>
  	<!--================ End footer Area  =================-->  
</body>
</html>