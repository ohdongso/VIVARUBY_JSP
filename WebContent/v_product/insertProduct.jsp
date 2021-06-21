<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<!-- Required meta tags -->
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
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function() {
// 		alert(1);
	});

</script>
</head>
<body>
  <!--================ Header 시작. =================-->
  <jsp:include page="../header.jsp" />
  <!--================ Header 끝. =================-->
  
		<!-- 분홍색 배너 -->
		<div id="Tit_NewMembe">
      		<h1 style="color: white;">
     			<strong>상품등록</strong>
      		</h1>
    	</div>
    	
   
   <!-- S:입력폼 -->
   <form action="${path}/front?key=product&methodName=insertProduct" method="post" enctype="multipart/form-data">
   <div id="NewMemberwarp">
    <div class="NewMember">
        <!-- 필수입력사항 -->
        <div id="necessary">
        <h1><strong>상품등록</strong></h1>    

            <div class="join_mem">
                <div class="join_cont1">

                     	<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <colgroup>
                           <col width="156">
                           <col width="">
                        </colgroup>


                        <tbody>                     
                           <!-- 상품이름 -->
                           <tr>
                              <th><span class="titR"></span>상품명</th>
                              <td>
                              <input type="text" name="productName"
							  class="memtxt" style="width: 338px; ime-mode: active;"
                              maxlength="20"></td>
                           </tr>
                           
                           <!-- 상품가격 -->
                           <tr>
                              <th><span class="titR"></span>상품가격</th>
                              <td>
                              <input type="text" name="productPrice"
							  class="memtxt" style="width: 338px; ime-mode: active;"
                              maxlength="20"></td>
                           </tr>
                           
                           <!-- 성별구분 -->
                           <tr>
                              <th><span class="titR"></span>상품성별</th>
                              <td>
                              		<select name="productGender" >
										<option value="1">여성</option>
										<option value="2">남성</option>
									</select>            
                              </td>
                           </tr>
							
						   <!-- 상품카테고리 -->
                           <tr>
                           	   <th><span class="titR"></span>상품 카테고리</th>                        	        	   
                           	   <td>                        	   
 									<select name="productCategory" >
										<option value="1">여성향수</option>
										<option value="2">남성향수</option>
										<option value="3">남녀공용</option>
										<option value="4">향수공병</option>
										<option value="5">선물세트</option>
										<option value="6">바디케어</option>
										<option value="7">화장품</option>
									</select>             
                           	   </td>
               			   </tr>
					 	   
			      		   <!-- 재고량 -->
                           <tr>
                              <th><span class="titR"></span>재고량</th>
                              <td>
                  				<input type="text" name="productStock"
							  	class="memtxt" style="width: 338px; ime-mode: active;"
                              	maxlength="20">          
                              </td>
                           </tr>
                                   
						   <!-- 용량 -->
                           <tr>
                              <th><span class="titR"></span>용량</th>
                              <td>
                  				<input type="text" name="productCapacity"
							  	class="memtxt" style="width: 338px; ime-mode: active;"
                              	maxlength="20">          
                              </td>
                           </tr>
							
                           <!-- 제품내용 -->
                           <tr>
                              <th><span class="titR"></span>제품내용</th>
                                  <td>
                                  <textarea name="productContent" placeholder="내용"
                                  onfocus="this.placeholder = ''"
								  onblur="this.placeholder = '내용'" required=""
								  style="width: 300px; height: 100px;">
								  </textarea>
                                  </td>
                  	       </tr>
                  	       
                  	       <!-- 이미지 -->
    					   <tr>
                              <th><span class="titR"></span>상품이미지</th>
                              <td>
                  				<input type="file" name="productImg" maxlength="60" size="40">          
                              </td>
                           </tr>             
                        </tbody>
                     </table>
					 
                  </div>      
            </div>
            
            <div class="btn_join">
            <input type="submit" value="상품등록" class="button" class="submit">
            <input type="reset" value="취소" class="button" class="cancel">
            </div> 
            
        </div>
    </div>
</div>
</form>	  		
  		
  		
  		
  
  
  
  <!--================ start footer Area  =================-->
  <jsp:include page="../footer.jsp"/>
  <!--================ End footer Area  =================-->
</body>
</html>