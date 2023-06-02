<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>
<script type="text/javascript" src="<%=conPath%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=resourcesPath%>/js/jquery-3.2.1.min.js"/></script>


<script>

$(document).ready(function(){	
	const urlParams = new URL(location.href).searchParams;
	const whatColumn = urlParams.get('whatColumn');
	const keyword = urlParams.get('keyword');
	
	
	 if(whatColumn==null){
			//alert("없다");
			document.getElementById('le1').style.backgroundColor = ' #89A621';
			document.getElementById('le1').style.color = 'yellow';
		}else {
			
			if(keyword=="채소"){
				document.getElementById('le2').style.backgroundColor = ' #89A621';
				document.getElementById('le2').style.color = 'yellow';
			}else if(keyword=="과일"){
				document.getElementById('le3').style.backgroundColor = ' #89A621';
				document.getElementById('le3').style.color = 'yellow';
			}else if(keyword=="쌀/견과"){
				document.getElementById('le4').style.backgroundColor = ' #89A621';
				document.getElementById('le4').style.color = 'yellow';
			}else if(keyword=="정육/계란류"){
				document.getElementById('le5').style.backgroundColor = ' #89A621';
				document.getElementById('le5').style.color = 'yellow';
			}else if(keyword=="우유/유제품"){
				document.getElementById('le6').style.backgroundColor = ' #89A621';
				document.getElementById('le6').style.color = 'yellow';
			}else{
				document.getElementById('le7').style.backgroundColor = ' #89A621';
				document.getElementById('le7').style.color = 'yellow';
			}
		}
	
	

	
});


</script>




<div class="hero-wrap hero-bread" style="background-image: url('<%=resourcesPath%>/images/mall_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>상품보기</span></p>
            <h1 class="mb-0 bread">Products</h1>
          </div>
        </div>
      </div>
      
      
    </div>


    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li ><a href="shop.prd"  id="le1" >모두보기</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=채소" id="le2">채소</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=과일"  id="le3">과일</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=쌀/견과"  id="le4">쌀/견과</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=정육/계란류"  id="le5">정육/계란류</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=우유/유제품"  id="le6">우유/유제품</a></li>
    					<li><a href="shop.prd?whatColumn=se&keyword=양념/오일"  id="le7">양념/오일</a></li>
    				</ul>
    			</div>
    			</div>
    		</div>
    		
    		<div class="row">
  
				<c:forEach var="i" items="${lists}">  		
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="prdDetail.prd?pdnum=${i.pdnum}" class="img-prod"><img class="img-fluid" src="${i.pdimage}" alt="Colorlib Template">
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="prdDetail.prd?pdnum=${i.pdnum}">${i.pdname }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price">${i.pdprice }</p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			
    		</c:forEach>  	
    			
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
      		 ${pageInfo.pagingHtml}
            </div>
          </div>
        </div>
    
    </section>

<%@include file= "./../common/footer.jsp" %>