<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

<main id="main" class="main">

      <div class="pagetitle">
      <h1>상품 추가하기</h1>
      <nav style="margin-top: 10px;">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">식재료 쇼핑몰</li>
          <li class="breadcrumb-item active">상품 추가</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">상품입력폼</h5>

              <!-- General Form Elements -->
              <form  action="insertPrd.am" method="post" enctype="multipart/form-data">
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label"  maxlength="10" >상품명</label>
                  <div class="col-sm-10">
                    <input type="text" name="pdname" class="form-control" required>
                  </div>
                  
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">카테고리</label>
                  <div class="col-sm-10">
                    <select class="form-select"  name="pdcategory"  aria-label="Default select example" required>
                      <option value="" selected>선택하세요</option>
                      <option value="채소">채소</option>
                      <option value="과일">과일</option>
                      <option value="쌀/견과">쌀/견과</option>
                      <option value="정육/계란류">정육/계란류</option>
                      <option value="우유/유제품">우유/유제품</option>
                      <option value="수산물/건해산">수산물/건해산</option>
                      <option value="양념/오일">양념/오일</option>
                    </select>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">상품 설명</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" maxlength="10"  name="pdcontent" style="height: 100px"></textarea>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber"  class="col-sm-2 col-form-label">재고량</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" min="1" max="80" name="pdstock" required>
                  </div>
                </div>
                
                 <div class="row mb-3">
                   <label for="inputNumber" class="col-sm-2 col-form-label" >가격</label>
                  <div class="col-sm-10">
                     <input type="number" class="form-control"  min="1" max="100000" name="pdprice" required>
                  </div>
                 </div>
                
                <div class="row mb-3">
                  <label for="upload" class="col-sm-2 col-form-label">상품사진</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file"  id=upload name="upload" required>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Submit Button</label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit Form</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>
        </div>
        </section>
  </main>

 <%@include file= "./../common/admin_footer.jsp" %>