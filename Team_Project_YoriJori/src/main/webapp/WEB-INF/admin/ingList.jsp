<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function refCheck(ingnum){
		$.ajax({
			url : "refCheck.am",
            type : 'POST',
            data : {"ingnum":ingnum},
            success : function(data) {
            	console.log(data);
            	if(data == "YES"){
            		var msg = ingnum+"번 식재료를 삭제하시겠습니까?";
    				if(confirm(msg) == true){
    					document.getElementById('deleteForm').submit();
    				}else{
    					return false;
    				}
				}else if(data == "NO"){
					alert("회원이 냉장고에 추가한 식재료는 삭제할 수 없습니다.");
				}
            }
        });
	}//refCheck
	
</script>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>식재료 관리</h1>
      <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">야금야금</li>
          <li class="breadcrumb-item active">식재료 리스트</li>
        </ol>
      </nav>
    </div>
    <section class="section">
      <div class="row">
        <!-- 식재료 리스트 -->
      	<div class="col-lg-12" id="inglist">
          <div class="card"><div class="card-body">
              <h5 class="card-title" style="font-weight: bolder !important;">
              	식재료 리스트
              	<a href="insertIng.am">
              	  <button type="button" class="btn btn-primary" style="margin-left:20px;">
              		<i class="bi bi-plus-circle"></i> 추가하기
              	  </button>
              	</a>
              </h5>
              <table class="table datatable">
                <thead>
                  <tr>
                  	<th scope="col">삭제</th>
                    <th scope="col">#</th>
                    <th scope="col">아이콘</th>
                    <th scope="col">식재료명</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">소비기간</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="list" items="${allList}">
                  <tr>
                  	<td>
                      <form action="ingDelete.am" method="post" id="deleteForm">
                        <input type="hidden" name="ingnum" value="${list.ingnum}">
                  		<a href="#" onclick="refCheck(${list.ingnum})"><i class="bi bi-x-square"></i></a>
                  	  </form>
                  	</td>
                    <th>${list.ingnum}</th>
                    <td><img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="max-height:30px;"></td>
                    <td>
                    	<c:if test="${list.ingnum eq 1}">${list.ingname}</c:if>
                    	<c:if test="${list.ingnum != 1}">
                    		<a href="updateIng.am?ingnum=${list.ingnum}">${list.ingname}</a>
                    	</c:if>
                    </td>
                    <td>${list.ingcategory}</td>
                    <td>${list.expiry}일</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
          </div></div>
      	</div>
      </div>
    </section>

  </main>

 <%@include file= "./../common/admin_footer.jsp" %>