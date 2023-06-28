
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String conPath = request.getContextPath();
%>
<%
String resourcesPath = request.getContextPath() + "/resources";
%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#area1").value = data.zonecode;
           document.querySelector("#area2").value =  data.address
        }
    }).open();
}
</script>

<title>회원가입</title>


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />

<!-- BootStrap -->
<link rel="stylesheet"
	href="<%=resourcesPath%>/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="<%=resourcesPath%>/css/animate.css">
<link rel="stylesheet"
	href="<%=resourcesPath%>/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=resourcesPath%>/css/owl.theme.default.min.css">
<link rel="stylesheet" href="<%=resourcesPath%>/css/magnific-popup.css">
<link rel="stylesheet" href="<%=resourcesPath%>/css/aos.css">
<link rel="stylesheet" href="<%=resourcesPath%>/css/ionicons.min.css">
<link rel="stylesheet"
	href="<%=resourcesPath%>/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="<%=resourcesPath%>/css/jquery.timepicker.css">
<link rel="stylesheet" href="<%=resourcesPath%>/css/flaticon.css">
<link rel="stylesheet" href="<%=resourcesPath%>/css/icomoon.css">
<link rel="stylesheet" href="<%=resourcesPath%>/css/style.css">
</head>
<style>
.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#email1 {
	width: 70px;
	height: 40px;
}
</style>



</head>

<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<img src="<%=resourcesPath%>/images/logo.png" style="height: 60px;">
				<br>
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" action="insert.mb" method="post"
					novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" name="id" value="${mb.id}"  maxlength="6" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="mname">이름</label> <input type="text"
								class="form-control" name="mname" value="${mb.mname}"   maxlength="6" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="pw">비밀번호</label> <input type="password" name="pw"
							class="form-control" required   maxlength="10">
						<div class="invalid-feedback">비밀번호 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="tel">전화번호</label> <input type="number"
							class="form-control" name="tel" placeholder="01012341234"
							    required>
						<div class="invalid-feedback">전화번호를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email" placeholder="you@example.com"
							required   >
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="age">나이</label> <input type="number"
							class="form-control" name="age" placeholder="24" required>
						<div class="invalid-feedback">나이를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="area1">우편번호</label> <input type="text"
							class="form-control" id="area1" name="area1" required   maxlength=10"> 
									 <br>
							 <input type="button" value="우편번호찾기"  onclick="kakaopost()">
					
						<div class="invalid-feedback">우편번호를 입력해주세요.</div>
						
					</div>

					<div class="mb-3">
						<label for="area2">상세주소<span class="text-muted"></span></label> <input
							type="text" class="form-control" required name="area2" id="area2"  maxlength=10"
							placeholder="상세주소를 입력해주세요.">
						<div class="invalid-feedback">상세주소를 입력해주세요.</div>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<%@include file="./../common/footer.jsp"%>

		</footer>
	</div>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>

</html>