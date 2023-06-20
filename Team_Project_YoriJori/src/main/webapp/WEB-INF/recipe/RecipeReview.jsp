<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="review" items="${reviewList}">
	<li class="comment">
		<div class="vcard bio">
			<img
				src="<%=request.getContextPath()%>/resources/images/user_img.jpg"
				alt="Image placeholder">
		</div>
		<div class="comment-body">
			<h3>${review.id}</h3>
			<div class="meta">${review.reviewdate}</div>
			<p>${review.review}</p>
			<p>
				<span class="reply" onclick="reviewReport(${review.reviewnum})"
					style="cursor: pointer;">신고하기</span>
				<c:if test="${review.id == id }">
					<span class="reply" onclick=""
						style="cursor: pointer; margin-left: 10px;">수정</span>
					<span class="reply"
						onclick="location.href='deleteReview.re?reviewnum=${review.reviewnum}&recipenum=${recipe.recipenum}'"
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
				cols="30" rows="5" class="form-control" style="resize: none;"></textarea>
		</div>
		<div class="form-group">
			<input type="button" onclick="updateReview(${review.reviewnum})"
				value="수정하기" class="btn py-3 px-4 btn-primary">
		</div>
	</li>
</c:forEach>
