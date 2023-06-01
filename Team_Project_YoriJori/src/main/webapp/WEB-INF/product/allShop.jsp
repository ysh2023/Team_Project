<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>
<script type="text/javascript" src="<%=conPath%>/js/jquery.js"></script>

<div class="hero-wrap hero-bread" style="background-image: url('<%=resourcesPath%>/images/mall_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>상품보기</span></p>
            <h1 class="mb-0 bread">Products</h1>
          </div>
        </div>
      </div>
      
      
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li><a href="shop.prd" >모두보기</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=채소">채소</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=과일" >과일</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=쌀/견과" >쌀/견과</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=정육/계란류">정육/계란류</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=우유/유제품">우유/유제품</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=양념/오일" >양념/오일</a></li>
    				</ul>
    			</div>
    			</div>
    		</div>
    		
    		<div class="row">
  
				<c:forEach var="i" items="${lists}">  		
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="${i.pdimage}" alt="Colorlib Template">
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="">${i.pdname }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price">${i.pdprice }</p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
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
      		 ${pageInfo.pagingHtml}
            </div>
          </div>
        </div>
    
    </section>

<%@include file= "./../common/footer.jsp" %>

