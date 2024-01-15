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
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container-fluid">
			<div class="row fullscreen d-flex align-items-center justify-content-between">
				<div class="col-lg-6 col-md-6 banner-img">
					<img class="img-fluid" src="customer/img/1.png" alt="">
				</div>
				<div class="banner-content col-lg-6 col-md-6">
					<h1 class="text-uppercase">
						<span>Final Project</span> of <br> HariboTeam
					</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<!-- Start schedule Area -->
	<section class="schedule-area section-gap">
		<img class="featured-img img-fluid" src="customer/img/8.png" alt="">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
						<h1>상담 신청하기</h1><br>
						<h5>신청서 작성해주시면 확인 후 개별로 연락 드리겠습니다.</h5><br>
						<p>
						 <form class="form-area contact-form text-right" id="contact" action="${pageContext.request.contextPath}/contact" method="post">
						<div class="row">
							<div class="col-lg-6 form-group">
								<label for="date">신청자의 생년월일을 선택해주세요: <input type="date"  name="customerBirth" max="2100-01-01" min="1950-01-01"  style="border:none"></label>
								<div><br></div>
							<label for="datetime">원하시는 상담 날짜와 시간을 선택해주세요:
  							<input type="datetime-local" name="customerContactDate" max="2100-01-01T21:00" min="1950-01-01T12:30" style="border:none"></label>
							</div>
							<div class="col-lg-6 form-group">
								<input name="customerName" placeholder="상담 신청자명을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력하세요'"
								 class="common-input mb-20 form-control" required="" type="text">
								 <input name="customerPhone" placeholder="신청자 전화번호를 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '번호를 입력하세요'"
								 class="common-input mb-20 form-control" required="" type="text">
								<textarea class="common-textarea form-control" name="contactContent" placeholder="상담목적를 입력해주세요" onfocus="this.placeholder = ''"
								 onblur="this.placeholder = 'Enter Messege'" required=""></textarea>
							</div>
							<div class="col-lg-12">
								<div class="alert-msg" style="text-align: left;"></div>
								<button class="genric-btn primary" style="float: right;">상담 신청</button>
							</div>
						</div>
					</form></p>
					</div>
				</div>
			</div>

	
		</div>
	</section>
<!-- End schedule Area -->

<!-- Start Features Area -->
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
				<c:forEach var="p" items="${plist}">
					<div class="single-testimonial item">
						<img class="img-fluid" src="customer/img/featured-class/f1.jpg" alt="">
						<div class="overlay overlay-bg"></div>
						<p class="desc">
							<h4>작성자 : ${p.programName }</h4><br>
							<h6>상세보기는 상단 메뉴바를 이용해주세요</h6>
						</p>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</section>
<!-- End Features Area -->

	<!-- Start testomial Area -->
	<section class="testomial-area section-gap">
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