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
	<title>프로그램 예약하기</title>

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
				<div class="col-lg-9 posts-list">
					<br><br><h4>프로그램 예약하기</h4>
					<div class="col-lg-12"><br><br>
						<select  class="form-select col-lg-5" id="program" style="float:left">
							<option>프로그램</option>
							<c:forEach var="p" items="${proList }">
								<option value="${p.programName }">${p.programName }</option>
							</c:forEach>
						</select>
						<select  class="form-select col-lg-5" id="branch" style="float:left">
							<option>지점</option>
						</select>
					
						<button class="col-lg-1 btn btn-outline-dark" id="formBtn" style="float:right" disabled>예약</button>
					</div>
					<div><br><br><br><br>
						<fieldset style="background-color: #ffffff; border:5px groove; height:1000px; overflow:scroll;">
						<legend style="background-color: gray; color: white; padding: 5px 10px; width:200px">예약 가능 날짜</legend>
							<form id="programDateForm" action="${pageContext.request.contextPath }/insertProgramReservation" method="post">
								<input type="hidden" name="customerId" value="${loginCustomer.customerId }">
								<input type="hidden" name="customerNo" value="${loginCustomer.customerNo }">
								<div align="center">
									<div class="textDiv">
										<br><br><h3>원하시는 프로그램과 지점을 선택해주세요</h3>
										<br><h3>예약 가능 일자가 출력되고 예약 버튼이 활성화 됩니다.</h3>
										<br><h6 style="color:red;">*예약은 프로그램 실시 전날까지 가능합니다*</h6>
										<br><h6 style="color:red;">*멤버십이 없으시면 날짜가 출력되지 않습니다.*</h6><br><br>
									</div>
									<h3><input type="checkbox" id="ckCtrl">&nbsp;전체 선택</h3><br>
									<div class="formDiv">
										
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
					$('.textDiv').html('')
					$('.formDiv').html('')
					$('#formBtn').attr("disabled", false);
					$(json).each(function(index,item){
						if($.trim(item.programReservationCNT) < $.trim(item.programMax)){
							$('.formDiv').append('<h3><input type="checkbox" id="ck" name="programDateNoList" value="'+item.programDateNo+'">&nbsp;&nbsp;&nbsp;'+item.programName+'&nbsp;('+item.branchName+')&nbsp;'+item.programDate+'&nbsp;('+item.programReservationCNT+'/'+item.programMax+')'+'</h3><br>');
						}else{
							$('.formDiv').append('<h3><input disabled type="checkbox" id="ck" name="programDateNoList" value="'+item.programDateNo+'">&nbsp;&nbsp;&nbsp;'+item.programName+'&nbsp;('+item.branchName+')&nbsp;'+item.programDate+'&nbsp;('+item.programReservationCNT+'/'+item.programMax+')'+'</h3><br>');
						}
					})
				}
			})
		})
		
		$('#formBtn').click(function(){
			if($('input:checkbox[id=ck]:checked').length < 1){
				alert('하나 이상의 날짜를 선택해주세요');
			}else{
				$('#programDateForm').submit();
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
	</Script>
</body>

</html>