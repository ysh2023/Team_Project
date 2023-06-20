<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file= "./../common/pg_header.jsp" %>


<style>
#table{

margin-left:-200px;
}

#ta{
height: 1000px;
}




</style>


<main id="main" class="main" >
<div id="ta">

	    			<table class="table" id="table">
						    <thead >
						      <tr >
						          <th scope="col">주문번호</th>
							      <th scope="col">상품명</th>
							      <th scope="col">주문자 이름</th>
							      <th scope="col">결제 금액</th>
							      <th scope="col">주문 날짜</th>
							      <th scope="col">거래 상태</th>
						   
						      </tr>
						    </thead>
						    <tbody>
						    <c:if test="${empty slist}">
						    	 <tr class="text-center">
						    	 	<td colspan="6">
						    	 		주문 목록이 없습니다.
						    	 	</td>
						    	 </tr>
						    </c:if>
						    <c:if test="${not empty slist }">
						    <c:forEach  var="order" items="${slist}">
						      <tr class="text-center">
						              <td scope="row"><a href="orderdetail.mp?ordnum=${order.ordnum }">${order.ordnum }</a></td> 
								      <td>${order.ordpdname }</td>
								      <td>${order.ordname }</td>
								      <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.ordtotalpay}" />원</td> 
								      <td>${order.orddate }</td>
								      <td>
								      	<c:if test="${order.ordpaystate == '결제 완료' }">
								      		<input id="cancelpaybtn" type="button" value="환불 요청" onclick="location.href='cancelpay.mp?merchant_uid=${order.ordnum}'">
								      	</c:if>
								      	<c:if test="${order.ordpaystate == '환불 요청' }">
								      		<p><span>환불 요청중 </span> </p>
								      	</c:if>
								      	<c:if test="${order.ordpaystate == '환불 승인' }">
								      		<p><span>환불 승인 완료 </span> </p>
								      	</c:if>
								      </td>
						        
						      </tr>
							</c:forEach>
						    </c:if>
						    </tbody>
						  </table>
						  
						  
				    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27" style="margin-left: -300px;">
            <ul>
      		 ${pageInfo.pagingHtml}
      		 </ul>
            </div>
          </div>
        </div>
     
   </div> 
</main>
  
<div style="margin-top: 100px;">
<%@include file= "./../common/footer.jsp" %>
</div> 


    
    