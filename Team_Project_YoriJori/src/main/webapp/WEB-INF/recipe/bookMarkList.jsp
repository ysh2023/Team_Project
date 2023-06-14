<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/header.jsp" %>


<div class="hero-wrap hero-bread" style="background-image: url(<%=resourcesPath%>/images/banner2.jpg);">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">${member.mname}</a></span> <span>님의</span></p>
            <h1 class="mb-0 bread">관심 레시피</h1>
          </div>
        </div>
      </div>
    </div>

 <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>관심 레시피</th>
						        <th>&nbsp;</th>
						        <th>카테고리</th>
						        <th>용량</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:if test="${empty BookmarkRecipeList}">
						    	 <tr class="text-center">
						    	 	<td colspan="5">
						    	 		선택한 레시피가 없습니다.
						    	 	</td>
						    	 </tr>
						    </c:if>
						    <c:if test="${not empty BookmarkRecipeList }">
						    <c:forEach  var="recipe" items="${BookmarkRecipeList}">
						      <tr class="text-center">
						        <td class="product-remove"><a href="deleteBookmark.re?recipenum=${recipe.recipenum}"><span class="ion-ios-close"></span></a></td>
						        
						        <td class="image-prod"><div class="img" style="background-image:url(${recipe.cookimage});"></div></td>
						        
						        <td class="product-name">
						        	<a href="detail.re?recipenum=${recipe.recipenum}">
						        	<h3>${recipe.recipename}</h3>
						        	</a>
						        </td>
						        
						        <td class="price">${recipe.recipecategory}</td>
						        
						        <td class="quantity">${recipe.servings}인분 </td>
						        
						      </tr><!-- END TR-->
							</c:forEach>
						    </c:if>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
			</div>
		</section>

<%@include file= "./../common/footer.jsp" %>