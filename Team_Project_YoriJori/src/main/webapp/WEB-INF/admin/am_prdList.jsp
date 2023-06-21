<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>상품 목록</h1>
	  <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">식재료 쇼핑몰</li>
          <li class="breadcrumb-item active">상품 목록</li>
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
                    <th scope="col">상품번호</th>
                    <th scope="col">상품이름</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">가격</th>
                    <th scope="col">재고량</th>
                    <th scope="col">이미지</th>
                    <th scope="col">수정</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${lists}">
                 <tr>
                    <th scope="row">${i.pdnum}</th>
                    <td>${i.pdname}</td>
                    <td>${i.pdcategory}</td>
                    <td>${i.pdprice}</td>
                    <td>${i.pdstock}</td>
                    <td><img  src="<%=resourcesPath%>/img_pd/${i.pdimage}" width="50px" height="50px" ></td>
                    <td><a href="updatePrd.am?pdnum=${i.pdnum}">수정</a></td>
                    <td><a href="deletePrd.am?pdnum=${i.pdnum}">삭제</a></td>
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