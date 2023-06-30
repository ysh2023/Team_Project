<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<script>

	function checkdeleteComment(id , repNum) {
		if(confirm('정말 삭제하시겠습니까')){
			location.href="deleteComment.am?id="+id+"&repNum="+repNum;
		}else{
			
		}
	}
	
	function checkdeleteReview(id , rerepnum) {
		if(confirm('정말 삭제하시겠습니까')){
			location.href="deleteComment.am?id="+id+"&rerepnum="+rerepnum;
		}else{
			
		}
	}
	function checkblindComment(id , repNum, comcontent) {
		if(confirm('블라인드 처리/해제 하시겠습니까')){
			if(comcontent == ""){
				alert('이미 삭제된 댓글은 블라인드처리가 불가능 합니다.');
			}else{
				location.href="blindReport.am?id="+id+"&repNum="+repNum;
			}
		}else{
			
		}
	}
	
	function checkblindReview(id , rerepnum, review) {
		if(confirm('블라인드 처리/해제 하시겠습니까')){
			if(review == ""){
				alert('이미 삭제된 댓글은 블라인드처리가 불가능 합니다.');
			}else{
				location.href="blindReport.am?id="+id+"&rerepnum="+rerepnum;
			}
		}else{
			
		}
	}
		
</script>
 

<main id="main" class="main">
  <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">게시판상세신고내역</h5>
              
              
              <div>
                <table class="table datatable">
                <thead> 
                  <tr>
                    <th scope="col">아이디</th>
                    <th scope="col">댓글내용</th>
                    <th scope="col">신고이유</th>
                    <th scope="col">상세설명</th>
                    <th scope="col">댓글삭제</th>
                    <th scope="col">블라인드</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${lists}">
                 <tr>
                    <th scope="row">${i.id}</th>
                    <c:if test="${i.comcontent == null }">
                    	<td><span style="color: red;">삭제된 댓글</span></td>
                    </c:if>
                    <c:if test="${i.comcontent != null }">
                    <td>${i.comcontent}</td>
                    </c:if>
                    <td>${i.reasons}</td>
                    <td>${i.repDiscription}</td>
                    <td><span onclick="checkdeleteComment('${id}','${i.count}')" style="color: blue; cursor: pointer;">삭제</span></td>
                  	<c:if test="${i.report == 0}">
                    <td><span onclick="checkblindComment('${id}','${i.count}','${i.comcontent}')" style="color: blue; cursor: pointer;">블라인드</span></td>
                    </c:if> 
                    <c:if test="${i.report == 1}">
                    <td><span onclick="checkblindComment('${id}','${i.count}','${i.comcontent}')" style="color: red; cursor: pointer;">블라인드 해제</span></td>
                    </c:if> 
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              </div>



            </div>
          </div>

        </div>
        
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">레시피댓글신고내역</h5>
              
              
              
              <div>
                <table class="table datatable">
                <thead> 
                  <tr>
                    <th scope="col">아이디</th>
                    <th scope="col">댓글내용</th>
                    <th scope="col">신고이유</th>
                    <th scope="col">상세설명</th>
                    <th scope="col">댓글삭제</th>
  					<th scope="col">블라인드</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="i" items="${recipeList}">
                 <tr>
                    <th scope="row">${i.id}</th>
                    <c:if test="${i.review == null }">
                    	<td><span style="color: red;">삭제된 댓글</span></td>
                    </c:if>
                    <c:if test="${i.review != null }">
                    <td>${i.review}</td>
                    </c:if>
                    <td>${i.reportreason}</td>
                    <td>${i.reportcontent}</td>
                    <td><span onclick="checkdeleteReview('${id}','${i.count}')" style="color: blue; cursor: pointer;">삭제</span></td>
                    <c:if test="${i.report == 0}">
                    <td><span onclick="checkblindReview('${id}','${i.count}','${i.review}')" style="color: blue; cursor: pointer;">블라인드</span></td>
                    </c:if> 
                    <c:if test="${i.report == 1}">
                    <td><span onclick="checkblindReview('${id}','${i.count}','${i.review}')" style="color: red; cursor: pointer;">블라인드 해제</span></td>
                    </c:if> 
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