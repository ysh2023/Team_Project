<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>주문 관리</h1>
      <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">식재료 쇼핑몰</li>
          <li class="breadcrumb-item">주문 목록</li>
          <li class="breadcrumb-item active">주문 상세보기</li>
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
				      <th scope="col">상품명</th>
				      <th scope="col">상품이미지</th>
				      <th scope="col">구매 갯수</th>
				      <th scope="col">결제 금액</th>
				    </tr>
                </thead>
                <tbody>
                
				<c:forEach var="orderdetail" items="${lists }">
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

            </div>
          </div>

        </div>
      </div>
    </section>

  </main>
  
  <%@include file= "./../common/admin_footer.jsp" %>