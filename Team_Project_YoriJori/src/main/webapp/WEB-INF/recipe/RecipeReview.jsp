<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
		              <c:forEach var="review" items="${reviewList}">
		                <li class="comment">
		                  <div class="vcard bio">
		                    <img src="<%=request.getContextPath()%>/resources/images/user_img.jpg" alt="Image placeholder">
		                  </div>
		                  <div class="comment-body">
		                    <h3>${review.id}</h3>
		                    <div class="meta">${review.reviewdate}</div>
		                    <p>${review.review}</p>
		                    <p><a href="report.re?reviewnum=${review.reviewnum}&recipenum=${recipe.recipenum}" class="reply">신고하기</a></p>	
		                  </div>
		                </li>
		              </c:forEach>
	              