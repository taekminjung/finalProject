<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	<title>지점별 프로그램 예약현황</title>

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
	<jsp:include page="/inc/customerHeader.jsp"></jsp:include>	<!-- end header Area -->

	<!-- start banner Area -->
	<section class="banner-area relative about-banner" id="home">
		<img class="cta-img img-fluid" src="customer/img/cta-img.png" alt="">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1>
						${pmap.branchName}지점 ${program.programName} 강의 일정
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="${pageContext.request.contextPath}/program">
							program
						</a>
						
						<p class="link-nav">
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<br><h4 style="text-align:center">${pmap.branchName}지점 ${program.programName} 프로그램 강의 일정</h4>
							<h4 style="text-align:center">${cMap.targetYear}년 ${cMap.targetMonth +1}월</h4>
									<div class="row justify-content-center">
				<div class="table-wrap col-lg-12">
					<a style="float:left" class="btn btn-outline-secondary" 
						href="${pageContext.request.contextPath }/ScheduleByBranch?programNo=${program.programNo}&programName=${program.programName}&targetYear=${cMap.targetYear}&targetMonth=${cMap.targetMonth -1}&branchNo=${branch.branchNo}&branchName=${pmap.branchName}">
							이전 달
						</a>
						<a style="float:right" class="btn btn-outline-secondary" 
						href="${pageContext.request.contextPath }/ScheduleByBranch?programNo=${program.programNo}&programName=${program.programName}&targetYear=${cMap.targetYear}&targetMonth=${cMap.targetMonth +1}&branchNo=${branch.branchNo}&branchName=${pmap.branchName}">
							다음 달
						</a>
					<table class="schdule-table table table-bordered">
						<thead class="thead-light">
							<tr>
								<th class="head" scope="col" style="color:red">일</th>
								<th class="head" scope="col">월</th>
								<th class="head" scope="col">화</th>
								<th class="head" scope="col">수</th>
								<th class="head" scope="col">목</th>
								<th class="head" scope="col">금</th>
								<th class="head" scope="col">토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
						<c:forEach var="i" begin="1" end="${cMap.totalTd}" step="1">
						<c:set var="d" value="${i -cMap.beginBlank}"></c:set>	
								<c:if test="${i % 7 == 1 }">
								<td style="color:red">
								</c:if>
								<c:if test="${!(i % 7 == 1)}">
								<td>
							</c:if>
							<c:if test="${d < 1 || d > cMap.lastDate}">
								&nbsp;
							</c:if>
							<c:if test="${!(d < 1 || d > cMap.lastDate)}">
								${d }<p>예약현황 : </p><br>
								<c:forEach var="p" items="${pList}">
									<c:if test="${p.programDateDay == d}">
										
										<span class="badge badge-danger">${p.programReservationCnt}/${p.programMaxCustomer}</span>
									</c:if>
								</c:forEach>
							</c:if>
							</td>
							<c:if test="${i < cMap.totalTd && i % 7 == 0}">
								</tr><tr>	
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="single-sidebar-widget user-info-widget">
							<img src="customer/img/blog/user-info.png" alt="">
							<a href="#"><h4>${map.employeeName}</h4></a>
							<p>
								${map.branchName}지점 트레이너
							</p>
							<p>
							Email : ${map.employeeEmail}
							</p>
								<p >
							<h5>지점별 일정/예약현황 보기</h5><br>
							<div style="margin: auto; text-align: center;">
							<nav id="nav-menu-container" >
							<ul class="nav-menu" >
						<li class="menu-has-children"><a href="">지점 선택</a>
							<ul>
							<c:forEach var="b" items="${list}">
								<li><a href="${pageContext.request.contextPath}/ScheduleByBranch?branchNo=${b.branchNo}&programNo=${program.programNo}&programName=${program.programName}&branchName=${b.branchName}">${b.branchName }</a></li>
							</c:forEach>
							</ul>
						</li>
						</ul>
					</nav>
					</div>
							</p>
						</div>
						<div class="d-grid">
						<a href="${pageContext.request.contextPath }/insertProgramReservation">
							<button type="button" class="btn btn-outline-secondary btn-block">
								<br>
								<p>예약하기</p>
							</button>
						</a>
					</div><br>
					<div class="d-grid">
						<a href="${pageContext.request.contextPath }/membership">
							<button type="button" class="btn btn-outline-secondary btn-block">
								<br>
								<p>멤버십 종료 날짜</p>
								<P><span id="membershipEnd"></span></P>
							</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End post-content Area -->

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
	<script>
	$(document).ready(function(){
		$.ajax({
			url:'/haribo/membershipEnd',
			method:'get',
			data:{'customerNo':${loginCustomer.customerNo}},
			success:function(json){
				$('#membershipEnd').text(json);
			},
			error:function(err){
				console.log(err);
			}
		})
	})
	</script>
</body>

</html>