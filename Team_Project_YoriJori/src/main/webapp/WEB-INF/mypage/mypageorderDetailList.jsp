<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="./../common/pg_header.jsp"%>
<html>
<body>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>주문 목록</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body" style="overflow: scroll; max-height: 930px;">
							<table class="table datatable">
								<thead>
									<tr>
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
		</section>


	</main>
</body>
<section style="margin-top: 100px;">
	<%@include file= "./../common/footer.jsp" %>
</section>

<script src="<%=request.getContextPath()%>/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/tinymce/tinymce.min.js"></script>

<!-- Template Main JS File -->
<script src="<%=request.getContextPath()%>/resources/js/main_am.js"></script>
</html>
    