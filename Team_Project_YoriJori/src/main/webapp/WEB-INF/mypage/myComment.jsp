<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/pg_header.jsp"%>

<div class="col-lg-9 ftco-animate fadeInUp ftco-animated" style="margin-top:30px; border-left: 0px !important;">
	<div class="pagetitle" style="margin-left:20px">
		<span>게시물</span>
		<h2 style="font-weight: bolder;">내가 쓴 댓글</h2>
	</div>
	<div class="card" style="margin:20px; margin-top: 0px;">
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

<%@include file= "./../common/footer.jsp" %>

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