<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/pg_header.jsp" %>

<div  id="main" style="margin-left:25%;padding:1px 16px;">
<h1 align="center">주문상세 페이지</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">주문번호</th>
      <th scope="col">상품명</th>
      <th scope="col">상품이미지</th>
      <th scope="col">구매 갯수</th>
      <th scope="col">결제 금액</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="orderdetail" items="${slist }">
    <tr>
      <td>${orderdetail.odtordnum }</td> 
      <td>${orderdetail.pdname }</td>
      <td><img src="<%=resourcesPath%>/img_pd/${orderdetail.pdimage }" style="width: 100px; height: 100px;"> </td>
      <td>${orderdetail.odtqty }</td>
      <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orderdetail.pdprice * orderdetail.odtqty}" />원</td> 
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

