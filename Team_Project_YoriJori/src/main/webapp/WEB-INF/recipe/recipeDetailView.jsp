<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/header.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>resoutces/js/jquery.js"></script>

<section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="images/product-1.jpg" class="d-flex justify-content-center"><img src="${recipe.cookimage}" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h1>${recipe.recipename}</h1>
    				<div class="rating d-flex">
							<p class="text-left mr-5">
								<a href="#" class="mr-2" style="color: #000;">${recipe.readcount} <span style="color: #bbb;">조회수</span></a>
							</p>
							<p class="text-left mr-5">
								
								<a href="#" class="mr-2" style="color: #000;">${SelectedRecipeCount} <span style="color: #bbb;"><i class="ion-ios-heart"></i></span></a>
							</p>
							<p class="text-left mr-5">
								<!-- 북마크 수 -->
								<!-- 누르면 북마크 추가 되도록 -->
								<form action="BookmarkInsert.re" method="post">
								<input type="hidden" name="recipenum" value="${recipe.recipenum}">
								<a href="#" class="mr-2" style="color: #000;">
								<span style="color: #bbb;"><input type="submit" value="찜" class="btn px-4 btn-primary"></span></a>
								</form>
							</p>
						</div>
    				<p class="price"><span>재료</span></p>
    				<div class="d-flex justify-content-center">
    					<ul>
	    					<c:forEach items="${foodList}" var="food">
	    						<li style="inline : block; float: left; margin-right: 40px">${food.foodname}  ${food.foodamount}</li>
	    					</c:forEach>
    					</ul>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

<section class="ftco-section ftco-degree-bg">
<h2 align="center" style="margin-bottom: 20px; padding-bottom: 20px;">조리 방법</h2>
      <div class="container">
        <div class="row">
          <div class="col-lg-12 ftco-animate">
			<div class="row">
				<c:forEach items="${recipeContentList}" var="recipeContent" varStatus="status">		
				<div class="col-md-12 d-flex ftco-animate">
		            <div class="blog-entry align-self-stretch d-md-flex">
		              <a href="blog-single.html" class="block-20" style="background-image: url('${recipeContent.recipeimage}');">
		              </a>
		              <div class="text d-block pl-md-4">
		                <h3 class="heading"><a href="#">${recipeContent.cookcontent}</a></h3>
		              </div>
		            </div>
		          </div>
		         </c:forEach> 
		          
		         </div>
				</div>
          	</div> <!-- .col-md-8 -->
	       </div>
    </section> <!-- .section -->

<section class="ftco-section ftco-degree-bg">
<div class="container">
        <div class="row">
          <div class="col-lg-12 ftco-animate">
  <div class="pt-5 mt-5">
              <h3 class="mb-5">등록된 리뷰 갯수 : ${reviewList.size()}</h3>
              <ul class="comment-list">
	              <!--  댓글 반복(댓글 list) 댓글 0개일때 보여줄 문구  -->
	              <c:if test="${empty reviewList}">
	              	 <li class="comment"> 등록된 리뷰가 없습니다.</li>
	              </c:if>
	              <c:if test="${not empty reviewList}">
		              <c:forEach var="review" items="${reviewList}">
		                <li class="comment">
		                  <div class="vcard bio">
		                  <!-- 괜찮은 이미지 넣기 -->
		                    <img src="<%=resourcesPath%>/images/user_img.jpg" alt="Image placeholder">
		                  </div>
		                  <div class="comment-body">
		                    <h3>${review.id}</h3>
		                    <!-- 시간 넣기 -->
		                    <div class="meta">${review.reviewdate}</div>
		                    <p>${review.review}</p>
		                    <p><a href="report.re?reviewnum=${review.reviewnum}&recipenum=${recipe.recipenum}" class="reply">신고하기</a></p>	
		                  </div>
		                </li>
		              </c:forEach>
	              </c:if>
	          </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">리뷰를 남겨주세요.</h3>
                <form action="insertReview.re" class="p-5 bg-light">
                  <div class="form-group">
                    <input type="hidden" class="form-control" name="id" value="${loginInfo.id}">
                    <input type="hidden" class="form-control" name="recipenum" value="${recipe.recipenum}">
                  </div>

                  <div class="form-group">
                    <label for="message">리뷰</label>
                    <textarea name="review" id="message" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="리뷰 남기기" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
            </div>
            </div>
            </div>
            </div>
</section>

<%@include file= "./../common/footer.jsp" %>