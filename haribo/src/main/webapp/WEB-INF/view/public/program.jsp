<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
 <style>
        .overlay {
            background-image: url('"customer/img/banner-bg.png');
            
        }
    </style>
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
	<title>하리보 지점</title>

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
	<!-- end header Area -->

	<!-- start banner Area -->
	<section class="banner-area relative blog-home-banner" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content blog-header-content col-lg-12">
					<h1 class="text-uppercase text-white">
						<span>Haribo Team</span> 의 <br> 프로그램
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span> <a href="${pageContext.request.contextPath}/program">
							Program</a></p>
					<a href="${pageContext.request.contextPath}/contact" class="primary-btn mt-40">Contact Us</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start top-category-widget Area -->
	<section class="top-category-widget-area pt-90 pb-90 ">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
						<h1>프로그램</h1>
						<p>저희가 준비한 프로그램입니다.</p>
					</div>
				</div>
			</div>
	<div align="center">
				<div class="col-lg-8 sidebar-widgets" >
					<div class="widget-wrap">
						<div class="single-sidebar-widget search-widget">
						<h5 style="text-align: center;">프로그램 검색</h5>
							<form class="search-form" action="${pageContext.request.contextPath}/program" method="post" id="searchProgram">
								<input placeholder="검색어를 입력해주세요" name="programName" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '검색어를 입력해주세요'">
								<button type="submit"><i class="fa fa-search"></i></button>
							</form>
						</div>
					</div>
				</div>
			</div>
	</section>
		<section class="testomial-area section-gap">
			<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
						<h1>OUR Programs</h1>
						<p>저희가 준비한 프로그램입니다.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="active-testimonial-carusel">
				<c:forEach var="p" items="${list}">
				<a href="${pageContext.request.contextPath}/programDetail?programNo=${p.programNo}&programName=${p.programName}">
					<div class="single-testimonial item">
						<img class="img-fluid" src="customer/img/featured-class/f1.jpg" alt="">
						<div class="overlay overlay-bg"></div>
						<p class="desc">
							<h4>${p.programName }</h4><br>
							<h6> 프로그램상세보기</h6>
						</p>
					</div>
					</a>
				</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- End top-category-widget Area -->

	<!-- Start post-content Area -->
	<section class="team-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
					
					</div>
				</div>
			</div>
			</div>
			
			</section>	
	<section class="post-content-area">
				

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
