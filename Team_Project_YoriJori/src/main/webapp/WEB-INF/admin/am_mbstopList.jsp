<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>정지 회원 목록</h1>
	  <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Home</li>
          <li class="breadcrumb-item">회원 관리</li>
          <li class="breadcrumb-item active">정지 회원 목록</li>
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
                    <th scope="col">아이디</th>
                    <th scope="col">정지날짜</th>
                    <th scope="col">정지수정</th>
                    <th scope="col">정지해제</th>
                  </tr>
                </thead>
                <tbody>
              
                <c:forEach var="i" items="${lists}">
                 <tr>
                    <th scope="row">${i.id}</th>
                    <td>${i.stopdate}</td>
           
                 	 <td>
                 	   <form action="stopMember.am">
                 	  <input type="hidden" value="${i.id}" name="id">
                 	    <input type="hidden" value="no" name="check">
                 	 <select id="stopdate" name="stopdate">
                    <option value="7">7일</option>
                    <option value="10">10일</option>
                    <option value="30">30일</option>
                    <option value="60">60일</option>
                    </select>
                    <input type="submit" value="수정">
                     </form>
                   
                    </td>
                    <td><a href="deleteStop.am?id=${i.id}">정지해제</a></td>
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