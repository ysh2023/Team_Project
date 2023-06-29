<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인</title>
</head>
<script>
	// 게시글 추천 기능
	function recommendClick(bodNum){
		if (`${loginInfo.id}` == '') {
			if (confirm('로그인 후 추천 가능합니다\n로그인 하시겠습니까?')) {
				location.href = 'login.mb';
				return;
			}else{
				return;
			}
		}
		$.ajax({
			url : 'recommend.board',
			data:({
				bodNum : bodNum
			}),
			success: function(data){
				if($.trim(data)=='1'){
					$('#recommend'+bodNum).attr('src',`<%=resourcesPath%>`+'/images/mainrecommend1.png');
			}else if($.trim(data)=='0'){
				$('#recommend'+bodNum).attr('src',`<%=resourcesPath%>`+'/images/mainrecommend2.png');					
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



	<!-- 게시글 카테고리 영역 -->
	<section class="ftco-section  ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center pt-2">
					<h6>냉장고 식재료 검색</h6>
				</div>
			</div>
			<div class="row justify-content-center" id="categorys">
				<div class="col-md-10 mb-5 text-center">
					<form action="refRecommend.board" method="post">
						<div class="row pt-2">
							<div class="col-md-10">

								<ul class="product-category">

									<c:forEach items="${ arr}" var="ingredient" varStatus="status">
										<div class="form-check form-check-inline">

											<input type="hidden" value="${refdday[status.index] }" name="refdday">
											<input type="hidden" value="${arr[status.index] }" name="arr">
											<input class="form-check-input" type="checkbox" value="${ingredient }" id="flexCheckDefault${status.index }" name="ingredient">
											<label class="form-check-label" for="flexCheckDefault${status.index }"> 
											<c:set value="<%=new Date()%>" var="now" /> 
											<fmt:parseDate pattern="yyyy-MM-dd" value="${refdday[status.index] }" var="parsedday" /> 
											<c:set value="${now.getTime() - parsedday.getTime()}" var="result" /> 
											<c:set value="${result/(24*60*60*1000) -1 }" var="dday" /> 
											<c:if test="${dday>0 }"><c:set value="${dday +(1-(dday%1))%1  }" var="dday"/>
											</c:if>
											<fmt:parseNumber value="${dday }" integerOnly="true" var="numberDday" /> 
											<c:choose>

													<c:when test="${numberDday==0 }">
														<span style="color: red !important;">D-day&nbsp;${ingredient }</span>

													</c:when>
													<c:when test="${numberDday>-3 }">
														<c:if test="${numberDday<0}">
															<span style="color: red !important;">D${numberDday}&nbsp;${ingredient}</span>
														</c:if>
														<c:if test="${numberDday>0}">
															<span style="color: red !important;">D+${numberDday}&nbsp;${ingredient}</span>
														</c:if>
													</c:when>
													<c:otherwise>
														D${numberDday } ${ingredient}
													</c:otherwise>
												</c:choose>
											</label>

										</div>
									</c:forEach>


								</ul>
							</div>
							<Div class="col-md-2">
								<input type="submit" value="검색" class="btn btn-primary py-2 px-3">
							</Div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!--  게시글 영역  -->
	<section class="ftco-section  ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<c:if test="${fn:length(boardList)==0 }">
						<h3>일치하는 레시피가 없습니다</h3>
					</c:if>
				</div>
				<c:forEach items="${boardList }" var="board" varStatus="status">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="boardDetail.board?bodNum=${board.bodNum}" class="img-prod" style="justify-content: center; align-items: center; display: flex;"> <img class="img-thumbnail" src="<%=resourcesPath%>/images/${board.bodImage==null ? 'noimage.png' : board.bodImage}" alt="Colorlib Template" style="height: 250px; width: 100%; object-fit: cover;">

							</a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3 style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									<a href="boardDetail.board?bodNum=${board.bodNum}">${board.title }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
										<p class="price">${board.servings}인분</p>
										<span class="mr-2 price-dc">${board.tags }</span>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<!-- 추천 -->
										<span class="heart d-flex justify-content-center align-items-center "> <span><img alt="추천" id="recommend${board.bodNum }" align="right" width="40" height="40" src="<%=resourcesPath%>/images/${board.rec==null? 'mainrecommend2.png' : 'mainrecommend1.png' }" style="cursor: pointer;" onclick="recommendClick(${board.bodNum })"></span>
										</span>

									</div>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>

				<!--  -->

			</div>
		</div>
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>${pageInfo.pagingHtml}
					</ul>
				</div>
			</div>
		</div>
	</section>
</body>
<%@include file="../common/footer.jsp"%>
<a target="_blank" href="https://icons8.com/icon/2744/%EC%97%84%EC%A7%80-%EC%B2%99">추천</a> icon by
<a target="_blank" href="https://icons8.com">Icons8</a>
<br>
<a target="_blank" href="https://icons8.com/icon/10271/%EC%97%84%EC%A7%80-%EC%B2%99">엄지 척</a> icon by
<a target="_blank" href="https://icons8.com">Icons8</a>
</html>