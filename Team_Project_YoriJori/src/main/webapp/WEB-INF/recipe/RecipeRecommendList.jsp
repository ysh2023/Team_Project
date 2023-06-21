<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file= "./../common/header.jsp" %>    
    
<div class="hero-wrap hero-bread" style="background-image: url(<%=resourcesPath%>/images/banner3.jpg);">
	<div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
        	<div class="col-md-9 ftco-animate text-center">
          		<p class="breadcrumbs"><span class="mr-2"><a href="index.html">다양한</a></span> <span>레시피</span></p>
            	<h1 class="mb-0 bread">추천 레시피</h1>
        	</div>
    	</div>
	</div>
</div>
   
    
    
<section class="ftco-section">
	<div class="container">
	
    	<div class="row justify-content-center">
    		<div class="col-md-12 mb-5 text-center">
		    	<a class="navbar-brand" style="margin-bottom: 20px">식재료</a>
			    	<form action="Recommend.re" method="post">
			    	<div class="row">
			    	
			    		<input type="hidden" name="whatColumn" value="food_name">
			    		<div class="col-md-8 justify-content-start">
			    		<c:forEach var="ingredient" items="${ingreList}" varStatus="status">
			    			<div class="form-check form-check-inline">
			    			<input type="hidden" value="${ingredient}" name="ingreList">
			    			<input type="hidden" value="${day[status.index]}" name="day">
							<input class="form-check-input" type="checkbox" value="${ingredient}" id="flexCheckDefault" name="keyword">
							<label class="form-check-label" for="flexCheckDefault">
							<c:choose>
								<c:when test="${day[status.index] == 0}">
									<span style="color: red !important;">D-day</span>
								</c:when>
								<c:when test="${day[status.index] >-3}">
									<span style="color: red !important;">D${day[status.index]}</span>
								</c:when>
								<c:otherwise>
									D${day[status.index]}${ingredient}
								</c:otherwise>
							</c:choose>
							</label>
							</div>
			    		</c:forEach>
			    		</div>
			    		<div class="col-md-4 ">
			    		<input type="submit" class="btn btn-outline-primary" value="레시피 검색">
			    		</div>
			    		</div>
			    		<div>
			    		</div>
			    	</form>
    		</div>
    	</div>	
    		
    		<c:if test="${empty recipeList}">
    		<div class="row justify-content-center">
         		<div class="col-md-7 heading-section ftco-animate text-center">
	            	<h2 class="mb-4">검색되는 레시피가 없습니다.</h2>
          		</div>
    		</c:if>
    		<c:if test="${!empty recipeList}">
    		<div class="row justify-content-start">
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
			    					<span><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'><path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/></svg></i></span>
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
        </c:if>
        
    	</div>
    </section>
<%@include file= "./../common/footer.jsp" %>