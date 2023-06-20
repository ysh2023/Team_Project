<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>주문 목록</h1>

    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">주문번호</th>
                    <th scope="col">상품이름</th>
                    <th scope="col">결제금액</th>
                    <th scope="col">이메일</th>
                    <th scope="col">이름</th>
                    <th scope="col">주소</th>
                    <th scope="col">우편번호</th>
                    <th scope="col">번호</th>
                    <th scope="col">구매 날짜</th>
                    <th scope="col">아이디</th>
                    <th scope="col">거래 상태</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="ord" items="${lists}">
                 <tr>
                    <th scope="row"><a href="orderdetailList.am?ordnum=${ord.ordnum}">${ord.ordnum}</a></th>
                    <td>${ord.ordpdname}</td>
                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ord.ordtotalpay}" />원</td>
                    <td>${ord.ordemail}</td>
                    <td>${ord.ordname}</td>
                    <td>${ord.ordaddr}</td>
                    <td>${ord.ordzipcode}</td>
                    <td>${ord.ordtel}</td>
                    <td>${ord.orddate}</td>
                    <td>${ord.ordmemid}</td>
                    <td>
	                    <c:if test="${ord.ordpaystate == '결제 완료' }">
	                    	<p><span>결제 완료 </span> </p>
	                    </c:if>
	                    <c:if test="${ord.ordpaystate == '환불 요청' }">
	                    	<a href="adminCancelPayOrd.am?ordnum=${ord.ordnum}">환불 승인</a>
	                    </c:if>
	                    <c:if test="${ord.ordpaystate == '환불 승인' }">
	                    	<p><span>승인 완료 </span> </p>
	                    </c:if>
                    </td>
                  </tr>
                </c:forEach>
         
                </tbody>
              </table>

            </div>
          </div>

        </div>
      </div>
    </section>

  </main>
  
  <%@include file= "./../common/admin_footer.jsp" %>