<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#area1").value = data.zonecode;
           document.querySelector("#area2").value =  data.address
        }
    }).open();
}
</script>    
<%@include file= "./../common/header.jsp" %>
   <div class="hero-wrap hero-bread" style="background-image: url('<%=resourcesPath%>/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span>결제</span></p>
            <h1 class="mb-0 bread">결제 하기</h1>
          </div>
        </div>
      </div>
    </div>
<input type="hidden" name="totalAmount" value="${totalAmount }">
 <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
							<h3 class="mb-4 billing-heading">결제 세부 사항</h3>
	          	<div class="row align-items-end">
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="name">이름</label>
	                  <input type="text" class="form-control" name="name" id="ordname" maxlength="6" value="${mb.mname }" >
	                	<div class="invalid-feedback">
			                이름을 입력해주세요.
			            </div>
	                </div>
	              </div>
              <div class="w-100"></div>
		            <div class="w-100"></div>
		            <div class="col-md-6">
		            	<div class="form-group">
		            		<label for="area1">우편번호</label> <input type="text"
							class="form-control" value="${mb.area1 }" id="area1" name="area1" maxlength="10" required > 
									 <br>
							 <input type="button" value="우편번호찾기"  onclick="kakaopost()">
	                  <div class="invalid-feedback">
		                우편번호를 입력해주세요.
		              </div>
	                </div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-12">
		            	<div class="form-group">
	                	<label for="area2">상세주소<span class="text-muted"></span></label> <input
							type="text" class="form-control" value="${mb.area2 }" required name="area2" maxlength="20" id="area2"
							placeholder="상세주소를 입력해주세요.">
	                  <div class="invalid-feedback">
		                주소를 입력해주세요.
		              </div>
	                </div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-6">
	                <div class="form-group">
	                	<label for="phone">핸드폰 번호</label>
	                  <input type="text" class="form-control" placeholder="" name="ordtel" id="ordtel" maxlength="11" value="${mb.tel }">
	                  <div class="invalid-feedback">
		                핸드폰 번호를 입력해주세요.
		              </div>
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="emailaddress">이메일 주소</label>
	                  <input type="text" class="form-control" placeholder="" name="ordemail" id="ordemail" maxlength="20" value="${mb.email}">
	                  <div class="invalid-feedback">
		                이메일을 입력해주세요.
		              </div>
	                </div>
                </div>
                <div class="w-100"></div>
	            </div>
					</div>
					<div class="col-xl-5">
	          <div class="row mt-5 pt-3">
	          	<div class="col-md-12 d-flex mb-5">
	          		<div class="cart-detail cart-total p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">결제 금액</h3>
	          			<p class="d-flex">
		    						<span>총합</span>
		    						<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAmount}" />원</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>배송비</span>
		    						<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${Baesong }" />원</span>
		    					</p>
<!-- 		    					<p class="d-flex">
		    						<span>할인가격</span>
		    						<span>0원</span>
		    					</p> -->
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>결제 금액</span>
		    						<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAmount+Baesong}" />원</span>
		    					</p>
								</div>
	          	</div>
	          	<div class="col-md-12">
	          		<div class="cart-detail p-3 p-md-4">
									<p>
									<button class="btn btn-primary py-3 px-4" id="requestPay" onclick="">결제하기</button>
									<!-- <button type="submit" class="btn btn-primary py-3 px-4" onclick="return requestPay()">결제하기</button> -->
									<!-- 결제 requestPay함수는 header.jsp에서 처리 -->
									<!-- <input type="submit" value="결제하기" class="btn btn-primary py-3 px-4"> -->
									</p>
								</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> 
<%@include file= "./../common/footer.jsp" %>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
