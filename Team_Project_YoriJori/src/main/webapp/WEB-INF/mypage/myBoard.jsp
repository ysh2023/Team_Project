<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="./../common/pg_header.jsp"%>

<div class="col-lg-9 ftco-animate fadeInUp ftco-animated" style="margin-top:30px; border-left: 0px !important;">
	<div class="pagetitle" style="margin-left:20px">
		<span>게시물</span>
		<h2 style="font-weight: bolder;">내가 쓴 게시물</h2>
	</div>
	<div class="card" style="margin:20px; margin-top: 0px;">
		<div class="card-body" style="overflow: scroll; max-height: 930px;">
			<table class="table datatable">
			<thead>
				<tr>
					<th scope="col" style="width: 50px;">번호</th>
					<th scope="col">제목</th>
					<th scope="col">인분</th>
					<th scope="col">조리시간</th>
					<th scope="col">카테고리</th>
					<th scope="col">태그</th>
					<th scope="col">ID</th>
					<th scope="col">요리 이미지</th>
					<th scope="col">추천 수</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(boardList)==0 }">
					<tr>
						<td colspan="10">작성한 게시물이 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="i" items="${boardList}">
					<tr>
						<td scope="row" style="width: full; text-overflow: ellipsis; white-space: nowrap;">${i.bodNum}</td>
						<td><div title="${i.title}" style="width: 10vw; text-overflow: ellipsis; white-space: normal; overflow: hidden; line-height: 1.5; height: 60px; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">
							<a href="boardDetail.board?bodNum=${i.bodNum }" target="_blank">${i.title} </a>
						</div></td>
						<td>${i.servings}</td>
						<td>${i.time}</td>
						<td>${i.category}</td>
						<td><div title="${i.tags}" style="width: 8vw; text-overflow: ellipsis; white-space: normal; overflow: hidden; line-height: 1.5; height: 60px; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">${i.tags}</div></td>
						<td>${i.id}</td>
						<td><img src="<%=resourcesPath%>/images/${i.bodImage != '' ? i.bodImage : 'noimage.png' }" width="60" height="60"></td>
						<td>${i.rec == null ? '0':i.rec}</td>
						<td><a id="deleteBoard" href="deleteBoard.mp?bodNum=${i.bodNum}" onclick="return deleteBoard(${i.bodNum})">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</div>
</div>

<%@include file= "./../common/footer.jsp" %>

<script>
	
	function deleteBoard(bodNum){
		var isOk = confirm(bodNum + '번 게시글을 삭제하시겠습니까?');
		if(!isOk){
			return false;
		}
	}
</script>
<script src="<%=request.getContextPath()%>/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/tinymce/tinymce.min.js"></script>

<!-- Template Main JS File -->
<script src="<%=request.getContextPath()%>/resources/js/main_am.js"></script>
</html>