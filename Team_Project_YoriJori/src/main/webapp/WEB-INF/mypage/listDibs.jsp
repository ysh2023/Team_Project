<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="./../common/pg_header.jsp"%>

<div class="col-lg-9 ftco-animate fadeInUp ftco-animated" style="margin-top:30px; border-left: 0px !important;">
	<div class="pagetitle" style="margin-left:20px">
		<span>상품</span>
		<h2 style="font-weight: bolder;">찜한 상품</h2>
	</div>
	<div class="card" style="margin:20px; margin-top: 0px;">
		<div class="card-body" style="overflow: scroll; max-height: 930px;">
			<table class="table datatable">
			<thead>
				<tr>
 					<th>상품이름</th>
					<th>상품가격</th>
					<th>상품이미지</th>
					<th>삭제</th>									
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty lists}">
				<tr class="text-center">
					<td colspan="4">찜한 상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty lists }">
			<c:forEach  var="i" items="${lists}">
				<tr class="text-center">
					<td>${i.pdname}</td>
					<td>${i.pdprice}</td>
					<td><img src="<%=resourcesPath%>/img_pd/${i.pdimage}" height="100px" width="100px"></td>
					<td><a href="deleteDibs.mp?pdnum=${i.pdnum}">삭제</a>
				</tr>
			</c:forEach>
			</c:if>
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
    
    