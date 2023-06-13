<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>신고리스트</h1>

    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <table class="table datatable">
                <thead> 
                  <tr>
                    <th scope="col">아이디</th>
                    <th scope="col">신고 횟수</th>
                    <th scope="col">상세보기</th>
                    <th scope="col">강제탈퇴</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${lists}">
                 <tr>
                    <th scope="row">${i.id}</th>
                    <td>${i.count}</td>
                    <td><a href="detailReport.am?id=${i.id}">상세보기</a></td>
                    <td><a href="deleteMember.am?id=${i.id}">강제탈퇴</a></td>
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