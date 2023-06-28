<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

function deleteClick(recipenum){
	$.ajax({
		type : 'Get',
		url:'deleteBookmark.re',
		data: ({
				recipenum : recipenum
			}),
		success:function(data){
			$('.table').html($.trim(data));
		},
		error:function( request, status, error){
			alert('찜 삭제 실패');
			alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		}
});
}

function selectCate(){

	var category = $('.form-select').val();
	 $.ajax({
		type : 'Post',
		url:'bookmark.re',
		data: ({
				keyword : category
			}),
		success:function(data){
			$('.table').html($.trim(data));
		},
		error:function( request, status, error){
			alert('댓글달기실패');
			alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		}
}); 
}

</script>

<div class="hero-wrap hero-bread"
	style="background-image: url(<%=resourcesPath%>/images/banner2.jpg);">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">${name}</a></span>
					<span>님의</span>
				</p>
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
								<th><select class="form-select form-select-sm" aria-label=".form-select-sm example" id="cate" onchange="selectCate()">
									<c:if test="${empty category}">
											<option value="" selected>카테고리</option>
									</c:if>
									<c:if test="${not empty category}">
										<option value="" selected>카테고리</option>
										<option value="All">전체</option>
										<c:forEach var="cate" items="${category}">
											<option value="${cate}">${cate}</option>
										</c:forEach>
									</c:if>
								</select>
								</th>
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
											src="<%=resourcesPath%>/images/full-heart.png"
											style="width: 30px; height: 30px;" style="cursor: pointer;"
											onclick="deleteClick(${recipe.recipenum})"></td>

										<td class="image-prod"><a
											href="detail.re?recipenum=${recipe.recipenum}"><div
													class="img"
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
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="./../common/footer.jsp"%>