<%@page import="member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- common -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String conPath = request.getContextPath(); %>
<% String resourcesPath = request.getContextPath() + "/resources"; %>


<!-- header.jsp -->
<!DOCTYPE html>
<html>
  <head>
    <title>야금야금</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
	
	<!-- BootStrap -->
    <link rel="stylesheet" href="<%=resourcesPath%>/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/animate.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/aos.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/jquery.timepicker.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/flaticon.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/icomoon.css">
    <link rel="stylesheet" href="<%=resourcesPath%>/css/style.css">
    
    <!-- 아임포트 api 설정 -->
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
      type="text/javascript"
      src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
   <script type="text/javascript" src="<%=resourcesPath%>/resources/js/jquery.js"></script>
   <script>
      var IMP = window.IMP;
      IMP.init("imp78600063");
 
      var today = new Date();   
      var hours = today.getHours(); // 시
      var minutes = today.getMinutes();  // 분
      var seconds = today.getSeconds();  // 초
      var milliseconds = today.getMilliseconds();
      var makeMerchantUid = hours +  minutes + seconds + milliseconds;
      
      $(document).ready(function(){
  		
  		$('#requestPay').click(function(){
  			if($('input[name=name]').val() == ""){
  				alert("아이디를 입력해주세요.");
  				$('input[name=name]').focus();
  				return false;
  			}
  			if($('input[name=ordzipcode]').val() == ""){
  				alert("우편번호를 입력해주세요.");
  				$('input[name=ordzipcode]').focus();
  				return false;
  			}
  			if($('input[name=ordaddr]').val() == ""){
  				alert("주소를 입력해주세요.");
  				$('input[name=ordaddr]').focus();
  				return false;
  			}
  			if($('input[name=ordtel]').val() == ""){
  				alert("전화번호를 입력해주세요.");
  				$('input[name=ordtel]').focus();
  				return false;
  			}
  			if($('input[name=ordemail]').val() == ""){
  				alert("이메일을 입력해주세요.");
  				$('input[name=ordemail]').focus();
  				return false;
  			}
  		    IMP.request_pay({
  		    	pg : 'html5_inicis',
                pay_method: "card",
                merchant_uid: "IMP"+makeMerchantUid, // 결제 고유 번호
                name: '${ordpdname}', //상품명
                amount: ${totalAmount}, //상품가격
                buyer_email: document.getElementById('ordemail').value,
                buyer_name: document.getElementById('ordname').value,
                buyer_tel: document.getElementById('ordtel').value,
                buyer_addr: document.getElementById('ordaddr').value,
                buyer_postcode: document.getElementById('ordzipcode').value 
  			    }, function (rsp) { // callback
  			    	 if (rsp.success) {// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
               		  var msg = '결제가 완료되었습니다.';
               	        msg += '주문 번호 : ' + rsp.merchant_uid;
               	        msg += '상품 이름 : ' + rsp.name;
               	        msg += '결제 금액 : ' + rsp.paid_amount;
               	        msg += '구매자 이메일 : ' + rsp.buyer_email;
               	        msg += '구매자 이름 : ' + rsp.buyer_name;
               	        msg += '구매자 번호 : ' + rsp.buyer_tel;
               	        msg += '구매자 주소 : ' + rsp.buyer_addr;
               	        msg += '구매자 우편번호 : ' + rsp.buyer_postcode;
               	        alert(msg);
                           location.href="orderinsert.ord?merchant_uid="+rsp.merchant_uid+"&name="+rsp.name+"&amount="+rsp.paid_amount+"&buyer_email="+rsp.buyer_email+
                           		"&buyer_name="+rsp.buyer_name+"&buyer_tel="+rsp.buyer_tel+"&buyer_addr="+rsp.buyer_addr+"&buyer_postcode="+rsp.buyer_postcode;
                     } else {
                   	  var msg = '결제에 실패하였습니다.';
                         msg += '에러내용 : ' + rsp.error_msg;
                         alert(msg);
                     }
  			    });//request pay
  			    
  		});
  		
  	});
    </script>
    <!-- 아임포트 api 설정 끝-->
    
  </head>
  
<script type="text/javascript" src="<%=resourcesPath%>/js/jquery.js"></script>
<script type="text/javascript">
	function toggle(element){
		console.log(element.checked);
		if(element.checked){
			document.search.action="main.board";
		}else{
			document.search.action="list.re";
		}
	}
	$(document).ready(function(){ 
		//alert(1);
	});
</script>
  <body class="goto-here">
  	<!-- header -->
	<header>
		<!-- top -->
		<nav id="ftco-navbar">
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col">
						<!-- 메인 로고 -->
						
						<a class="navbar-brand" href="/ex"> <img
							src="<%=resourcesPath%>/images/logo.png" style="height: 60px;">
						</a>
						<!-- login -->
						<% if(session.getAttribute("loginInfo") == null)
						{//로그인이 안된 상태라면?
							%>
						<a href="login.mb"
							style="font-size: 11px; height: 12px; margin-top: 20px; float: right;">
							<img src="<%=resourcesPath%>/images/btn_login.png"
							style="height: 33px;"> 로그인
						</a>
						<a href="insert.mb"
							style="font-size: 11px; height: 12px; margin-top: 20px; margin-right: 15px; float: right;">
							<img src="<%=resourcesPath%>/images/btn_register.png"
							style="height: 33px;"> 회원가입
						</a>

						<%
						} else {
						%>
						<a href="#"
							style="font-size: 11px; height: 12px; margin-top: 20px;">${loginInfo.mname}님
							안녕하세요! </a> <a href="orderlist.mp"
							style="font-size: 11px; height: 12px; margin-top: 20px; float: right;">
							<img src="<%=resourcesPath%>/images/mypage.png"
							style="height: 33px;"> 마이페이지
						</a> <a href="logout.mb"
							style="font-size: 11px; height: 12px; margin-top: 20px; margin-right: 15px; float: right;">
							<img src="<%=resourcesPath%>/images/btn_logout.png"
							style="height: 33px;"> 로그아웃
						</a>

						<%
						}
						%>


					</div>
					<!-- search form  -->
					<div class="col-md-auto">
						<form action="list.re" class="search-form" name="search">
							<input type="hidden" value="recipename" name="whatColumn">
							<div class="custom-control custom-switch">
		  					<input type="checkbox" class="custom-control-input" id="customSwitch1" onclick="toggle(this)">
		  					<label class="custom-control-label" for="customSwitch1"><span id="switchMessage">스위치 체크시 방구석쉐프 검색</span></label>
							</div>
							<div class="input-group mb-3">
  							 <input type="search" class="form-control" placeholder="요리명 검색" aria-label="Example text with two button addons" name="keyword">
							 </div>
						</form>
					</div>
				</div>
			</div>
		</nav>
		<!-- navigation -->
		<nav
			class="bg-primary navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light"
			id="ftco-navbar" style="height: 50px">
			<div class="container">
				<div class="collapse navbar-collapse" id="ftco-nav">
					<!-- left nav -->
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a href="/ex"
							class="nav-link">Home</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="shop.prd?whatColumn=no&searchName=${searchName}" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">장보기</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="shop.prd?whatColumn=no">전체보기</a> <a
									class="dropdown-item" href="shop.prd?whatColumn=se&keyword=채소&searchName=${searchName}">채소</a>
								<a class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=과일&searchName=${searchName}">과일</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=쌀/견과&searchName=${searchName}">쌀/견과</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=정육/계란류&searchName=${searchName}">정육/계란류</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=우유/유제품&searchName=${searchName}">우유/유제품</a> 
									<a class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=수산물/건해산&searchName=${searchName}">수산물/건해산</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=양념/오일&searchName=${searchName}">양념/오일</a>
							</div></li>
						<li class="nav-item"><a href="list.re" class="nav-link">레시피</a></li>
						<li class="nav-item"><a href="main.board" class="nav-link">방구석
								쉐프</a></li>
					<% 	
					
					if((MemberBean)session.getAttribute("loginInfo")!=null) {
					    String id=((MemberBean)session.getAttribute("loginInfo")).getId();
						if(id.equals("admin")){%>
						<li class="nav-item"><a href="main.am" class="nav-link">관리자페이지</a></li>
						<%
						}
					}
						%>
					</ul>
					<!-- right nav -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a href="page.ref" class="nav-link">
								<img src="<%=resourcesPath%>/images/btn_circle.png"
								style="width: 18px; margin-right: 5px; margin-bottom: 2px;">
								나의 냉장고
						</a></li>
						<li class="nav-item"><a href="bookmark.re" class="nav-link">
								<img src="<%=resourcesPath%>/images/btn_circle.png"
								style="width: 18px; margin-right: 5px; margin-bottom: 2px;">
								북마크 레시피
						</a></li>
						<li class="nav-item cta cta-colored"><a href="list.bsk"
							class="nav-link"><span class="icon-shopping_cart" style="color:#F2BC1B;">[0]</span></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
    <!-- END header -->
    
    
		      
	