<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	/* 삭제 확인 */
	function delConfirm(refnum){
		var msg = "해당 식재료를 냉장고에서 삭제하시겠습니까?";
	    var url = "delete.ref?refnum="+refnum;
	    
	    if(confirm(msg) == true){
			location.href = url;
		}else{
			return false;
		}
	}
</script>

<!-- title -->
<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(<%=resourcesPath%>/images/bg_3.jpg);">
    <div class="container">
    	<div class="col-md-7 heading-section ftco-animate text-center" style="margin:auto;">
          <span class="subheading">My refrigerator</span>
	      <h2 class="mb-4">식재료 수정하기</h2>
		  <p></p>
		</div>  
    </div>
</section>
  
<section class="ftco-section testimony-section">
  <div class="container">
    <div align="center" style="margin-bottom: 20px;">
      <img src="<%=resourcesPath%>/images/icon/${joinbean.ingicon}" style="width: 40px;">
	  <b style="font-size: 20pt">${joinbean.ingname}</b>
	</div>
	<div class="comment-form-wrap col-md-12 mx-auto" style="max-width: 800px; margin: auto;">
	  <!-- 수정 폼 -->
  	  <form name="refDetail" action="update.ref" method="post" class="p-5 bg-light">
  	    <input type="hidden" name="refnum" value="${joinbean.refnum}">
		<div class="row align-items-end">
  	    <div class="form-group col-md-6">
		  <label>추가일</label>
		  <fmt:parseDate var="inputdate" value="${joinbean.inputdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		  <fmt:formatDate var="inputdate" value="${inputdate}" pattern="yyyy-MM-dd"/>
		  <h5 class="heading">${inputdate}</h5>
      	</div>
      	<div class="form-group col-md-6">
		  <label>카테고리</label>
		  <h5 class="heading">${joinbean.ingcategory}</h5>
      	</div>
      	<div class="form-group col-md-6">
          <label for="refdday">* 유통기한</label>
          <fmt:parseDate var="dday" value="${joinbean.refdday}" pattern="yyyy-MM-dd"/>
		  <fmt:formatDate var="dday" value="${dday}" pattern="yyyy-MM-dd"/>
		  <jsp:useBean id="javaDate" class="java.util.Date" />
		  <fmt:formatDate var="nowDate" value="${javaDate}" pattern="yyyy-MM-dd"/>
		  <input type="date" class="form-control" id="refdday" name="refdday" value="${dday}" min="${nowDate}">
      	</div>
      	<div class="form-group col-md-6">
          <label for="refstorage">* 보관</label>
          <select class="form-control" id="refstorage" name="refstorage">
			<option value="냉장" <c:if test="${joinbean.refstorage eq '냉장'}">selected</c:if>>냉장</option>
			<option value="냉동" <c:if test="${joinbean.refstorage eq '냉동'}">selected</c:if>>냉동</option>
			<option value="실온" <c:if test="${joinbean.refstorage eq '실온'}">selected</c:if>>실온</option>
		  </select>
      	</div>
	  	<div class="form-group col-md-12">
          <label for="refdetail">메모 (최대 33자 입력 가능)</label>
          <textarea class="form-control" name="refdetail" id="refdetail" cols="30" rows="3" maxlength="33">${joinbean.refdetail}</textarea>
      	</div>
      	</div>
      	<br>
      	<div class="form-group" align="center">
          <input type="submit" value="수정하기" class="btn py-3 px-4 btn-primary"> &nbsp;&nbsp;
          <input type="button" value="삭제하기" class="btn py-3 px-4 btn-secondary" onClick="delConfirm(${joinbean.refnum})">
      	</div>
	  </form>
	</div>
  </div>
</section>

<%@include file= "../common/footer.jsp" %>