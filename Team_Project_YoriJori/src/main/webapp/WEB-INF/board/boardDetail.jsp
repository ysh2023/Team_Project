<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<%@include file="../common/header.jsp"%>
<body>
	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 ftco-animate">
					<h2>${board.title }</h2><a class="" href="boardDelete.board?bodNum=${board.bodNum}" style="cursor: pointer; background-color: pink;">삭제</a>
					<div class="row">
						<div class="col-md-6">요리량 : ${board.servings }인분</div>
						<div class="col-md-6">조리시간 : ${board.time }분</div>
					</div>
					<div>요리 분류 : ${board.category }</div>
					<hr>

					<c:forEach items="${boardContentList }" var="boardContent" varStatus="status">
						<div>조리과정 ${status.index+1 }${boardContent.bodContent } <c:if test="${boardContent.image != ''}">
								<img src="<%=resourcesPath%>/images/${boardContent.image}" alt="조리과정 이미지">
							</c:if>
						</div>
					</c:forEach>

					<div>
						<c:forEach items="${tags }" var="tag">#${tag } </c:forEach>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 ftco-animate">
					<div class="pt-5 mt-5">
						<h3 class="mb-5">${fn:length(comments) }댓글</h3>
						<ul class="comment-list">
							<li class="comment">
								<div class="vcard bio">
									<img src="<%=resourcesPath%>/images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">June 27, 2018 at 2:21pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									<p>
										<a href="#" class="reply">Reply</a>
									</p>
								</div>
							</li>

							<li class="comment">
								<div class="vcard bio">
									<img src="<%=resourcesPath%>/images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">June 27, 2018 at 2:21pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									<p>
										<a href="#" class="reply">Reply</a>
									</p>
								</div>

								<ul class="children">
									<li class="comment">
										<div class="vcard bio">
											<img src="<%=resourcesPath%>/images/person_1.jpg" alt="Image placeholder">
										</div>
										<div class="comment-body">
											<h3>John Doe</h3>
											<div class="meta">June 27, 2018 at 2:21pm</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
											<p>
												<a href="#" class="reply">Reply</a>
											</p>
										</div>


										<ul class="children">
											<li class="comment">
												<div class="vcard bio">
													<img src="<%=resourcesPath%>/images/person_1.jpg" alt="Image placeholder">
												</div>
												<div class="comment-body">
													<h3>John Doe</h3>
													<div class="meta">June 27, 2018 at 2:21pm</div>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
													<p>
														<a href="#" class="reply">Reply</a>
													</p>
												</div>

												<ul class="children">
													<li class="comment">
														<div class="vcard bio">
															<img src="images/person_1.jpg" alt="Image placeholder">
														</div>
														<div class="comment-body">
															<h3>John Doe</h3>
															<div class="meta">June 27, 2018 at 2:21pm</div>
															<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
															<p>
																<a href="#" class="reply">Reply</a>
															</p>
														</div>
													</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<!-- END comment-list -->
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<%@include file="../common/footer.jsp"%>
</html>