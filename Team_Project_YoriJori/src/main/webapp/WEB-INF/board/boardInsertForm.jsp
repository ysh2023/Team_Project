<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
.drop-zone {
	padding: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	font-family: "Quicksand", sans-serif;
	font-weight: 500;
	font-size: 20px;
	cursor: pointer;
	color: #cccccc;
	border: 4px dashed #009578;
	border-radius: 10px;
}

.drop-zone--over {
	border-style: solid;
}

.drop-zone__input {
	display: none;
}

.drop-zone__thumb {
	width: 100%;
	height: 100%;
	border-radius: 10px;
	overflow: hidden;
	background-color: #cccccc;
	background-size: cover;
	position: relative;
}

.drop-zone__thumb::after {
	content: attr(data-label);
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	padding: 5px 0;
	color: #ffffff;
	/* background: rgba(0, 0, 0, 0.75); */
	font-size: 14px;
	text-align: center;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	var cookProcessIndex = 1;
	/* 조리과정 추가  */
	function addCookProcess() {

		$('#cookProcess')
				.append('<div class="row" id='+cookProcessIndex+'><div class="col-md-12"><label for="bod_content">조리과정 </label><div class="row"><div class="col-md-6"><textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea></div><div class="col-md-6" style="display : flex; width:100%; justify-content: space-between;"><div  class="drop-zone" style="width:100%;"><span class="drop-zone__prompt">Drop file here or click to upload</span> <input id=drop'+cookProcessIndex+' type="file" name="upload" class="drop-zone__input"></div><input class="btn btn-danger " style="width:80px; height:50px;" type="button" value="삭제" onclick="removeCookProcess(\''
						+ cookProcessIndex + '\')"></div></div></div></div>'
						/* '<div class="row" id='+cookProcessIndex+'><div class="col-md-6"> <label for="country">조리과정 </label> <textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea> </div> <div  class="col-md-6"><input type="file" name="upload"><input class="btn btn-danger py-2 px-2" type="button" value="삭제" onclick="removeCookProcess(\''
								+ cookProcessIndex + '\')"></div>	</div>' */
								);
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
					'<font size="2" color="red">식재료를 추가해주세요</font>');
			isCheck = false;
		}

		if (isCheck) {
			f.submit();
		}
	}

	var addIngredientIndex = 0;

	/* 식재료 추가 */
	function addIngredient() {
		if ($('input[name=inputIngName]').val().length == 0) {
			alert('식재료를 입력하세요');
			$('input[name=inputIngName]').focus();
		} else {
			$("#selectIngName")
					.append(
							"<span  style='border: 1px solid gray; border-radius: 20px; padding: 5px; margin:5px;' id='addingredient"+addIngredientIndex+"'><input type='hidden' name='big_name' value='"
									+ $('input[name=inputIngName]').val()
									+ "'>재료명 : "
									+ $('input[name=inputIngName]').val()
									+ "<input type='hidden' name='big_amount' value='"
									+ ($('input[name=inputBig]').val() == "" ? null
											: $('input[name=inputBig]').val())
									+ "'> 용량 : "
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
									+ "'><span style='cursor:pointer;' onclick='removeIngredient(\""
									+ addIngredientIndex
									+ "\")'>X</span></span>");
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



<body onload="uploadEvent()">
	<section class="ftco-section " style="min-width: 500px;">
		<div class="container">
			<div class="cart-total mb-3">

				<h2>나만의 레시피 공유하기</h2>
				<p>본인만의 레시피를 등록하면 다른 사람들과 공유할 수 있습니다</p>
				<form action="write.board" method="post" class="info" name="f" enctype="multipart/form-data">



					<div align="center">
						<div class="drop-zone" id="zone" style="width: 400px; height: 300px;">
							<span class="drop-zone__prompt" style="justify-content: space-between;">레시피 대표 사진을 끌어다 놓거나 <br>여기를 클릭해서 업로드하세요
							</span> <input type="file" name="bod_image_upload" class="drop-zone__input">
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
								<label for="title">* 요리명 <span id="titleMsg"></span></label><input type="text" name="title" class="form-control text-left px-3" placeholder="요리제목을 입력하세요">
							</div>
							<!-- <div class="col-md-6">
								<input type="file" name="bod_image_upload">
							</div> -->
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
						<div class="row">
							<div class="col-md-6">
								<label for="category">* 카테고리 <span id="categoryMsg"></span></label> <select name="category" class="form-control text-left px-3">
									<option value="">카테고리를 선택해주세요
										<c:forEach items="${categorys }" var="category">
											<option>${category }
										</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<label for="tags">해쉬태그 </label> <input name="tags" type="text" class="form-control text-left px-3" placeholder="태그를 작성해주세요 예 : #김 #밥">

							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-6">
										<label for="inputIngName">* 식재료 <span id="ingredientMsg"></span>
										</label> <input name="inputIngName" id="inputIngName" list="ingNameList" class="form-control " placeholder="검색 후 추가 목록에 없으면 작성 후 추가">
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
							<div class="col-md-12" id="selectIngName"></div>
						</div>
					</div>
					<div class="form-group">
						<div id="cookProcess">
							<div class="row">
								<div class="col-md-12">
									<label for="bod_content">조리과정 </label>
									<div class="row">
										<div class="col-md-6">
											<textarea name="bod_content" cols="40" rows="10" style="resize: none;" class="form-control text-left px-3" placeholder=""></textarea>
										</div>
										<div class="col-md-6">
											<div class="drop-zone" style="width: 100%; height: 100%; min-height: 200px;">
												<span class="drop-zone__prompt">이미지를 끌어다놓거나 클릭하세요</span> <input type="file" id="f1" name="upload" class="drop-zone__input">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input class="btn btn-primary col-md-12 py-3" id="addCookProcessBtn" type="button" value="조리과정추가" onclick="addCookProcess()">
					</div>
					<div class="btn btn-primary py-3 px-4" onclick="submitHandle()">레시피 등록하기</div>
				</form>
			</div>
		</div>
	</section>

</body>
<script>


document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
	const dropZoneElement = inputElement.closest(".drop-zone");
	//const dropZoneElement = document.querySelectorAll(".drop-zone");
	console.log(inputElement);
	
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


	function uploadEvent(id){
		var sel = '#drop' + id 
		console.log(sel)
	console.log(document.querySelector('#drop3'));
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
	function updateThumbnail(dropZoneElement, file) {
	  let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");

	  // First time - remove the prompt
	  if (dropZoneElement.querySelector(".drop-zone__prompt")) {
	    dropZoneElement.querySelector(".drop-zone__prompt").remove();
	  }

	  // First time - there is no thumbnail element, so lets create it
	  if (!thumbnailElement) {
	    thumbnailElement = document.createElement("div");
	    thumbnailElement.classList.add("drop-zone__thumb");
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
	      console.log("없음");
	  }
	}
	
</script>


</html>