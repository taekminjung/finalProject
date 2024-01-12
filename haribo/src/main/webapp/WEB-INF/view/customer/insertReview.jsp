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
	<title>리뷰 작성하기</title>

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
						리뷰 작성하기 
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span> <a href="${pageContext.request.contextPath}/insertReview">
							</a>InsertReview</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start schedule Area -->
	<section class="schedule-area section-gap">
		<img class="featured-img img-fluid" src="img/featured-class/feature-img.png" alt="">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<jsp:include page="/inc/customerMyPageSidebar.jsp"></jsp:include>
				<div class="col-lg-9">
					<div class="section-title-wrap text-center">
						<h1>리뷰 작성하기</h1>
						<p>예약 에 대한 리뷰 작성하기 입니다.</p>
					</div>
					<table class="schdule-table table table-bordered">
						<thead class="thead-light">
							<tr>
								<th class="head" scope="col">수강 지점</th>
								<th class="head" scope="col">수강한 프로그램</th>
								<th class="head" scope="col">프로그램 수강 날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${map.branchName}</td>
								<td>${map.programName}</td>
								<td>${map.programDate}</td>
							</tr>
						</tbody>
					</table>
				<div class="table-wrap">
				<form id="form" action="${pageContext.request.contextPath}/insertReview" method="post">
					<table class="schdule-table table table-bordered">
						<tr>
							<th class="head col-lg-2" scope="col">제목</th>
							<td><input id="title" class="single-input" type="text" name="reviewTitle"></td>
						</tr>
						<tr>
							<th class="head" scope="col" align="center">내용</th>
							<td><textarea id="content" name="reviewContent" cols="100" rows="5" style="border:none;"></textarea></td>
						</tr>
					</table>
					<input type="hidden" name="programReservationNo" value="${review.programReservationNo}">
					<input type="hidden" name="customerNo" value="${loginCustomer.customerNo }">
					</form>
					<button id="formBtn" class="btn btn-outline-dark">리뷰 작성하기</button>
				</div>
			</div>
		</div>
	</section>
	<!-- End schedule Area -->

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
		$('#formBtn').click(function(){
			if($('#title').val().length < 1){
				alert('제목을 입력하세요');
			}else if($('#content').val().length < 1){
				alert('내용을 입력하세요');
			}else{
				$('#form').submit();
			}
		})
	</script>
</body>

</html>