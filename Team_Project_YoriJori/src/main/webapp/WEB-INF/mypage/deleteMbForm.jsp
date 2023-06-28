<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file= "./../common/pg_header.jsp" %>

<div class="col-lg-9 ftco-animate fadeInUp ftco-animated" style="margin-top:30px; border-left: 0px !important;">
	<div class="pagetitle" style="margin-left:20px">
		<span>개인정보</span>
		<h2 style="font-weight: bolder;">탈퇴하기</h2>
	</div>
	<div style="margin: 20px;">
		<form action="deleteMb.mp" method="post">
			탈퇴하시려면 비밀번호를 입력하세요<br>
			<input type="password" name="pw">
			<input type="submit" value="제출">
		</form>
	</div>
	</div>
</div>
</div>
   





<%@include file= "./../common/footer.jsp" %>

    