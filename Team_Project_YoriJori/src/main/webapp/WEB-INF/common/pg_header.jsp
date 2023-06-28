<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/header.jsp"%> 



<link
	href="<%=resourcesPath%>/vendor/simple-datatables/style.css"
	rel="stylesheet">
<script type="text/javascript" src="<%=resourcesPath%>/vendor/simple-datatables/simple-datatables.js"></script>

<div class="row">
	<div class="col-lg-2 sidebar ftco-animate fadeInUp ftco-animated" style="border-left: 0px !important; border: 2px solid gray !important; margin: 20px; margin-left: 40px; min-width: 242px; max-width: 242px;">
		 <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
		   <div style="margin-bottom: 20px;">
            <img src="<%=resourcesPath%>/images/mypage.png" style="height: 20px; margin-bottom: 10px; margin-right: 5px;">
            <h3 class="heading" style="display:inline !important; margin-bottom:0px !important;"><b>마이페이지</b></h3>
           </div>
            <ul class="categories">
              <li>
              	<b style="color: black;">상품</b><br>
              	<a href="orderlist.mp"><i class="icon-receipt"></i>&nbsp; 주문 목록</a>
              	<a href="listDibs.mp"><i class="icon-heart"></i>&nbsp; 찜한 상품</a>
              </li>
              <li>
              	<b style="color: black;">게시물</b><br>
              	<a href="myBoard.mp"><i class="icon-pencil"></i>&nbsp; 내가 쓴 게시물</a>
              	<a href="myComment.mp"><i class="icon-pencil"></i>&nbsp; 내가 쓴 댓글</a>
              	<a href="myRecommend.mp"><i class="icon-thumbs-up"></i>&nbsp; 내가 추천한 글</a>
              </li>
              <li>
              	<b style="color: black;">개인정보</b><br>
              	<a href="updateMb.mp">수정하기</a>
              	<a href="deleteMb.mp">탈퇴하기</a>
              </li>
            </ul>
         </div>
	</div>

