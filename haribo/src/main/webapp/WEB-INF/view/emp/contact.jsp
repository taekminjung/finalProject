<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
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
	<title>Contact</title>

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
	<header id="header">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-8 header-top-left no-padding">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-behance"></i></a></li>
						</ul>
					</div>
					<div class="col-lg-6 col-sm-6 col-4 header-top-right no-padding">
						<a href="tel:+880 1234 654 953">
							<span class="text">+880 1234 654 953</span>
						</a>
						<a class="book-now" href="#">Book Now</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="customer/img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.html">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="trainers.html">Trainers</a></li>
						<li class="menu-has-children"><a href="">Blog</a>
							<ul>
								<li><a href="blog-home.html">Blog Home</a></li>
								<li><a href="blog-single.html">Blog Single</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href="">Pages</a>
							<ul>
								<li><a href="schedule.html">Schedule</a></li>
								<li><a href="courses.html">Courses</a></li>
								<li><a href="elements.html">Elements</a></li>
							</ul>
						</li>
						<li><a class="active" href="contact.html">Contact</a></li>
					</ul>
				</nav><!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- end header Area -->

	<!-- start banner Area -->
	<section class="banner-area relative about-banner" id="home">
		<img class="cta-img img-fluid" src="customer/img/cta-img.png" alt="">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1>
						Contact
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span> <a href="${pageContext.request.contextPath}contact">
							Contact</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start contact-page Area -->
	<section class="contact-page-area section-gap">
		<div class="container">
			<div class="row">
			 
				<div  class="map-wrap" style="width:100%; height: 440px;" id= "map"></div><div><br></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	139fe7eca596ff88f8b69da1ea0c9e18"></script>
			<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(37.476502, 126.880176),
							level: 4
						};	
						var map = new kakao.maps.Map(container, options);
						// 마커가 표시될 위치(본사위치)
						var markerPosition  = new kakao.maps.LatLng(37.476502, 126.880176); 
						// 마커 생성
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
						// 마커가 지도 위에 표시되도록 설정
						marker.setMap(map);

						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
						var mapTypeControl = new kakao.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시
						// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의(오른쪽 위)
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
						var zoomControl = new kakao.maps.ZoomControl();
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						
						var iwContent = '<div style="padding:5px;">하리보팀 본사 <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,37.476502, 126.880176" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = new kakao.maps.LatLng(37.476502, 126.880176); //인포윈도우 표시 위치

					// 인포윈도우 생성
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시/ 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시
					infowindow.open(map, marker); 
			</script>
			
				<div class="col-lg-4 d-flex flex-column address-wrap">
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-home"></span>
						</div>
						<div class="contact-details">
							<h5>대한민국/서울 </h5>
							<p>
								서울시 금천구 가산디지털2로 95
							</p>
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-phone-handset"></span>
						</div>
						<div class="contact-details">
							<h5>+82 02)818-7950</h5>
							<p>Mon to Fri 9am to 6 pm</p>
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-envelope"></span>
						</div>
						<div class="contact-details">
							<h5>hariboteam@gmail.com</h5>
							<p>편하게 메일 주세요!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<form class="form-area contact-form text-right" id="contact" action="${pageContext.request.contextPath}/contact" method="post">
						<div class="row">
							<div class="col-lg-6 form-group">
								<label for="date">생년월일을 선택해주세요: <input type="date"  name="customerBirth" max="2077-06-20" min="1900-01-01"></label>
								<div><br></div>
							<label for="datetime">원하시는 상담 날짜와 시간을 선택해주세요:
  							<input type="datetime-local" name="customerContactDate" max="2100-01-01T21:00" min="2077-06-05T12:30"></label>
							</div>
							<div class="col-lg-6 form-group">
								<input name="customerName" placeholder="상담 신청자명을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력하세요'"
								 class="common-input mb-20 form-control" required="" type="text">
								<textarea class="common-textarea form-control" name="contactContent" placeholder="상담목적를 입력해주세요" onfocus="this.placeholder = ''"
								 onblur="this.placeholder = 'Enter Messege'" required=""></textarea>
							</div>
							<div class="col-lg-12">
								<div class="alert-msg" style="text-align: left;"></div>
								<button class="genric-btn primary" style="float: right;">Send Message</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- End contact-page Area -->

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>About Us</h4>
						<p>
							The state of Utah in the United States is home to lots of beautiful National Parks, & Bryce Canyon National Park ranks as
							three of the magnificent & awe inspiring.
						</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>Contact Us</h4>
						<p>
							56/8, rockybeach road, santa monica, Los angeles, California - 59620.
						</p>
						<p class="number">
							012-6532-568-9746 <br> 012-6532-569-9748
						</p>
					</div>
				</div>
				<div class="col-lg-5  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h4>Newsletter</h4>
						<p>You can trust us. we only send offers, not a single spam.</p>
						<div class="d-flex flex-row" id="mc_embed_signup">

							<form class="navbar-form" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							 method="get">
								<div class="input-group add-on align-items-center d-flex">
									<input class="form-control" name="email" placeholder="Your Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email address'"
									 required="" type="email">
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
									</div>
									<div class="input-group-btn">
										<button class="genric-btn"><span class="lnr lnr-arrow-right"></span></button>
									</div>
								</div>
								<div class="info mt-20"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom row align-items-center">
				<p class="footer-text m-0 col-lg-6 col-md-12"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				<div class="col-lg-6 col-sm-12 footer-social">
					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-dribbble"></i></a>
					<a href="#"><i class="fa fa-behance"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.tabs.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>

</html>