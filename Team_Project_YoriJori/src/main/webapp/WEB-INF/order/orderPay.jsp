<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>
   <div class="hero-wrap hero-bread" style="background-image: url('<%=resourcesPath%>/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>결제</span></p>
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
	                  <input type="text" class="form-control" name="name" id="ordname" value="${buyname }" >
	                	<div class="invalid-feedback">
			                이름을 입력해주세요.
			            </div>
	                </div>
	              </div>
              <div class="w-100"></div>
		           <!--    <div class="col-md-12">
		            	<div class="form-group">
		            		<label for="country">State / Country</label>
		            		<div class="select-wrap">
		                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
		                  <select name="" id="" class="form-control">
		                  	<option value="">France</option>
		                    <option value="">Italy</option>
		                    <option value="">Philippines</option>
		                    <option value="">South Korea</option>
		                    <option value="">Hongkong</option>
		                    <option value="">Japan</option>
		                  </select>
		                </div>
		            	</div>
		            </div>-->
		            <div class="w-100"></div>
		            <div class="col-md-6">
		            	<div class="form-group">
		            		<label for="postcodezip">우편번호</label>
	                  <input type="text" class="form-control" name="ordzipcode" id="ordzipcode">
	                  <div class="invalid-feedback">
		                우편번호를 입력해주세요.
		              </div>
	                </div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-12">
		            	<div class="form-group">
	                	<label for="streetaddress">주소</label>
	                  <input type="text" class="form-control" placeholder="주소를 입력해 주세요." name="ordaddr" id="ordaddr">
	                  <div class="invalid-feedback">
		                주소를 입력해주세요.
		              </div>
	                </div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-6">
	                <div class="form-group">
	                	<label for="phone">핸드폰 번호</label>
	                  <input type="text" class="form-control" placeholder="" name="ordtel" id="ordtel">
	                  <div class="invalid-feedback">
		                핸드폰 번호를 입력해주세요.
		              </div>
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="emailaddress">이메일 주소</label>
	                  <input type="text" class="form-control" placeholder="" name="ordemail" id="ordemail">
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
		    						<span>무료</span>
		    					</p>
		    					<p class="d-flex">
		    						<span>할인가격</span>
		    						<span>0원</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>Total</span>
		    						<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAmount}" />원</span>
		    					</p>
								</div>
	          	</div>
	          	<div class="col-md-12">
	          		<div class="cart-detail p-3 p-md-4">
	<!--           			<h3 class="billing-heading mb-4">결제 수단</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label><input type="radio" name="optradio" class="mr-2" value="무통장 입금"> 무통장 입금</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label><input type="radio" name="optradio" class="mr-2" value="카드 결제"> 카드 결제</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
											   <label><input type="radio" name="optradio" class="mr-2" value="일반 결제"> 일반 결제</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="checkbox">
											   <label><input type="checkbox" value="" class="mr-2"> I have read and accept the terms and conditions</label>
											</div>
										</div>
									</div> -->
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

