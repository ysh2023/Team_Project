<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>

<script type="text/javascript">
	/* 펼치기 */
	function expand(){
		var objclassName = document.getElementById('showIcon').className;
		
		if(objclassName == "showToggle"){
			$('.showToggle').hide();
			$('.showToggle').next().show();       
			$('.showToggle').parent().parent().parent().next().show();
			objclassName = "hideToggle";
		}
	}
	
	/* 접기 */
	function collapse(){
		var objclassName = document.getElementById('hideIcon').className;
		
		if(objclassName == "hideToggle"){
			$('.hideToggle').hide();
			$('.hideToggle').prev().show();
			$('.hideToggle').parent().parent().parent().next().hide();
			objclassName = "showToggle";
		}
	}
	
	function checkIng(){ //추가하기 버튼 클릭
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

<% String[] category = {"곡류/콩/견과류","계란/유제품","채소","과일","정육/해산물","면/빵/떡","소스/오일"}; %>

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
			<input type="button" value="추가하기" class="btn btn-primary" onclick="checkIng()" style="display:inline; position: absolute; right: 5%; margin-top:10px; font-size: 14pt;">
	    </div>
		<div class="cart-list">
			<table class="table">
				<!-- 곡류/콩/견과류 -->
				<thead style="background-color: #89A621; height:30px;">
					<tr class="text-center">
						<th colspan="2">
							<a href="#" class="showToggle" id="showIcon" onclick="expand()" style="display: show; font-size: 12pt; color: white;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[0]%>
							</a>
							<a href="#" class="hideToggle" id="hideIcon" onclick="collapse()" style="display: none; font-size: 12pt; color: white;">
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
							<a href="#" class="showToggle" id="showIcon" onclick="expand()" style="font-size: 12pt; color: white;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[1]%>
							</a>
							<a href="#" class="hideToggle" id="hideIcon" onclick="collapse()" style="display: none; font-size: 12pt; color: white;">
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
							<a href="#" class="showToggle" id="showIcon" onclick="expand()" style="display: show; font-size: 12pt; color: white;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[2]%>
							</a>
							<a href="#" class="hideToggle" id="hideIcon" onclick="collapse()" style="display: none; font-size: 12pt; color: white;">
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
							<a href="#" class="showToggle" id="showIcon" onclick="expand()" style="display: show; font-size: 12pt; color: white;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[3]%>
							</a>
							<a href="#" class="hideToggle" id="hideIcon" onclick="collapse()" style="display: none; font-size: 12pt; color: white;">
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
							<a href="#" class="showToggle" id="showIcon" onclick="expand()" style="display: show; font-size: 12pt; color: white;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[4]%>
							</a>
							<a href="#" class="hideToggle" id="hideIcon" onclick="collapse()" style="display: none; font-size: 12pt; color: white;">
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
							<a href="#" class="showToggle" id="showIcon" onclick="expand()" style="display: show; font-size: 12pt; color: white;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[5]%>
							</a>
							<a href="#" class="hideToggle" id="hideIcon" onclick="collapse()" style="display: none; font-size: 12pt; color: white;">
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
							<a href="#" class="showToggle" id="showIcon" onclick="expand()" style="display: show; font-size: 12pt; color: white;">
								<i class="icon-sort-up"></i>
								&nbsp; <%=category[6]%>
							</a>
							<a href="#" class="hideToggle" id="hideIcon" onclick="collapse()" style="display: none; font-size: 12pt; color: white;">
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