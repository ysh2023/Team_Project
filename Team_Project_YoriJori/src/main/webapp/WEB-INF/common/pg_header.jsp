<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#nav1 {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
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
  col

</style>
</head>
<body>

<ul id="nav1">
 	
 	 <strong><li style="font-size: 30px">주문</li></strong> 
   	<li><a href="orderlist.mb">주문목록</a></li>
   	<li><a href="#">보유쿠폰</a></li>
   	
   	 <strong><li style="font-size: 30px">게시물</li></strong> 
   	<li><a href="#">내가 쓴 게시물</a></li>
   	<li><a href="#">내가 쓴 댓글</a></li>
   	  
      
 	<strong>  <li style="font-size: 30px">개인정보</li></strong> 
 	<li><a href="updateMv.mb">수정하기</a></li>
 	<li><a href="#">탈퇴하기</a></li>
   	
   
</ul>
</html>
