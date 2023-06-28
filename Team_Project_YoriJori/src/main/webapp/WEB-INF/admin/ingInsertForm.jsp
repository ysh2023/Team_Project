<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var use;
	var isCheck = false;
	
	function keyd(){
		$('#dupl').css('display','none');
		use = "";
		isCheck = false;
	}
	
	function ingCheck(){
		isCheck = true;
		var ingname = $("#ingname").val();
		
		if(ingname==''){
			$("#dupl").html('식재료명을 입력하세요.').show();
			return;
		}
		
		$.ajax({
			url : "checkInsertIng.am",
            type : 'POST',
            data : {"ingname":ingname},
            success : function(data) {
            	console.log(data);
            	if(data == "YES"){
					$("#dupl").html('<font color=blue>사용 가능한 식재료명입니다.</font>').show();
					use = "available";
				}else if(data == "NO"){
					$("#dupl").html('이미 있는 식재료명입니다.').show();
					$('#ingname').select();
					use = "duplicate";
				}
            }
        });
	}//ingCheck
	
	function duplCheck(){
		if(isCheck == false){
			alert("중복 체크는 필수입니다.");
			return false;
		}else{
			if(use == "available"){
				var msg = "입력하신 식재료를 추가하시겠습니까?";
				if(confirm(msg) == true){
					document.getElementById('insertForm').submit();
				}else{
					return false;
				}
			}else if(use == "duplicate"){
				alert('중복 식재료명은 추가할 수 없습니다.');
				$('#ingname').select();
				return false;
			}
		}
		
	}//submitCheck
	
</script>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>식재료 관리</h1>
      <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">야금야금</li>
          <li class="breadcrumb-item"><a href="ingList.am">식재료 관리</a></li>
          <li class="breadcrumb-item active">추가하기</li>
        </ol>
      </nav>
    </div><br>
    <section class="section">
      <div class="row">
        <!-- 식재료 리스트 -->
      	<div class="col-lg-8" id="inglist">
          <div class="card"><div class="card-body">
              <h5 class="card-title" style="font-weight: bolder !important;">식재료 리스트</h5>
              <table class="table datatable">
                <thead>
                  <tr>
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
                    <th scope="row">${list.ingnum}</th>
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
      	<!-- 식재료 추가 -->
      	<div class="col-lg-4" id="insertForm">
      	  <div class="card"><div class="card-body">
            <h5 class="card-title" style="font-weight: bolder !important;">식재료 추가하기</h5>
			<form class="row g-3" id="insertForm" enctype="multipart/form-data" action="insertIng.am" method="post" onSubmit="return duplCheck()">
                <div class="col-md-12">
                  <label for="upload" class="form-label">아이콘</label>
                  <input type="file" class="form-control" id="upload" name="upload" required>
                </div>
                <div class="col-md-12">
                  <label for="ingname" class="form-label">식재료명</label>
                  <input type="text" class="form-control" id="ingname" name="ingname" onkeydown="keyd()" maxlength="15" required>
                  <div style="margin-top: 10px;">
                    <input type="button" class="btn btn-secondary btn-sm" value="중복체크" onClick="ingCheck()">
                    &nbsp;<span id="dupl" class="invalid-feedback"></span>
                  </div>
                </div>
                <div class="col-md-12">
                  <label for="ingCtg" class="form-label">카테고리</label>
                  <select class="form-select" id="ingCtg" name="ingcategory" required>
                  	<c:forEach var="ctg" items="${ctg}">
                    	<option value="${ctg}">${ctg}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-12">
                  <label for="expiry" class="form-label">소비기한</label>
                  <input type="number" class="form-control" id="expiry" name="expiry" max="999" required>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">추가하기</button>
                  <button type="reset" class="btn btn-secondary">취소</button>
                </div>
            </form>
          </div></div>
        </div>
      </div>
    </section>
  </main>

 <%@include file= "./../common/admin_footer.jsp" %>