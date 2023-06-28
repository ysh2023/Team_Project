<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/pg_header.jsp" %>

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
	margin-top: 10px;
	padding: 20px;
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

<div class="col-lg-9 ftco-animate fadeInUp ftco-animated" style="margin-top:30px; border-left: 0px !important;">
	<div class="pagetitle" style="margin-left:20px">
		<span>개인정보</span>
		<h2 style="font-weight: bolder;">개인정보 수정하기</h2>
	</div>
			<div class="input-form col-md-12 mx-auto" style="margin-left:20px !important; margin-bottom: 50px;">
				<form class="validation-form" action="updateMb.mp" method="post"
					novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" name="id"  readonly="readonly"
								value="${mb.id}"
								required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="mname">이름</label> <input type="text"
								class="form-control" name="mname" value="${mb.mname}" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="pw">비밀번호</label> <input type="password" name="pw"
							class="form-control" value="${mb.pw}" required>
						<div class="invalid-feedback">비밀번호 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="tel">전화번호</label> <input type="tel"
							class="form-control" name="tel" placeholder="01012341234" value="${mb.tel}"
							required>
						<div class="invalid-feedback">전화번호를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email" placeholder="you@example.com"
							value="${mb.email}" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="age">나이</label> <input type="text"
							class="form-control" name="age" placeholder="24" value="${mb.age}" required>
						<div class="invalid-feedback">나이를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="area1">우편번호</label> <input type="text"
							class="form-control" id="area1" name="area1" value="${mb.area1}"  required > 
									 <br>
							 <input type="button" value="우편번호찾기"  onclick="kakaopost()">
					
						<div class="invalid-feedback">우편번호를 입력해주세요.</div>
						
					</div>

					<div class="mb-3">
						<label for="area2">상세주소<span class="text-muted"></span></label> <input
							type="text" class="form-control" required name="area2" id="area2" value="${mb.area2}"
							placeholder="상세주소를 입력해주세요.">
						<div class="invalid-feedback">상세주소를 입력해주세요.</div>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">수정 완료</button>
				</form>
			</div>
		</div>
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
  
     

<%@include file= "./../common/footer.jsp" %>
