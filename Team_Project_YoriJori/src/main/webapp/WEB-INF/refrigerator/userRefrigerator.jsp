<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<center>
	<br>
	사용자 냉장고 페이지<br><br>
	
	<input type="button" value="식재료 추가하기" onClick="location.href='insert.ref'">
	냉장고에 식재료 추가하는 페이지로 이동
	<br><br>
	
	${loginInfo.id}님의 냉장고<br>
	사용자가 추가한 식재료 보기<br>
	<table border="1" style="width: 800px;">
		<tr>
			<th>식재료명</th>
			<th>추가일</th>
			<th>유통기한</th>
			<th>보관</th>
			<th>메모</th>
		</tr>
		<c:if test="${refList eq null}">
			<tr><th>보관 중인 식재료가 없습니다</th></tr>
		</c:if>
		<c:if test="${refList != null}">
			<c:forEach var="list" items="${refList}">
				<tr>
					<td>
						<a href="update.ref">
							${list.ingname}
						</a>
					</td>
					<td>
						<fmt:parseDate var="inputdate" value="${list.inputdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="inputdate" value="${inputdate}" pattern="yyyy-MM-dd"/>
						${inputdate}
					</td>
					<td>
						<fmt:parseDate var="dday" value="${list.refdday}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dday" value="${dday}" pattern="yyyy-MM-dd"/>
						${dday}
					</td>
					<td>${list.refstorage}</td>
					<td>${list.refdetail}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<br><br><br>
</center>

<%@include file= "../common/footer.jsp" %>