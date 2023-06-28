<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>
<script>
	function checkdeleteComment(id) {
		if(confirm('정말 삭제하시겠습니까')){
			location.href="deleteReport.am?id="+id;
		}else{
			
		}
	}
	
	function checkdeleteReview(id) {
		if(confirm('정말 삭제하시겠습니까')){
			location.href="deleteReveiwReport.am?id="+id;
		}else{
			
		}
	}
</script>

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
      <h1>회원 신고 내역</h1>
      <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Home</li>
          <li class="breadcrumb-item">회원 관리</li>
          <li class="breadcrumb-item active">회원 신고 내역</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <table class="table datatable">
              <h3 style="color: navy; font-family: fantasy;">게시판 댓글 신고</h3>
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
                    <th scope="row">${i.idOrigin}</th>
                    <td>${i.count}</td>
                   
                    <td><a href="detailReport.am?id=${i.idOrigin}">상세보기</a></td>
                    
                 	 <td>
                 	   <form action="stopMember.am">
                 	  <input type="hidden" value="${i.idOrigin}" name="id">
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
                    <td><a href="#" onclick="stop('${i.idOrigin}')">강제탈퇴</a></td>
                    <td><span onclick="checkdeleteComment('${i.repDiscription}')" style="color: blue; cursor: pointer;">내역삭제</span></td>
                  </tr>
                </c:forEach>
          		
        
                </tbody>
              </table>

            </div>
          </div>

        </div>
      </div>
    </section>
     <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <table class="table datatable">
               <h3 style="color: navy; font-family: fantasy;">레시피 댓글 신고</h3>
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
              
                <c:forEach var="i" items="${recipelist}">
                 <tr>
                    <th scope="row">${i.idorigin}</th>
                    <td>${i.count}</td>
                   
                    <td><a href="detailReport.am?id=${i.idorigin}">상세보기</a></td>
                    
                 	 <td>
                 	   <form action="stopMember.am">
                 	  <input type="hidden" value="${i.idorigin}" name="id">
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
                    <td><a href="#" onclick="stop('${i.idorigin}')">강제탈퇴</a></td>
                    <td><span onclick="checkdeleteReview('${i.idorigin}')" style="color: blue; cursor: pointer;">내역삭제</span></td>
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