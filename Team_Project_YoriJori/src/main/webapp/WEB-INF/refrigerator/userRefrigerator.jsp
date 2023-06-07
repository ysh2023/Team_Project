<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
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
	
		
	function checkDel(){ //삭제 버튼 클릭
		flag = false;
		var rchk = document.getElementsByName('rowchk');
			
		for(i=0; i<rchk.length; i++){
			if(rchk[i].checked){
				flag = true;
			}
		}
			
		if(flag==false){
			alert("삭제할 재료의 체크박스를 선택하세요");
			return;
		}
			
		document.reflist.submit();
		
	}//checkDel
	
</script>

<center>
	<br>
	사용자 냉장고 페이지<br><br>
	
	<input type="button" value="식재료 추가하기" onClick="location.href='insert.ref'">
	냉장고에 식재료 추가하는 페이지로 이동
	<br><br>
	
	${loginInfo.id}님의 냉장고<br>
	사용자가 추가한 식재료 보기<br>
	<form name="reflist" action="delete.ref" method="post">
	<table border="1" style="width: 800px;">
		<tr><td colspan="7">
			<button type="button" class="btn btn-warning btn-sm" onClick="checkDel()">삭제</button>
		</td></tr>
		<tr>
			<th><input type="checkbox" id="allcheck" name="allcheck" onClick="allCheck(this)"></th>
			<th>식재료명</th>
			<th>카테고리</th>
			<th>추가일</th>
			<th>유통기한</th>
			<th>보관</th>
			<th>메모</th>
		</tr>
		<c:if test="${refList eq null}">
			<tr><th>보관 중인 식재료가 없습니다</th></tr>
		</c:if>
		<c:if test="${refList != null}">
			<c:forEach var="list" items="${refList}">
				<tr>
					<td><input type="checkbox" name="rowchk" value="${list.ingnum}"></td>
					<td>
						<a href="update.ref?ingnum=${list.ingnum}">
							${list.ingname}
						</a>
					</td>
					<td>
						${list.ingcategory}
					</td>
					<td>
						<fmt:parseDate var="inputdate" value="${list.inputdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="inputdate" value="${inputdate}" pattern="yyyy-MM-dd"/>
						${inputdate}
					</td>
					<td>
						<fmt:parseDate var="dday" value="${list.refdday}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="dday" value="${dday}" pattern="yyyy-MM-dd"/>
						${dday}
					</td>
					<td>${list.refstorage}</td>
					<td>${list.refdetail}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</form>
	
	<br><br><br>
</center>

<%@include file= "../common/footer.jsp" %>