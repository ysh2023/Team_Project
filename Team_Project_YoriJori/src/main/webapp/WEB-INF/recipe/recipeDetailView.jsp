<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		if('${msg}' == 'noid'){
			$('#heart').html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'><path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/></svg>");
		}
		if('${msg}' == 'yes'){
			$('#heart').html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-heart-fill' viewBox='0 0 16 16'> <path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/> </svg>");
		}
		if("${msg}" == 'no'){
			$('#heart').html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart' viewBox='0 0 16 16'><path d='m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z'/></svg>");
		}
		$("#bookmark").submit(function(){
			
			alert(${msg});
		});
		
	});
	
	
	function goReview(){
		if (`${loginInfo.id}` == '') {
			if (confirm('리뷰작성은 로그인이 필요합니다.')) {
				location.href ='login.mb';
				
			} 
		}else{
			if($("textarea[name=review]").val().length==0){
				alert("댓글을 입력해주세요")
				$("textarea[name=review]").focus();
			}else{
		
			$.ajax({
					type : 'Get',
					url:'insertReview.re',
					data: ({
							recipenum : ${recipe.recipenum},
							review : $("textarea[name=review]").val()
						}),
					success:function(data){
						$('.comment-list').html($.trim(data));
						$('textarea[name=review]').val('');
					},
					error:function( request, status, error){
						alert('댓글달기실패');
						alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
					}
			});
			}
		}
	}
	var UprevIndex = 0;
	var UisOpen = false;
	
function updateHandle(index){
	
	 if(UprevIndex==0){
		$('#updateForm'+index).show();	
		$('#updateForm'+index).focus();	
		UprevIndex = index;
		UisOpen = true;
	}else if(UprevIndex == index){
		if(UisOpen){
			$('#updateForm'+index).hide();	
			UisOpen=false;
		}else{
			$('#updateForm'+index).show();	
			$('#updateForm'+index).focus();	
			UisOpen = true;
		}			
	}else{
		$('#updateForm'+UprevIndex).hide();			
		$('#updateForm'+index).show();							
		$('#updateForm'+index).focus();	
		UprevIndex = index;
		UisOpen = true;
	} 
}	


function reviewReport(reviewnum,reviewid){
	$('#reportScreen').fadeIn();
	$('input[name=reviewnum]').val(reviewnum);
	$('input[name=reviewid]').val(reviewid);
	

}

function modalClose(e){
	if(e.target.id=='reportScreen'){		
		$('#reportScreen').fadeOut();
	}
}

function loingCheck(){
	if (`${loginInfo.id}` == '') {
		if (confirm('로그인 후 신고 가능합니다\n로그인 하시겠습니까?')) {
			location.href = 'login.mb';
			return;
		}else{
			$('#reportScreen').fadeOut();
			return;
		}
	}
	$.ajax({
		url:'report.re',
		data:({
			reviewnum: $('input[name=reviewnum]').val(),
			reviewid: $('input[name=reviewid]').val(),
			reportreason : $('select[name=reportreason]').val(),
			reportcontent : $('textarea[name=reportcontent]').val()
		}),
		success: function(data){
			alert($.trim(data));
			$('#reportScreen').fadeOut();
			$('textarea[name=reportcontent]').val("");
		},
		error:function(request, status, error){
			
			alert('신고접수 에러 관리자에게 문의하세요');
			alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
			$('#reportScreen').fadeOut();
		}
	});
}

function updateReview(reviewnum,recipenum){
	
	$.ajax({
		url:'updateReview.re',
		data:({
			recipenum: recipenum,
			reviewnum: reviewnum,
			review : $("textarea[name=UcomContent"+reviewnum+"]").val()
		}),
		success: function(data){
			$('.comment-list').html($.trim(data));
			$("textarea[name=UcomContent"+reviewnum+"]").val("");
		},
		error:function(request, status, error){
			alert('에러 관리자에게 문의하세요');
			alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		}
	});
	
}

function deleteReview(reviewnum,recipenum){
	
	if(confirm('정말 댓글을 삭제하시겠습니까')){
		$.ajax({
			url:'deleteReview.re',
			data:({
				recipenum: recipenum,
				reviewnum: reviewnum,
			}),
			success: function(data){
				$('.comment-list').html($.trim(data));
				$("textarea[name=UcomContent"+reviewnum+"]").val("");
			},
			error:function(request, status, error){
				alert('에러 관리자에게 문의하세요');
				alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
			}
		});
	}else{
		alert('삭제안함');
	}

}
</script>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mb-5 ftco-animate">
				<a  class="d-flex justify-content-center"><img
					src="${recipe.cookimage}" class="img-fluid" alt="Colorlib Template"></a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<h1>${recipe.recipename}</h1>
				<div class="rating d-flex">
					<p class="text-left mr-5">
						<a href="#" class="mr-2" style="color: #000;">${recipe.readcount}
							<span style="color: #bbb;">조회수</span>
						</a>
					</p>
					<p class="text-left mr-5">

						<a href="#" class="mr-2" style="color: #000;">${SelectedRecipeCount}
							<span style="color: #bbb;" id="heart"> </span>
						</a>
					</p>
					<p class="text-left mr-5">
						<!-- 북마크 수 -->
						<!-- 누르면 북마크 추가 되도록 -->
					<form action="BookmarkInsert.re" method="post" id="bookmark">
						<input type="hidden" name="recipenum" value="${recipe.recipenum}">
						<a href="#" class="mr-2" style="color: #000;"> <span
							style="color: #bbb;"><input type="submit" value="찜"
								class="btn px-4 btn-primary"></span></a>
					</form>
					</p>
				</div>
				<p class="price">
					<span>재료</span>
				</p>
				<div class="d-flex justify-content-center">
					<ul>
					  <c:forEach items="${foodList}" var="food">
					    <li style="inline: block; float: left; margin-right: 40px">
							<a href="shop.prd?whatColumn=no&searchName=${food.foodname}&ck=ys">${food.foodname}</a>
							${food.foodamount}
							<c:if test="${loginInfo != null}">
							  <c:set var="refflag" value="false"/>
							  <c:set var="detailflag" value="false"/>
							  <c:forEach items="${refList}" var="ref">
							    <c:if test="${not refflag}">
							      <c:if test="${ref.ingnum != 1 && fn:contains(food.foodname, ref.ingname)}">
							        &nbsp;
							        <a href="update.ref?refnum=${ref.refnum}&ingnum=${ref.ingnum}" style="color:gray">
							          <i class="icon-check-circle"></i> ${ref.ingname}
							        </a>
							        <c:set var="refflag" value="true"/>
							      </c:if>
							    </c:if>
							    <c:if test="${not detailflag}">
							      <c:if test="${ref.ingnum eq 1 && fn:contains(food.foodname, ref.refdetail)}">
							          &nbsp;
							          <a href="update.ref?refnum=${ref.refnum}&ingnum=${ref.ingnum}" style="color:gray">
							            <i class="icon-check-circle"></i> ${ref.refdetail}
							          </a>
							          <c:set var="detailflag" value="true"/>
							      </c:if>
							    </c:if>
							  </c:forEach>
						    </c:if>		
						</li>
					  </c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-degree-bg">
	<h2 align="center" style="margin-bottom: 20px; padding-bottom: 20px;">조리
		방법</h2>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 ftco-animate">
				<div class="row">
					<c:forEach items="${recipeContentList}" var="recipeContent"
						varStatus="status">
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a class="block-20"
									style="background-image: url('${recipeContent.recipeimage}');">
								</a>
								<div class="text d-block pl-md-4">
									<h3 class="heading">${recipeContent.cookcontent}</h3>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
		<!-- .col-md-8 -->
	</div>
</section>
<!-- .section -->

<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">

			<div class="col-lg-12 ftco-animate">
				<div class="pt-5 mt-5">
					<ul class="comment-list">
					<h3 class="mb-5">등록된 리뷰 갯수 : ${reviewList.size()}</h3>
						<c:forEach var="review" items="${reviewList}" varStatus="status">
							<c:if test="${review.report == 1 }">
							<li class="comment">
								<div class="vcard bio">
									<!-- 괜찮은 이미지 넣기 -->
									<img
										src="<%=request.getContextPath()%>/resources/images/user_img.jpg"
										alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>${review.id}</h3>
									<!-- 시간 넣기 -->
									<div class="meta">${review.reviewdate}</div>
									<p>해당 댓글은 블라인드 처리되었습니다.</p>
									<c:if test="${review.id == id or id == 'admin'}">
									<span class="reply"
											onclick="deleteReview(${review.reviewnum},${recipe.recipenum})"
											style="cursor: pointer; margin-left: 10px;">삭제</span>
											
										</c:if>
								</div>
							</c:if>
							<c:if test="${review.report == 0 }">
							<li class="comment">
								<div class="vcard bio">
									<!-- 괜찮은 이미지 넣기 -->
									<img
										src="<%=request.getContextPath()%>/resources/images/user_img.jpg"
										alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>${review.id}</h3>
									<!-- 시간 넣기 -->
									<div class="meta">${review.reviewdate}</div>
									<p>${review.review}</p>
									<p>
										<c:if test="${review.id != id}">
										<span class="reply"
											onclick="reviewReport(${review.reviewnum},'${review.id}')"
											style="cursor: pointer;">신고하기</span>
										</c:if>
										<c:if test="${review.id == id or id == 'admin' }">
										<span class="reply"
											onclick="updateHandle(${status.index+1})"
											style="cursor: pointer; margin-left: 10px;">수정</span>
										<span class="reply"
											onclick="deleteReview(${review.reviewnum},${recipe.recipenum})"
											style="cursor: pointer; margin-left: 10px;">삭제</span>
											
										</c:if>
									</p>
								</div>
							</li>
								<li style="display: none;" id="updateForm${status.index+1}"
									class="px-5 py-4 ">
									<div class="form-group">
										<label for="message">수정할 답글을 입력</label>
										<textarea name="UcomContent${review.reviewnum}" id="message"
											cols="30" rows="5" class="form-control" style="resize: none;" maxlength="100" ></textarea>
									</div>
									<div class="form-group">
										<input type="button"
											onclick="updateReview(${review.reviewnum},${recipe.recipenum})" value="수정하기"
											class="btn py-3 px-4 btn-primary">
									</div>
								</li>
							</c:if>	
						</c:forEach>

					</ul>
					<!-- END comment-list -->

					<div class="comment-form-wrap pt-5">
						<h3 class="mb-5">리뷰를 남겨주세요.</h3>
						<div class="form-group">
							<label for="message">리뷰</label>
							<textarea name="review" id="message" cols="30" rows="5"
								class="form-control" maxlength="100"></textarea>
						</div>
						<div class="form-group">
							<input type="button" value="리뷰 남기기"
								class="btn py-3 px-4 btn-primary" onclick="goReview()">
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<div id="reportScreen"
	style="background-color: rgba(90, 90, 90, 0.5); width: 100%; height: 100%; position: fixed; top: 0px; left: 0px; display: none; z-index: 999"
	onclick="modalClose(event)">
	<div id="popup"
		style="background-color: white; min-width: 400px; min-height: 300px; padding: 20px; position: absolute; top: calc(50% - 150px); left: calc(50% - 200px); border-radius: 10px;"
		onclick="">
		<div align="right">
			<span onclick="$('#reportScreen').fadeOut();"
				style="cursor: pointer;"><svg
					xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  				<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg></span>
		</div>
		<div>
			<input class="form-controll" type="hidden" name="reviewnum">
			<input class="form-controll" type="hidden" name="reviewid">
			<select class="form-control" aria-label="Default select example"
				name="reportreason" style="margin-bottom: 20px; border-radius: 10px">
				<option>욕설
				<option>비하
				<option>음란
				<option>허위
				<option>광고
				<option>기타
			</select>
		</div>
		<div>
			<textarea name="reportcontent" rows="6" class="w-100"
				style="resize: none; border-radius: 10px; margin-bottom: 10px" placeholder="내용을 적어주세요" maxlength="100"></textarea>
		</div>
		<input class="btn btn-primary w-100" type="button" value="신고하기"
			onclick="loingCheck()">

	</div>
</div>


<%@include file="./../common/footer.jsp"%>