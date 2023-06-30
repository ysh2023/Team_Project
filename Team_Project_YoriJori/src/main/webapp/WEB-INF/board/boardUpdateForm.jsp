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

		
		
	
	var cookProcessIndex = ${fn:length(boardContentList)}+1;
	/* 조리과정 추가  */
	function addCookProcess() {

		$('#cookProcess')
				.append(
						'<div class="row" id='+cookProcessIndex+'><div class="col-md-12"><div class="pt-3 pb-2"><label for="bod_content" name="processLabel">조리과정 </label><input class="btn btn-danger " style="margin-left: 20px;width:60px; height:40px;" type="button" value="삭제" onclick="removeCookProcess(\''+ cookProcessIndex + '\')"></div><div class="row"><div class="col-md-6"><textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea></div><div class="col-md-6" style="display: flex; justify-content: center;"><div  class="drop-zone" style="width: 400px; height: 284px; position: relative;"><span class="drop-zone__prompt">이미지를 끌어다놓거나 클릭하세요</span> <input id=drop'+cookProcessIndex+' type="file" name="upload" class="drop-zone__input"><svg xmlns="http://www.w3.org/2000/svg" style="stroke: red; cursor: pointer; margin-left: 10px; position: absolute; top: 0px; right: 0px; display: none; z-index: 2;" width="40" height="40" fill="currentColor" class="bi bi-x-circle close__thumb" viewBox="-1 -1 18 18"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" /><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /></svg></div></div></div></div></div>');
		uploadEvent(cookProcessIndex);
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
		
		if(document.getElementById('selectIngName').childElementCount==0	){
			$('#ingredientMsg').html(
					'<font >식재료를 추가해주세요</font>');
			$('#inputIngName').focus();
			isCheck = false;
		}else{
			$('#ingredientMsg').html('');			
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
							"<div  style='border: 1px solid gray; border-radius: 80px; padding: 10px; margin:10px;' id='addingredient"+addIngredientIndex+"'><input type='hidden' name='big_name' value='"
							+ $('input[name=inputIngName]').val()
							+ "'>식재료 : "
							+ $('input[name=inputIngName]').val()
							+ "<input type='hidden' name='big_amount' value='"
							+ ($('input[name=inputBig]').val() == "" ? null
									: $('input[name=inputBig]').val())
							+ "'> / 용량 : "
							+ $('input[name=inputBig]').val()
							+ "<input type='hidden' name='ing_num' value='"
							+ ($(
									'#ingNameList option[value="'
											+ $(
													'input[name=inputIngName]')
													.val() + '"]')
									.data('value') == null ? null
									: $(
											'#ingNameList option[value="'
													+ $(
															'input[name=inputIngName]')
															.val()
													+ '"]').data(
											'value'))
							+ "'><svg xmlns='http://www.w3.org/2000/svg' style='stroke : red; cursor:pointer; margin-left:10px; '  width='25' height='25' fill='currentColor' class='bi bi-x-circle' viewBox='-1 -1 18 18' onclick='removeIngredient(\""
							+ addIngredientIndex
							+ "\")'><path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/></svg></div>");
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
								<div class="row">
									<div class="col-md-12">
										<label for="title" onclick="lodings()">* 요리명 <span id="titleMsg"></span></label><input type="text" name="title" value="${board.title }" class="form-control text-left px-3" placeholder="요리제목을 입력하세요">
									</div>
								</div>
								<div class="row pt-3">
									<div class="col-md-12">
										<label for="servings">몇인분 </label> <input type="number" name="servings" value="${board.servings }" class="form-control text-left px-3" placeholder="예 : 1">
									</div>
								</div>
								<div class="row pt-3">
									<div class="col-md-12">
										<label for="time">조리시간 </label> <input type="number" name="time" value="${board.time }" class="form-control text-left px-3" placeholder="조리시간(단위 : 분) 예 : 10">
									</div>
								</div>
							</div>
							<div class="col-md-6" style="display: flex; justify-content: center;">
								<input type="hidden" name="prev_bod_image" value="${board.bodImage }"> <input type="hidden" name="prev_bod_origin" value="${board.bodOrigin }">
								<div class="drop-zone" id="zone" style="width: 400px; height: 300px; position: relative;">
									<span class="drop-zone__prompt" style="justify-content: space-between;">레시피 대표 사진을 끌어다 놓거나 <br>여기를 클릭해서 업로드하세요
									</span> <input type="file" name="bod_image_upload" class="drop-zone__input" id="bod_image_upload">
									<svg xmlns='http://www.w3.org/2000/svg' style='stroke: red; cursor: pointer; margin-left: 10px; position: absolute; top: 0px; right: 0px; display: none; z-index: 2;' width='40' height='40' fill='currentColor' class='bi bi-x-circle close__thumb' viewBox='-1 -1 18 18'>
										<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z' />
										
										<path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z' /></svg>
								</div>

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
										<label for="inputIngName">* 식재료 </label><span class="err" id="ingredientMsg"></span> <input name="inputIngName" id="inputIngName" list="ingNameList" class="form-control " placeholder="검색 후 추가 목록에 없으면 작성 후 추가">
										<datalist id="ingNameList">
											<c:forEach items="${ingredients }" var="ingredient">
												<option data-value="${ingredient.ingnum}" value="${ingredient.ingname}">${ingredient.ingnum}</option>
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
							<div class="col-md-12" id="selectIngName" style="height: auto; display: flex; flex-wrap: wrap;">
								<c:forEach items="${boardIngredientList }" var="boardIngredientBean" varStatus="status">
									<%-- 		<span style='border: 1px solid gray; border-radius: 20px; padding: 5px; margin: 5px;'
										id="addingredient${status.index }"><input type='hidden' name='big_name'
										value="${boardIngredientBean.bigName }"><input type='hidden' name='big_amount'
										value="${boardIngredientBean.bigAmount }">재료명 : ${boardIngredientBean.bigName} /
										용량 : ${boardIngredientBean.bigAmount }<input type='hidden' name='ing_num'
										value="${boardIngredientBean.ingNum }"><span style='cursor: pointer;'
										onclick='removeIngredient(${status.index})'>X</span></span>
 --%>
									<div style="border: 1px solid gray; border-radius: 80px; padding: 10px; margin: 10px;" id="addingredient${status.index }">
										<input type="hidden" name="big_name" value=" ${boardIngredientBean.bigName }"> 식재료 : ${boardIngredientBean.bigName }<input type="hidden" name="big_amount" value="${boardIngredientBean.bigAmount }"> / 용량 : ${boardIngredientBean.bigAmount == 'null' ? '' : boardIngredientBean.bigAmount }<input type="hidden" name="ing_num" value="${boardIngredientBean.ingNum == null ? 'null' : boardIngredientBean.ingNum  }">
										<svg xmlns="http://www.w3.org/2000/svg" style="stroke: red; cursor: pointer; margin-left: 10px;" width="25" height="25" fill="currentColor" class="bi bi-x-circle" viewBox="-1 -1 18 18" onclick="removeIngredient(${status.index})">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
											<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" /></svg>
									</div>

								</c:forEach>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div id="cookProcess">
							<c:if test="${fn:length(boardContentList) == 0 }">
								<div class="row">
									<div class="col-md-12">
										<label for="bod_content">조리과정</label>
										<div class="row">
											<div class="col-md-6">
												<textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea>
											</div>
											<div class="col-md-6" style="display: flex; justify-content: center;">
												<input type="hidden" name="prev_image" value=""> <input type="hidden" name="originImage" value="">
												<div class="drop-zone" style="width: 400px; height: 284px; position: relative;">
													<span class="drop-zone__prompt">이미지를 끌어다놓거나 클릭하세요</span> <input type="file" id="f1" name="upload" class="drop-zone__input">
													<svg xmlns='http://www.w3.org/2000/svg' style='stroke: red; cursor: pointer; margin-left: 10px; position: absolute; top: 0px; right: 0px; display: none; z-index: 2;' width='40' height='40' fill='currentColor' class='bi bi-x-circle close__thumb' viewBox='-1 -1 18 18'>
										<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z' />
										
										<path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z' /></svg>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<c:forEach items="${boardContentList }" var="boardContentBean" varStatus="status">

								<div class="row" id="${status.index }">
									<div class="col-md-12">

										<div class="pt-3 pb-2">
											<label for="bod_content">조리과정</label>
											<c:if test="${status.index>0 }">
												<input class="btn btn-danger " style="margin-left: 20px; width: 60px; height: 40px;" type="button" value="삭제" onclick="removeCookProcess(${status.index})">
											</c:if>
										</div>
										<div class="row">
											<div class="col-md-6">
												<textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder="">${boardContentBean.bodContent }</textarea>

											</div>
											<div class="col-md-6" style="display: flex; justify-content: center;">


												<input type="hidden" name="prev_image" value="${boardContentBean.image == null ? '' : boardContentBean.image }"> <input type="hidden" name="originImage" value="${boardContentBean.originImage == null ? '' : boardContentBean.originImage }">
												<div class="drop-zone" style="width: 400px; height: 284px;position: relative;">
													<span class="drop-zone__prompt">이미지를 끌어다놓거나 클릭하세요</span> <input type="file" id="f1" name="upload" class="drop-zone__input">
													<svg xmlns='http://www.w3.org/2000/svg' style='stroke: red; cursor: pointer; margin-left: 10px; position: absolute; top: 0px; right: 0px; display: none; z-index: 2;' width='40' height='40' fill='currentColor' class='bi bi-x-circle close__thumb' viewBox='-1 -1 18 18'>
										<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z' />
										
										<path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z' /></svg>
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
<script>


	// 이미지 불러오는 처리
	var contentListIndex = 0;
	var cnt = ${fn:length(boardContentList)};
	
	document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
		
	  	// 대표 이미지 불러오기
		if(contentListIndex==0){
			if('${board.bodImage}' != ''){			
				const dz = inputElement.closest(".drop-zone");
		
				let tb = dz.querySelector(".drop-zone__thumb");
				if (dz.querySelector(".drop-zone__prompt")) {
					dz.querySelector(".drop-zone__prompt").style.display = 'none';
				}
				
				if(!tb){
					tb = document.createElement("div");
					tb.classList.add("drop-zone__thumb");
				
			  		let deleteButton = dz.querySelector(".close__thumb");
				    deleteButton.style.display="inline-block";
				    deleteButton.addEventListener("click", (e) => {
				    	e.stopPropagation();
					    isBoardUpload = false;
			    		tb.remove();
			    		dz.querySelector(".drop-zone__prompt").style.display = 'block';
				   	 	deleteButton.style.display="none";
				   	 	inputElement.type = "radio";
				   	 	inputElement.type = "file";
			    	});
					
				    dz.appendChild(tb);
				}
				
				tb.dataset.label = '${board.bodOrigin}';
				tb.style.backgroundImage = `url(<%=resourcesPath%>/images/${board.bodImage})`
			}
		}
		
	  	// 조리과정 이미지 불러오기
		if( contentListIndex > 0){
			var imgIndex = contentListIndex-1;
			var imgsrc;
			var originsrc;
			if(f.prev_image.length!=null){
				imgsrc = f.prev_image[imgIndex].value;
				originsrc= f.originImage[imgIndex].value;		
				console.log(originsrc+"오리진 이미지1");
			}else{
				imgsrc = f.prev_image.value;
				originsrc = f.originImage.value;								
				console.log(originsrc+"오리진 이미지2");
			}
			
			if(imgsrc!=''){		
				const dz = inputElement.closest(".drop-zone");
		
				let tb = dz.querySelector(".drop-zone__thumb");
				if (dz.querySelector(".drop-zone__prompt")) {
					dz.querySelector(".drop-zone__prompt").style.display = 'none';
				}
				
				if(!tb){
					tb = document.createElement("div");
					tb.classList.add("drop-zone__thumb");
					
					let deleteButton = dz.querySelector(".close__thumb");
				    deleteButton.style.display="inline-block";
				    deleteButton.addEventListener("click", (e) => {
				    	e.stopPropagation();
					    isBoardUpload = false;
			    		tb.remove();
			    		dz.querySelector(".drop-zone__prompt").style.display = 'block';
				   	 	deleteButton.style.display="none";
				   	 	inputElement.type = "radio";
				   	 	inputElement.type = "file";
			    	});
					
				    dz.appendChild(tb);
				}
	
				tb.dataset.label = originsrc;
			
				var url = `url(<%=resourcesPath%>/images/`+imgsrc;
				tb.style.backgroundImage = url; 
			}
		} 
		contentListIndex++;
	});
	
</script>

<script>
	// 전체 DragAndDrop 이벤트 처리
	document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
		const dropZoneElement = inputElement.closest(".drop-zone");
		
		
		var inputClick = (e) => {
			inputElement.click();
		}
	
		/* dropZoneElement.removeEventListener('click', inputClick); */
		/* inputElement.addEventListener("click", (e)=>{
			dropZoneElement.removeEventListener('click',inputClick);
				console.log("삭제");
		}); */
		
		dropZoneElement.addEventListener("click",inputClick);
	
	 	inputElement.addEventListener("change", (e) => {
		    if (inputElement.files.length) {
		    	updateThumbnail(dropZoneElement, inputElement.files[0]);
		    }
	  	});
	
	  	dropZoneElement.addEventListener("dragover", (e) => {
		    e.preventDefault();
		    dropZoneElement.classList.add("drop-zone--over");
	  	});
	
	  	["dragleave", "dragend"].forEach((type) => {
	    	dropZoneElement.addEventListener(type, (e) => {
	    		dropZoneElement.classList.remove("drop-zone--over");
	    	});
	  	});
	
	  	dropZoneElement.addEventListener("drop", (e) => {
	    	e.preventDefault();
	
	    	if (e.dataTransfer.files.length) {
		      	inputElement.files = e.dataTransfer.files;
		      	updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
	    	}
	
	    	dropZoneElement.classList.remove("drop-zone--over");
	  	});
	});

	// 조리과정 추가 시 이벤트 처리
	function uploadEvent(id){
		var sel = '#drop' + id 
		document.querySelectorAll("#drop" + id).forEach((inputElement) => {
			const dropZoneElement = inputElement.closest(".drop-zone");
			//const dropZoneElement = document.querySelectorAll(".drop-zone");
			console.log(inputElement);
			
			var inputClick = (e) => {
				inputElement.click();
			}
	
			/* dropZoneElement.removeEventListener('click', inputClick); */
			
			dropZoneElement.addEventListener("click",inputClick);
	
		  	inputElement.addEventListener("change", (e) => {
		    	if (inputElement.files.length) {
		    		updateThumbnail(dropZoneElement, inputElement.files[0]);
		    	}
		  	});
	
		  	dropZoneElement.addEventListener("dragover", (e) => {
		    	e.preventDefault();
		    	dropZoneElement.classList.add("drop-zone--over");
		  	});
	
		  	["dragleave", "dragend"].forEach((type) => {
		    	dropZoneElement.addEventListener(type, (e) => {
		    	  	dropZoneElement.classList.remove("drop-zone--over");
		    	});
		  	});
	
		  	dropZoneElement.addEventListener("drop", (e) => {
		    	e.preventDefault();
	
			    if (e.dataTransfer.files.length) {
			    	inputElement.files = e.dataTransfer.files;
			      	updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
			    }
	
		    	dropZoneElement.classList.remove("drop-zone--over");
		  	});
		});
	}
	
	/**
	 * Updates the thumbnail on a drop zone element.
	 *
	 * @param {HTMLElement} dropZoneElement
	 * @param {File} file
	 */
	 // 이미지 등록하는 함수
	function updateThumbnail(dropZoneElement, file) {
		 
		let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");

	  	// First time - remove the prompt
 	 	if (dropZoneElement.querySelector(".drop-zone__prompt")) {
	    	dropZoneElement.querySelector(".drop-zone__prompt").style.display = 'none';
	  	}

	  	// First time - there is no thumbnail element, so lets create it
	  	if (!thumbnailElement) {
		    thumbnailElement = document.createElement("div");
		    thumbnailElement.classList.add("drop-zone__thumb");
		   
		    let deleteButton = dropZoneElement.querySelector(".close__thumb");
		    deleteButton.style.display="inline-block";
		    deleteButton.addEventListener("click", (e) => {
		    	e.stopPropagation();
		    	isBoardUpload = false;
		    	thumbnailElement.remove();
		   	 	dropZoneElement.querySelector(".drop-zone__prompt").style.display = 'block';
		   	 	 deleteButton.style.display="none";
		   	 	inputElement.type = "radio";
		   	 	inputElement.type = "file";
		    });
		    dropZoneElement.appendChild(thumbnailElement);
  		}

	  	thumbnailElement.dataset.label = file.name;

	  	// Show thumbnail for image files
	  	if (file.type.startsWith("image/")) {
	    	const reader = new FileReader();

	    	reader.readAsDataURL(file);
	    	reader.onload = () => {
		      	var uri = ${'reader.result'};
		      	thumbnailElement.style.backgroundImage = 'url('+uri+')';
		      	//thumbnailElement.style.backgroundImage = `url('${reader.result}')`;
	    	};
	  	} else {
	    	thumbnailElement.style.backgroundImage = null;
	  	}
	}
</script>


<%@ include file="../common/footer.jsp"%>

</html>