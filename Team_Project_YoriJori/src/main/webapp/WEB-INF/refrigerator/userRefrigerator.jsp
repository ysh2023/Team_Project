<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Favicons -->
<link href="<%=resourcesPath %>/img/favicon.png" rel="icon">
<link href="<%=resourcesPath %>/img/apple-touch-icon.png" rel="apple-touch-icon">

<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
</style>

<script type="text/javascript">

	$(document).ready(function () {
	    var modelscroll = "${modelscroll}";
	    if(modelscroll != null){
	    	window.scrollTo(0,modelscroll);
	    }
	});

	var height;
	$(window).scroll(function () {
		height = $(document).scrollTop();
		console.log(height);
	});
	
	function sortAll(){
		var myScroll = document.createElement("input");
		myScroll.type = "hidden";
		myScroll.name = "myscroll";
		myScroll.value = height;
		document.getElementById('all_sortForm').appendChild(myScroll);
		
		document.getElementById('all_sortForm').submit();
	}
	
	function sortRef(){
		var myScroll = document.createElement("input");
		myScroll.type = "hidden";
		myScroll.name = "myscroll";
		myScroll.value = height;
		document.getElementById('ref_sortForm').appendChild(myScroll);
		
		document.getElementById('ref_sortForm').submit();
	}
	
	function sortFreeze(){
		var myScroll = document.createElement("input");
		myScroll.type = "hidden";
		myScroll.name = "myscroll";
		myScroll.value = height;
		document.getElementById('freeze_sortForm').appendChild(myScroll);
		
		document.getElementById('freeze_sortForm').submit();
	}
	
	function sortRoom(){
		var myScroll = document.createElement("input");
		myScroll.type = "hidden";
		myScroll.name = "myscroll";
		myScroll.value = height;
		document.getElementById('room_sortForm').appendChild(myScroll);
		
		document.getElementById('room_sortForm').submit();
	}
	
	/* 전체 선택 */
	function allCheck(obj){	//obj=allcheck
		var rchk = document.getElementsByName('rowchk');	//rowchk들을 배열 변수에 담음
			
		if(obj.checked){ //allcheck 체크했으면
			for(i=0; i<rchk.length; i++){
				rchk[i].checked = true;	//rowchk들을 checked 상태로
			}
		}else{ //allcheck 체크 해제했으면
			for(i=0; i<rchk.length; i++){
				rchk[i].checked = false;	//rowchk들을 checked 상태 해제
			}
		}
	}//allCheck
	
	/* 냉장보관 선택 */
	function refCheck(obj){	//obj=refcheck
		var rchk = document.getElementsByName('rowchk');	//rowchk들을 배열 변수에 담음
			
		if(obj.checked){ //refcheck 체크했으면
			for(i=0; i<rchk.length; i++){
				if(rchk[i].id == "냉장"){
					rchk[i].checked = true;	//rowchk들을 checked 상태로
				}
			}
		}else{ //refcheck 체크 해제했으면
			for(i=0; i<rchk.length; i++){
				if(rchk[i].id == "냉장"){
					rchk[i].checked = false;	//rowchk들을 checked 상태 해제
				}
			}
		}
	}//refCheck
	
	/* 냉동보관 선택 */
	function freezeCheck(obj){	//obj=refcheck
		var rchk = document.getElementsByName('rowchk');	//rowchk들을 배열 변수에 담음
			
		if(obj.checked){ //refcheck 체크했으면
			for(i=0; i<rchk.length; i++){
				if(rchk[i].id == "냉동"){
					rchk[i].checked = true;	//rowchk들을 checked 상태로
				}
			}
		}else{ //refcheck 체크 해제했으면
			for(i=0; i<rchk.length; i++){
				if(rchk[i].id == "냉동"){
					rchk[i].checked = false;	//rowchk들을 checked 상태 해제
				}
			}
		}
	}//freezeCheck
	
	/* 실온보관 선택 */
	function roomCheck(obj){	//obj=refcheck
		var rchk = document.getElementsByName('rowchk');	//rowchk들을 배열 변수에 담음
			
		if(obj.checked){ //refcheck 체크했으면
			for(i=0; i<rchk.length; i++){
				if(rchk[i].id == "실온"){
					rchk[i].checked = true;	//rowchk들을 checked 상태로
				}
			}
		}else{ //refcheck 체크 해제했으면
			for(i=0; i<rchk.length; i++){
				if(rchk[i].id == "실온"){
					rchk[i].checked = false;	//rowchk들을 checked 상태 해제
				}
			}
		}
	}//roomCheck
	
	/* 식재료 체크박스 */
	function checkDel(){ //삭제 버튼 클릭
		flag = false;
		var rchk = document.getElementsByName('rowchk');
		var msg = "해당 식재료를 냉장고에서 삭제하시겠습니까?";
			
		for(i=0; i<rchk.length; i++){
			if(rchk[i].checked){
				flag = true;
			}
		}
		
		if(flag==false){
			alert("삭제할 재료의 체크박스를 선택하세요");
			return;
		}
		
		if(confirm(msg) == true){
			document.getElementById('all_list').submit();
		}else{
			return false;
		}
		
	}//checkDel
	
	/* 메모 삭제 확인 */
	function delMemo(memonum){
		var msg = "해당 메모를 삭제하시겠습니까?";
	    var url = "delete.memo?memonum="+memonum+"&myscroll="+height+"&destination=ref";
	    
	    if(confirm(msg) == true){
			location.href = url;
		}else{
			return false;
		}
	}
	
	/* 메모 작성폼 띄우기 */
	function showWriteForm(){
		$('#writeform').show();
	}
	
	/* 메모 작성폼 숨기기 */
	function hideWriteForm(){
		$('#writeform').hide();
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
	
</script>

<!-- 냉장고 통계 -->
<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(<%=resourcesPath%>/images/bg_3.jpg);">
    <div class="container" style="background-color: white; background-color: rgba( 255, 255, 255, 0.5 );">
    	<!-- title -->
    	<div class="col-md-7 heading-section ftco-animate text-center" style="margin:auto;">
          <span class="subheading" style="padding-top:20px;">My refrigerator</span>
	      <h2 class="mb-4">나의 냉장고</h2>
		  <p style="color: black;">현재 ${loginInfo.mname}님이 보유한 <b>${totalCnt}개</b>의 식재료를 한 눈에 확인할 수 있어요.</p>
		</div>  
    	<div class="row justify-content-center py-5">
    		<div class="col-md-10"><div class="row">
		    	<!-- 냉장 식재료 수 -->
		        <div class="col-md-3 d-flex justify-content-center counter-wrap">
		          <div class="block-18 text-center"><div class="text">
		            <strong class="number">${refCnt}</strong><span><b>냉장</b></span>
		          </div></div>
		        </div>
		        <!-- 냉동 식재료 수 -->
		        <div class="col-md-3 d-flex justify-content-center counter-wrap">
		          <div class="block-18 text-center"><div class="text">
		            <strong class="number">${freezeCnt}</strong><span><b>냉동</b></span>
		          </div></div>
		        </div>
		        <!-- 실온 식재료 수 -->
		        <div class="col-md-3 d-flex justify-content-center counter-wrap">
		          <div class="block-18 text-center"><div class="text">
		            <strong class="number">${roomCnt}</strong><span><b>실온</b></span>
		          </div></div>
		        </div>
		        <!-- 소비기한 임박 식재료 수 -->
		        <div class="col-md-3 d-flex justify-content-center counter-wrap">
		          <div class="block-18 text-center"><div class="text">
		            <strong class="number" style="color: red">${ddayCnt}</strong><span><b>소비기한 임박</b></span>
		          </div></div>
		        </div>
		    </div></div>
        </div>
    </div>
</section>

<section class="ftco-section testimony-section">
	<div class="container">
        <div class="row">
          <!-- 냉장고 리스트 -->
          <div class="col-md-9">
            <div class="text text-center" style="margin-bottom: 50px;">
            	<a class="button" href="#all">전체보기</a> &nbsp;
            	<i class="icon-navigate_next"></i> &nbsp;
	            <a class="button" href="#ref">냉장고</a> &nbsp;
	            <i class="icon-navigate_next"></i> &nbsp;
	        	<a class="button" href="#freeze">냉동고</a> &nbsp;
	        	<i class="icon-navigate_next"></i> &nbsp;
	        	<a class="button" href="#room">실온보관</a>
            </div>
            <div id="owl-banner" class="carousel-testimony owl-carousel">
              <!-- 전체보기(allList) -->
              <div class="item" data-merge="3" data-hash="all">
                <div class="testimony-wrap p-4 pb-5">
                  <!-- 슬라이드 타이틀 -->
                  <div class="mb-3">
                  	<img src="<%=resourcesPath%>/images/icon/fridge.png" style="width: 100px; margin: auto;">
                  </div>
                  <div class="text text-center">
                    <p class="name">전체</p>
                    <span class="position">show all</span>
                  </div>
                  <!-- select, check, button -->
                  <div style="margin: 40px; margin-bottom:0px; height: 80px; display:flex; align-items: center;">
                    <form id="all_sortForm" action="page.ref">
                  	  <select id="all_arrange" name="arrange" onchange="sortAll()">
                  		<option value="i.ing_name" <c:if test="${arrange eq 'i.ing_name'}">selected</c:if>>이름순 정렬</option>
                  		<option value="r.ref_dday" <c:if test="${arrange eq 'r.ref_dday'}">selected</c:if>>소비기한순 정렬</option>
                  		<option value="r.inputdate" <c:if test="${arrange eq 'r.inputdate'}">selected</c:if>>추가일순 정렬</option>
                  	  </select>
                  	</form>
                  	<!-- 삭제, 추가 button -->
                  	<ul class="ftco-footer-social list-unstyled" style="display:inline; position: absolute; right: 5%">
					    <li class="ftco-animate fadeInUp ftco-animated">
					      <a href="#" onclick="checkDel();" style="background-color: gray;">
					        <span class="icon-delete_forever" style="color: white;"></span>
					      </a>
					    </li>
					    <li class="ftco-animate fadeInUp ftco-animated">
					      <a href="insert.ref?arrange=${arrange}&storage=ref" style="background-color: #F2BC1B;">
					        <span class="icon-add_circle" style="color: white;"></span>
					      </a>
					    </li>
					</ul>
                  </div>
                  <!-- 보관별 선택 -->
                  <div style="margin: 20px; margin-top: 0px; height: 40px; display:flex; align-items: center;">
                  	<span style="padding-left:20px;">
                  		<input type="checkbox" id="allcheck" name="allcheck" onClick="allCheck(this)"> 전체 선택 &nbsp;&nbsp;
                  		<input type="checkbox" id="refcheck" name="refcheck" onClick="refCheck(this)">
                  			<i class="icon-leaf" style="color:#7cde6a;"></i> 냉장보관 &nbsp;&nbsp;
                  		<input type="checkbox" id="freezecheck" name="freezecheck" onClick="freezeCheck(this)">
							<i class="icon-snowflake-o" style="color:#99c2f7;"></i> 냉동보관 &nbsp;&nbsp;
						<input type="checkbox" id="roomcheck" name="roomcheck" onClick="roomCheck(this)">
							<i class="icon-inbox" style="color:#786248;"></i> 실온보관 &nbsp;&nbsp;
					</span>
					<span style="display:inline; position: absolute; right: 5%">
					</span>
                  </div>
                  <!-- 식재료 리스트 -->
                  <form id="all_list" name="all_list" action="delete.ref" method="post">
                    <div class="row" align="center">
                      <c:if test="${allList eq '[]'}">
                      	<b style="margin-top:100px; margin-left:auto; margin-right:auto; font-size: 15pt; color: gray">보관 중인 식재료가 없습니다</b>
                      </c:if>
					  <c:if test="${allList != null}">
					    <c:forEach var="list" items="${allList}">
						  <div class="col-lg-2 text-center" style="height: 100px">
						  	<input type="checkbox" name="rowchk" id="${list.refstorage}" value="${list.refnum}" style="display: inline;">
						  	<a href="update.ref?refnum=${list.refnum}&ingnum=${list.ingnum}">
							  <img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
							  <!-- 보관 위치별 아이콘 색 -->
							  <c:if test="${list.refstorage eq '냉장'}">
							  	<i class="icon-leaf" style="color:#7cde6a;"></i>
							  </c:if>
							  <c:if test="${list.refstorage eq '냉동'}">
							  	<i class="icon-snowflake-o" style="color:#99c2f7;"></i>
							  </c:if>
							  <c:if test="${list.refstorage eq '실온'}">
							  	<i class="icon-inbox" style="color:#786248;"></i>
							  </c:if>
							  <c:if test="${list.ingnum != 1}">
							  	<b>${list.ingname}</b>
							  </c:if>
							  <c:if test="${list.ingnum eq 1}">
							  	<b>${list.refdetail}</b>
							  </c:if>
							  </a><br>
						  	<!-- 소비기한 디데이 계산 -->
						  	<jsp:useBean id="javaDate" class="java.util.Date" />
							<fmt:formatDate var="nowDate" value="${javaDate}" pattern="yyyyMMdd"/>
							<fmt:parseDate var="refdday" value="${list.refdday}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="refdday" value="${refdday}" pattern="yyyyMMdd"/>
							<!-- 소비기한 임박 알림 아이콘 & 디데이 표시 -->
							<c:if test="${(refdday - nowDate) > 7}">
								<b style="color: gray">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${3<(refdday - nowDate) && (refdday - nowDate)<=7}">
							  <i class="icon-warning" style="color:orange;"></i>
							  <b style="color: orange">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${0<(refdday - nowDate) && (refdday - nowDate)<=3}">
							  <i class="icon-warning" style="color:red;"></i>
							  <b style="color: red">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${(refdday - nowDate) eq 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D-Day</b>
							</c:if>
							<c:if test="${(refdday - nowDate) < 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D+${nowDate - refdday}</b>
							</c:if>
						  </div>
					    </c:forEach>
					  </c:if>
					</div>
                  </form>
                </div>
              </div>
              <!-- 냉장(refList) -->
              <div class="item" data-merge="3" data-hash="ref">
                <div class="testimony-wrap p-4 pb-5">
                  <!-- 슬라이드 타이틀 -->
                  <div class="mb-3">
                  	<img src="<%=resourcesPath%>/images/icon/ref.png" style="width: 100px; margin: auto;">
                  </div>
                  <div class="text text-center">
                    <p class="name">냉장고</p>
                    <span class="position">refrigerator</span>
                  </div>
                  <!-- select, check, button -->
                  <div style="margin: 40px; height: 60px; display:flex; align-items: center;">
                    <form id="ref_sortForm" action="page.ref#ref">
                      <select id="ref_arrange" name="arrange" onchange="sortRef()">
                  		<option value="i.ing_name" <c:if test="${arrange eq 'i.ing_name'}">selected</c:if>>이름순 정렬</option>
                  		<option value="r.ref_dday" <c:if test="${arrange eq 'r.ref_dday'}">selected</c:if>>소비기한순 정렬</option>
                  		<option value="r.inputdate" <c:if test="${arrange eq 'r.inputdate'}">selected</c:if>>추가일순 정렬</option>
                  	  </select>
                  	</form>
                  	&nbsp;&nbsp;&nbsp;
                  	<!-- Check all -->
                  	<span>
                  		<input type="checkbox" id="refcheck" name="refcheck" onClick="refCheck(this)"> 전체 선택
                  	</span>
                  	<!-- 삭제, 추가 button -->
                  	<ul class="ftco-footer-social list-unstyled" style="display:inline; position: absolute; right: 5%">
                  		<li class="ftco-animate fadeInUp ftco-animated">
					      <a href="#" onclick="checkDel();" style="background-color: gray;">
					        <span class="icon-delete_forever" style="color: white;"></span>
					      </a>
					    </li>
					    <li class="ftco-animate fadeInUp ftco-animated">
					      <a href="insert.ref?arrange=${arrange}&storage=ref" style="background-color: #F2BC1B;">
					        <span class="icon-add_circle" style="color: white;"></span>
					      </a>
					    </li>
					</ul>
                  </div>
                  <!-- 식재료 리스트 -->
                  <form id="ref_list" name="ref_list" action="delete.ref" method="post">
                    <div class="row" align="center">
                      <c:if test="${refList eq '[]'}">
                      	<b style="margin-top:100px; margin-left:auto; margin-right:auto; font-size: 15pt; color: gray">보관 중인 식재료가 없습니다</b>
                      </c:if>
					  <c:if test="${refList != null}">
					    <c:forEach var="list" items="${refList}">
						  <div class="col-lg-2 text-center" style="height: 100px">
						    <input type="checkbox" name="rowchk" id="${list.refstorage}" value="${list.refnum}" style="display: inline;">
						  	<a href="update.ref?refnum=${list.refnum}&ingnum=${list.ingnum}">
						  	  <img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  <b>${list.ingname}</b>
						  	</a><br>
						  	<!-- 소비기한 디데이 계산 -->
						  	<fmt:parseDate var="refdday" value="${list.refdday}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="refdday" value="${refdday}" pattern="yyyyMMdd"/>
							<!-- 소비기한 임박 알림 아이콘 & 디데이 표시 -->
							<c:if test="${(refdday - nowDate) > 7}">
								<b style="color: gray">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${3<(refdday - nowDate) && (refdday - nowDate)<=7}">
							  <i class="icon-warning" style="color:orange;"></i>
							  <b style="color: orange">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${0<(refdday - nowDate) && (refdday - nowDate)<=3}">
							  <i class="icon-warning" style="color:red;"></i>
							  <b style="color: red">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${(refdday - nowDate) eq 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D-Day</b>
							</c:if>
							<c:if test="${(refdday - nowDate) < 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D+${nowDate - refdday}</b>
							</c:if>
						  </div>
					    </c:forEach>
					  </c:if>
					</div>
                  </form>
                </div>
              </div>
              <!-- 냉동(freezeList) -->
              <div class="item" data-merge="3" data-hash="freeze">
                <div class="testimony-wrap p-4 pb-5">
                  <!-- 슬라이드 타이틀 -->
                  <div class="mb-3">
                  	<img src="<%=resourcesPath%>/images/icon/freeze.png" style="width: 100px; margin: auto;">
                  </div>
                  <div class="text text-center">
                    <p class="name">냉동고</p>
                    <span class="position">freezer</span>
                  </div>
                  <!-- select, check, button -->
                  <div style="margin: 40px; height: 60px; display:flex; align-items: center;">
                    <form id="freeze_sortForm" action="page.ref">
                      <input type="hidden" name="slide" value="#freeze">
                  	  <select id="freeze_arrange" name="arrange" onchange="sortFreeze()">
                  		<option value="i.ing_name" <c:if test="${arrange eq 'i.ing_name'}">selected</c:if>>이름순 정렬</option>
                  		<option value="r.ref_dday" <c:if test="${arrange eq 'r.ref_dday'}">selected</c:if>>소비기한순 정렬</option>
                  		<option value="r.inputdate" <c:if test="${arrange eq 'r.inputdate'}">selected</c:if>>추가일순 정렬</option>
                  	  </select>
                  	</form>
                  	&nbsp;&nbsp;&nbsp;
                  	<!-- Check all -->
                  	<span>
                  		<input type="checkbox" id="freezecheck" name="freezecheck" onClick="freezeCheck(this)"> 전체 선택
                  	</span>
                  	<!-- 삭제, 추가 button -->
                  	<ul class="ftco-footer-social list-unstyled" style="display:inline; position: absolute; right: 5%">
                  		<li class="ftco-animate fadeInUp ftco-animated">
					      <a href="#" onclick="checkDel();" style="background-color: gray;">
					        <span class="icon-delete_forever" style="color: white;"></span>
					      </a>
					    </li>
					    <li class="ftco-animate fadeInUp ftco-animated">
					      <a href="insert.ref?arrange=${arrange}&storage=freeze" style="background-color: #F2BC1B;">
					        <span class="icon-add_circle" style="color: white;"></span>
					      </a>
					    </li>
					</ul>
                  </div>
                  <!-- 식재료 리스트 -->
                  <form id="freeze_list" name="freeze_list" action="delete.ref" method="post">
                    <div class="row" align="center">
                      <c:if test="${freezeList eq '[]'}">
                      	<b style="margin-top:100px; margin-left:auto; margin-right:auto; font-size: 15pt; color: gray">보관 중인 식재료가 없습니다</b>
                      </c:if>
                      <c:if test="${freezeList != null}">
					    <c:forEach var="list" items="${freezeList}">
					      <div class="col-lg-2 text-center" style="height: 100px">
					        <input type="checkbox" name="rowchk" id="${list.refstorage}" value="${list.refnum}" style="display: inline;">
						  	<a href="update.ref?refnum=${list.refnum}&ingnum=${list.ingnum}">
						  	  <img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  <b>${list.ingname}</b>
						  	</a><br>
						  	<!-- 소비기한 디데이 계산 -->
							<fmt:parseDate var="refdday" value="${list.refdday}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="refdday" value="${refdday}" pattern="yyyyMMdd"/>
							<!-- 소비기한 임박 알림 아이콘 & 디데이 표시 -->
							<c:if test="${(refdday - nowDate) > 7}">
								<b style="color: gray">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${3<(refdday - nowDate) && (refdday - nowDate)<=7}">
							  <i class="icon-warning" style="color:orange;"></i>
							  <b style="color: orange">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${0<(refdday - nowDate) && (refdday - nowDate)<=3}">
							  <i class="icon-warning" style="color:red;"></i>
							  <b style="color: red">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${(refdday - nowDate) eq 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D-Day</b>
							</c:if>
							<c:if test="${(refdday - nowDate) < 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D+${nowDate - refdday}</b>
							</c:if>
						  </div>
					    </c:forEach>
					  </c:if>
					</div>
                  </form>
                </div>
              </div>
              <!-- 실온(roomList) -->
              <div class="item" data-merge="3" data-hash="room">
                <div class="testimony-wrap p-4 pb-5">
                  <!-- 슬라이드 타이틀 -->
                  <div class="mb-3">
                  	<img src="<%=resourcesPath%>/images/icon/room.png" style="width: 100px; margin: auto;">
                  </div>
                  <div class="text text-center">
                    <p class="name">실온 보관</p>
                    <span class="position">room temperature</span>
                  </div>
                  <!-- select, check, button -->
                  <div style="margin: 40px; height: 60px; display:flex; align-items: center;">
                    <form id="room_sortForm" action="page.ref">
                      <input type="hidden" name="slide" value="#room">
                  	  <select id="room_arrange" name="arrange" onchange="sortRoom()">
                  		<option value="i.ing_name" <c:if test="${arrange eq 'i.ing_name'}">selected</c:if>>이름순 정렬</option>
                  		<option value="r.ref_dday" <c:if test="${arrange eq 'r.ref_dday'}">selected</c:if>>소비기한순 정렬</option>
                  		<option value="r.inputdate" <c:if test="${arrange eq 'r.inputdate'}">selected</c:if>>추가일순 정렬</option>
                  	  </select>
                  	</form>
                  	&nbsp;&nbsp;&nbsp;
                  	<!-- Check all -->
                  	<span>
                  		<input type="checkbox" id="roomcheck" name="roomcheck" onClick="roomCheck(this)"> 전체 선택
                  	</span>
                  	<!-- 삭제, 추가 button -->
                  	<ul class="ftco-footer-social list-unstyled" style="display:inline; position: absolute; right: 5%">
                  		<li class="ftco-animate fadeInUp ftco-animated">
					      <a href="#" onclick="checkDel();" style="background-color: gray;">
					        <span class="icon-delete_forever" style="color: white;"></span>
					      </a>
					    </li>
					    <li class="ftco-animate fadeInUp ftco-animated">
					      <a href="insert.ref?arrange=${arrange}&storage=room" style="background-color: #F2BC1B;">
					        <span class="icon-add_circle" style="color: white;"></span>
					      </a>
					    </li>
					</ul>
                  </div>
                  <!-- 식재료 리스트 -->
                  <form id="room_list" name="room_list" action="delete.ref" method="post">
                    <div class="row" align="center">
                      <c:if test="${roomList eq '[]'}">
                      	<b style="margin-top:100px; margin-left:auto; margin-right:auto; font-size: 15pt; color: gray">보관 중인 식재료가 없습니다</b>
                      </c:if>
                      <c:if test="${roomList != null}">
					    <c:forEach var="list" items="${roomList}">
					      <div class="col-lg-2 text-center" style="height: 100px">
					        <input type="checkbox" name="rowchk" id="${list.refstorage}" value="${list.refnum}" style="display: inline;">
						  	<a href="update.ref?refnum=${list.refnum}&ingnum=${list.ingnum}">
						  	  <img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  <b>${list.ingname}</b>
						  	</a><br>
						  	<!-- 소비기한 디데이 계산 -->
							<fmt:parseDate var="refdday" value="${list.refdday}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="refdday" value="${refdday}" pattern="yyyyMMdd"/>
							<!-- 소비기한 임박 알림 아이콘 & 디데이 표시 -->
							<c:if test="${(refdday - nowDate) > 7}">
								<b style="color: gray">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${3<(refdday - nowDate) && (refdday - nowDate)<=7}">
							  <i class="icon-warning" style="color:orange;"></i>
							  <b style="color: orange">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${0<(refdday - nowDate) && (refdday - nowDate)<=3}">
							  <i class="icon-warning" style="color:red;"></i>
							  <b style="color: red">D-${refdday - nowDate}</b>
							</c:if>
							<c:if test="${(refdday - nowDate) eq 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D-Day</b>
							</c:if>
							<c:if test="${(refdday - nowDate) < 0}">
								<i class="icon-warning" style="color:red;"></i>
								<b style="color: red">D+${nowDate - refdday}</b>
							</c:if>
						  </div>
					    </c:forEach>
					  </c:if>
					</div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 sidebar ftxo-animate fadeInUp ftco-animated">
            <!-- 장보기 메모 -->
            <div class="sidebar-box ftxo-animate fadeInUp ftco-animated">
          	  <div class="bg-light" style="min-height: 300px; max-height: 900px; position:relative;">
          	    <div style="text-align: center; padding-top: 20px; padding-bottom: 15px;">
          	  	  <i class="icon-sticky-note" style="color:#F2BC1B;"></i> &nbsp; <b>장보기 메모</b>
          	    </div>
          	    
          	    <form id="updateForm" action="update.memo" method="post">
          	      <input type="hidden" name="destination" value="ref">
          	      <!-- 메모 리스트 -->  
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
          	  	  <a href="#" onclick="updateMemo()">
          	  	    <i class="icon-save2" style="color:gray; font-size: 10pt;">&nbsp;저장</i>
          	  	  </a>
          	    </div>
              </div>
            </div>
            <!-- 메모 작성 폼 -->
            <div class="sidebar-box ftxo-animate fadeInUp ftco-animated" id="writeform" style="display: none;">
          	  <div class="bg-light" style="min-height: 300px; position:relative;">
          	    <div style="text-align: center; padding-top: 20px; padding-bottom: 15px;">
          	  	  <i class="icon-sticky-note" style="color:#F2BC1B;"></i> &nbsp; <b>메모 쓰기</b>
          	    </div>
          	    <form id="writeForm" action="write.memo" method="post">
          	      <input type="hidden" name="destination" value="ref">
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
        </div>
	</div>
</section>

<%@include file= "../common/footer.jsp" %>