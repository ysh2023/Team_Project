<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>상품테이블</h1>

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
                    <th scope="col">이름</th>
                    <th scope="col">비번</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">나이</th>
                    <th scope="col">지역</th>
                    <th scope="col">상세지역</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${lists}">
                 <tr>
                    <th scope="row">${i.id}</th>
                    <td>${i.mname}</td>
                    <td>${i.pw}</td>
                    <td>${i.tel}</td>
                    <td>${i.age}</td>
                    <td>${i.area1}</td>
                    <td>${i.area2}</td>
                    <td><a href="deleteMb.am?pdnum=${i.id}">삭제</a></td>
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