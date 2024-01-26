<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<title>회원 탈퇴</title>

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
						<a href="${pageContext.request.contextPath }/deleteCustomer?customerNo=${loginCustomer.customerNo}">
							Withdraw
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
			<h3>회원 탈퇴 비밀번호 입력</h3><br><br>
				<form name="form" id="form" method="post" action="${pageContext.request.contextPath }/deleteCustomer">
					<div>
						<h4>비밀번호를 입력하시면 회원 탈퇴가 진행됩니다.</h4>
					</div><br><br>
					<div class="col-lg-8">
						<div class="row">
							<p>비밀번호 확인</p>
							<input id="pw" type="password" name="customerPw" class="single-input">
							<input id="id" type="hidden" name="customerId" value="${loginCustomer.customerId }">
							<input id="no" type="hidden" name="customerNo" value="${loginCustomer.customerNo }">
						</div><br><br>
					</div>
				</form>
				<div align="center">
					<p></p>
					<button id="formBtn" class="genric-btn primary-border circle e-large">탈퇴</button>
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
		$('#formBtn').click(function(){
			if($('#pw').val().length < 1){
				alert('비밀번호를 입력해주세요')
				$('#pw').focus()
			}else{
				$.ajax({
					url:'/haribo/customerPwCk',
					method:'post',
					data:{'customerPw':$('#pw').val(),'customerId':$('#id').val()},
					success:function(json){
						if(json != 1){
							$('#pw').val('')
							alert('비밀번호가 일치하지 않습니다')
						}else{
							var result = confirm('정말 탈퇴 하시겠습니까?');
							if(result){
								$('#form').submit()
							}else{
								
							}
									
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}
		})
	</script>
</body>

</html>