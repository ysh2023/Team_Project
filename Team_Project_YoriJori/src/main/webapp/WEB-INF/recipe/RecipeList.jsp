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
    		<div class="row justify-content-center">
    			<div class="col-md-12 mb-5 text-center">
    			<table>
    				<tr>
    					<td>
    						<a class="active">구분별</a>
    					</td>
    					<td>
    						<ul class="product-category">
    							<li><a href="list.re" class="active" >전체</a></li>
		    					<li><a href="list.re?whatColumn=readcount">조회많은순</a></li>
		    					<li><a href="list.re?whatColumn=bookmark">찜많은순</a></li>
		    				</ul>
    					</td>
    				</tr>
    				<tr>
    					<td width="20%">
    						카테고리별
    					</td>
    					<td>
    						<ul class="product-category">
    							<li><a href="list.re" class="active" >전체</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=반찬">반찬</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=국&찌개">국&찌개</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=일품">일품</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=밥">밥</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=후식">후식</a></li>
    							<li><a href="list.re?whatColumn=recipecategory&keyword=기타">기타</a></li>
    						</ul>
    					</td>
    				</tr>
    				<tr>
    					<td>
    						식재료별
    					</td>
    					<td>
    						<ul class="product-category">
    							<li><a href="list.re" class="active" >전체</a></li>
    							<li><a href="listByIng.re?whatColumn=foodcategory&keyword=곡류/콩/견과류">곡류/콩/견과류</a></li>
    							<li><a href="listByIng.re?whatColumn=foodcategory&keyword=소스/오일">소스/오일</a></li>
    							<li><a href="listByIng.re?whatColumn=foodcategory&keyword=채소">채소</a></li>
    							<li><a href="listByIng.re?whatColumn=foodcategory&keyword=과일">과일</a></li>
    							<li><a href="listByIng.re?whatColumn=foodcategory&keyword=정육/해산물">정육/해산물</a></li>
    							<li><a href="listByIng.re?whatColumn=foodcategory&keyword=계란/유제품">계란/유제품</a></li>
    							<li><a href="listByIng.re?whatColumn=foodcategory&keyword=면/빵/떡">면/빵/떡</a></li> 
    						</ul>
    					</td>
    				</tr>
    				<tr>
    					<td>
    						분류별
    					</td>
    					<td>
	    					<ul class="product-category" id="category">
		    					<li><a href="list.re" class="active" >전체</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=돼지고기">돼지고기</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=소고기">소고기</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=닭고기">닭고기</a></li>
		    					<li><a href="list.re?whatColumn=recipecategory&keyword=육류">육류</a></li>
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
	    					</ul>
    					</td>
    				</tr>
    			</table>
    			</div>
    		</div>
    		<div class="row justify-content-center">
    			<c:if test="${empty recipeList}">
         				<div class="col-md-7 heading-section ftco-animate text-center">
	            			<h2 class="mb-4">검색되는 레시피가 없습니다.</h2>
          				</div>
    			</c:if>
    			<c:if test="${!empty recipeList}">
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
</main>

<%@include file= "./../common/footer.jsp" %>