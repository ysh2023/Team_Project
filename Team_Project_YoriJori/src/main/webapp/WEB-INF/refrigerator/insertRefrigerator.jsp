<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>
<% String[] category = {"곡류/콩/견과류","계란/유제품","채소","과일","정육/해산물","면/빵/떡","소스/오일"}; %>

<br><br>
<center>
	식재료 선택	<br>
	추후에 제이쿼리로 tr toggle로 변경
	<form>
		<table border="1" style="width: 800px;">
				<tr>
					<th><%=category[0]%></th>
				</tr>
				<tr>
					<td>
						<c:forEach var="list" items="${ingList1}">
							<input type="checkbox" name="ingname" value="${list.ingname}"> <!-- <c:if test="${refList.ingname eq list.ingname}">checked</c:if> -->
							${list.ingname}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th><%=category[1]%></th>
				</tr>
				<tr>
					<td>
						<c:forEach var="list" items="${ingList2}">
							<input type="checkbox" name="ingname" value="${list.ingname}"> <!-- <c:if test="${refList.ingname eq list.ingname}">checked</c:if> -->
							${list.ingname}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th><%=category[2]%></th>
				</tr>
				<tr>
					<td>
						<c:forEach var="list" items="${ingList3}">
							<input type="checkbox" name="ingname" value="${list.ingname}"> <!-- <c:if test="${refList.ingname eq list.ingname}">checked</c:if> -->
							${list.ingname}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th><%=category[3]%></th>
				</tr>
				<tr>
					<td>
						<c:forEach var="list" items="${ingList4}">
							<input type="checkbox" name="ingname" value="${list.ingname}"> <!-- <c:if test="${refList.ingname eq list.ingname}">checked</c:if> -->
							${list.ingname}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th><%=category[4]%></th>
				</tr>
				<tr>
					<td>
						<c:forEach var="list" items="${ingList5}">
							<input type="checkbox" name="ingname" value="${list.ingname}"> <!-- <c:if test="${refList.ingname eq list.ingname}">checked</c:if> -->
							${list.ingname}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th><%=category[5]%></th>
				</tr>
				<tr>
					<td>
						<c:forEach var="list" items="${ingList6}">
							<input type="checkbox" name="ingname" value="${list.ingname}"> <!-- <c:if test="${refList.ingname eq list.ingname}">checked</c:if> -->
							${list.ingname}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th><%=category[6]%></th>
				</tr>
				<tr>
					<td>
						<c:forEach var="list" items="${ingList7}">
							<input type="checkbox" name="ingname" value="${list.ingname}"> <!-- <c:if test="${refList.ingname eq list.ingname}">checked</c:if> -->
							${list.ingname}
						</c:forEach>
					</td>
				</tr>
				<tr><td><input type="submit" value="추가하기"></td></tr>
			</table>
		</form>
	</center>
	<br><br><br>
	
<%@include file= "../common/footer.jsp" %>