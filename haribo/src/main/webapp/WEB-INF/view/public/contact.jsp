<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=139fe7eca596ff88f8b69da1ea0c9e18&libraries=services"></script>

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
	<!-- inc 폴더의 CustomerHeader.jsp를 include -->
	<jsp:include page="/inc/customerHeader.jsp"></jsp:include>
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
	<h1 style="text-align: center;">지점 위치</h1><br>
		<div class="container">
			<div class="row">
			 
				<div  class="map-wrap" style="width:100%; height: 440px;" id= "map"></div><div><br></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	139fe7eca596ff88f8b69da1ea0c9e18"></script>
			<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(37.476502, 126.880176),
							level: 14
						};	
						var map = new kakao.maps.Map(container, options);
						// 마커가 표시될 위치(본사,제주,부산)
						var markerPosition  = new kakao.maps.LatLng(37.476502, 126.880176); 
						var markerPosition1  = new kakao.maps.LatLng(33.496779, 126.531605);
						var markerPosition2  = new kakao.maps.LatLng(35.141186, 129.059647); 
						// 서울 본사 마커 생성
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
						//제주지점
						var marker1 = new kakao.maps.Marker({
						    position: markerPosition1
						});
						//부산 지점
						var marker2 = new kakao.maps.Marker({
						    position: markerPosition2
						});
						// 마커가 지도 위에 표시되도록 설정
						//서울본사
						marker.setMap(map);
						//제주지점
						marker1.setMap(map);
						//부산지점
						marker2.setMap(map);

						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
						var mapTypeControl = new kakao.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시
						// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의(오른쪽 위)
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
						var zoomControl = new kakao.maps.ZoomControl();
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						
						 // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						var iwContent = '<div style="padding:5px;">하리보팀 본사 <br><a href="https://map.kakao.com/link/map/하리보팀 본사,37.476502, 126.880176" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,37.476502, 126.880176" style="color:blue" target="_blank">길찾기</a></div>',
					    iwPosition = new kakao.maps.LatLng(37.476502, 126.880176); 
						//제주 인포윈도우
						var iwContent1 = '<div style="padding:5px;">하리보팀 제주지점 <br><a href="https://map.kakao.com/link/map/하리보팀 제주지점,33.496779, 126.531605" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.496779, 126.531605" style="color:blue" target="_blank">길찾기</a></div>',
					    iwPosition1 = new kakao.maps.LatLng(33.496779, 126.531605);
						var iwContent2 = '<div style="padding:5px;">하리보팀 부산지점 <br><a href="https://map.kakao.com/link/map/하리보팀 부산지점,35.141186, 129.059647" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,35.141186, 129.059647" style="color:blue" target="_blank">길찾기</a></div>',
					    iwPosition2 = new kakao.maps.LatLng(35.141186, 129.059647);
					// 인포윈도우 생성(서울,제주,부산)
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					var infowindow1 = new kakao.maps.InfoWindow({
					    position : iwPosition1, 
					    content : iwContent1 
					});
					var infowindow2 = new kakao.maps.InfoWindow({
					    position : iwPosition2, 
					    content : iwContent2 
					});
					  
					// 마커 위에 인포윈도우를 표시/ 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시
					//본사
					infowindow.open(map, marker);
					//제주
					infowindow1.open(map, marker1);
					//부산
					infowindow2.open(map, marker2);
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
		
			</div>
		</div>
	</section>
	<!-- End contact-page Area -->

	<!-- start footer Area -->
	<!-- inc 폴더의 CustomerFooter.jsp를 include -->
	<jsp:include page="/inc/customerFooter.jsp"></jsp:include>
	<!-- End footer Area -->

	<script src="customer/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	 crossorigin="anonymous"></script>
	<script src="customer/js/vendor/bootstrap.min.js"></script>
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