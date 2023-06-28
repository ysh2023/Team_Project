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
				<%session.setAttribute("destination", "redirect:/main.board");%>
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


	<!-- 	style="position: fixed; bottom: 50px; right: 20px; z-index: 999;" -->
	<div class="container pt-2" align="right">
		<a class="btn btn-primary" href="write.board" class="active">글작성</a>
	</div>
	<!-- <div class="container pt-2" align="right">
	<form action="refRecommend.board" method="post">
		<input name="ingredient"  type="text">
		<input name="ingredient"  type="text">
		<input  type="submit" value="냉장고 검색">
	</form> 
		
	</div> -->

	<section class="py-5 testimony-section">
		<div class="container">


			<!-- 주간 인기 게시글 5개정도 -->
			<div class="row ftco-animate">
				<div class="col-md-12">
						<h3 class="px-4">인기 추천 게시글</h3>
				</div>
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel">
						<c:forEach items="${topBoards }" var="topBoard" varStatus="status">
							<div class="item" data-bs-interval="100" onclick="location.href='boardDetail.board?bodNum=${topBoard.bodNum}'" style="cursor: pointer;">
								<div class="testimony-wrap p-4 ">
									<div>${status.index+1 }위</div>
									<img class="img-thumbnail" src="<%=resourcesPath%>/images/${topBoard.bodImage==null ? 'noimage.png' : topBoard.bodImage}" alt="인기순위 이미지" style="height: 250px; width: 100%;">

									<%-- <div class="" style="background-image: url(<%=resourcesPath%>/images/${topBoard.bodImage==null ? 'noimage.png' : topBoard.bodImage}); background-size:cover; height:150px;width:100%;"></div> --%>
									<div class="text text-center">
										<p class=" pl-4 line" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
											<font size="4">${topBoard.title }</font><br>${topBoard.servings}인분 <br> <span class="position">${topBoard.tags == null ? '<br>' :  topBoard.tags}</span>
										<p>
									</div>
								</div>
							</div>
						</c:forEach>



					</div>
				</div>
			</div>

			<!-- 슬라이드 예비 -->
			<%-- <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="<%=resourcesPath%>/images/product-2.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>First slide label</h5>
							<p>Some representative placeholder content for the first slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="<%=resourcesPath%>/images/product-1.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Second slide label</h5>
							<p>Some representative placeholder content for the second slide.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="<%=resourcesPath%>/images/product-3.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Third slide label</h5>
							<p>Some representative placeholder content for the third slide.</p>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div> --%>
		</div>
	</section>


	<!-- 게시글 카테고리 영역 -->
	<section class="ftco-section  ftco-no-pt ftco-no-pb" id="category">
		<div class="container">
			<div class="row justify-content-center" id="categorys">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category">
						<c:forEach items="${foodCategorys}" var="category">
							<li><a href="main.board?whatColumn=foodCategory&keyword=${category }#category" ${selectCategory == category ? 'class="active"':"" }>${category }</a></li>
						</c:forEach>

					</ul>
					<ul class="product-category">
						<c:forEach items="${ingredientCategorys}" var="category">
							<li><a href="main.board?whatColumn=ingredientCategory&keyword=${category =='그외 식재료' ? 'other' : category }#category" ${selectCategory == category ? 'class="active"':"" }>${category }</a></li>
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

				<!-- 게시글 -->
				<c:forEach items="${boardList }" var="board" varStatus="status">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="boardDetail.board?bodNum=${board.bodNum}" class="img-prod" style="justify-content: center; align-items: center; display: flex;"> <img class="img-thumbnail" src="<%=resourcesPath%>/images/${board.bodImage==null ? 'noimage.png' : board.bodImage}" alt="Colorlib Template" style="height: 250px; width: 100%; object-fit: cover;">

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

</html>