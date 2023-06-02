<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../common/header.jsp" %>
<% String[] category = {"곡류/콩/견과류","계란/유제품","채소","과일","정육/해산물","면/빵/떡","소스/오일"}; %>

<center>
	<br>
	<br> 식재료 선택 <br> 추후에 제이쿼리로 tr toggle로 변경
	<form action="insert.ref" method="post">
		<table border="1" style="width: 800px; text-align: center;">
			<tr>
				<th><%=category[0]%></th>
			</tr>
			<tr>
				<td><c:forEach var="ingList1" items="${ingList1}"
						varStatus="status">
						<input type="checkbox" name="ingnum" value="${ingList1.ingnum}"
							<c:forEach var="refList" items="${refList}">
								<c:if test="${refList.ingname eq ingList1.ingname}">disabled</c:if>
							</c:forEach>>
						<!-- 냉장고에 이미 있는 재료 선택 불가 -->
						${ingList1.ingname} &nbsp;
						<c:if test="${status.count % 10 == 0}">
							<br>
						</c:if>
						<!-- n개마다 엔터 -->
					</c:forEach></td>
			</tr>
			<tr>
				<th><%=category[1]%></th>
			</tr>
			<tr>
				<td><c:forEach var="ingList2" items="${ingList2}"
						varStatus="status">
						<input type="checkbox" name="ingnum" value="${ingList2.ingnum}"
							<c:forEach var="refList" items="${refList}">
								<c:if test="${refList.ingname eq ingList2.ingname}">disabled</c:if>
							</c:forEach>>
						${ingList2.ingname} &nbsp;
						<c:if test="${status.count % 6 == 0}">
							<br>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<th><%=category[2]%></th>
			</tr>
			<tr>
				<td><c:forEach var="ingList3" items="${ingList3}"
						varStatus="status">
						<input type="checkbox" name="ingnum" value="${ingList3.ingnum}"
							<c:forEach var="refList" items="${refList}">
									<c:if test="${refList.ingname eq ingList3.ingname}">disabled</c:if>
								</c:forEach>>
							${ingList3.ingname} &nbsp;
							<c:if test="${status.count % 10 == 0}">
							<br>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<th><%=category[3]%></th>
			</tr>
			<tr>
				<td><c:forEach var="ingList4" items="${ingList4}"
						varStatus="status">
						<input type="checkbox" name="ingnum" value="${ingList4.ingnum}"
							<c:forEach var="refList" items="${refList}">
									<c:if test="${refList.ingname eq ingList4.ingname}">disabled</c:if>
								</c:forEach>>
							${ingList4.ingname} &nbsp;
							<c:if test="${status.count % 10 == 0}">
							<br>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<th><%=category[4]%></th>
			</tr>
			<tr>
				<td><c:forEach var="ingList5" items="${ingList5}"
						varStatus="status">
						<input type="checkbox" name="ingnum" value="${ingList5.ingnum}"
							<c:forEach var="refList" items="${refList}">
									<c:if test="${refList.ingname eq ingList5.ingname}">disabled</c:if>
								</c:forEach>>
							${ingList5.ingname} &nbsp;
							<c:if test="${status.count % 9 == 0}">
							<br>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<th><%=category[5]%></th>
			</tr>
			<tr>
				<td><c:forEach var="ingList6" items="${ingList6}"
						varStatus="status">
						<input type="checkbox" name="ingnum" value="${ingList6.ingnum}"
							<c:forEach var="refList" items="${refList}">
									<c:if test="${refList.ingname eq ingList6.ingname}">disabled</c:if>
								</c:forEach>>
							${ingList6.ingname} &nbsp;
							<c:if test="${status.count % 10 == 0}">
							<br>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<th><%=category[6]%></th>
			</tr>
			<tr>
				<td><c:forEach var="ingList7" items="${ingList7}"
						varStatus="status">
						<input type="checkbox" name="ingnum" value="${ingList7.ingnum}"
							<c:forEach var="refList" items="${refList}">
									<c:if test="${refList.ingname eq ingList7.ingname}">disabled</c:if>
								</c:forEach>>
							${ingList7.ingname} &nbsp;
							<c:if test="${status.count % 10 == 0}">
							<br>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td><input type="submit" value="추가하기"></td>
			</tr>
		</table>
	</form>
</center>
<br>
<br>

<%@include file= "../common/footer.jsp" %>