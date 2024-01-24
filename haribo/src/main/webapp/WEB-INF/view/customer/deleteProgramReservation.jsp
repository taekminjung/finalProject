<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
	<!-- 공통 스타일 폰트 -->
  	<link rel="stylesheet" href="common/css/main.css">
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="customer/img/favicon.png">
	<!-- Author Meta -->
	<meta name="author" content="colorlib">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>프로그램 예약 취소</title>

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
	<style>
	input[type=checkbox] {

	zoom: 2.0;

	}
	</style>
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
						프로그램 예약 취소
					</h1>
					<p class="link-nav"><a href="index.html">Home </a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="blog-single.html">
							My Page
						</a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="blog-single.html">
							Cancel Reservation
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
				<div class="col-lg-9 posts-list">
					<br><br><h4>프로그램 예약 취소</h4>
					<div>
						<button id="deleteBtn" class="btn btn-outline-danger" style="float:right">예약 취소</button><br><br>
						<fieldset style="background-color: #ffffff; border:5px groove; height:1000px; overflow:scroll;">
						<legend style="background-color: gray; color: white; padding: 5px 10px; width:250px">예약 취소 가능 날짜</legend>
							<form id="deleteForm" action="${pageContext.request.contextPath }/deleteProgramReservation" method="post">
								<div align="center">
									<div class="textDiv"><br>
										<input type="hidden" name="customerNo" value="${loginCustomer.customerNo }">
										<h4>프로그램 당일 예약 취소는 불가능합니다.</h4><br>
										<h4>취소를 원하시는 날짜를 선택 후 "예약 취소" 버튼을 눌러주세요.</h4><br><br>
										<h4><input type="checkbox" id="ckCtrl">&nbsp;전체 선택</h4><br>
										<c:forEach var="pr" items="${prList }">
											<h4><input id="ck" type="checkbox" name="programReservationNoList" value="${pr.programReservationNo }">&nbsp;${pr.programName },${pr.branchName } : ${pr.programDate }</h4><br>
										</c:forEach>
									</div>
								</div>
							</form>
						</fieldset>
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
		$('#deleteBtn').click(function(){
			if($('input:checkbox[id=ck]:checked').length < 1){
				alert('하나 이상의 날짜를 선택해주세요');
			}else{
				$('#deleteForm').submit();
			}
		});
		
		$('#ckCtrl').on("change",function(){
			console.log('클릭');
			if($(this).is(":checked")){
				console.log('체크');
				$('input[type="checkbox"]').prop("checked",true);
			}else{
				console.log('해제');
				$('input[type="checkbox"]').prop("checked",false);
			}
			
		})
	</script>
</body>

</html>