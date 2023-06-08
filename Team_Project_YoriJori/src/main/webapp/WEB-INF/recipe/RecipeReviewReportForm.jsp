<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/header.jsp" %>

<section class="ftco-section ftco-degree-bg">
<div class="container">
	<div class="row">
    	<div class="col-lg-12 ftco-animate">
  			<div class="pt-5 mt-5">
  				<div class="comment-form-wrap pt-5">
	                <h3 class="mb-5">리뷰신고</h3>
	                <form action="report.re" method="post" class="p-5 bg-light">
	                  <div class="form-group">
	                    <input type="hidden" class="form-control" name="reviewnum" value="${param.reviewnum}">
	                    <input type="hidden" class="form-control" name="recipenum" value="${param.recipenum}">
	                  </div>
	                 <div class="form-group">
	                    <label for="message">신고사유</label>
	                    <select name="reportcontent" id="message" class="form-control">
	                    	<option value="욕설">욕설</option>
	                    	<option value="비방">비방</option>
	                    	<option value="광고">광고</option>
	                    	<option value="허위">허위</option>
	                    </select>
	                  </div>
	                 <div class="form-group">
	                    <input type="submit" value="신고하기" class="btn py-3 px-4 btn-primary">
	            	</div>
                </form>
              </div>
  			</div>
  		</div>
  	</div>
</div>
</section>
<%@include file= "./../common/footer.jsp" %>