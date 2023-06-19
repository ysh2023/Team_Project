<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/pg_header.jsp" %>

<div  id="main" style="margin-left:25%;padding:1px 16px;">
<h1 align="center">주문목록 페이지</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">주문번호</th>
      <th scope="col">상품명</th>
      <th scope="col">주문자 이름</th>
      <th scope="col">결제 금액</th>
      <th scope="col">주문 날짜</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="order" items="${slist }">
    <tr>
      <td scope="row"><a href="orderdetail.mb?ordnum=${order.ordnum }">${order.ordnum }</a></td> 
      <td>${order.ordpdname }</td>
      <td>${order.ordname }</td>
      <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.ordtotalpay}" />원</td> 
      <td>${order.orddate }</td>
    </tr>
  	</c:forEach>
  </tbody>
</table>
<br>
<br>
 <%@include file= "./../common/footer.jsp" %>
</div>
</body>
</html>

