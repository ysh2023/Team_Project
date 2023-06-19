<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">
  <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">상세신고내역</h5>
              
              
              
              <div>
                <table class="table datatable">
                <thead> 
                  <tr>
                    <th scope="col">아이디</th>
                    <th scope="col">댓글내용</th>
                    <th scope="col">신고이유</th>
                    <th scope="col">상세설명</th>
                    <th scope="col">댓글삭제</th>
  
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${lists}">
                 <tr>
                    <th scope="row">${i.id}</th>
                    <td>${i.comcontent}</td>
                    <td>${i.reasons}</td>
                    <td>${i.repDiscription}</td>
                    <td><a href="deleteComment.am?id=${i.id}&comNum=${i.comNum}">삭제</a></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              </div>



            </div>
          </div>

        </div>
        </div>
        </section>
</main>

 <%@include file= "./../common/admin_footer.jsp" %>