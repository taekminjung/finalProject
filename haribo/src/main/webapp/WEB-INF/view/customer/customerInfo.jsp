<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<title>회원 개인정보</title>

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
	
	<!-- 공공 데이터 활용 주소 검색 api -->
	<script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/haribo/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
	
	function jusoCallBack(roadFullAddr){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
	}
	</script>
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
						<a href="${pageContext.request.contextPath }/customerInfo?customerNo=${loginCustomer.customerNo}">
							Info
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
			<div class="col-lg-9 comments-area">
			<h3>개인 정보</h3><input type="hidden" id="customerId" value="${loginCustomer.customerId }"><br><br>
				<form name="form" id="form" method="post" action="${pageContext.request.contextPath }/updateCustomerInfo?customerNo=${loginCustomer.customerNo}">
					<div class="row">
						<div class="col-lg-6">
							<p>이름</p>
							<input id="name" type="text" name="customerName" value="${custInfoMap.customerName }" class="single-input">
						</div>
						<div class="col-lg-6">
							<p>성별</p>
							<input type="text" name="customerGender" value="${custInfoMap.customerGender }자" class="single-input" readonly>
						</div>
					</div><br><br>
					<div class="row">
						<div class="col-lg-6">
							<p>키</p>
							<input type="text" name="customerHeight" value=${custInfoMap.customerHeight } class="single-input">
						</div>
						<div class="col-lg-6">
							<p>몸무게</p>
							<input type="text" name="customerWeight" value=${custInfoMap.customerWeight } class="single-input">
						</div>
					</div><br><br>
					<div>
						<p>전화번호</p>
						<input id="phone" type="text" name="customerPhone" value=${custInfoMap.customerPhone } class="single-input">
					</div><br><br>
					<div class="row">
						<div class="col-lg-6">
							<p>이메일 아이디</p>
							<input id="emailId" type="text" name="emailId" value="${custInfoMap.emailId }" class="single-input">
						</div>
						<div class="default-select col-lg-6" id="default-select">
							<p>이메일 도메인</p>
							<select name="emailDomain">
								<option value="${custInfoMap.emailDomain }" selected>${custInfoMap.emailDomain }</option>
								<option value="@naver.com">@naver.com</option>
								<option value="@gmail.com">@gmail.com</option>
							</select>
						</div>
					</div><br><br>
					<div id="callBackDiv">
						<p style="float:left">주소</p><input type="button" onClick="goPopup();" value="Find Addr" style="float:right"/>
						<input id="roadFullAddr" type="text" name="customerAddress" value="${custInfoMap.customerAddress }" class="single-input" readonly>
					</div>
				</form><br>
				<div class="row">
					<div class="col-lg-8">
						<p>비밀번호 확인</p>
						<input id="customerPw" type="password" name="customerPw" placeholder="비밀번호 입력 후 수정가능" class="single-input">
					</div>
					<div class="col-lg-4" align="center">
						<p></p>
						<button id="formBtn" class="genric-btn primary-border circle e-large">수정</button>
					</div>
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
			if($('#name').val().length < 1){
				alert('이름을 확인해주세요');
				$('#name').focus();
			}else if($('#phone').val().length < 1){
				alert('전화번호를 확인해주세요');
				$('#phone').focus();
			}else if($('#emailId').val().length < 1){
				alert('이메일을 확인해주세요');
				$('#emailId').focus();
			}else if($('#roadFullAddr').val().length < 1){
				alert('주소를 확인해주세요');
				$('#roadFullAddr').focus();
			}else if($('#customerPw').val().length < 1){
				alert('비밀번호를 입력해주세요');
			}else{
				$.ajax({
					url:'/haribo/customerPwCk',
					method:'post',
					data:{'customerPw':$('#customerPw').val(),'customerId':$('#customerId').val()},
					success:function(json){
						if(json != 1){
							$('#customerPw').val('')
							alert('비밀번호가 틀렸습니다')
						}else{
							$('#form').submit();
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