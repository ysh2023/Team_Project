<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<thead class="thead-primary">
	<tr class="text-center">
		<th>&nbsp;</th>
		<th>관심 레시피</th>
		<th>&nbsp;</th>
		<th><select class="form-select form-select-sm"
			aria-label=".form-select-sm example" id="cate"
			onchange="selectCate()">
				<c:if test="${empty category}">
					<option value="" selected>카테고리</option>
				</c:if>
				<c:if test="${not empty category }">
					<option value="" selected>카테고리</option>
					<option value="All">전체</option>
					<c:forEach var="cate" items="${category}">
						<option value="${cate}">${cate}</option>
					</c:forEach>
				</c:if>
		</select></th>
		<th>용량</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty BookmarkRecipeList}">
		<tr class="text-center">
			<td colspan="5">선택한 레시피가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty BookmarkRecipeList }">
		<c:forEach var="recipe" items="${BookmarkRecipeList}">
			<tr class="text-center">
				<td class="product-remove"><img
					src="<%=request.getContextPath()%>/resources/images/full-heart.png"
					style="width: 30px; height: 30px;" style="cursor: pointer;"
					onclick="deleteClick(${recipe.recipenum})"></td>

				<td class="image-prod"><a
					href="detail.re?recipenum=${recipe.recipenum}"><div class="img"
							style="background-image:url(${recipe.cookimage});"></div></a></td>

				<td class="product-name"><a
					href="detail.re?recipenum=${recipe.recipenum}">
						<h3>${recipe.recipename}</h3>
				</a></td>

				<td class="price">${recipe.recipecategory}</td>

				<td class="quantity">${recipe.servings}인분</td>

			</tr>
		</c:forEach>
	</c:if>
</tbody>