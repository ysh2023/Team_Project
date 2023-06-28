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
	
	function ingCheck(ingnum){
		isCheck = true;
		var ingname = $("#ingname").val();
		
		if(ingname==''){
			$("#dupl").html('식재료명을 입력하세요.').show();
			return;
		}
		
		$.ajax({
			url : "checkUpdateIng.am",
            type : 'POST',
            data : {"ingnum":ingnum,"ingname":ingname},
            success : function(data) {
            	console.log(data);
            	if(data == "YES"){
					$("#dupl").html('<font color=blue>사용 가능한 식재료명입니다.</font>').show();
					use = "available";
				}else if(data == "NO"){
					$("#dupl").html('이미 있는 식재료명입니다.').show();
					$('#ingname').select();
					use = "duplicate";
				}else if(data == "KEEP"){
					$("#dupl").html('<font color=blue>식재료명 유지함</font>').show();
					use = "available";
				}
            }
        });
	}//ingCheck
	
	function duplCheck(ingnum){
		if(isCheck == false){
			alert("중복 체크는 필수입니다.");
			return false;
		}else{
			if(use == "available"){
				var msg = ingnum+"번 식재료를 수정하시겠습니까?";
				if(confirm(msg) == true){
					document.getElementById('insertForm').submit();
				}else{
					return false;
				}
			}else if(use == "duplicate"){
				alert('이미 있는 식재료명으로 수정 불가합니다.');
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
          <li class="breadcrumb-item active">수정하기</li>
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
      	<!-- 식재료 수정 -->
      	<div class="col-lg-4" id="updateForm">
      	  <div class="card"><div class="card-body">
            <h5 class="card-title" style="font-weight: bolder !important;">식재료 수정하기</h5>
			<form class="row g-3" id="updateForm" enctype="multipart/form-data" action="updateIng.am" method="post" onSubmit="return duplCheck(${ingbean.ingnum})">
				<input type="hidden" name="ingnum" value="${ingbean.ingnum}">
                <div class="col-md-12">
                  <label for="upload" class="form-label">아이콘</label>
                  <div align="center">
                  	<img src="<%=resourcesPath%>/images/icon/${ingbean.ingicon}" style="max-height:50px;"><br>
                  	${ingbean.ingicon}
                  </div>
                  <input type="file" class="form-control" id="upload" name="upload" required>
				  <input type="hidden" name="origin" value="${ingbean.ingicon}">
                </div>
                <div class="col-md-12">
                  <label for="ingname" class="form-label">식재료명</label>
                  <input type="text" class="form-control" id="ingname" name="ingname" value="${ingbean.ingname}" maxlength="15" onkeydown="keyd()" required>
                  <div style="margin-top: 10px;">
                    <input type="button" class="btn btn-secondary btn-sm" value="중복체크" onClick="ingCheck(${ingbean.ingnum})">
                    &nbsp;<span id="dupl" class="invalid-feedback"></span>
                  </div>
                </div>
                <div class="col-md-12">
                  <label for="ingCtg" class="form-label">카테고리</label>
                  <select class="form-select" id="ingCtg" name="ingcategory" required>
                  	<c:forEach var="ctg" items="${ctg}">
                    	<option value="${ctg}" <c:if test="${ingbean.ingcategory eq ctg}">selected</c:if>>${ctg}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-12">
                  <label for="expiry" class="form-label">소비기한</label>
                  <input type="text" class="form-control" id="expiry" name="expiry" value="${ingbean.expiry}" max="999" required>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">수정하기</button>
                  <button type="reset" class="btn btn-secondary">취소</button>
                </div>
            </form>
          </div></div>
        </div>
      </div>
    </section>
  </main>

 <%@include file= "./../common/admin_footer.jsp" %>