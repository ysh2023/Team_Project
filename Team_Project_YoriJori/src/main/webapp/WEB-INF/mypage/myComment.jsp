<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/pg_header.jsp"%>
<html>
<body>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>내가 작성한 댓글</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body" style="overflow: scroll; max-height: 930px;">
							<table id="tables" class="table datatable">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">내용</th>
										<th scope="col">작성시간</th>
										<th scope="col">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${fn:length(commentList)==0 }">
										<tr>
											<td colspan="10">작성한 댓글이 없습니다</td>
										</tr>
									</c:if>
									<c:forEach var="i" items="${commentList}">
										<tr>
											<td>${i.comNum}</td>
											<td><a href="boardDetail.board?bodNum=${i.bodNum }#comment-list">${i.comContent}</a></td>
											<td>${i.createAt}</td>
											<td><a href="deleteComment.mp?comNum=${i.comNum}" onclick="return deleteComment(${i.comNum})">삭제</a></td>
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
<Script>
	function deleteComment(comNum){
		var isOk = confirm(comNum+ '번 댓글을 삭제하시겠습니까?');
		if(!isOk){
			return false;
		}
	}
</Script>

<script src="<%=request.getContextPath()%>/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/tinymce/tinymce.min.js"></script>

<!-- Template Main JS File -->
<script src="<%=request.getContextPath()%>/resources/js/main_am.js"></script>

</html>