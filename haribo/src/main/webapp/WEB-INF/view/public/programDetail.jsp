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
	<title>프로그램 상세보기</title>

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
						${program.programName}
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
							<div class="feature-img">
								<img class="customer/img-fluid" src="customer/img/blog/feature-img1.jpg" alt="">
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<h3 class="mt-20 mb-20">${program.programName}</h3> 
						</div>
						<div class="col-lg-12">
						<h5 style="text-align:center">프로그램 소개</h5>
							<div class="quotes">
							${dmap.programMemo}<br>
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
								<li><a href="${pageContext.request.contextPath}/ScheduleByBranch?branchNo=${b.branchNo}&programNo=${program.programNo}&programName=${program.programName}&branchName=${b.branchName}">${b.branchName}</a></li>
							</c:forEach>
							</ul>
						</li>
						</ul>
					</nav>
					</div>
							</p>
						</div>
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
</body>

</html>