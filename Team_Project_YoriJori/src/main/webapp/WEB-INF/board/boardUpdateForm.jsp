<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	var cookProcessIndex = ${fn:length(boardContent)}+1;
	/* 조리과정 추가  */
	function addCookProcess() {

		$('#cookProcess')
				.append(
						'<div class="row" id='+cookProcessIndex+'><div class="col-md-6"> <label for="country">조리과정 </label> <textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea> </div> <div  class="col-md-6"><input type="file" name="upload"><input class="btn btn-danger py-2 px-2" type="button" value="삭제" onclick="removeCookProcess(\''
								+ cookProcessIndex + '\')"></div>	</div>');
		cookProcessIndex++;

	}

	/* 조리과정 삭제  */
	function removeCookProcess(id) {
		$('#' + id).remove();
	}

	/* 유효성 검사  */
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

	var addIngredientIndex = ${fn:length(boardIngredientList)};

	/* 식재료 추가 */
	function addIngredient() {
		if($('input[name=inputIngName]').val().length==0){
			alert('식재료를 입력하세요');
			$('input[name=inputIngName]').focus();
		}else{
			$("#selectIngName")
					.append(
							"<span  style='border: 1px solid gray; border-radius: 20px; padding: 5px; margin:5px;' id='addingredient"+addIngredientIndex+"'><input type='hidden' name='big_name' value='"
									+ $('input[name=inputIngName]').val()
									+ "'>재료명 : "
									+ $('input[name=inputIngName]').val()
									+ "<input type='hidden' name='big_amount' value='"
									+ ($('input[name=inputBig]').val() == "" ? null : $('input[name=inputBig]').val())
									+ "'> 용량 : "
									+ $('input[name=inputBig]').val()
									+ "<input type='hidden' name='ing_num' value='"
									+ ($('#ingNameList option[value="'+$('input[name=inputIngName]').val()+'"]').data('value') == null ? null:$('#ingNameList option[value="'+$('input[name=inputIngName]').val()+'"]').data('value'))
									+ "'><span style='cursor:pointer;' onclick='removeIngredient(\""
									+ addIngredientIndex + "\")'>X</span></span>");
			addIngredientIndex++;
			$('input[name=inputIngName]').val("");
			$('input[name=inputBig]').val("");
		}
	}

	/* 식재료 삭제 */
	function removeIngredient(removeIndex) {
		$('#addingredient' + removeIndex).remove();
	}
</script>

<body>
	<section class="ftco-section">
		<div class="container">
			<div class="cart-total mb-3">
				<h2>나만의 레시피 공유하기</h2>
				<p>본인만의 레시피를 등록하면 다른 사람들과 공유할 수 있습니다</p>
				<form action="boardUpdate.board" method="post" name="f" enctype="multipart/form-data">
					<input type="hidden" name="bod_num" value="${board.bodNum }">
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label for="title">* 요리명 <span id="titleMsg"></span></label><input type="text" name="title" value="${board.title }" class="form-control text-left px-3" placeholder="요리제목을 입력하세요">
							</div>
							<div class="col-md-6">
								<input type="hidden" name="prev_bod_image" value="${board.bodImage }"> <img src="<%=resourcesPath%>/images/${board.bodImage == null ? 'noimage.png' : board.bodImage}" width="300" height="200"> <input type="file" name="bod_image_upload">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label for="servings">몇인분 </label> <input type="number" name="servings" value="${board.servings }" class="form-control text-left px-3" placeholder="예 : 1">
							</div>
							<div class="col-md-6">
								<label for="time">조리시간 </label> <input type="number" name="time" value="${board.time }" class="form-control text-left px-3" placeholder="조리시간(단위 : 분) 예 : 10">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label for="category">* 카테고리 <span id="categoryMsg"></span></label> <select name="category" class="form-control text-left px-3">
									<option value="">카테고리를 선택해주세요
										<c:forEach items="${categorys }" var="category">
											<option <c:if test="${board.category eq category }">selected</c:if>>${category }
										</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<label for="tags">해쉬태그 </label> <input name="tags" type="text" value="${board.tags }" class="form-control text-left px-3" placeholder="태그를 작성해주세요 예 : #김 #밥">

							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-6">
										<label for="inputIngName">식재료 </label> <input name="inputIngName" id="inputIngName" list="ingNameList" class="form-control " placeholder="검색 후 추가 목록에 없으면 작성 후 추가">
										<datalist id="ingNameList">
											<c:forEach items="${ingredients }" var="ingredient">
												<option data-value="${ingredient.ingNum}" value="${ingredient.ingName}">${ingredient.ingNum}</option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-md-6">
										<label for="inputBig">용량</label>
										<div class="row">
											<div class="col-md-9">
												<input type="text" name="inputBig" class="form-control text-left px-3" placeholder="식재료 양을 적어주세요">

											</div>
											<div class="col-md-3">
												<input class="btn btn-primary px-4 py-3" type="button" value="추가" onclick="addIngredient()">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12" id="selectIngName">
								<c:forEach items="${boardIngredientList }" var="boardIngredientBean" varStatus="status">
									<span style='border: 1px solid gray; border-radius: 20px; padding: 5px; margin: 5px;' id="addingredient${status.index }"><input type='hidden' name='big_name' value="${boardIngredientBean.bigName }"><input type='hidden' name='big_amount' value="${boardIngredientBean.bigAmount }">재료명 : ${boardIngredientBean.bigName} / 용량 : ${boardIngredientBean.bigAmount }<input type='hidden' name='ing_num' value="${boardIngredientBean.ingNum }"><span style='cursor: pointer;' onclick='removeIngredient(${status.index})'>X</span></span>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div id="cookProcess">
							<c:if test="${fn:length(boardContentList) == 0 }">
								<div class="row">
									<div class="col-md-12">
										<label for="bod_content">조리과정 1번 </label>
										<div class="row">
											<div class="col-md-6">
												<textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-8">
														<input type="file" name="upload">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<c:forEach items="${boardContentList }" var="boardContentBean" varStatus="status">

								<div class="row" id="${status.index }">
									<div class="col-md-12">
										<label for="bod_content">조리과정 </label>
										<div class="row">
											<div class="col-md-6">
												<textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder="">${boardContentBean.bodContent }</textarea>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-8">

														<div>
															<img style="width: 200px; height: 150px;" alt="조리과정이미지" src="<%=resourcesPath%>/images/${boardContentBean.image != null ? boardContentBean.image : 'noimage.png'}">
														</div>
														<input type="text" name="prev_image" value="${boardContentBean.image == null ? '' : boardContentBean.image }"> <input type="file" name="upload">
														<input type="text" value="${boardContentBean.image }">
													</div>
													<div class="col-md-4">
														<c:if test="${status.index>0 }">
															<input class="btn btn-danger py-2 px-2" type="button" value="삭제" onclick="removeCookProcess(${status.index})">
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<div class="form-group">
						<input class="btn btn-primary col-md-12 py-3" id="addCookProcessBtn" type="button" value="조리과정추가" onclick="addCookProcess()">
					</div>
					<div class="btn btn-primary py-3 px-4" onclick="submitHandle()">레시피 수정하기</div>
				</form>
			</div>
		</div>
	</section>
	<hr>
	<br>
	<br>
</body>
<%@ include file="../common/footer.jsp"%>
</html>