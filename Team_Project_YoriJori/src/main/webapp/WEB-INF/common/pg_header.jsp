<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>
<style>

#nav1 {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  height:1000px;
  background-color: #f1f1f1;
  display: block;
  text-align: center;
}

#nav1 a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}
#nav1 li a.active {
  background-color: #555;
  color: white;
  
}

#nav1 li a:hover:not(.active) {
  background-color: #555;
 }
 
 #main{
 
 margin-left:40%;
 margin-top:-980px;
 }

</style>
</head>
<aside id="sidebar" class="sidebar">
<ul id="nav1">
 	
 	 <strong><li style="font-size: 30px">주문</li></strong> 
   	<li><a href="#">주문목록</a></li>
   	<li><a href="#">보유쿠폰</a></li>
   	
   	 <strong><li style="font-size: 30px">게시물</li></strong> 
   	<li><a href="#">내가 쓴 게시물</a></li>
   	<li><a href="#">내가 쓴 댓글</a></li>
   	
   	<strong><li style="font-size: 30px">찜</li></strong> 
   	<li><a href="listDibs.mp">찜한 상품</a></li>
   	  
      
 	<strong>  <li style="font-size: 30px">개인정보</li></strong> 
 	<li><a href="updateMb.mp">수정하기</a></li>
 	<li><a href="deleteMb.mp">탈퇴하기</a></li>
   	
   
</ul>
</aside>

