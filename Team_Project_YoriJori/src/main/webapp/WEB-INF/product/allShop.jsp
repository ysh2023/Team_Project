<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/header.jsp" %>
<script type="text/javascript" src="<%=conPath%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=resourcesPath%>/js/jquery-3.2.1.min.js"/></script>


<script>

var height;
$(window).scroll(function () {
   height = $(document).scrollTop();
   console.log(height);
});

/* 메모 삭제 확인 */
function delMemo(memonum){
   var msg = "해당 메모를 삭제하시겠습니까?";
    var url = "delete.memo?memonum="+memonum+"&myscroll="+height+"&destination=prd";
    
    if(confirm(msg) == true){
      location.href = url;
   }else{
      return false;
   }
}

/* 메모 작성폼 띄우기 */
function showWriteForm(){
   $('#memowriteform').show();
}

/* 메모 작성폼 숨기기 */
function hideWriteForm(){
   $('#memowriteform').hide();
}

/* 메모 작성폼 submit */
function submitWriteForm(){
   var myScroll = document.createElement("input");
   myScroll.type = "hidden";
   myScroll.name = "myscroll";
   myScroll.value = height;
   document.getElementById('writeForm').appendChild(myScroll);
   
   var msg = "작성하신 메모를 추가하시겠습니까?";
   if(confirm(msg) == true){
      document.getElementById('writeForm').submit();
   }else{
      return false;
   }
}

/* 메모 수정 submit */
function updateMemo(){
   var myScroll = document.createElement("input");
   myScroll.type = "hidden";
   myScroll.name = "myscroll";
   myScroll.value = height;
   document.getElementById('updateForm').appendChild(myScroll);
   
   document.getElementById('updateForm').submit();
}

$(document).ready(function(){   
   var modelscroll = "${modelscroll}";
    if(modelscroll != null){
       window.scrollTo(0,modelscroll);
    }
    
   const urlParams = new URL(location.href).searchParams;
   const whatColumn = urlParams.get('whatColumn');
   const keyword = urlParams.get('keyword');
   
   
    if(whatColumn!="se"){
         //alert("없다");
         document.getElementById('le1').style.backgroundColor = ' #89A621';
         document.getElementById('le1').style.color = 'yellow';
      }
    
    
    else{
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
         }else if(keyword=="수산물/건해산"){
            document.getElementById('le7').style.backgroundColor = ' #89A621';
            document.getElementById('le7').style.color = 'yellow';
         }else{
            document.getElementById('le8').style.backgroundColor = ' #89A621';
            document.getElementById('le8').style.color = 'yellow';
         }
      }
   
   

   
});


</script>

<style>
#floating{
 position: fixed; 
 margin-right: -800px;
  right: 50%; 
  top: 180px;
  width:200px;
 
}


</style>

<!-- 상품보기 상단 -->
<div class="hero-wrap hero-bread" style="background-image: url('<%=resourcesPath%>/images/bg_1.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-center justify-content-center">
      <div class="col-md-9 ftco-animate text-center fadeInUp ftco-animated">
        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>상품보기</span></p>
        <h1 class="mb-0 bread">Products</h1>
      </div>
    </div>
  </div>
</div>

<!-- 상품 리스트 -->
<section class="ftco-section">
  <div class="container">
    <div class="row justify-content-center">
      <!-- 상품 카테고리별 네비게이터 -->
      <div class="col-lg-9 text-center">
        <ul class="product-category">
         <li><a href="shop.prd?whatColumn=no&searchName= "  id="le1" >모두보기</a></li>
         <li><a href="shop.prd?whatColumn=se&keyword=채소&searchName=" id="le2">채소</a></li>
         <li><a href="shop.prd?whatColumn=se&keyword=과일&searchName= "  id="le3">과일</a></li>
         <li><a href="shop.prd?whatColumn=se&keyword=쌀/견과&searchName= "  id="le4">쌀/견과</a></li>
         <li><a href="shop.prd?whatColumn=se&keyword=정육/계란류&searchName= "  id="le5">정육/계란류</a></li>
         <li><a href="shop.prd?whatColumn=se&keyword=우유/유제품&searchName= "  id="le6">우유/유제품</a></li>
         <li><a href="shop.prd?whatColumn=se&keyword=수산물/건해산&searchName= "  id="le7">수산물/건해산</a></li>
         <li><a href="shop.prd?whatColumn=se&keyword=양념/오일&searchName= "  id="le8">양념/오일</a></li>
         
       </ul>
       <!-- 상품 검색 -->
       <form action="shop.prd" class="search-form">
        <input type="hidden" value="${keyword}" name="keyword">
        <input type="hidden" value="${whatColumn}" name="whatColumn">
        <input  type="search" placeholder="상품명 입력하세요" aria-label="Search"  name="searchName" width="30px;" style="margin-bottom: 10px;">
        <input type="submit" value="검색">
      </form>
      <!-- 상품 목록 -->
      <div class="row" style="margin-top:20px;">
         <c:forEach var="i" items="${lists}">
            <div class="col-lg-3 ftco-animate fadeInUp ftco-animated">
             <div class="product">
                <a href="prdDetail.prd?pdnum=${i.pdnum}" class="img-prod">
                   <img class="img-fluid" src="<%=resourcesPath%>/img_pd/${i.pdimage}" alt="Colorlib Template">
                </a>
                <div class="text py-3 pb-4 px-3 text-center">
                   <h3><a href="prdDetail.prd?pdnum=${i.pdnum}">${i.pdname }</a></h3>
                   <div class="d-flex">
                      <div class="pricing"><p class="price">  <fmt:formatNumber value="${i.pdprice }" /> <br/></p></div>
                   </div>
                   <div class="bottom-area d-flex px-3">
                      <div class="m-auto d-flex">
                         <a href="insert.bsk?pdnum=${i.pdnum }&qty=1" class="buy-now d-flex justify-content-center align-items-center mx-1">
                         <span><i class="ion-ios-cart"></i></span>
                         </a>
                         <a href="insertDibs.mp?pdnum=${i.pdnum}&pageNumber=${pageInfo.pageNumber}" class="heart d-flex justify-content-center align-items-center ">
                         <span><i class="ion-ios-heart"></i></span>
                         </a>
                      </div>
                   </div>
                </div>
             </div>
             </div>
           </c:forEach>
        </div>
        <!-- 페이징 -->
       <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                ${pageInfo.pagingHtml}
              </ul>
            </div>
          </div>
        </div>
        <!-- 상품 리스트 끝 -->
      </div>
      
      <!-- 오른쪽 -->
      <c:if test="${loginInfo != null}">
      <div class="col-lg-3 sidebar ftxo-animate fadeInUp ftco-animated">
         <!-- 메모 리스트 -->
         <div class="sidebar-box ftxo-animate fadeInUp ftco-animated">
             <div class="bg-light" style="min-height: 300px; max-height: 900px; position:relative;">
                <div style="text-align: center; padding-top: 20px; padding-bottom: 15px;">
                    <i class="icon-sticky-note" style="color:#F2BC1B;"></i> &nbsp; <b>장보기 메모</b>
                 </div>
                 <form id="updateForm" action="update.memo" method="post">
                   <input type="hidden" name="destination" value="prd">
                      <c:forEach var="list" items="${userMemo}">
                       <div class="block-21 mb-2 d-flex">
                        <div class="text" style="margin: auto;">
                       <div style="padding-top: 10px;">
                           <span onClick="delMemo(${list.memonum})" style="cursor: pointer;">
                            <i class="icon-close2" style="color:gray"></i>
                           </span>
                           <input type="checkbox" id="memonum" name="memonum" value="${list.memonum}" <c:if test="${list.memoflag eq 1}">checked</c:if>>
                           &nbsp;<a href="shop.prd?keyword=&whatColumn=no&searchName=${list.memotask}&ck=ys">${list.memotask}</a>
                        </div>
                        <div class="meta">${list.memocontent}</div>
                      </div>
                    </div>
                     </c:forEach>
                </form>
                <!-- 메모 버튼 -->
               <div style="text-align: center; padding-top: 20px; padding-bottom: 15px;">
                    <span href="#" onclick="showWriteForm()" style="cursor: pointer;">
                      <i class="icon-add_circle" style="color:gray; font-size: 10pt;">&nbsp;쓰기</i>
                    </span>
                    &nbsp;&nbsp;&nbsp;
                    <span onclick="updateMemo()" style="cursor: pointer;">
                      <i class="icon-save2" style="color:gray; font-size: 10pt;">&nbsp;저장</i>
                    </span>
                </div>
             </div>
          </div>
         
         <!-- 메모 작성 폼 -->
         <div class="sidebar-box ftxo-animate fadeInUp ftco-animated" id="memowriteform" style="display: none;">
               <div class="bg-light" style="min-height: 300px; position:relative;">
                 <div style="text-align: center; padding-top: 20px; padding-bottom: 15px;">
                    <i class="icon-sticky-note" style="color:#F2BC1B;"></i> &nbsp; <b>메모 쓰기</b>
                 </div>
                 <form id="writeForm" action="write.memo" method="post">
                   <input type="hidden" name="destination" value="prd">
                   <input type="hidden" name="id" value="${loginInfo.id}">
                   <div class="block-21 mb-2 d-flex">
                     <div class="form-group" style="margin-left: 20px; margin-right: 20px;">
                       <label>* 메모</label>
                        <input class="form-control" type="text" name="memotask" maxlength="13" style="height: 30px; font-size: 11pt;" required>
                      </div>
                  </div>
                  <div>
                    <div class="form-group" style="margin-left: 20px; margin-right: 20px;">
                       <label>상세 메모</label>
                        <textarea class="form-control" name="memocontent" cols="2" rows="2" maxlength="33" placeholder="최대 33자 입력 가능" style="font-size: 11pt;"></textarea>
                      </div>
                  </div>
                </form>
                <!-- 메모 버튼 -->
                <div style="text-align: center; padding-top: 20px; padding-bottom: 15px;">
                    <span href="#" onclick="hideWriteForm()" style="cursor: pointer;">
                      <i class="icon-close" style="color:gray; font-size: 10pt;">&nbsp;닫기</i>
                    </span>
                    &nbsp;&nbsp;&nbsp;
                    <span onclick="submitWriteForm()" style="cursor: pointer;">
                      <i class="icon-add_circle" style="color:gray; font-size: 10pt;">&nbsp;추가하기</i>
                    </span>
                 </div>
              </div>
            </div>
        </div>
       </c:if>        
        
    </div>
  </div>   <!-- 컨테이너 끝 -->
</section>


<%@include file= "./../common/footer.jsp" %>