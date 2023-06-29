<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="-1" var="refboder" />
<c:forEach items="${ commentsList}" var="comment" varStatus="status">
	<c:if test="${refboder != comment.ref }">
		<li><hr></li>
	</c:if>
	<li class="comment" style="margin-left: ${comment.refLevel * 50}px;"><c:set value="${comment.ref}" var="refboder" />

		<div class="vcard bio">
			<img src="<%=request.getContextPath()%>/resources/images/user_img.jpg" alt="Image placeholder">
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
		</div></li>
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
