<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>Trainers</title>

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
						트레이너
					</h1>
					<p class="link-nav"><a href="${pageContext.request.contextPath}/home">Home </a>
						<span class="lnr lnr-arrow-right"></span> <a href="${pageContext.request.contextPath}/trainers">
							Trainers</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start team Area -->
	<section class="team-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="section-title-wrap text-center">
						<h1>${branch.branchName}지점 트레이너 소개</h1>
						<p>저희와 함께하는 소중한 트레이너들을 소개합니다.</p>
					</div>
				</div>
			</div>
			<div class="row justify-content-center d-flex align-items-center">
					<c:forEach var="t" items="${list}">
				<div class="col-md-6 col-lg-3 single-team">
					<div class="thumb">
						<img class="customer/img-fluid" src="customer/img/t1.jpg" alt="">
					</div>
					<div class="meta-text mt-30 text-center">
						<h4>${t.employeeName}</h4>
						<p>${t.branchName} 지점</p>
						<p>Email  : ${t.employeeEmail}</p>
					</div>
				</div>
					</c:forEach>
			</div>
		</div>
	</section>
	<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item">
							  <c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/trsiners?currentPage=${currentPage-1}" class="page-link" aria-label="Previous">
									<span aria-hidden="true">
										<span class="lnr lnr-chevron-left"></span>
									</span>
								</a>
								</c:if>
							</li>
							<li class="page-item">
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/trsiners?currentPage=${currentPage+1}" class="page-link" aria-label="Next">
									<span aria-hidden="true">
										<span class="lnr lnr-chevron-right"></span>
									</span>
								</a>
							</c:if>
							</li>
						</ul>
					</nav>
			<section>
			<h1 style="text-align: center;">${branch.branchName} 지점 지도</h1><br>
			<h3 style="text-align: center;">주소 : ${BranchAddr}</h3><br>
			<div class="container">
			<div  class="map-wrap" style="width:100%; height: 440px;" id= "map"></div><div><br></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	139fe7eca596ff88f8b69da1ea0c9e18&libraries=services"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(37.476502, 126.880176), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성  
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의(오른쪽 위)
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
				// 주소-좌표 변환 객체를 생성
				var geocoder = new kakao.maps.services.Geocoder();
				
				// DB에 저장된 지점 주소로 좌표를 검색
				geocoder.addressSearch('${BranchAddr}', function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">하리보팀 ${branch.branchName}<br><a href="https://map.kakao.com/link/search/ ${BranchAddr}" style="color:blue" target="_blank">큰지도보기</a></div> '
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동
				        map.setCenter(coords);
				    } 
				});    
				</script>
			</div>
			</section>
	<!-- End team Area -->

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