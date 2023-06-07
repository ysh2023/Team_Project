<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/header.jsp" %>

<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
	<div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
        	<div class="col-md-12">
        		<h2 align="center">${member.mname}님의 관심 레시피</h2>
        	</div>
    	</div>
	</div>
</section>

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
						        <th>인분</th>
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