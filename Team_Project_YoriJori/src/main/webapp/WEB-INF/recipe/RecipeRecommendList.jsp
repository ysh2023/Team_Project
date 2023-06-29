<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file= "./../common/header.jsp" %>    
 <script>
function recommendClick(recipenum){
	if (`${loginInfo.id}` == '') {
		if (confirm('로그인 후 북마크 추가 가능합니다\n로그인 하시겠습니까?')) {
			location.href = 'login.mb';
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
				if('${pageInfo.keyword}'== '찜많은순'){
					location.href="list.re?whatColumn=bookmark&keyword=찜많은순";
				}
		}else if($.trim(data)=='0'){
			$('#recommend'+recipenum).attr('src',`<%=resourcesPath%>`+'/images/heart.png');					
			if('${pageInfo.keyword}'== '찜많은순'){
				location.href="list.re?whatColumn=bookmark&keyword=찜많은순";
			}
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
		    	<a class="navbar-brand" style="margin-bottom: 20px">냉장고 식재료 검색</a>
			    	<form action="Recommend.re" method="post">
			    	<div class="row">
			    	
			    		<input type="hidden" name="whatColumn" value="food_name">
			    		<div class="col-md-8 justify-content-start">
			    		<c:forEach var="ingredient" items="${ingreList}" varStatus="status">
			    			<div class="form-check form-check-inline">
			    			<input type="hidden" value="${ingredient}" name="ingreList">
			    			<input type="hidden" value="${day[status.index]}" name="day">
							<input class="form-check-input" type="checkbox" value="${ingredient}" id="flexCheckDefault+${status.index}" name="keyword">
							<label class="form-check-label" for="flexCheckDefault+${status.index}">
							<c:choose>
								<c:when test="${day[status.index] == 0}">
									<span style="color: red !important;">D-day&nbsp;${ingredient}</span>
								</c:when>
								<c:when test="${day[status.index] >-3}">
									<c:if test="${day[status.index]<0}">
									<span style="color: red !important;">D${day[status.index]}&nbsp;${ingredient}</span>
									</c:if>
									<c:if test="${day[status.index]>0}">
									<span style="color: red !important;">D+${day[status.index]}&nbsp;${ingredient}</span>
									</c:if>
								</c:when>
								<c:otherwise>
									D${day[status.index]}&nbsp;${ingredient}
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
			    				<span class="heart d-flex justify-content-center align-items-center "> <span><img alt="추천" id="recommend${recipe.recipenum}" align="right" width="40" height="40" src="<%=resourcesPath%>/images/${recipe.rec!='0'? 'full-heart.png' : 'heart.png' }" style="cursor: pointer;" onclick="recommendClick(${recipe.recipenum})"></span>
								</span>
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