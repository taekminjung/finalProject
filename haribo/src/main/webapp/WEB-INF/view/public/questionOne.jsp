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
	<title>문의사항 상세보기</title>

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
				<br>
					<h1>
						문의사항 상세보기
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span> <a href="${pageContext.request.contextPath}/questionList">
							Question</a></p>
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
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
						<h1>문의사항 상세보기</h1>
						<p>문의사항 상세보기 페이지 입니다.</p>
					</div>
					<div>
					</div>
				</div>
			</div>
<section>
			<div class="row justify-content-center">
				<div class="table-wrap col-lg-10">
					<table class="schdule-table table table-bordered">
						<thead class="thead-light">
							<tr>
								<th class="head" scope="col">번호</th>
								<th class="head" scope="col">제목</th>
								<th class="head" scope="col">문의내용</th>
								<th class="head" scope="col">작성자</th>
								<th class="head" scope="col">작성일자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${resultQuestion.questionNo}</td>
								<td>${resultQuestion.questionTitle}</td>
								<td>${resultQuestion.questionContent}</td>
								<td>${resultQuestion.customerId}</td>
								<td>${resultQuestion.createdate}</td>
							</tr>
						</tbody>
					</table>
					<c:if test="${resultQuestion.customerId == loginCustomer.customerId}">
					<div style="text-align:center"><a class="primary-btn mt-40" href="${pageContext.request.contextPath}/deleteQuestion?questionNo=${question.questionNo}">삭제</a></div>
					</c:if>
					<br>						
					</section>
					<section>
					<c:if test="${resultQuestion.customerId == loginCustomer.customerId}">
						<h3 style="text-align:center"> 수정</h3><br>
						<table class="schdule-table table table-bordered">
						<thead class="thead-light">
							<tr>
								<th class="head" scope="col">제목</th>
								<th class="head" scope="col">내용</th>
							</tr>
						</thead>
						<tbody>
							<form action="${pageContext.request.contextPath}/updateQuestion" method="post">
								<input type="hidden" value="${question.questionNo}" name="questionNo">
							<tr>
								<td><input type="text" name="questionTitle"></td>
								<td><textarea name="questionContent"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div style="text-align:center">
							<button type="submit"  class="primary-btn mt-40">수정</button>
					</div>
							</form>
							<div style="text-align:center"></div>
					</c:if>
					</section>
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
</body>

</html>