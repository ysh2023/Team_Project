<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인</title>
</head>
<script>
	// 게시글 추천 기능
	function recommendClick(bodNum){
		if (`${loginInfo.id}` == '') {
			if (confirm('로그인 후 추천 가능합니다\n로그인 하시겠습니까?')) {
				location.href = 'login.mb';
				return;
			}else{
				return;
			}
		}
		$.ajax({
			url : 'recommend.board',
			data:({
				bodNum : bodNum
			}),
			success: function(data){
				if($.trim(data)=='1'){
					$('#recommend'+bodNum).attr('src',`<%=resourcesPath%>`+'/images/mainrecommend1.png');
			}else if($.trim(data)=='0'){
				$('#recommend'+bodNum).attr('src',`<%=resourcesPath%>`+'/images/mainrecommend2.png');					
				}else{
					alert('추천 에러');
				}
			},
			error: function(){
				alert('추천 에러');
			}
		}); 
	}
</script>
<body>



	<!-- 게시글 카테고리 영역 -->
	<section class="ftco-section  ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row justify-content-center" id="categorys">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category">
						<c:forEach items="${ingreList}" var="ingredient">
							<li>
								<input type="checkbox" value="${ingredient }">${ingredient }
							</li>
						</c:forEach>

					</ul>
				</div>
			</div>
		</div>
	</section>

	<!--  게시글 영역  -->
	<section class="ftco-section  ftco-no-pt">
		<div class="container">
			<div class="row">



				<c:forEach items="${boardList }" var="board" varStatus="status">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="boardDetail.board?bodNum=${board.bodNum}" class="img-prod" style="justify-content: center; align-items: center; display: flex;">
								<img class="img-thumbnail" src="<%=resourcesPath%>/images/${board.bodImage==null ? 'noimage.png' : board.bodImage}" alt="Colorlib Template" style="height: 250px; width: 100%; object-fit: cover;">

							</a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3 style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									<a href="boardDetail.board?bodNum=${board.bodNum}">${board.title }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
										<p class="price">${board.servings}인분</p>
										<span class="mr-2 price-dc">${board.tags }</span>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<!-- 추천 -->
										<span class="heart d-flex justify-content-center align-items-center "> <span><img alt="추천" id="recommend${board.bodNum }" align="right" width="40" height="40" src="<%=resourcesPath%>/images/${board.rec==null? 'mainrecommend2.png' : 'mainrecommend1.png' }" style="cursor: pointer;" onclick="recommendClick(${board.bodNum })"></span>
										</span>

									</div>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>

				<!--  -->

			</div>
		</div>
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>${pageInfo.pagingHtml}
					</ul>
				</div>
			</div>
		</div>
	</section>

</body>
<%@include file="../common/footer.jsp"%>
<a target="_blank" href="https://icons8.com/icon/2744/%EC%97%84%EC%A7%80-%EC%B2%99">추천</a>
icon by
<a target="_blank" href="https://icons8.com">Icons8</a>
<br>
<a target="_blank" href="https://icons8.com/icon/10271/%EC%97%84%EC%A7%80-%EC%B2%99">엄지 척</a>
icon by
<a target="_blank" href="https://icons8.com">Icons8</a>
</html>