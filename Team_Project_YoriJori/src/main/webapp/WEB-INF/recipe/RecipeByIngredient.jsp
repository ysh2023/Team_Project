<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>resoutces/js/jquery.js"></script>
<script>
function recommendClick(recipenum){
	if (`${loginInfo.id}` == '') {
		if (confirm('로그인 후 추천 가능합니다\n로그인 하시겠습니까?')) {
			location.href = 'login.mb';
			return;
		}else{
			return;
		}
	}
	
	$.ajax({
		url : 'BookmarkInsert.re',
		data:({
			recipenum : recipenum
		}),
		type: "GET",
		
		success: function(data){
			if($.trim(data)=='1'){
				$('#recommend'+recipenum).attr('src',`<%=resourcesPath%>`+'/images/full-heart.png');
		
		}else if($.trim(data)=='0'){
			$('#recommend'+recipenum).attr('src',`<%=resourcesPath%>`+'/images/heart.png');					
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

<main>
<!-- banner -->
<div class="hero-wrap hero-bread" style="background-image: url(<%=resourcesPath%>/images/banner3.jpg);">
	<div class="container">
    	<div class="row no-gutters slider-text align-items-center justify-content-center">
        	<div class="col-md-9 ftco-animate text-center">
          		<p class="breadcrumbs"><span class="mr-2"><a href="index.html">다양한</a></span> <span>레시피</span></p>
            	<h1 class="mb-0 bread">즐거운 요리</h1>
          	</div>
        </div>
	</div>
</div>
<section class="ftco-section">
	<div class="container">
	<!-- categoryList -->
		<div class="row justify-content-center">
    		<div class="col-md-12 mb-5 text-center">
    			<a class="navbar-brand" style="margin-bottom: 20px">${keyword}</a>
    			
    			<ul class="product-category">
    				<c:forEach var="ingredient" items="${ingreList}">
    					<li><a href="listByIng.re?whatColumn=food_name&keyword=${ingredient}"${selectCategory == ingredient ? 'class="active"':"" }>${ingredient}</a></li>
    				</c:forEach>
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
			    					<span class="heart d-flex justify-content-center align-items-center "> <span><img alt="추천" id="recommend${recipe.recipenum}" align="right" width="40" height="40" src="<%=resourcesPath%>/images/${recipe.rec!='0'? 'full-heart.png' : 'heart.png' }" style="cursor: pointer;" onclick="recommendClick(${recipe.recipenum})"></span>
			    					</span>
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    	</div>
		  	</c:forEach>
		 </div>
		<!-- pagenation -->
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