<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

<%
String cateArr[]= {"채소","과일","쌀/견과","정육/계란류","우유/유제품","수산물/건해산","양념/오일"};
%>

      <div class="pagetitle">
      <h1>상품 수정하기(${product.pdnum})</h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">상품수정폼</h5>

              <form  action="updatePrd.am" method="post" enctype="multipart/form-data">
                <input type="hidden" name="pdnum" class="form-control" value="${product.pdnum}" required>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label" >상품명</label>
                  <div class="col-sm-10">
                    <input type="text" name="pdname" class="form-control" maxlength="10" value="${product.pdname}" required>
                  </div>
                  
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">카테고리</label>
                  <div class="col-sm-10">
                    <select class="form-select"  name="pdcategory"  aria-label="Default select example" required>
                      <option value="" selected>선택하세요</option>
                      
                      <c:forEach var="i" items="<%=cateArr%>"><option value="${i}"
                      
                      <c:if test="${i eq product.pdcategory}">selected</c:if>
                      >${i}</option> </c:forEach>
    
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">상품 설명</label>
                  <div class="col-sm-10">
                    <textarea class="form-control"   maxlength="10" name="pdcontent" style="height: 100px" >${product.pdcontent}</textarea>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber"  class="col-sm-2 col-form-label">재고량</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control"  min="1" max="80" name="pdstock" value="${product.pdstock}" required>
                  </div>
                </div>
                
                 <div class="row mb-3">
                   <label for="inputNumber" class="col-sm-2 col-form-label" >가격</label>
                  <div class="col-sm-10">
                     <input type="number" class="form-control"  min="1" max="100000"  name="pdprice"  maxlength="4" value="${product.pdprice}" required>
                  </div>
                 </div>
                
                <div class="row mb-3">
                  <label for="upload" class="col-sm-2 col-form-label">상품사진</label>
                  <div class="col-sm-10">
                  	<img src="<%=request.getContextPath()%>/resources/img_pd/${product.pdimage}" width="100px"><br><br>
                  	                
					<input type="file" name="upload" id="upload" value="${product.pdimage}" >
					<input type="hidden" name="upload2" value="${product.pdimage}">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Submit Button</label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit Form</button>
                  </div>
                </div>

              </form>

            </div>
          </div>

        </div>
        </div>
        </section>
  </main>

 <%@include file= "./../common/admin_footer.jsp" %>