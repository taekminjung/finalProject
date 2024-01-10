<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="colorlib">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>리뷰</title>

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
	<section class="banner-area relative about-banner" id="home">
		<img class="cta-img img-fluid" src="img/cta-img.png" alt="">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1>
						리뷰
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span> <a href="${pageContext.request.contextPath}/reviewList">
							Review</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<br><br>
	<!-- Start testomial Area -->
	<section class="testomial-area section-gap-bottom">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
						<h1>고객 리뷰</h1>
						<p>저희 프로그램을 수강하신 소중한 고객님들의 리뷰입니다.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="active-testimonial-carusel">
				<c:forEach var="r" items="${list}">
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle"  width="150" height="150"  src="${pageContext.request.contextPath}/upload/customer/${r.customerImgFileName}" alt=""  onerror="this.src='${pageContext.request.contextPath }/upload/customer/default.jpg'">
						<p class="desc">
							<h4>작성자 : ${r.customerId }</h4><br>
							<h4>수강 프로그램 : ${r.programName}</h4><br>
							<h5>수강 지점: ${r.branchName}</h5><br>
							<h5>담당트레이너: ${r.employeeId}</h5><br>
							리뷰 제목:${r.reviewTitle}<br>
							리뷰 내용 : ${r.reviewContent}
						</p>
						<c:forEach var="rp" items="${rpList }">
							<c:if test="${r.reviewNo == rp.reviewNo }">
								
								<p class="desc">
									<h4>관리자 : ${rp.employeeId }</h4><br>
									코멘트 : ${rp.reviewReplyContent}
								</p>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- End testomial Area -->

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