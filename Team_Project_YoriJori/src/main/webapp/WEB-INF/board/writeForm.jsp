<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	var cookProcessIndex = 1;
	function addCookProcess() {

		$('#cookProcess')
				.append(
						'<div class="row" id='+cookProcessIndex+'><div class="col-md-6"> <label for="country">조리과정 </label> <textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea> </div> <div  class="col-md-6"><input type="file" name="upload"><input class="btn btn-danger py-2 px-2" type="button" value="삭제" onclick="removeCookProcess(\''
								+ cookProcessIndex + '\')"></div>	</div>');
		cookProcessIndex++;

	}

	function removeCookProcess(id) {
		$('#' + id).remove();
	}

	function submitHandle() {
		var isCheck = true;
		if ($('input[name=title]').val().length == 0) {
			$('#titleMsg')
					.html('<font size="2" color="red">요리제목을 입력하세요</font>');
			isCheck = false;
			$('input[name=title]').focus();
		} else {
			$('#titleMsg').html('');
		}

		if ($('select[name=category]').val().length == 0) {
			$('#categoryMsg').html(
					'<font size="2" color="red">카테고리를 선택하세요</font>');
			isCheck = false;
			$('select[name=category]').focus();
		} else {
			$('#categoryMsg').html('');
		}

		if (isCheck) {
			f.submit();
		}
	}
</script>
<body>

	<section class="ftco-section">
		<div class="container">
			<div class="cart-total mb-3">
				<h2>나만의 레시피 공유하기</h2>
				<p>본인만의 레시피를 등록하면 다른 사람들과 공유할 수 있습니다</p>
				<form commandName="boardFormBean" action="write.board" method="post" class="info" name="f" enctype="multipart/form-data">
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label for="title">* 요리명 <span id="titleMsg"></span></label><input type="text" name="title" class="form-control text-left px-3" placeholder="요리제목을 입력하세요">
							</div>
							<div class="col-md-6">
								<input type="file" name="bod_image_upload">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label for="servings">몇인분 </label> <input type="number" name="servings" class="form-control text-left px-3" placeholder="예 : 1">
							</div>
							<div class="col-md-6">
								<label for="time">조리시간 </label> <input type="number" name="time" class="form-control text-left px-3" placeholder="조리시간(단위 : 분) 예 : 10">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="category">* 카테고리 <span id="categoryMsg"></span></label> <select name="category" class="form-control text-left px-3">
							<option value="">카테고리를 선택해주세요
								<c:forEach items="${categorys }" var="category">
									<option>${category }
								</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="tags">해쉬태그 </label> <input name="tags" type="text" class="form-control text-left px-3" placeholder="태그를 작성해주세요 예 : #김 #밥">
					</div>
					<div class="form-group">
						<label for="big_name">식재료 </label> <input name="big_name" type="text" class="form-control text-left px-3" placeholder="">
					</div>
					<div class="form-group">
						<div id="cookProcess">
							<div class="row">
								<div class="col-md-6">
									<label for="bod_content">조리과정 </label>
									<textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea>
								</div>
								<div class="col-md-6">
									<input type="file" name="upload">
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input class="btn btn-primary col-md-12" id="addCookProcessBtn" type="button" value="조리과정추가" onclick="addCookProcess()">
					</div>
					<div class="btn btn-primary py-3 px-4" onclick="submitHandle()">레시피 등록하기</div>
				</form>
			</div>
		</div>
	</section>

	<!-- 두번째 디자인 -->
	<!-- <section class="ftco-section">
		<div class="container">
			<div class="cart-total mb-3">
				<form action="#" class="p-5 bg-light" name="cookForm">
					<div class="form-group">
						<label for="name">Name *</label> <input type="text" class="form-control" id="name">
					</div>
					<div class="form-group">
						<label for="email">Email *</label> <input type="email" class="form-control" id="email">
					</div>
					<div class="form-group">
						<label for="website">Website</label> <input type="url" class="form-control" id="website">

					</div>

					<div class="form-group">
						<label for="message">Message</label>
						<textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
					</div>
				</form>
			</div>
		</div>
	</section> -->
</body>
</html>