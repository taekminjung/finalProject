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
						프로그램 예약
					</h1>
					<p class="link-nav"><a href="index.html">Home </a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="blog-single.html">
							My Page
						</a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="blog-single.html">
							Program Reservation
						</a>
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
				<jsp:include page="/inc/customerMyPageSidebar.jsp"></jsp:include>
				<div class="col-lg-9 posts-list"><br><br>
					<div class="col-lg-10 row">
						<select id="program">
							<option>프로그램</option>
							<c:forEach var="p" items="${proList }">
								<option value="${p.programName }">${p.programName }</option>
							</c:forEach>
						</select>
						<select id="branch" style="float:left">
							<option>지점</option>
						</select>
						<button style="float:right">예약하기</button>
					</div>
					<div>
						<form id="programDateForm" action="${pageContext.request.contextPath }/insertProgramReservation" method="post">
							<input type="hidden" name="cutomerId" value="${loginCustomer.customerId }">
						</form>
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
	<Script>
		$('#program').change(function(){
			$.ajax({
				url:'/haribo/branchNameByProgramName',
				method:'get',
				data:{'programName':$('#program').val()},
				success:function(json){
					$('#branch').html('<option>지점</option>');
					$(json).each(function(index,item){	
						$('#branch').append('<option value="'+item.branchName+'">'+item.branchName+'</option>')
					})
				}
			})
		})
		
		$('#branch').change(function(){
			$.ajax({
				url:'/haribo/programDateByProgramNameBranchName',
				method:'get',
				data:{'branchName':$('#branch').val(),'programName':$('#program').val()},
				success:function(json){
					$('#programDateForm').html('');
					$(json).each(function(index,item){	
						$('#programDateForm').append('<p><input type="checkbox" name="programDateNoList" value="'+item.programDateNo+'">'+item.programDate+'</p>');
					})
				}
			})
		})
		
	</Script>
</body>

</html>