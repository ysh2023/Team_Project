<%@page import="java.util.List"%>
<%@page import="refrigerator.model.RefBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>

<script type="text/javascript">
	/* 전체 토글  */
	function expandAll(){
		$('.expand').hide();
		$('.expand').next().show();       
		$('.expand').parent().parent().parent().next().show();
	}//expandAll
	
	function collapseAll(){
		$('.collapse').hide();
		$('.collapse').prev().show();
		$('.collapse').parent().parent().parent().next().hide();
	}//collapseAll
	
	/* 카테고리별 토글 */
	function expandCtg(a){
		var atagId = $(a).attr('id');
		
		if(atagId == "showCtg1"){
			$('#showCtg1').hide();
			$('#showCtg1').next().show();       
			$('#showCtg1').parent().parent().parent().next().show();
		}
		if(atagId == "showCtg2"){
			$('#showCtg2').hide();
			$('#showCtg2').next().show();       
			$('#showCtg2').parent().parent().parent().next().show();
		}
		if(atagId == "showCtg3"){
			$('#showCtg3').hide();
			$('#showCtg3').next().show();       
			$('#showCtg3').parent().parent().parent().next().show();
		}
		if(atagId == "showCtg4"){
			$('#showCtg4').hide();
			$('#showCtg4').next().show();       
			$('#showCtg4').parent().parent().parent().next().show();
		}
		if(atagId == "showCtg5"){
			$('#showCtg5').hide();
			$('#showCtg5').next().show();       
			$('#showCtg5').parent().parent().parent().next().show();
		}
		if(atagId == "showCtg6"){
			$('#showCtg6').hide();
			$('#showCtg6').next().show();       
			$('#showCtg6').parent().parent().parent().next().show();
		}
		if(atagId == "showCtg7"){
			$('#showCtg7').hide();
			$('#showCtg7').next().show();       
			$('#showCtg7').parent().parent().parent().next().show();
		}
		if(atagId == "showCtg8"){
			$('#showCtg8').hide();
			$('#showCtg8').next().show();       
			$('#showCtg8').parent().parent().parent().next().show();
		}
	}
	
	function collapseCtg(a){
		var atagId = $(a).attr('id');
		
		if(atagId == "hideCtg1"){
			$('#hideCtg1').hide();
			$('#hideCtg1').prev().show();
			$('#hideCtg1').parent().parent().parent().next().hide();
		}
		if(atagId == "hideCtg2"){
			$('#hideCtg2').hide();
			$('#hideCtg2').prev().show();
			$('#hideCtg2').parent().parent().parent().next().hide();
		}
		if(atagId == "hideCtg3"){
			$('#hideCtg3').hide();
			$('#hideCtg3').prev().show();
			$('#hideCtg3').parent().parent().parent().next().hide();
		}
		if(atagId == "hideCtg4"){
			$('#hideCtg4').hide();
			$('#hideCtg4').prev().show();
			$('#hideCtg4').parent().parent().parent().next().hide();
		}
		if(atagId == "hideCtg5"){
			$('#hideCtg5').hide();
			$('#hideCtg5').prev().show();
			$('#hideCtg5').parent().parent().parent().next().hide();
		}
		if(atagId == "hideCtg6"){
			$('#hideCtg6').hide();
			$('#hideCtg6').prev().show();
			$('#hideCtg6').parent().parent().parent().next().hide();
		}
		if(atagId == "hideCtg7"){
			$('#hideCtg7').hide();
			$('#hideCtg7').prev().show();
			$('#hideCtg7').parent().parent().parent().next().hide();
		}
		if(atagId == "hideCtg8"){
			$('#hideCtg8').hide();
			$('#hideCtg8').prev().show();
			$('#hideCtg8').parent().parent().parent().next().hide();
		}
	}

	
	/* 추가하기 버튼 클릭 */
	function checkIng(){
		flag = false;
		var rchk = document.getElementsByName('rowchk');
			
		for(i=0; i<rchk.length; i++){
			if(rchk[i].checked){
				flag = true;
			}
		}
			
		if(flag==false){
			alert("추가할 재료의 체크박스를 선택하세요");
			return;
		}
		
		var msg = "선택하신 식재료를 추가하시겠습니까?";
		if(confirm(msg) == true){
			document.getElementById('insertForm').submit();
		}else{
			return false;
		}
		
	}//checkIng
	
</script>

<% String[] category = {"곡류/콩/견과류","계란/유제품","채소","과일","정육/해산물","면/빵/떡","소스/오일","기타"}; %>

<!-- title -->
<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(<%=resourcesPath%>/images/bg_3.jpg);">
    <div class="container">
    	<div class="col-md-7 heading-section ftco-animate text-center" style="margin:auto;">
          <span class="subheading">My refrigerator</span>
	      <h2 class="mb-4">식재료 추가하기</h2>
		  <p></p>
		</div>  
    </div>
</section>

<!-- 식재료 선택 -->
<section class="ftco-section ftco-cart">
<div class="container"><div class="row"><div class="col-md-12">
	<!-- form -->
	<form action="insert.ref" method="post" id="insertForm">
		<div style="height: 100px; margin-bottom:10px; display:flex; align-items: center; background-color: #f7f6f2;">
			<span style="width:90px; font-size: 14pt; margin-left:45px;">보관 위치</span>
	        <select name="refstorage" class="form-control" style="font-size: 14pt; width:100px;">
				<option value="냉장" <c:if test="${storage eq 'ref'}">selected</c:if>>냉장</option>
				<option value="냉동" <c:if test="${storage eq 'freeze'}">selected</c:if>>냉동</option>
				<option value="실온" <c:if test="${storage eq 'room'}">selected</c:if>>실온</option>
			</select>
			<div class="col-lg-2 text-center" style="height: 60px; position: absolute; right: 10%;">
				<input type="checkbox" name="rowchk" value="${userIng.ingnum}" style="display: inline;">
				<img src="<%=resourcesPath%>/images/icon/${userIng.ingicon}" style="width: 40px; display: inline;"> <br>
				<b>${userIng.ingname}</b><br>
			</div>	
			<input type="button" value="추가하기" class="btn btn-primary" onclick="checkIng()" style="display:inline; position: absolute; right: 5%; margin-top:10px; font-size: 14pt;">
	    </div>
	    <div>
	    	<a class="expand" onclick="expandAll()" style="display: show; font-size: 14pt; cursor: pointer;">
	    		<i class="icon-sort-up"></i> &nbsp; 전체 펼치기
	    	</a>
	    	<a class="collapse" onclick="collapseAll()" style="display: none; font-size: 14pt; cursor: pointer;">
				<i class="icon-sort-down"></i> &nbsp; 전체 접기
			</a>
			(검색: 전체 펼치기 > ctrl+f)
	    </div>
		<div class="cart-list">
			<table class="table">
				<!-- 곡류/콩/견과류 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg1" onclick="expandCtg(this)" style="display: show; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[0]%>
							</a>
							<a class="collapse" id="hideCtg1" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[0]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList1}" varStatus="status">
								<div class="col-lg-1 text-center" style="height: 100px;">
									<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  			<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
				<!-- 계란/유제품 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg2" onclick="expandCtg(this)" style="font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[1]%>
							</a>
							<a class="collapse" id="hideCtg2" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[1]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList2}" varStatus="status">
								<div class="col-lg-2 text-center" style="height: 100px;">
						  			<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  		<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
				<!-- 채소 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg3" onclick="expandCtg(this)" style="display: show; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[2]%>
							</a>
							<a class="collapse" id="hideCtg3" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[2]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList3}" varStatus="status">
								<div class="col-lg-1 text-center" style="height: 100px;">
						  			<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  		<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
				<!-- 과일 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg4" onclick="expandCtg(this)" style="display: show; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[3]%>
							</a>
							<a class="collapse" id="hideCtg4" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[3]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList4}" varStatus="status">
								<div class="col-lg-1 text-center" style="height: 100px;">
						  			<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  		<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
				<!-- 정육/해산물 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg5" onclick="expandCtg(this)" style="display: show; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[4]%>
							</a>
							<a class="collapse" id="hideCtg5" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[4]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList5}" varStatus="status">
								<div class="col-lg-1 text-center" style="height: 100px;">
						  			<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  		<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
				<!-- 면/빵/떡 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg6" onclick="expandCtg(this)" style="display: show; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[5]%>
							</a>
							<a class="collapse" id="hideCtg6" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[5]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList6}" varStatus="status">
								<div class="col-lg-1 text-center" style="height: 100px;">
						  			<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  		<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
				<!-- 소스/오일 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg7" onclick="expandCtg(this)" style="display: show; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[6]%>
							</a>
							<a class="collapse" id="hideCtg7" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[6]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList7}" varStatus="status">
								<div class="col-lg-1 text-center" style="height: 100px;">
						  			<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  		<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
				<!-- 기타 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a class="expand" id="showCtg8" onclick="expandCtg(this)" style="display: show; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[7]%>
							</a>
							<a class="collapse" id="hideCtg8" onclick="collapseCtg(this)" style="display: none; font-size: 12pt; color: white; cursor: pointer;">
								<i class="icon-sort-down"></i>
								&nbsp; <%=category[7]%>
							</a>
						</th>
					</tr>
				</thead>
				<tbody style="display:none">
					<tr class="text-center">
						<td style="width: 600px; text-align: center; font-size: 11pt;">
							<div class="row" align="center" style="margin-left:20px; margin-right:20px;">
							<c:forEach var="list" items="${ingList8}" varStatus="status">
								<div class="col-lg-1 text-center" style="height: 100px;">
						  			<input type="checkbox" name="rowchk" value="${list.ingnum}" style="display: inline;">
						  			<img src="<%=resourcesPath%>/images/icon/${list.ingicon}" style="width: 40px; display: inline;"> <br>
						  	  		<!-- 사용자 냉장고와 비교해 있는 식재료면 아이콘 표시 -->
						  	  		<c:set var="flag" value="false"/>
						  			<c:forEach var="user" items="${allList}">
						  				<c:if test="${not flag}">
						  					<c:if test="${user.ingnum eq list.ingnum}">
						  						<i class="icon-check-circle"></i>
						  						<c:set var="flag" value="true"/>
						  					</c:if>
						  				</c:if>
						  			</c:forEach>
						  	  		<b>${list.ingname}</b><br>
						  		</div>
							</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div></div></div>
</section>

<br><br>

<%@include file= "../common/footer.jsp" %>