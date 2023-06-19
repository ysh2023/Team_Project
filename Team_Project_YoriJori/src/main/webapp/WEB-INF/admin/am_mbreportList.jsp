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
                    <th scope="col">회원정지</th>
                    <th scope="col">강제탈퇴</th>
                    <th scope="col">내역삭제</th>
                  </tr>
                </thead>
                <tbody>
              
                <c:forEach var="i" items="${lists}">
                 <tr>
                    <th scope="row">${i.id}</th>
                    <td>${i.count}</td>
                   
                    <td><a href="detailReport.am?id=${i.id}">상세보기</a></td>
                    
                 	 <td>
                 	   <form action="stopMember.am">
                 	  <input type="hidden" value="${i.id}" name="id">
                 	    <input type="hidden" value="ys" name="check">
                 	 <select id="stopdate" name="stopdate">
                    <option value="7">7일</option>
                    <option value="10">10일</option>
                    <option value="30">30일</option>
                    <option value="60">60일</option>
                    </select>
                    <input type="submit" value="정지">
                     </form>
                   
                    </td>
                    <td><a href="deleteMb.am?id=${i.id}">강제탈퇴</a></td>
                    <td><a href="deleteReport.am?id=${i.id}">내역삭제</a></td>
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