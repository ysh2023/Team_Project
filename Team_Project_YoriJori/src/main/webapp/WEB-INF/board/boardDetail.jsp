<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<%@include file="../common/header.jsp"%>
<script type="text/javascript">
	function addComments(comNum) {
		if (`${loginInfo.id}` == '') {
			if (confirm('로그인 필요')) {
				location.href = 'login.mb';
			} 
		}else{
			if(comNum==0){
				$.ajax({
					url : 'insertComments.board',
					data : ({
						bodNum : ${board.bodNum},
						comContent : $("textarea[name=RcomContent]").val(),
						comNum : comNum
					}),
					success : function(data){
						$('.comment-list').html($.trim(data));
						$("textarea[name=RcomContent]").val('');
					},
					error : function(data){
						alert("댓글달기 실패");
						alert($.trim(data));
					}
				});
			}else{
				$.ajax({
					url : 'insertComments.board',
					data : ({
						bodNum : ${board.bodNum},
						comContent : $("textarea[name=RcomContent"+comNum+"]").val(),
						comNum : comNum
					}),
					success : function(data){
						$('.comment-list').html($.trim(data));
						$("textarea[name=RcomContent"+comNum+"]").val('');
					},
					error : function(data){
						alert("답글달기 실패");
					}
				});
			}
		}
	}
	
	function updateComments(comNum) {
		$.ajax({
			url : 'updateComments.board',
			data : ({
				bodNum : ${board.bodNum},
				comContent : $("textarea[name=UcomContent"+comNum+"]").val(),
				comNum : comNum
			}),
			success : function(data){
				$('.comment-list').html($.trim(data));
				$("textarea[name=UcomContent"+comNum+"]").val('');
			},
			error : function(data){
				alert("답글달기 실패");
			}
		});
	}
	
	
	var RprevIndex = 0;
	var RisOpen = false;
	var UprevIndex = 0;
	var UisOpen = false;
	function replyHandle(index){
		UisOpen = false;
		$('#updateForm'+UprevIndex).hide();			
		if(RprevIndex==0){
			$('#replyForm'+index).show();	
			$('#replyForm'+index).focus();	
			RprevIndex = index;
			RisOpen = true;
		}else if(RprevIndex == index){
			if(RisOpen){
				$('#replyForm'+index).hide();	
				RisOpen=false;
			}else{
				$('#replyForm'+index).show();	
				$('#replyForm'+index).focus();	
				RisOpen = true;
			}			
		}else{
			$('#replyForm'+RprevIndex).hide();			
			$('#replyForm'+index).show();							
			$('#replyForm'+index).focus();	
			RprevIndex = index;
			RisOpen = true;
		}
	}
	
	function updateHandle(index){
		RisOpen = false;
		$('#replyForm'+RprevIndex).hide();
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
	
	function commentReport(comNum){
		$('#reportScreen').show();
		$('input[name=comNum]').val(comNum);
	}
	
	function modalClose(e){
		if(e.target.id=='reportScreen'){		
			$('#reportScreen').hide();
		}
	}
	
	function loingCheck(){
		if (`${loginInfo.id}` == '') {
			if (confirm('로그인 후 신고 가능합니다\n로그인 하시겠습니까?')) {
				location.href = 'login.mb';
				return;
			}else{
				$('#reportScreen').hide();
				return;
			}
		}
		
		$.ajax({
			url:'commentReport.board',
			data:({
				comNum: $('input[name=comNum]').val(),
				reasons : $('select[name=reasons]').val(),
				repDiscription : $('textarea[name=repDiscription]').val()
			}),
			success: function(data){
				alert($.trim(data));
				$('#reportScreen').hide();
				$('textarea[name=repDiscription]').val("");
			},
			error:function(data){
				alert(data);
				alert('신고접수 에러 관리자에게 문의하세요');
				$('#reportScreen').hide();
			}
		});
	}
	
	function recommendClick(){
		if (`${loginInfo.id}` == '') {
			if (confirm('로그인 후 추천 가능합니다\n로그인 하시겠습니까?')) {
				location.href = 'login.mb';
				return;
			}
		}
		$.ajax({
			url : 'recommend.board',
			data:({
				bodNum : ${board.bodNum}
			}),
			success: function(data){
				if($.trim(data)=='1'){
					$('#recommend').attr('src',`<%=resourcesPath%>`+'/images/recommend2.png');
				}else if($.trim(data)=='0'){
					$('#recommend').attr('src',`<%=resourcesPath%>`+'/images/recommend1.png');					
				}else{
					alert('추천 에러');
				}
			},
			error: function(){
				alert('추천 에러');
			}
		});
	}
</script>
<body>
	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 ftco-animate">
					<h2>${board.title }</h2>
					<a class="" href="boardDelete.board?bodNum=${board.bodNum}" style="cursor: pointer; background-color: pink;">삭제</a>
					<a class="" href="boardUpdate.board?bodNum=${board.bodNum}" style="cursor: pointer; background-color: pink;">수정</a>
					<div class="row">
						<div class="col-md-6">요리량 : ${board.servings }인분</div>
						<div class="col-md-6">조리시간 : ${board.time }분</div>
					</div>
					<div>요리 분류 : ${board.category }</div>
					<hr>
										
					<c:forEach items="${boardIngredientList }" var="boardIngredient" varStatus="status">
						<div>
							식재료 :  ${status.index+1 }${boardIngredient.bigName }<br>
							용량 : ${ boardIngredient.bigAmount}
							
						</div>
					</c:forEach>

					<c:forEach items="${boardContentList }" var="boardContent" varStatus="status">
						<div>
							조리과정 ${status.index+1 }${boardContent.bodContent }
							<c:if test="${boardContent.image != ''}">
								<img src="<%=resourcesPath%>/images/${boardContent.image}" alt="조리과정 이미지">
							</c:if>
						</div>
					</c:forEach>

					<div>
						<c:forEach items="${tags }" var="tag">${tag } </c:forEach>
					</div>
					<img alt="추천" id="recommend" src="<%=resourcesPath%>/images/${recommend=='0'? 'recommend1.png' : 'recommend2.png' }" style="cursor: pointer;" onclick="recommendClick()">
				</div>
			</div>
		</div>
	</section>
	<hr>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="">
						<h3>${fn:length(commentsList) }댓글</h3>
						<div class="comment-form-wrap pt-5">
							<h3 class="">댓글 남기기</h3>
							<!-- 댓글 폼  -->
							<div class="px-5 py-4 bg-light">
								<div class="form-group">
									<label for="message">댓글을 입력</label>
									<textarea name="RcomContent" id="message" cols="30" rows="5" class="form-control" style="resize: none;"></textarea>
								</div>
								<div class="form-group">
									<input type="button" onclick="addComments(0)" value="댓글달기" class="btn py-3 px-4 btn-primary">
								</div>
							</div>

						</div>
						<hr>

						<!-- 댓글 목록 -->
						<ul class="comment-list">

							<c:forEach items="${ commentsList}" var="comment" varStatus="status">
								<li class="comment" style="margin-left: ${comment.refLevel * 80}px;">
									<div class="vcard bio">
										<img src="<%=resourcesPath%>/images/person_1.jpg" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>${comment.id }</h3>

										<div class="meta">
											<fmt:parseDate value="${comment.createAt }" var="pdate" pattern="yyyy-MM-dd HH:mm:ss.S" />
											<fmt:formatDate value="${pdate }" pattern="yyyy년 MM월 dd일 hh:mm" />
										</div>
										<p>${comment.comContent }</p>
										<p>
											<span class="reply" id="reply${status.index+1 }" onclick="replyHandle(${status.index+1})" style="cursor: pointer;">댓글 달기</span>
											<c:if test="${loginInfo.id == comment.id }">
												<span onclick="location.href='deleteComments.board?bodNum=${board.bodNum}&comNum=${comment.comNum}'" style="cursor: pointer;">삭제</span>
												<span id="updateComment${status.index+1 }" onclick="updateHandle(${status.index+1})" style="cursor: pointer;">수정</span>
											</c:if>
											<span onclick="commentReport(${comment.comNum })" style="cursor: pointer;">신고하기</span>
										</p>
									</div>
								</li>
								<li style="display: none;" id="replyForm${status.index+1 }" class="px-5 py-4 ">
									<div class="form-group">
										<label for="message">답글을 입력</label>
										<textarea name="RcomContent${comment.comNum}" id="message" cols="30" rows="5" class="form-control" style="resize: none;"></textarea>
									</div>
									<div class="form-group">
										<input type="button" onclick="addComments(${comment.comNum})" value="답글달기" class="btn py-3 px-4 btn-primary">
									</div>
								</li>
								<li style="display: none;" id="updateForm${status.index+1 }" class="px-5 py-4 ">
									<div class="form-group">
										<label for="message">수정할 답글을 입력</label>
										<textarea name="UcomContent${comment.comNum}" id="message" cols="30" rows="5" class="form-control" style="resize: none;"></textarea>
									</div>
									<div class="form-group">
										<input type="button" onclick="updateComments(${comment.comNum})" value="수정하기" class="btn py-3 px-4 btn-primary">
									</div>
								</li>
							</c:forEach>
						</ul>
						<!-- END comment-list -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="reportScreen" style="background-color: rgba(90, 90, 90, 0.5); width: 100%; height: 100%; position: fixed; top: 0px; left: 0px; display: none; z-index: 999" onclick="modalClose(event)">
		<div id="popup" style="background-color: white; width: 400px; height: 300px; padding: 20px; position: absolute; top: calc(50% - 150px); left: calc(50% - 200px);" onclick="">
			<div>
			<input class="form-controll" type="hidden" name="comNum"> <select class="form-select" aria-label="Default select example" name="reasons">
				<option>욕설
				<option>비하
				<option>음란
				<option>허위
				<option>기타
			</select> 
			</div>
			<div>
				<textarea name="repDiscription" cols="30" rows="5" placeholder="내용을 적어주세요"></textarea>
			</div>
			<input type="button" value="신고하기" onclick="loingCheck()">

		</div>
	</div>
</body>
<%@include file="../common/footer.jsp"%>
<a target="_blank" href="https://icons8.com/icon/2744/%EC%97%84%EC%A7%80-%EC%B2%99">추천</a> icon by
<a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icon/10271/%EC%97%84%EC%A7%80-%EC%B2%99">추천</a> icon by
<a target="_blank" href="https://icons8.com">Icons8</a>

</html>



