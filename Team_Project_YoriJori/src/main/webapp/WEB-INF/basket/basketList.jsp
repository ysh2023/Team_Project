<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>

   <div class="hero-wrap hero-bread" style="background-image: url('<%=resourcesPath%>/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span>장바구니</span></p>
            <h1 class="mb-0 bread">장바구니</h1>
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
						        <th>삭제</th>
						        <th>상품 이미지</th>
						        <th>상품 이름</th>
						        <th>가격</th>
						        <th>수량</th>
						        <th>수정</th>
						        <th>총합</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:choose>
						    	<c:when test="${fn:length(slist) == 0 }">
							    	<tr class="text-center">
							    		<td colspan="7" align="center">장바구니에 등록된 상품이 없습니다.</td>
							    	</tr>
						    	</c:when>
						    	<c:otherwise>
							    <c:forEach var="bsk" items="${slist }">
							      <tr class="text-center">
							        <td class="product-remove"><a href="delete.bsk?bsknum=${bsk.bsknum }"><span class="ion-ios-close"></span></a></td>
							        
							        <td class="image-prod"><div class="img" style="background-image:url('<%=resourcesPath%>/img_pd/${bsk.pdimage}');"></div></td>
							        
							        <td class="product-name">
							        	<h3>${bsk.pdname }</h3>
							        </td>
							        
							        <td class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bsk.pdprice }" />원</td>
							        <form action="update.bsk">
							        <input type="hidden" name="bsknum" value="${bsk.bsknum }">
							        <td class="quantity">
							        	<div class="input-group mb-3">
						             	<input type="text" name="qty" class="quantity form-control input-number" value="${bsk.bskqty }" min="1" max="100">
						          	</div>
						          </td>
							        	<td class="update"><input type="submit" value="수정하기"></td>
							        </form>
							        <td class="total"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bsk.pdprice * bsk.bskqty }" />원</td>
							      </tr><!-- END TR-->
							    </c:forEach>
						    	</c:otherwise>
						    </c:choose>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
     		<div class="row justify-content-end">
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate" style="float: right;">
    				<div class="cart-total mb-3">
    					<h3>장바구니 결제금액</h3>
    					<p class="d-flex">
    						<span>총합</span>
    						<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAmount }" />원</span>
    					</p>
    					<p class="d-flex">
    						<span>배송비</span>
    						<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${Baesong }" />원</span>
    					</p>
<!--     					<p class="d-flex">
    						<span>할인가격</span>
    						<span>0원</span>
    					</p> -->
    					<hr>
    					<p class="d-flex total-price">
    						<span>결제 금액</span>
    						<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAmount+Baesong}" />원</span>
    					</p>
    				</div>
    				<c:if test="${BCount >= 1 }">
    				<p><a href="orderpay.ord?totalAmount=${totalAmount}&Baesong=${Baesong}" class="btn btn-primary py-3 px-4">주문하기</a></p>
    				</c:if>
    			</div>
    		</div>
			</div>
		</section>
    

<%@include file= "./../common/footer.jsp" %>

