<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx" class="no-js">

<head>
	<!-- 공통 스타일 폰트 -->
  	<link rel="stylesheet" href="common/css/main.css">
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
	<title>멤버십 상세/결제</title>

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
						
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="${pageContext.request.contextPath}/payment">
							Payment
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
								<img class="customer/img-fluid" src="${pageContext.request.contextPath}/upload/emp/${membership.membershipName}.png" alt="">
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
						<c:forEach var="m" items="${list}">
							<h3 class="mt-20 mb-20">${m.membershipName}권</h3> 
						</div>
						<div class="col-lg-12">
							<div class="quotes">
							 해당 멤버십은 ${m.membershipMonth}개월 권 입니다
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 sidebar-widgets">
					<div class="widget-wrap">
						<div class="single-sidebar-widget user-info-widget">

							<h3>${m.membershipName}권 결제하기</h3>
							<br>
							<h4>결제 금액 : ${m.membershipPrice}원</h4>
							<p>
								<form id="form" action="${pageContext.request.contextPath}/insertPayment" method="post">
									<input type="hidden" value="${loginCustomer.customerId}" name="customerId">
									<input type="hidden" value="${loginCustomer.customerNo}" name="customerNo">
									<input type="hidden" value="${m.membershipNo}" name="paymentMembershipNo">
									<input id="price"type="hidden" value="${m.membershipPrice}" name="paymentPrice">
								</form>
									<button id="paymentBtn" class="primary-btn mt-40">결제</button>
							</p>
							</c:forEach>
							<p></p>
						</div>
					</div>
					<div class="d-grid">
						<button type="button" class="btn btn-outline-secondary btn-block" disabled>
							<br>
							<p>현재 멤버십 종료 날짜</p>
							<P id="membershipEnd"></P>
						</button>
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
		$('#paymentBtn').click(function(){
			var result = confirm($('#price').val()+'원이 결제됩니다. \n결제를 진행 하시겠습니까');
			if(result){
				$('#form').submit()
			}else{
				
			}
		})
		
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