<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<%@include file="./../common/admin_header.jsp"%>
<style>
</style>
<body>

	<main id="main" class="main">


		<div class="pagetitle">
			<h1>사용자 게시글</h1>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<table class="table datatable" style="max-height: 930px; overflow: auto;">
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
									<c:forEach var="i" items="${lists}">
										<tr>
											<td scope="row" style="width: full; text-overflow: ellipsis; white-space: nowrap;">${i.bodNum}</td>
											<td><div title="${i.title}" style="width: 10vw; text-overflow: ellipsis; white-space: normal; overflow: hidden; line-height: 1.2; height: 60px; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">
													<a href="boardDetail.board?bodNum=${i.bodNum }" target="_blank">${i.title} </a>
												</div></td>
											<td>${i.servings}</td>
											<td>${i.time}</td>
											<td>${i.category}</td>
											<td><div title="${i.tags}" style="width: 8vw; text-overflow: ellipsis; white-space: normal; overflow: hidden; line-height: 1.2; height: 60px; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">${i.tags}</div></td>
											<td>${i.id}</td>
											<td><img src="<%=resourcesPath%>/images/${i.bodImage != '' ? i.bodImage : 'noimage.png' }" width="60" height="60"></td>
											<td>${i.rec == null ? '0':i.rec}</td>
											<td><a id="deleteBoard" href="deleteBoard.am?bodNum=${i.bodNum}" onclick="return deleteBoard(${i.bodNum})">삭제</a></td>
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

<%@include file="./../common/admin_footer.jsp"%>
<script>
	
	function deleteBoard(bodNum){
		var isOk = confirm(bodNum + '번 게시글을 삭제하시겠습니까?');
		if(!isOk){
			return false;
		}
	}

	$('#boardViewBackground').click(function(e){
		console.log(e.target.id);
		if(e.target.id=='boardViewBackground' || e.target.id=='close'){
				$('#boardViewBackground').css('display','none');			
		}
	});
</script>

</html>