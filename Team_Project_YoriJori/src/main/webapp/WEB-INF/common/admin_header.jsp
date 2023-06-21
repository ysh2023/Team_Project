<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- common -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String conPath = request.getContextPath();
%>
<%
String resourcesPath = request.getContextPath() + "/resources";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin 야금야금</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=resourcesPath%>/images/simpleLogo.png"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/resources/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<%=resourcesPath%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=resourcesPath%>/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="<%=resourcesPath%>/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="<%=resourcesPath%>/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="<%=resourcesPath%>/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="<%=resourcesPath%>/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="<%=resourcesPath%>/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<%=resourcesPath%>/css/style_am.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Mar 09 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<!-- Logo -->
		<div class="d-flex align-items-center justify-content-between">
			<a href="main.am" class="logo d-flex align-items-center">
				<img src="<%=resourcesPath%>/images/simpleLogo.png" alt="" style="margin-right:10px;">
				<span class="d-none d-lg-block">Admin 야금야금</span>
			</a>
			<i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<!-- Search Bar -->
		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->
		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<!-- Search Icon-->
				<li class="nav-item d-block d-lg-none">
					<a class="nav-link nav-icon search-bar-toggle " href="#"><i class="bi bi-search"></i></a>
				</li>
				<!-- End Search Icon-->
				
				<!-- Profile Nav -->
				<li class="nav-item dropdown pe-3">
					 <!-- Profile Imag -->
					<a	class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
						<img src="<%=resourcesPath%>/img/profile-img.jpg" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">관리자</span>
					</a>
					<!-- Profile Dropdown -->
					<ul	class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">

						<li>
							<a class="dropdown-item d-flex align-items-center" href="logout.mb">
								<i class="bi bi-box-arrow-right"></i> <span>SignOut</span>
							</a>
						</li>
					</ul>
					<!-- End Profile Dropdown Items -->
				</li>
				<!-- End Profile Nav -->
			</ul>
		</nav>
		<!-- End Icons Navigation -->
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-heading">Home</li>
			<!-- 메인 화면 -->
			<li class="nav-item"><a class="nav-link collapsed" href="main.am">
				<i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- 회원 관리 -->
         	<li class="nav-item">
            	<a class="nav-link collapsed" data-bs-target="#member-nav" data-bs-toggle="collapse" href="#">
               		<i class="bi bi-person-fill"></i><span>회원 관리</span>
               		<i class="bi bi-chevron-down ms-auto"></i>
            	</a>
            	<ul id="member-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
               		<li><a   href="mbList.am">
                  		<i class="bi bi-circle"></i><span>회원 목록</span>
               		</a></li>
               		<li><a href="mbReportList.am">
               			<i class="bi bi-circle"></i><span>회원 신고 내역</span>
					</a></li>
					 <li><a href="mbStopList.am"> <i class="bi bi-circle"></i><span>정지 회원 목록</span>
					</a></li>
            	</ul>
         	</li>
			<li class="nav-heading">야금야금</li>
			<!-- 식재료 -->
			<li class="nav-item"><a class="nav-link collapsed" href="ingList.am">
				<i class="bi bi-egg"></i> <span>식재료 관리</span>
			</a></li>
			<!-- 게시판 관리 -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#tables-nav" href="userBoard.am">
					<i class="bi bi-layout-text-sidebar-reverse"></i><span>사용자 게시글 관리</span>
				</a>

			</li>
			
			<li class="nav-heading">식재료 쇼핑몰</li>
			<!-- 상품 관리 -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#product-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-cart4"></i><span>상품 관리</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="product-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
					<li><a href="prdList.am">
						<i class="bi bi-circle"></i><span>상품 목록</span>
					</a></li>
					<li><a href="insertPrd.am">
						<i class="bi bi-circle"></i><span>상품 추가</span>
					</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#order-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-cart4"></i><span>주문 관리</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="order-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
					<li><a href="orderlist.am">
						<i class="bi bi-circle"></i><span>주문 목록</span>
					</a></li>
					<li><a href="ordercancel.am">
						<i class="bi bi-circle"></i><span>환불 목록</span>
					</a></li>
				</ul>
			</li>
<!-- 			<li class="nav-item">
		         <a class="nav-link collapsed" href="orderlist.am">
		             <i class="bi bi-cart4"></i> <span>주문 관리</span>
		         </a>
       		</li> -->
			<li class="nav-heading">Pages</li>
			<li class="nav-item"><a class="nav-link collapsed" href="/ex">
				<i class="ri ri-game-fill"></i> <span>야금야금 페이지</span>
			</a></li>
		</ul>
	</aside>