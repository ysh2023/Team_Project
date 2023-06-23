<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	location.href="/ex";
</script>
<!-- header -->
<%@include file= "WEB-INF/common/header.jsp" %>

<!-- main -->
	<!-- slider -->
    <section id="home-section" class="hero" style="height: 650px;">
		  <div class="home-slider owl-carousel">
		  <!-- first slide -->
	      <div id="main-image" class="slider-item" style="background-image: url(<%=resourcesPath%>/images/mainbanner.png);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text" data-scrollax-parent="true" style="height: 500px;">
				<!-- text -->
	            <div class="col-md-12 ftco-animate text-center" style="padding-top: 45px" >
	              <h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
		  <!-- second slide -->
	      <div id="main-image" class="slider-item" style="background-image: url(<%=resourcesPath%>/images/bg_2.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text" data-scrollax-parent="true">
	            <div class="col-sm-12 ftco-animate text-center" style="padding-top: 45px" style="height: 500px;" >
	              <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
    </section>
    <!-- END slider -->

	<!-- 1st section -->
    <section class="ftco-section">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-md-4 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div class="media-body">
                <h3 class="heading" >배송비 무료</h3>
                <span>5만원 이상 구매시 배송비 무료</span>
              </div>
            </div>      
          </div>
          <div class="col-md-4 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">검증된 신선함</h3>
                <span>당일생산/유통기한 내 폐기 원칙 준수</span>
              </div>
            </div>    
          </div>
          <div class="col-md-4 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
               <h3 class="heading">우수한 레시피</h3>
                <span>퀄리티 좋은 다양한 레시피</span>
              </div>
            </div>      
          </div>
        <!--   <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Support</h3>
                <span>24/7 Support</span>
              </div>
            </div>      
          </div> -->
        </div>
			</div>
	</section>
	<!-- End 1st section -->

	<!-- 2nd section -->
	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6 order-md-last align-items-stretch d-flex">
							<div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(<%=conPath%>/images/category.jpg);">
								<div class="text text-center">
									<h2>Recipe</h2>
									<p>사용자들이 많이 저장한 레시피</p>
									<p><a href="list.re" class="btn btn-primary">보러가기</a></p>
								</div>
							</div>
						</div>
						
						<c:forEach var="recipe" items="${recipeList}" varStatus="status">
							<c:choose>
								<c:when test="${status.index == 0}">
									<div class="col-md-6">
									
									<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(${recipe.cookimage}); cursor: pointer;" onclick="location.href='detail.re?recipenum=${recipe.recipenum}'" >
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="detail.re?recipenum=${recipe.recipenum}">${recipe.recipename }</a></h2>
									</div>
								</div>
								
								</c:when>
								<c:when test="${status.index == 1}">
									<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(${recipe.cookimage});cursor: pointer; "  onclick="location.href='detail.re?recipenum=${recipe.recipenum}'">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="detail.re?recipenum=${recipe.recipenum}">${recipe.recipename }</a></h2>
									</div>
								</div>
								</div>
								</div>
								</div>
								</c:when>
								<c:when test="${status.index == 2}">
									<div class="col-md-4">
									<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(${recipe.cookimage});cursor: pointer;" onclick="location.href='detail.re?recipenum=${recipe.recipenum}'">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="detail.re?recipenum=${recipe.recipenum}">${recipe.recipename }</a></h2>
									</div>
								</div>
							
								</c:when>
								<c:when test="${status.index == 3}">
									<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(${recipe.cookimage});cursor: pointer;" onclick="location.href='detail.re?recipenum=${recipe.recipenum}'">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="detail.re?recipenum=${recipe.recipenum}">${recipe.recipename }</a></h2>
									</div>
								</div>
								</div>
								</div>
								</div>
								</c:when>
							</c:choose>
						</c:forEach>
						
						
					</div>
				</div>
			
				</div>
			</div>
	</section>
	<!-- END 2nd section -->

		<!-- 3rd section -->
    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">Featured Products</span>
            <h2 class="mb-4">상품</h2>
       <p><a href="shop.prd?whatColumn=no" class="btn btn-primary">shop now</a></p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<!-- first row -->
    		
    		<div class="row">
    		<c:forEach var="i" items="${plists}" end="7"> 
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="prdDetail.prd?pdnum=${i.pdnum}" class="img-prod"><img class="img-fluid" src="<%=resourcesPath%>/img_pd/${i.pdimage}" alt="Colorlib Template">
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="prdDetail.prd?pdnum=${i.pdnum}">${i.pdname}</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"> <fmt:formatNumber value="${i.pdprice }" /></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="insert.bsk?pdnum=${i.pdnum }&qty=1" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="insertDibs.mp?pdnum=${i.pdnum}&ck=ys" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
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
    <!-- End 3rd section -->
<!-- footer -->
<%@include file= "WEB-INF/common/footer.jsp" %>