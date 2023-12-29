<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>About Us</title>

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
		<img class="cta-img img-fluid" src="customer/img/cta-img.png" alt="">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1>
						About Us
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span> <a href="${pageContext.request.contextPath}/aboutUs">
							About Us</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start About Us Area -->
	<section class="about-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
						<h1>How Yogaflex can change your life</h1>
						<p>As you pour the first glass of your favorite Chianti or Chardonnay and settle into an intimate Friday evening.</p>
					</div>
				</div>
			</div>

			<div class="row justify-content-between align-items-center">
				<div class="col-lg-6 about-right">
					<div class="row">
						<div class="col-lg-6">
							<div class="single-about">
								<h4>Why Choose Us</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
									Ut enim ad minim veniam.
								</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="single-about">
								<h4>Our Properties</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
									Ut enim ad minim veniam.
								</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="single-about">
								<h4>Legal Notice</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
									Ut enim ad minim veniam.
								</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="single-about">
								<h4>Legal Notice</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
									Ut enim ad minim veniam.
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6 about-left">
					<img class="customer/img-fluid" src="customer/img/about-img.png" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- End About Us Area -->

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
					<div class="single-testimonial item">
				<c:forEach var="r" items="${list}">
						<img class="mx-auto rounded-circle" src="customer/img/t1.png" alt="">	<!-- ${r.customerImgFileName} -->
						<p class="desc">
							${r.reviewContent}
						</p>
						<h4>${r.customerId }</h4>
						<p>
					
						</p>
				</c:forEach>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t2.png" alt="">
						<p class="desc">
							It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has
							been achieving great heights so far as its.
						</p>
						<h4>Cordelia Barton</h4>
						<p>
							CEO at Twitter
						</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t3.png" alt="">
						<p class="desc">
							About 64% of all on-line teens say that do things online that they wouldn’t want their parents to know about. 11% of all
							adult internet users visit dating websites.
						</p>
						<h4>Carrie Reese</h4>
						<p>
							CEO at Google
						</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t1.png" alt="">
						<p class="desc">
							Accessories Here you can find the best computer accessory for your laptop, monitor, printer, scanner, speaker, projector,
							hardware and more. laptop accessory
						</p>
						<h4>Helena Phillips</h4>
						<p>
							CEO at Facebook
						</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t2.png" alt="">
						<p class="desc">
							It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has
							been achieving great heights so far as its.
						</p>
						<h4>Cordelia Barton</h4>
						<p>
							CEO at Twitter
						</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t3.png" alt="">
						<p class="desc">
							About 64% of all on-line teens say that do things online that they wouldn’t want their parents to know about. 11% of all
							adult internet users visit dating websites.
						</p>
						<h4>Carrie Reese</h4>
						<p>
							CEO at Google
						</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t1.png" alt="">
						<p class="desc">
							Accessories Here you can find the best computer accessory for your laptop, monitor, printer, scanner, speaker, projector,
							hardware and more. laptop accessory
						</p>
						<h4>Helena Phillips</h4>
						<p>
							CEO at Facebook
						</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t2.png" alt="">
						<p class="desc">
							It won’t be a bigger problem to find one video game lover in your neighbor. Since the introduction of Virtual Game, it has
							been achieving great heights so far as its.
						</p>
						<h4>Cordelia Barton</h4>
						<p>
							CEO at Twitter
						</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto rounded-circle" src="customer/img/t3.png" alt="">
						<p class="desc">
							About 64% of all on-line teens say that do things online that they wouldn’t want their parents to know about. 11% of all
							adult internet users visit dating websites.
						</p>
						<h4>Carrie Reese</h4>
						<p>
							CEO at Google
						</p>
					</div>
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