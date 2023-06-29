<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>주문 관리</h1>
      <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">식재료 쇼핑몰</li>
          <li class="breadcrumb-item active">주문 목록</li>
        </ol>
      </nav>

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
                    <th scope="col">이름</th>
                    <th scope="col">이메일</th>
                    <th scope="col">우편번호</th>
                    <th scope="col">주소</th>
                    <th scope="col">번호</th>
                    <th scope="col">구매 날짜</th>
                    <th scope="col">결제금액</th>
                    <th scope="col">거래현황</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="ord" items="${lists}">
                 <tr>
                    <th scope="row"><a href="orderdetailList.am?ordnum=${ord.ordnum}">${ord.ordnum}</a></th>
                    <td>${ord.ordname}</td>
                    <td>${ord.ordemail}</td>
                    <td>${ord.ordzipcode}</td>
                    <td>${ord.ordaddr}</td>
                    <td>${ord.ordtel}</td>
                    <td>
	                    <fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm" value="${ord.orddate}"/>
	                    <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm" var="det"/>
	                    <c:out value="${det}"></c:out>
                    </td>
                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ord.ordtotalpay}" />원</td>
                    <td>${ord.ordpaystate}</td>
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