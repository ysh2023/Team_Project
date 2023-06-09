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
						
						<a class="navbar-brand" href="<%=conPath%>/main.jsp"> <img
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
							안녕하세요! </a> <a href="mypage.mb"
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
						<li class="nav-item active"><a href="index.html"
							class="nav-link">Home</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">장보기</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="shop.prd">전체보기</a> <a
									class="dropdown-item" href="shop.prd?whatColumn=se&keyword=채소">채소</a>
								<a class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=과일">과일</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=쌀/견과">쌀/견과</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=정육/계란류">정육/계란류</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=우유/유제품">우유/유제품</a> <a
									class="dropdown-item"
									href="shop.prd?whatColumn=se&keyword=양념/오일">양념/오일</a>
							</div></li>
						<li class="nav-item"><a href="list.re" class="nav-link">레시피</a></li>
						<li class="nav-item"><a href="blog.html" class="nav-link">방구석
								쉐프</a></li>
					</ul>
					<!-- right nav -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a href="list.ref" class="nav-link">
								<img src="<%=resourcesPath%>/images/btn_circle.png"
								style="width: 18px; margin-right: 5px; margin-bottom: 2px;">
								나의 냉장고
						</a></li>
						<li class="nav-item"><a href="bookmark.re" class="nav-link">
								<img src="<%=resourcesPath%>/images/btn_circle.png"
								style="width: 18px; margin-right: 5px; margin-bottom: 2px;">
								북마크 레시피
						</a></li>
						<li class="nav-item cta cta-colored"><a href="cart.html"
							class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
    <!-- END header -->
    
    
		      
	