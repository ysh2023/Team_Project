<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file= "./../common/pg_header.jsp" %>
<main id="main" class="main" >

<form action="deleteMb.mp" method="post">
비밀번호를 입력하세요

<input type="password" name="pw">
<input type="submit" value="제출">

</form>
   
<div style="margin-top: 1000px; margin-left: -800px;">
<%@include file= "./../common/footer.jsp" %>
</div> 


</main>

    