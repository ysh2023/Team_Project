<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/header.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>resoutces/js/jquery.js"></script>

<section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="images/product-1.jpg" class="image-popup"><img src="${recipe.cookimage}" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3>${recipe.recipename}</h3>
    				<div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="#" class="mr-2">5.0</a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
							</p>
							<p class="text-left mr-4">
								<!-- 조회수 -->
								<a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">찜</span></a>
							</p>
							<p class="text-left">
								<!-- 북마크 수 -->
								<a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">조회</span></a>
							</p>
						</div>
    				<p class="price"><span>재료</span></p>
    				
    					<c:forEach items="${foodList}" var="food">
    					<p>
    						${food.foodname}
    					</p>
    					</c:forEach>
          			<p><a href="cart.html" class="btn btn-black py-3 px-5">찜</a></p>
    			</div>
    		</div>
    	</div>
    </section>

<section class="ftco-section ftco-degree-bg">
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
		              	<div class="meta mb-3">
		                  <div><a href="#">${status.count}</a></div>
		                </div>
		                <h3 class="heading"><a href="#">${recipeContent.cookcontent}</a></h3>
		              </div>
		            </div>
		          </div>
		         </c:forEach> 
		          
		         </div>
				</div>
          	</div> <!-- .col-md-8 -->
	       </div>
      </div>
    </section> <!-- .section -->

<section class="ftco-section ftco-degree-bg">
<div class="container">
        <div class="row">
          <div class="col-lg-12 ftco-animate">
  <div class="pt-5 mt-5">
              <h3 class="mb-5">댓글 숫자</h3>
              <ul class="comment-list">
              <!--  댓글 반복(댓글 list) 댓글 0개일때 보여줄 문구  -->
                <li class="comment">
                  <div class="vcard bio">
                    <img src="images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">신고하기</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form action="#" class="p-5 bg-light">
                  <div class="form-group">
                    <label for="name">Name *</label>
                    <input type="text" class="form-control" id="name">
                  </div>
                  <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" class="form-control" id="email">
                  </div>
                  <div class="form-group">
                    <label for="website">Website</label>
                    <input type="url" class="form-control" id="website">
                  </div>

                  <div class="form-group">
                    <label for="message">Message</label>
                    <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
            </div>
            </div>
            </div>
</section>

<%@include file= "./../common/footer.jsp" %>