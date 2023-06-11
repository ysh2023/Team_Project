<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인</title>
</head>
<body>


	<!-- 	style="position: fixed; bottom: 50px; right: 20px; z-index: 999;" -->
	<div class="container pt-2" align="right">
		<a class="btn btn-primary" href="write.board" class="active">게시글
			작성</a>
	</div>

	<section class="py-5 testimony-section">
		<div class="container">
			<!-- <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading">Testimony</span>
            <h2 class="mb-4">Our satisfied customer says</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
          </div>
        </div> -->


			<!-- 주간 인기 게시글 5개정도 -->
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel">
						<c:forEach items="${topBoards }" var="topBoard" varStatus="status">
							<div class="item"
								onclick="location.href='boardDetail.board?bodNum=${topBoard.bodNum}'"
								style="cursor: pointer; border: 1px solid gray; border-radius: 20px;">
								<div class="testimony-wrap p-4 ">
									<div>${status.index+1 }위</div>
									<img
										src="<%=resourcesPath%>/images/${topBoard.bodImage==null ? 'noimage.png' : topBoard.bodImage}"
										alt="인기순위 이미지" style="height: 250px; width: 100%;">
									<%-- 									<div class=""
										style="background-image: url(<%=resourcesPath%>/images/${topBoard.bodImage==null ? 'noimage.png' : topBoard.bodImage}); background-size:cover; height:150px;width:100%;"></div> --%>
									<div class="text text-center">
										<p class=" pl-4 line">
											${topBoard.title }<br>${topBoard.servings}인분 <br> <span
												class="position">${topBoard.tags }</span>
										<p>
									</div>
								</div>
							</div>
						</c:forEach>



					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- 전체 게시글 영역 -->
	<section class="ftco-section ftco-category ftco-no-pt">

		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center">
				<ul class="product-category">
					<c:forEach items="${foodCategorys}" var="category">
						<li><a
							href="main.board?whatColumn=foodCategory&keyword=${category }"
							${selectCategory == category ? 'class="active"':"" }>${category }</a></li>
					</c:forEach>

				</ul>
				<ul class="product-category">
					<c:forEach items="${ingredientCategorys}" var="category">
						<li><a
							href="main.board?whatColumn=ingredientCategory&keyword=${category }"
							${selectCategory == category ? 'class="active"':"" }>${category }</a></li>
					</c:forEach>

				</ul>
			</div>
		</div>

		<div class="container">
			<div class="row">



				<c:forEach items="${boardList }" var="board">
					<%-- <div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="boardDetail.board?bodNum=${board.bodNum}"
								class="img-prod"><img style="width: 100%; height: 100%;"
								class="img-fluid"
								src="<%=resourcesPath%>/images/${board.bodImage==null ? 'noimage.png' : board.bodImage}"
								alt="음식 대표 이미지"> <!-- <span class="status">30%</span> -->
								<!-- <div class="overlay">asdfas</div> --> </a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="#">${board.title }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="mr-2 price-dc">${board.tags }</span><span
												class="price-sale">${board.category }</span>
										</p>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<a href="#"
											class="add-to-cart d-flex justify-content-center align-items-center text-center">
											<span><i class="ion-ios-menu"></i></span>
										</a> <a href="#"
											class="buy-now d-flex justify-content-center align-items-center mx-1">
											<span><i class="ion-ios-cart"></i></span>
										</a> <a href="#"
											class="heart d-flex justify-content-center align-items-center ">
											<span><i class="ion-ios-heart"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div> --%>
					<!--  -->
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="boardDetail.board?bodNum=${board.bodNum}"
								class="img-prod"> <img class="img-thumbnail"
								src="<%=resourcesPath%>/images/${board.bodImage==null ? 'noimage.png' : board.bodImage}"
								alt="Colorlib Template" style="height: 250px; width: 100%;">
								<div class="overlay"></div>
							</a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="boardDetail.board?bodNum=${board.bodNum}">${board.title }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">${board.servings}인분</p>
										<span class="mr-2 price-dc">${board.tags }</span>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<!-- 찜하기 -->
										<a href="BookmarkInsert.re?recipenum=${recipe.recipenum}"
											class="heart d-flex justify-content-center align-items-center ">
											<span><i class="ion-ios-heart"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!--  -->

				</c:forEach>
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