<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="customer/img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="colorlib">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>하리보팀 파이널프로젝트</title>

	<link href="https://fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,700" rel="stylesheet">
	<!--
			CSS
			============================================= -->
	<link rel="stylesheet" href="customer/css/linearicons.css">
	<link rel="stylesheet" href="customer/css/font-awesome.min.css">
	<link rel="stylesheet" href="customer/css/bootstrap.css">
	<link rel="stylesheet" href="customer/css/magnific-popup.css">
	<link rel="stylesheet" href="customer/css/nice-select.css">
	<link rel="stylesheet" href="customer/css/animate.min.css">
	<link rel="stylesheet" href="customer/css/owl.carousel.css">
	<link rel="stylesheet" href="customer/css/jquery-ui.css">
	<link rel="stylesheet" href="customer/css/main.css">
</head>

<body>
	<!-- start header Area -->
	<!-- inc 폴더의 CustomerHeader.jsp를 include -->
	<jsp:include page="/inc/customerHeader.jsp"></jsp:include>
	<!-- End header Area -->
	
	<!-- start banner Area -->
	<section class="banner-area relative about-banner" id="home">
		<img class="cta-img img-fluid" src="customer/img/cta-img.png" alt="">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1>
						마이 페이지
					</h1>
					<p class="link-nav">
						<a href="${pageContext.request.contextPath }/home">
							Home 
						</a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}">
							My Page
						</a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}">
							Schedule
						</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	
	<div class="container">
		<div class="row">
			<jsp:include page="/inc/customerMyPageSidebar.jsp"></jsp:include>
			<div class="col-lg-9 comments-area">
				<div>
					<h3>일정</h3><br><br>
					<div>
						<h4>${calMap.targetYear}년 ${calMap.targetMonth +1}월</h4>
						<a style="float:left" class="btn btn-outline-secondary" 
						href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth -1}">
							이전 달
						</a>
						<a style="float:right" class="btn btn-outline-secondary" 
						href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth +1}">
							다음 달
						</a>
					</div><br><br>
					<table class="table table-bordered" style="table-layout:fixed">
						<tr>
							<th class="col-lg-1" style="color:red">일</th>
							<th class="col-lg-1">월</th>
							<th class="col-lg-1">화</th>
							<th class="col-lg-1">수</th>
							<th class="col-lg-1">목</th>
							<th class="col-lg-1">금</th>
							<th class="col-lg-1">토</th>
						</tr>
						<tr style="height:200px">
						<c:forEach var="i" begin="1" end="${calMap.totalTd}" step="1">
							<c:set var="d" value="${i - calMap.beginBlank }"></c:set>
							<c:if test="${i % 7 == 1 }">
								<td style="color:red">
							</c:if>
							<c:if test="${!(i % 7 == 1)}">
								<td>
							</c:if>
							<c:if test="${d < 1 || d > calMap.lastDate}">
								&nbsp;
							</c:if>
							<c:if test="${!(d < 1 || d > calMap.lastDate)}">
								${d }<br>
								<c:forEach var="p" items="${proList }">
									<c:if test="${p.programDateDay == d }">
										<c:if test="${p.exitTime != null }">
											<a href="${pageContext.request.contextPath }/insertReviewForm?programReservationNo=${p.programReservationNo}" data-bs-toggle="tooltip" title="리뷰 쓰기">
												<h6>${p.branchName }<br>
												: ${p.programName}</h6>
											</a>
										</c:if>
										<c:if test="${p.exitTime == null }">
										<h6>${p.branchName }<br>
											: ${p.programName}</h6>
											</c:if>
										<div>
											<c:if test="${p.programDate <= now }">
												<c:if test="${p.cnt == 0 && p.enterTime == null}">
													<span class="badge bg-primary text-light">
														<a class="text-light" href="${pageContext.request.contextPath }/insertAttendance?programReservationNo=${p.programReservationNo }&customerNo=${loginCustomer.customerNo}">
															입실하기
														</a>
													</span>
												</c:if>
												<c:if test="${p.enterTime != null}">
													<span class="badge bg-primary text-light">
														입실 ${p.enterTime }
													</span>
												</c:if>
												<c:if test="${p.cnt != 0 && p.exitTime == null}">
													<span class="badge bg-danger">
														<a class="text-light" href="${pageContext.request.contextPath }/updateAttendance?programReservationNo=${p.programReservationNo }&customerNo=${loginCustomer.customerNo}">
															퇴실하기
														</a>
													</span>
												</c:if>
												<c:if test="${p.cnt != 0 && p.exitTime != null}">
													<span class="badge bg-danger text-light">
														퇴실 ${p.exitTime }
													</span>
												</c:if>
											</c:if>
										</div>
										<br><br>
									</c:if>
								</c:forEach>
							</c:if>
							</td>
							<c:if test="${i < calMap.totalTd && i % 7 == 0}">
								</tr><tr style="height:200px">	
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div><br><br>
	
	
	<!-- start footer Area -->
	<!-- inc 폴더의 CustomerFooter.jsp를 include -->
	<jsp:include page="/inc/customerFooter.jsp"></jsp:include>
	<!-- End footer Area -->

	<script src="customer/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	 crossorigin="anonymous"></script>
	<script src="customer/js/vendor/bootstrap.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="customer/js/easing.min.js"></script>
	<script src="customer/js/hoverIntent.js"></script>
	<script src="customer/js/superfish.min.js"></script>
	<script src="customer/js/jquery.ajaxchimp.min.js"></script>
	<script src="customer/js/jquery.magnific-popup.min.js"></script>
	<script src="customer/js/jquery.tabs.min.js"></script>
	<script src="customer/js/jquery.nice-select.min.js"></script>
	<script src="customer/js/owl.carousel.min.js"></script>
	<script src="customer/js/mail-script.js"></script>
	<script src="customer/js/main.js"></script>
</body>

</html>