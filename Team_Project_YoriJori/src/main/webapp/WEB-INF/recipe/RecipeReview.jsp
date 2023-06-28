<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<c:if test="${review.id == id or id == 'admin' }">
									<span class="reply"
											onclick="deleteReview(${review.reviewnum},${recipenum})"
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
										<c:if test="${review.id != id }">
										<span class="reply"
											onclick="reviewReport(${review.reviewnum},'${review.id}')"
											style="cursor: pointer;">신고하기</span>
										</c:if>
										<c:if test="${review.id == id or id == 'admin' }">
										<span class="reply"
											onclick="updateHandle(${status.index+1})"
											style="cursor: pointer; margin-left: 10px;">수정</span>
										<span class="reply"
											onclick="deleteReview(${review.reviewnum},${recipenum})"
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
											cols="30" rows="5" class="form-control" style="resize: none;" maxlength="100"></textarea>
									</div>
									<div class="form-group">
										<input type="button"
											onclick="updateReview(${review.reviewnum},${recipenum})" value="수정하기"
											class="btn py-3 px-4 btn-primary">
									</div>
								</li>
							</c:if>	
						</c:forEach>