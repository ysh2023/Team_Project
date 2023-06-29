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
			if (confirm('로그인 후 이용가능합니다\n로그인 하시겠습니까?')) {
				<%session.setAttribute("destination", "redirect:/boardDetail.board?bodNum=" + request.getParameter("bodNum"));%>
				location.href = 'login.mb';
			} 
		}else{
			if(comNum==0){
				if($("textarea[name=RcomContent]").val().length==0){					
					alert("댓글을 입력해주세요");
					$("textarea[name=RcomContent]").focus();
					return;
				}
			}else if(comNum!=0){
				if($("textarea[name=RcomContent"+comNum+"]").val().length==0){
					alert("댓글을 입력해주세요");
					$("textarea[name=RcomContent"+comNum+"]").focus();
					return;
				}
			}
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
						$('#commentCount').text(Number($('#commentCount').text())+1);
					},
					error : function(data){
						alert("댓글달기 실패");
						alert($.trim(data));
						console.log(data);
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
	
	function deleteComment(comNum){
		var isDelete = confirm('댓글을 삭제하시겠습니까?');
		if(isDelete){	
			$.ajax({
				url: 'deleteComments.board',
				data : ({
					bodNum : ${board.bodNum},
					comNum : comNum
				}),
				success : function(data){
					$('.comment-list').html($.trim(data));
					$('#commentCount').text(Number($('#commentCount').text())-1);
				},
				error : function(){
					alert("댓글 삭제 에러입니다");
				}
			});
		}
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
	
	function handleUpdateComment(index){
		
		RisOpen = false;
		$('#replyForm'+RprevIndex).hide();
		if(UprevIndex==0){
			$('#updateForm'+index).show();	
			$('#updateForm'+index).focus();	
			$('#Umessage'+index).val($('#comment'+index).text());	
			UprevIndex = index;
			UisOpen = true;
		}else if(UprevIndex == index){
			if(UisOpen){
				$('#updateForm'+index).hide();	
				UisOpen=false;
			}else{
				$('#updateForm'+index).show();	
				$('#Umessage'+index).val($('#comment'+index).text());	
				$('#updateForm'+index).focus();	
				UisOpen = true;
			}			
		}else{
			$('#updateForm'+UprevIndex).hide();			
			$('#updateForm'+index).show();		
			$('#Umessage'+index).val($('#comment'+index).text());	
			$('#updateForm'+index).focus();	
			UprevIndex = index;
			UisOpen = true;
		}
	}
	var idOrigin;
	function commentReport(comNum,id){
		idOrigin = id;
		$('#reportScreen').fadeIn();
		$('input[name=comNum]').val(comNum);
	}
	
	function modalClose(e){
		if(e.target.id=='reportScreen'){		
			$('#reportScreen').fadeOut();
		}
	}
	
	function loginCheck(){
		if (`${loginInfo.id}` == '') {
			if (confirm('로그인 후 신고 가능합니다\n로그인 하시겠습니까?')) {
				<%session.setAttribute("destination", "redirect:/boardDetail.board?bodNum=" + request.getParameter("bodNum"));%>
				location.href = 'login.mb';
				return;
			}else{
				$('#reportScreen').fadeOut();
				return;
			}
		}
		
		$.ajax({
			url:'commentReport.board',
			data:({
				comNum: $('input[name=comNum]').val(),
				reasons : $('select[name=reasons]').val(),
				repDiscription : $('textarea[name=repDiscription]').val(),
				idOrigin : idOrigin
			}),
			success: function(data){
				alert($.trim(data));
				$('#reportScreen').fadeOut();
				$('textarea[name=repDiscription]').val("");
			},
			error:function(data){
				alert(data);
				alert('신고접수 에러 관리자에게 문의하세요');
				$('#reportScreen').fadeOut();
			}
		});
	}
	
	function recommendClick(){
		if (`${loginInfo.id}` == '') {
			if (confirm('로그인 후 추천 가능합니다\n로그인 하시겠습니까?')) {
				<%session.setAttribute("destination", "redirect:/boardDetail.board?bodNum=" + request.getParameter("bodNum"));%>
				location.href = 'login.mb';
				return;
			}else{
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
	
	function menuTogle(){
		$('#menu').toggle();
	}
	
	function updateHandle(){
		location.href='boardUpdate.board?bodNum=' +'${board.bodNum}';
	}

	function deleteHandle(){
		if(confirm('삭제하시겠습니까?')){			
			location.href='boardDelete.board?bodNum=' + '${board.bodNum}';		
		}
	}
</script>
<body>
	<!-- 요리 설명 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="images/product-1.jpg" class="image-popup"> <img src="<%=resourcesPath%>/images/${board.bodImage == null ? 'noimage.png' : board.bodImage}" class="img-fluid" alt="요리 대표 이미지">
					</a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h1>${board.title}</h1>
					<div style="position: absolute; right: 20px; top: 20px;">
						<span><img src="<%=resourcesPath%>/images/dotmenu.png" style="cursor: pointer; position: absolute;" onclick="menuTogle()"></span>
						<div id="menu" style="z-index: 999; position: absolute; top: 24px; right: -24px; width: 80px; text-align: left; border: 0.25px solid gray; border-radius: 10px; background-color: white; display: none;">
							<div style="display: flex; flex-flow: column;">
								<button class="btn" ${loginInfo.id == board.id or loginInfo.id =='admin' ? '':'disabled' } style="cursor: pointer; text-align: center; border-radius: 10px 10px 0px 0px;  ${loginInfo.id == board.id or loginInfo.id =='admin' ? '' : 'color:gray;' }" onclick="updateHandle()">
									<b>수정</b>
								</button>
								<button class="btn" ${loginInfo.id == board.id or loginInfo.id =='admin' ? '':'disabled' } style="cursor: pointer; text-align: center; border-radius: 0px 0px 10px 10px; ${loginInfo.id == board.id or loginInfo.id =='admin' ? '' : 'color:gray;'  }" onclick="deleteHandle()">
									<b>삭제</b>
								</button>
							</div>
						</div>
					</div>
					<div class="rating d-flex">

						<table style="width: 100%;">
							<tr>
								<td>
									<p class="price">
										<span>요리분류</span>

									</p>
								</td>
								<td>
									<p class="price">
										<span>조리시간</span>
									</p>
								</td>
								<td>
									<p class="price">
										<span>요리량</span>
									</p>
								</td>
							</tr>

							<tr>
								<td>
									<p>${board.servings }인분
								</td>
								<td>
									<p>${board.time }분
								</td>
								<td>
									<p>${board.category }
								</td>
							</tr>
						</table>
					</div>
					<p class="price">
						<span>식재료</span>
					</p>

					<c:forEach items="${boardIngredientList}" var="boardIngredient" varStatus="status">

						<li style="inline: block; float: left; margin-right: 40px"><a href="shop.prd?whatColumn=no&searchName=${boardIngredient.bigName}">${boardIngredient.bigName }</a>
						  <c:if test="${boardIngredient.bigAmount == null }">
						   -${ boardIngredient.bigAmount}
						  </c:if>
						  <c:if test="${loginInfo != null}">
							<c:set var="refflag" value="false"/>
							<c:set var="detailflag" value="false"/>
							<c:forEach items="${refList}" var="ref">
							  <c:if test="${not refflag}">
							    <c:if test="${ref.ingnum != 1 && fn:contains(boardIngredient.bigName, ref.ingname)}">
							      &nbsp;
							      <a href="update.ref?refnum=${ref.refnum}&ingnum=${ref.ingnum}" style="color:gray">
							        <i class="icon-check-circle"></i> ${ref.ingname}
							      </a>
							      <c:set var="refflag" value="true"/>
							    </c:if>
							  </c:if>
							  <c:if test="${not detailflag}">
							    <c:if test="${ref.ingnum eq 1 && fn:contains(boardIngredient.bigName, ref.refdetail)}">
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
				</div>
			</div>
		</div>
	</section>



	<section class="ftco-section ftco-no-pt ftco-degree-bg">
		<h2 align="center" style="margin-bottom: 20px; padding-bottom: 20px;">조리 방법</h2>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 ftco-animate">
					<div class="row">
						<c:forEach items="${boardContentList}" var="boardContent" varStatus="status">
							<c:if test="${boardContent.bodContent != null or boardContent.image !=null }">
								<div class="col-md-12 d-flex ftco-animate">
									<div class="blog-entry align-self-stretch d-md-flex">
										<span href="blog-single.html" class="block-20" style="background-image: url('<%=resourcesPath%>/images/${boardContent.image}');"> </span>
										<div class="text d-block pl-md-4">
											<h3 class="heading">${boardContent.bodContent}</h3>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div style="min-height: 40px;">
						<c:forEach items="${tags }" var="tag">${tag } </c:forEach>
						<img alt="추천" id="recommend" align="right" width="40" height="40" src="<%=resourcesPath%>/images/${recommend=='0'? 'recommend1.png' : 'recommend2.png' }" style="cursor: pointer;" onclick="recommendClick()">
					</div>
				</div>
			</div>
			<!-- .col-md-8 -->
		</div>
	</section>
	<!-- .section -->
	<!-- 댓글 영역 -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="">
						<h3>
							<span id="commentCount">${fn:length(commentsList) }</span>댓글
						</h3>
						<div class="comment-form-wrap pt-2">
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

						<!-- 댓글 목록 -->
						<ul class="comment-list" id="comment-list">
							<c:set value="-1" var="refboder"/>
							<c:forEach items="${ commentsList}" var="comment" varStatus="status">
								<c:if test="${refboder != comment.ref }"><li><hr></li></c:if>
								<li class="comment" style="margin-left: ${comment.refLevel * 80}px;">
								<c:set value="${comment.ref}" var="refboder"/>
								
								
									<div class="vcard bio">
										<img src="<%=resourcesPath%>/images/user_img.jpg" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>${comment.id }</h3>

										<div class="meta">
											<fmt:parseDate value="${comment.createAt }" var="pdate" pattern="yyyy-MM-dd HH:mm:ss.S" />
											<fmt:formatDate value="${pdate }" pattern="yyyy년 MM월 dd일 hh:mm" />
										</div>
										<p id="comment${status.index+1 }">${comment.report == 1 ? '해당 댓글은 블라인드처리 되었습니다.' : comment.report == 2 ? '삭제된 댓글입니다.': comment.comContent }</p>
										<p>
											<c:if test="${comment.report != 2 }">
												<span class="reply" id="reply${status.index+1 }" onclick="replyHandle(${status.index+1})" style="cursor: pointer;">답글 달기</span>
												<c:if test="${loginInfo.id == comment.id  && comment.report != 1   || loginInfo.id == 'admin'}">
													<span class="reply" id="updateComment${status.index+1 }" onclick="handleUpdateComment(${status.index+1})" style="cursor: pointer; margin-left: 5px;">수정</span>
													<span class="reply" id="deleteComment${status.index+1 }" onclick="deleteComment(${comment.comNum})" style="cursor: pointer; margin-left: 5px;">삭제</span>
												</c:if>
												<c:if test="${loginInfo.id != comment.id }">
													<span class="reply btn-primary" onclick="commentReport(${comment.comNum },'${comment.id }')" style="cursor: pointer; margin-left: 5px;">신고하기</span>
												</c:if>
											</c:if>
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
										<textarea name="UcomContent${comment.comNum}" id="Umessage${status.index+1 }" cols="30" rows="5" class="form-control" style="resize: none;"></textarea>
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


	<div id="reportScreen" style="background-color: rgba(90, 90, 90, 0.5); width: 100%; height: 100%; position: fixed; top: 0px; left: 0px; display: none; z-index: 999;" onclick="modalClose(event)">
		<div id="popup" style="background-color: white; min-width: 400px; min-height: 300px; padding: 20px; position: absolute; top: calc(50% - 150px); left: calc(50% - 200px); border-radius: 10px;" onclick="">
			<Div align="right">
				<span onclick="$('#reportScreen').fadeOut();" style="cursor: pointer;"><font color="gray" size="5">X</font></span>
			</Div>
			<div>
				<input class="form-control" type="hidden" name="comNum"> <select class="form-control" aria-label="Default select example" name="reasons">
					<option>욕설
					<option>비하
					<option>음란
					<option>허위
					<option>기타
				</select>
			</div>
			<div class="pt-2 pb-2">
				<textarea name="repDiscription" rows="6" class="form-control w-100" style="resize: none;" placeholder="내용을 적어주세요"></textarea>
			</div>
			<input class="btn btn-primary w-100" type="button" value="신고하기" onclick="loginCheck()">

		</div>
	</div>
</body>
<%@include file="../common/footer.jsp"%>
</html>




