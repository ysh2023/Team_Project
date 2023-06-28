<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="./../common/pg_header.jsp"%>

<div class="col-lg-9 ftco-animate fadeInUp ftco-animated" style="margin-top:30px; border-left: 0px !important;">
	<div class="pagetitle" style="margin-left:20px">
		<span>상품</span>
		<h2 style="font-weight: bolder;">주문 목록</h2>
	</div>
	<div class="card" style="margin:20px; margin-top: 0px;">
		<div class="card-body" id="maindiv" style="overflow: scroll; max-height: 930px;">
			<table class="table datatable" id="maintable">
				<thead>
					<tr class="text-center">
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
						<td colspan="6">주문 목록이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty slist }">
				<c:forEach  var="order" items="${slist}">
					<tr>
						<td scope="row"><a href="orderdetail.mp?ordnum=${order.ordnum }">${order.ordnum }</a></td> 
						<td>${order.ordpdname }</td>
						<td>${order.ordname }</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.ordtotalpay}" />원</td> 
						<td>
						  <fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm" value="${order.orddate}"/>
					      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm" var="det"/>
					      <c:out value="${det}"></c:out>
						</td>
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
	</div>
</div>
</div>
</div>

<%@include file= "./../common/footer.jsp" %>

<script src="<%=request.getContextPath()%>/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/tinymce/tinymce.min.js"></script>

<!-- Template Main JS File -->
<script src="<%=request.getContextPath()%>/resources/js/main_am.js"></script>
</html>
    