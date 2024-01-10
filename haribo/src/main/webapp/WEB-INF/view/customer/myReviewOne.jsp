<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
						마이 페이지
					</h1>
					<p class="link-nav">
						<a href="${pageContext.request.contextPath }/home">
							Home 
						</a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}">
							My Page
						</a>
						<span class="lnr lnr-arrow-right"></span>
						<a href="${pageContext.request.contextPath }/myReviewList?customerNo=${loginCustomer.customerNo}">
							My ReviewList
						</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	
	<div class="container">
		<div class="row">
			<jsp:include page="/inc/customerMyPageSidebar.jsp"></jsp:include>
			<div class="col-lg-9 comments-area" align="center">
			<h3>내가 작성한 리뷰</h3><br><br>
				<div>
					<table  class="col-lg-11">
						<tr align="center">
							<td class="col-lg-1"></td>
							<td class="col-lg-1"></td>
							<td class="col-lg-1"></td>
							<td class="col-lg-1"></td>
							<td class="col-lg-1"></td>
							<td class="col-lg-1"></td>
						</tr>
						<form id="form" action="${pageContext.request.contextPath }/updateReview" method="post">
							<tr align="center" height="140px">
								<td colspan="2"><h3>제목</h3><input id="reviewNo" type="hidden" name="reviewNo" value="${rMap.reviewNo }"></td>
								<td colspan="4"><h3><input class="single-input" type="text" name="reviewTitle" value="${rMap.reviewTitle}"></h3></td>
							</tr>
							<tr align="right">
								<td colspan="4">작성자<br><br><br>
								<td colspan="2"><input class="single-input" type="text" name="customerId" placeholder="${loginCustomer.customerId }" readonly><br><br></td>
							</tr>
							<tr align="center">
								<td colspan="1">프로그램</td>
								<td colspan="2"><input class="single-input" type="text" placeholder="${rMap.programName }(${rMap.branchName })" readonly></td>
								<td colspan="1">담당 트레이너</td>
								<td colspan="2"><input class="single-input" type="text" placeholder="${rMap.employeeId }" readonly></td>
							</tr>
							<tr align="center" height="100px">
								<td colspan="6"><h3>내용</h3></td>
							</tr>
							<tr align="center">
								<td colspan="1"></td>
								<td colspan="4" height="100px"><h3><textarea class="single-textarea" name="reviewContent">${rMap.reviewContent }</textarea></h3><br><br></td>
								<td colspan="1"></td>
							</tr>
							<tr align="right">
								<td colspan="4">작성일<br><br><br></td>
								<td colspan="2"><input class="single-input" type="text" placeholder="${rMap.createdate }" readonly><br><br></td>
							</tr>
						</form>
						<tr align="left">
							<td colspan="6">
								<button id="updateBtn" class="btn btn-outline-dark">수정</button>
								<button id="deleteBtn" class="btn btn-outline-danger">삭제</button>
							</td>
						</tr>
					</table>
				</div><br><br>
				<div>
				<h3>Reply</h3><br><br>
					<table class="table col-lg-11">
						<tr align="center">
							<td class="col-lg-7"><h3>내용</h3></td>
							<td class="col-lg-2"><h3>작성자</h3></td>
							<td class="col-lg-3"><h3>작성일</h3></td>
						</tr>
					</table>
					<c:forEach var="rr" items="${rrList }">
						<c:if test="${rr.reviewNo == rMap.reviewNo }">
							<table class="table col-lg-11">
								<tr align="center">
									<td class="col-lg-7">${rr.reviewReplyContent }</td>
									<td class="col-lg-2">${rr.employeeId }</td>
									<td class="col-lg-3">${rr.createdate }</td>
								</tr>
							</table>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div><br><br>
	
	
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
	$('#updateBtn').click(function(){
		var result = confirm('수정하시겠습니까');
		if(result){
			$('#form').submit()
		}else{
			
		}
	})
	
	$('#deleteBtn').click(function(){
		var result2 = confirm('삭제하시겠습니까');
		if(result2){
			location.replace('${pageContext.request.contextPath}/deleteReview?reviewNo=${rMap.reviewNo}&customerNo=${loginCustomer.customerNo}');
		}else{
			
		}
	})	
	</script>
</body>

</html>