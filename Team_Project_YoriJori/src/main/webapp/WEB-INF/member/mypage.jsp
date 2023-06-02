<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/header.jsp" %>
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
 <strong><li>주문</li></strong> 
   <li><a href="#">주문목록</a></li>
   
   
 	<strong>  <li>개인정보</li></strong> 
 	<li><a href="#">수정하기</a></li>
 	<li><a href="#">탈퇴하기</a></li>
</ul>

<div style="margin-left:25%;padding:1px 16px;height:1000px;">
<h1>마이페이지!</h1>
</div>
</body>
</html>


 