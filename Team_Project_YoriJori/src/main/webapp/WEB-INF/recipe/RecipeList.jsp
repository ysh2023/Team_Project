<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/header.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>resoutces/js/jquery.js"></script>
<main>
  <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(<%=resourcesPath%>/images/banner3.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-center">
	              <h1 class="mb-2">easy cooking </h1>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>

	          </div>
	        </div>
	      </div>

	      <div class="slider-item" style="background-image: url(<%=resourcesPath%>/images/banner2.jpg);">
	      	<div class="overlay"></div>	
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-center">
	              <h1 class="mb-2">enjoy cooking      </h1>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>

	          </div>
	        </div>
	      </div>
	    </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li><a href="list.re" class="active">All</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=돼지고기">돼지고기</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=소고기">소고기</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=닭고기">닭고기</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=채소류">채소류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=해물류">해물류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=달걀/유제품">달걀/유제품</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=가공식품류">가공식품류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=쌀">쌀</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=밀가루">밀가루</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=건어물류">건어물류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=버섯류">버섯류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=과일류">과일류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=콩/견과류">콩/견과류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=곡류">곡류</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=기타">기타</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=반찬">반찬</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=국&찌개">국&찌개</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=일품">일품</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=밥">밥</a></li>
    					<li><a href="list.re?whatColumn=recipecategory&keyword=후식">후식</a></li>
    				</ul>
    			</div>
    		</div>
    		<div class="row">
    			<c:forEach items="${recipeList}" var="recipe">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="detail.re?recipenum=${recipe.recipenum}" class="img-prod">
    					<img class="img-thumbnail" src="${recipe.cookimage}" alt="Colorlib Template" style="height: 250px; width: 100%; ">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="detail.re?recipenum=${recipe.recipenum}">${recipe.recipename}</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price">${recipe.servings}인분</p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex"> 
	    							<!-- 찜하기 -->
	    							<a href="BookmarkInsert.re?recipenum=${recipe.recipenum}" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    			
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
            <ul>
              ${pageInfo.pagingHtml}
              </ul>
            </div>
          </div>
        </div>
    	</div>
    </section>
</main>

<%@include file= "./../common/footer.jsp" %>