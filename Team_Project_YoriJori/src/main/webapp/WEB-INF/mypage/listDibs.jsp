<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file= "./../common/pg_header.jsp" %>


<style>
#table{

margin-left:-250px;
}

</style>


<main id="main" class="main" >



	    			<table class="table" id="table">
						    <thead >
						      <tr >
						        <th>상품이름</th>
						        <th>상품가격</th>
						        <th>상품이미지</th>
						        <th>삭제</th>
						   
						      </tr>
						    </thead>
						    <tbody>
						    <c:if test="${empty lists}">
						    	 <tr class="text-center">
						    	 	<td colspan="4">
						    	 		담은 찜이 없습니다.
						    	 	</td>
						    	 </tr>
						    </c:if>
						    <c:if test="${not empty lists }">
						    <c:forEach  var="i" items="${lists}">
						      <tr class="text-center">
						        <td>${i.pdname}</td>
						        <td>${i.pdprice}</td>
						        <td><img src="<%=resourcesPath%>/img_pd/${i.pdimage}" height="100px" width="100px"></td>
						        <td><a href="deleteDibs.mp?pdnum=${i.pdnum}">삭제</a>
						        
						        
						      </tr>
							</c:forEach>
						    </c:if>
						    </tbody>
						  </table>

</main>


    