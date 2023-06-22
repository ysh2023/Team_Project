<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>


    <div class="hero-wrap hero-bread" style="background-image: url('<%=resourcesPath%>/images/mall_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="<%=conPath%>/main.jsp">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span> <span>Product Single</span></p>
            <h1 class="mb-0 bread">상세 페이지</h1>
          </div>
        </div>
      </div>
    </div>
<form method="post">
<input type="hidden" name="pdnum" value="${product.pdnum }">
<input type="hidden" name="pdname" value="${product.pdname }">
<input type="hidden" name="pdprice" value="${product.pdprice }">
    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="#" class="image-popup"><img src="<%=resourcesPath%>/img_pd/${product.pdimage}" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3>${product.pdname }</h3>
    				<p class="price"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.pdprice}" />원</span></p>
    				<p>맛있고 신선한 ${product.pdname }입니다 저희는 매번 품질보장이 되는 제품만 판매합니다<br>
    				구매하셔도 후회없으실 겁니다 존맛...이기 때문이죠....
    				 
						</p>
						<div class="row mt-4">
							<div class="col-md-6">
								<div class="form-group d-flex">
	
		            </div>
							</div>
							<div class="w-100"></div>
							<div class="input-group col-md-6 d-flex mb-3">
	             	<span class="input-group-btn mr-2">
	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
	             	<input type="text" id="quantity" name="qty" class="form-control input-number" value="1" min="1" max="100">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
	                     <i class="ion-ios-add"></i>
	                 </button>
	             	</span>
	          	</div>
	          	<div class="w-100">
		          	<div class="col-md-12">
		          		<c:if test="${product.pdstock >= 1 }">
		          			<p style="color: #000;">상품 재고 : ${product.pdstock }</p>
		          		</c:if>
		          		<c:if test="${product.pdstock <= 0 }">
		          			<p style="color: #000;">상품 재고 : 품절</p>
		          		</c:if>
		          		
		          	</div>
	          	</div>
          	</div>
		    <p>
          	<c:choose>
	          	<c:when test="${product.pdstock > 0 }">
			          	<input type="submit" formaction="orderpay.ord" class="btn btn-black py-3 px-5" value="구매하기">
			          	<input type="submit" formaction="insert.bsk" class="btn btn-black py-3 px-5" value="장바구니에 담기">
	          	</c:when>
	          	<c:otherwise>
	          			<span>품절된 상품입니다.</span>
	          	</c:otherwise>
          	</c:choose>
		    </p>
          	
    			</div>
    		</div>
    	</div>
    </section>
</form>  
 <!-- 수량조절버튼 script -->
	<script type="text/javascript" src="<%=resourcesPath%>/js/jquery-3.2.1.min.js"/></script>
    <script>
		$(document).ready(function(){
		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        // If is not undefined
		          	 $('#quantity').val(quantity + 1);
		            	

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>

<%@include file= "./../common/footer.jsp" %>