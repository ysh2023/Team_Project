
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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/js/admin/cate_manage.js"></script>

<title>로그인화면</title>

<script>
window.Kakao.init("7e584e270b43673d5f03e41074fc3c4e");

function kakaoLogin(){
    
    window.Kakao.Auth.login({
        scope:'profile_nickname, account_email',
        success: function(authObj){
 
            console.log(authObj);
            window.Kakao.API.request({
                url:'/v2/user/me',
                success: res => {
                    const kakao_account = res.kakao_account;
                    console.log(kakao_account);
                    
                     console.log(res);
                    console.log(res.properties['nickname']);
                     console.log(res.kakao_account['email']);
                      
                      const profileNickname = res.properties['nickname'];
                      const accountEmail = res.kakao_account['email'];
                      const gender = res.kakao_account['gender'];
                      
                      location.href='loginkakao.mb?profileNickname='+profileNickname+'&accountEmail='+accountEmail;
                }
            });
            
        }
    });
}

</script>


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
</style>



</head>

<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<img src="<%=resourcesPath%>/images/logo.png" style="height: 60px;">
				<br>
				<h4 class="mb-3">로그인</h4>
				<form class="validation-form" action="login.mb" method="post"
					novalidate>
						<div class="mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" name="id"  required >
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>

					<div class="mb-3">
						<label for="pw">비밀번호</label> <input type="password" name="password"
							class="form-control" required>
						<div class="invalid-feedback">비밀번호 입력해주세요.</div>
					</div>
					
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">로그인
						</button>
					<button class="btn btn-primary btn-lg btn-block" type="button" onclick="location.href='insert.mb'" >
					회원가입
						</button>
						
						<a href="javascript:kakaoLogin();"></a>
			<img src="https://www.kefe.co.kr/m/image/sub/signup/signup_28.jpg" style="height: 30px; width: auto; margin-top: 10px;" onclick="kakaoLogin();" >					
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<%@include file="./../common/footer.jsp"%>

		</footer>
	</div>
	
</body>

</html>