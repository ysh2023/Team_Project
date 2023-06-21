<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
<%@include file= "./../common/admin_header.jsp" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function stop(id){
	var check=confirm("삭제 하시겠습니까?");
	if(check==true){
		location.href="deleteMb.am?id="+id;
	}
	
}
	
</script>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>회원 관리</h1>
      <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Home</li>
          <li class="breadcrumb-item">회원 관리</li>
          <li class="breadcrumb-item active">회원 목록</li>
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
                    <th scope="col">이름</th>
                    <th scope="col">비번</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">나이</th>
                    <th scope="col">우편번호</th>
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
                    <td>
                  		<a href="#" onclick="stop('${i.id}')"><i class="bi bi-x-square"></i></a>
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