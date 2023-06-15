<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>식재료 목록</h1>
      <nav>
        <ol class="breadcrumb" style="margin-top: 5px;">
          <li class="breadcrumb-item"><a href="<%=conPath %>/intranet/view/main.jsp">Home</a></li>
          <li class="breadcrumb-item">야금야금</li>
          <li class="breadcrumb-item">식재료</li>
          <li class="breadcrumb-item active">식재료 목록</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Users</h5>
              <p>냉장고에 추가 가능한 식재료 목록입니다.</p>
              <form name="search" method="post" style="float:right; margin-bottom: 10px;">
                <input name="keyword" class="datatable-input" placeholder="식재료명 검색" style="width: 150px">
                <button type="button" class="btn btn-secondary btn-sm" onClick="searchCheck(form)" style="margin-bottom: 5px;">
                  <i class="bi bi-search"></i>
                </button>
              </form>
              
              <form name="selctg" style="float:right; margin-bottom: 10px;">
                <select class="datatable-selector" id="selCtg" name="code" onChange="deptCheck()">
	            	<option value="">전체</option>
	                <option value=""></option>
                </select>
                &nbsp;&nbsp;
              </form>
              
              <form name="inglist" action="ingList.am" method="post">
                <div class="datable-top">
                  <div style="float:left;">
              	    <button type="button" class="btn btn-warning btn-sm" onClick="checkDel()">삭제</button>
                  </div>
                </div>
                
                <div class="datatable-container">
                <!-- 전체 식재료 Table -->
                <table class="table datatable datatable-table">
                  <thead>
                    <tr style="background-color: #eceefe">
                      <th scope="col" style="width: 5%;">
                        <input type="checkbox" id="allcheck" name="allcheck" onClick="allCheck(this)">
                      </th>
                      <th scope="col">#</th>
                      <th scope="col">아이콘</th>
                      <th scope="col">카테고리</th>
                      <th scope="col">식재료명</th>
                      <th scope="col">소비기간</th>
                    </tr>
                  </thead>
                  <tbody id="listall">
                  	<c:forEach var="list" items="allList">
                  	<tr>
                 		<td style="width: 5%;"> 
                  			<input type="checkbox" name="rowchk" value="${list.ingnum}">
                 		</td>
                        <td style="width: 15%;">${list.ingicon}</td>
                        <td style="width: 20%;">${list.ingcategory}</td>
                        <td style="width: 15%;">${list.ingname}</td>
                        <td style="width: 10%; padding-right: 0">${list.expiry}</td>
					</tr>
                    </c:forEach>
                  </tbody>
                </table>
                </div>
                <!-- End 식재료 리스트 Table -->       
                </form>
              <div class="datatable-bottom" style="float:right;">
    			<div class="datatable-info">
    			  <p style="float:right;">
    			  	전체 식재료 수: <b></b>
    			  </p>
    			</div>
    			<nav class="datatable-pagination"><ul class="datatable-pagination-list"></ul></nav>
			  </div>
			  
            </div>
          </div>
        </div>
      </div>
    </section>

  </main>

 <%@include file= "./../common/admin_footer.jsp" %>