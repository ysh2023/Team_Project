<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="./../common/pg_header.jsp"%>

<div class="col-lg-9 ftco-animate fadeInUp ftco-animated" style="margin-top:30px; border-left: 0px !important;">
	<div class="pagetitle" style="margin-left:20px">
		<span>상품</span>
		<h2 style="font-weight: bolder;">주문 상세보기</h2>
	</div>
	<div class="card" style="margin:20px; margin-top: 0px;">
		<div class="card-body" id="maindiv" style="overflow: scroll; max-height: 930px;">
			<table class="table datatable" id="maintable">
				<thead>
					<tr class="text-center">
						<th scope="col">주문번호</th>
						<th scope="col">상품명</th>
						<th scope="col">상품이미지</th>
						<th scope="col">구매 갯수</th>
						<th scope="col">결제 금액</th>
      				</tr>
				</thead>
				<tbody>
					<c:forEach var="orderdetail" items="${slist }">
					<tr>
						<td>${orderdetail.odtordnum }</td> 
						<td>${orderdetail.pdname }</td>
						<td><img src="<%=resourcesPath%>/img_pd/${orderdetail.pdimage }" style="width: 100px; height: 100px;"> </td>
						<td>${orderdetail.odtqty }</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderdetail.pdprice * orderdetail.odtqty}" />원</td> 
					</tr>
					</c:forEach>
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
    