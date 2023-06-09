<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String conPath = request.getContextPath(); %>
<% String resourcesPath = request.getContextPath() + "/resources"; %>

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
  
  <style>
  #footer{
  background-color: #FFFFCC;
  }
  
 table{
 width: 400px;
 height: 230px;
 
 }
  
  </style>
 
  
  <center>
   <img src="<%=resourcesPath%>/images/logo.png" style="height: 60px;">

   <form action="login.mb" method="post">

	<table border="1" height="150px">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id">
			</td>
		</tr>
		<tr>
			<td>비번</td>
			<td>
				<input type="text" name="password">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='insert.mb'">
			</td>
		</tr>
	</table>   
   </form>
    </center>
    
    <br>  <br>  <br>  <br>  <br>  <br>
    <hr>
    
      <br>
    
   <div id="footer">
   <%@include file= "./../common/footer.jsp" %>
   </div>