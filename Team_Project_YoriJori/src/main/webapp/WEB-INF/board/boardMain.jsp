<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인</title>
</head>
<body>

	<ul class="product-category">
		<li><a href="write.board" class="active">게시글 작성</a></li>
	</ul>
	<section class="ftco-section testimony-section">
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
							<div class="item" onclick="location.href='boardDetail.board?bodNum=${board.bodNum}'">
								<div class="testimony-wrap p-4 pb-5">
									<div>${status.index+1 }번</div>
									<div class="user-img mb-5" style="background-image: url(<%=resourcesPath%>/images/${topBoard.bodImage==null ? 'noimage.png' : topBoard.bodImage}); background-size:cover;">
										<span class="quote d-flex align-items-center justify-content-center"> <i class="icon-quote-left"></i>
										</span>
									</div>
									<div class="text text-center">
										<p class="mb-5 pl-4 line">${topBoard.servings}인분</p>
										<p class="name">${topBoard.time }</p>
										<span class="position">${topBoard.tags }</span>
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
					<c:forEach items="${categorys}" var="category">
						<li><a href="main.board?category=${category }" ${selectCategory == category ? 'class="active"':"" }>${category }</a></li>
					</c:forEach>

				</ul>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<%-- <div class="col-md-8">
						<div class="col-md-6 order-md-last align-items-stretch d-flex">
							<div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(<%=conPath%>/images/category.jpg);">
								<div class="text text-center">
									<h2>Vegetables</h2>
									<p>Protect the health of every home</p>
									<p><a href="#" class="btn btn-primary">Shop now</a></p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(<%=resourcesPath%>/images/category-1.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0"><a href="#">Fruits</a></h2>
								</div>
							</div>
							<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(<%=resourcesPath%>/images/category-2.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0"><a href="#">Vegetables</a></h2>
								</div>
							</div>
						
					</div>
				</div> --%>
				<c:forEach items="${boardList }" var="board">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product" onclick="location.href='boardDetail.board?bodNum=${board.bodNum}'">
							<a href="#" class="img-prod"><img style="width: 100%; height: 100%;" class="img-fluid" src="<%=resourcesPath%>/images/${board.bodImage==null ? 'noimage.png' : board.bodImage}" alt="음식 대표 이미지"> <!-- <span class="status">30%</span> -->
								<!-- <div class="overlay">asdfas</div> --> </a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="#">${board.title }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="mr-2 price-dc">${board.tags }</span><span class="price-sale">${board.category }</span>
										</p>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center"> <span><i class="ion-ios-menu"></i></span>
										</a> <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1"> <span><i class="ion-ios-cart"></i></span>
										</a> <a href="#" class="heart d-flex justify-content-center align-items-center "> <span><i class="ion-ios-heart"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>


</body>
<%@include file="../common/footer.jsp"%>
</html>