<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./../common/admin_header.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">
                <div class="card-body">
                  <h5 class="card-title" style="font-weight: bold !important;">주문량 <span>| 이번 년도</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${ordernum}건</h6>
                      
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title" style="font-weight: bold !important;">매출 <span>| 이번 년도</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bx bx-money"></i>
                    </div>
                    <div class="ps-3">
                      <fmt:formatNumber type="number" maxFractionDigits="3" value="${sales*10}" var="totalsales" />
                      <h6>${totalsales}</h6>
                      
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">
              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title" style="font-weight: bold !important;">총 가입자 수</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${totalMember*10}명</h6>
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->

            <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" style="font-weight: bold !important;">가입자 추이 &nbsp;<span>| 2023년 상반기</span></h5>

              <!-- Line Chart -->
              <canvas id="lineChart" style="max-height: 400px; display: block; box-sizing: border-box; height: 239px; width: 479px;" width="959" height="479"></canvas>
              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new Chart(document.querySelector('#lineChart'), {
                    type: 'line',
                    data: {
                      labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
                      datasets: [{
                        label: 'Line Chart',
                        data: [${jan*10}, ${feb*10}, ${mar*10}, ${apr*10}, ${may*10}, ${june*10}],
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                      }]
                    },
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true
                        }
                      }
                    }
                  });
                });
              </script>
              <!-- End Line CHart -->

            </div>
          </div>
        </div>

       <!-- Recent Sales -->
       <div class="col-12">
         <div class="card">
           <div class="card-body">
             <h5 class="card-title" style="font-weight: bold !important;">주문 목록</h5>
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">주문번호</th>
                    <th>구매자명</th>
                    <th>상품명</th>
                    <th>결제금액</th>
                    <th>구매일</th>
                    <th>거래 상태</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="ord" items="${orderlist}">
                 <tr>
                    <th scope="row"><a href="orderdetailList.am?ordnum=${ord.ordnum}">${ord.ordnum}</a></th>
                    <td>${ord.ordname}</td>
                    <td>${ord.ordpdname}</td>
                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ord.ordtotalpay}" />원</td>
                    <td>
                    	<fmt:parseDate value="${ord.orddate}" var="orddate" pattern="yyyy-MM-dd HH:mm:ss" />
                    	<fmt:formatDate var="orddate" value="${orddate}" pattern="yyyy-MM-dd"/>
                    	${orddate}
                    </td>
                    <td>
	                  <c:if test="${ord.ordpaystate == '결제 완료' }">
					    <span class="badge bg-success">결제 완료</span>
				      </c:if>
					  <c:if test="${ord.ordpaystate == '환불 요청' }">
						<a href="adminCancelPayOrd.am?ordnum=${ord.ordnum}">
						<span class="badge bg-warning">환불 승인</span>
						</a>
				      </c:if>
				   	  <c:if test="${ord.ordpaystate == '환불 승인' }">
						<span class="badge bg-danger">환불 완료 </span>
					  </c:if>
					</td>
                  </tr>
                </c:forEach>
         
                </tbody>
              </table>

            </div>
          </div>     
        </div><!-- End Recent Sales -->

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">
          <!-- News & Updates Traffic -->
          <div class="card">
           <div class="card-body pb-0">
              <h5 class="card-title" style="font-weight: bold !important;">사용자 게시판 <span>| 최신글 5개</span></h5>

              <div class="news" style="margin-bottom: 20px;">
                <c:forEach var="board" items="${boardlist}">
	                <div class="post-item clearfix">
	                  <img src="<%=resourcesPath%>/images/${board.bodImage != '' ? board.bodImage : 'noimage.png' }" width="60" height="60">
	                  <h4><a href="boardDetail.board?bodNum=${board.bodNum}">${board.title}</a></h4>
	                  <p>${board.tags}</p>
	                </div>
				</c:forEach>
                

              </div><!-- End sidebar recent posts-->

            </div>
          </div><!-- End News & Updates -->

		  <div class="card top-selling overflow-auto">
			<div class="card-body pb-0">
                  <h5 class="card-title" style="font-weight: bold !important;">인기 상품 Top5</h5>

                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">상품명</th>
                        <th scope="col">판매 횟수</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="sell" items="${detailtopseller}">
                      <tr>
                        <th scope="row">${sell.ranknum}위</th>
                        <td><a href="prdDetail.prd?pdname=${sell.pdname}" class="text-primary fw-bold">${sell.pdname}</a></td>
                        <td class="fw-bold">${sell.sellnum}</td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>

                </div>

              </div>
        </div><!-- End Right side columns -->

      </div>
    </section>

  </main>


 <%@include file= "./../common/admin_footer.jsp" %>