<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>트레이너 홈페이지</title>
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/skin-blue.min.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- header 시작 부분 -->
  <!-- inc 폴더의 TrainerNavi.jsp를 include -->
  <jsp:include page="/inc/trainerNavi.jsp"></jsp:include>
  <!-- header 끝나는 부분 -->

  <!-- aside 작성 뒤 항상 이 부분이 메인 컨텐츠 부분이 됨 -->
  <!-- 헤더 + 내용 wrapper 부분 시작 -->
  <div class="content-wrapper">
    <!-- 페이지 메인 헤더 -->
    <section class="content-header">
      <h1>
        안녕하세요, ${loginEmployee.employeeName}님😀
        <br>
        <small>오늘도 힘찬 하루 되세요💪🏻</small>
      </h1>
    </section>

    <!-- 페이지 메인 내용 시작 -->
    <section class="content container-fluid">
	안뇽딱따구리 여기에 캘린더 들어옴
	<div>
		<div>
			<h4>${calMap.targetYear}년 ${calMap.targetMonth +1}월</h4>
			<a style="float:left" class="btn btn-outline-secondary" 
			href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth -1}">
				이전 달
			</a>
			<a style="float:right" class="btn btn-outline-secondary" 
			href="${pageContext.request.contextPath }/customerSchedule?customerNo=${loginCustomer.customerNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth +1}">
				다음 달
			</a>
		</div>
		<br>
		<br>
		
		<table class="table table-bordered" style="table-layout:fixed">
			<tr>
				<th class="col-lg-1" style="color:red">일</th>
				<th class="col-lg-1">월</th>
				<th class="col-lg-1">화</th>
				<th class="col-lg-1">수</th>
				<th class="col-lg-1">목</th>
				<th class="col-lg-1">금</th>
				<th class="col-lg-1">토</th>
			</tr>
			<tr style="height:200px">
			<c:forEach var="i" begin="1" end="${calMap.totalTd}" step="1">
				<c:set var="d" value="${i - calMap.beginBlank }"></c:set>
				<c:if test="${i % 7 == 1 }">
					<td style="color:red">
				</c:if>
				<c:if test="${!(i % 7 == 1)}">
					<td>
				</c:if>
				<c:if test="${d < 1 || d > calMap.lastDate}">
					&nbsp;
				</c:if>
				<c:if test="${!(d < 1 || d > calMap.lastDate)}">
					${d }<br>
					<c:forEach var="p" items="${proList }">
						<c:if test="${p.programDateDay == d }">
							<c:if test="${p.exitTime != null }">
								<a href="${pageContext.request.contextPath }/insertReviewForm?programReservationNo=${p.programReservationNo}" data-bs-toggle="tooltip" title="리뷰 쓰기">
									<h6>${p.branchName }<br>
									: ${p.programName}</h6>
								</a>
							</c:if>
							<c:if test="${p.exitTime == null }">
							<h6>${p.branchName }<br>
								: ${p.programName}</h6>
								</c:if>
							
							<br><br>
						</c:if>
					</c:forEach>
				</c:if>
				</td>
				<c:if test="${i < calMap.totalTd && i % 7 == 0}">
					</tr><tr style="height:200px">	
				</c:if>
			</c:forEach>
		</table>
	</div>
    </section>
    <!-- 페이지 메인 내용 끝 -->
  </div>
  <!-- 헤더 + 내용 wrapper 부분 끝 -->

  <!-- 메인 footer 항상 적을 것 -->
  <footer class="main-footer">
    <!-- 맨 오른쪽 표시되는 것 -->
    <div class="pull-right hidden-xs">
      팀 하리보
    </div>
    <!-- 저작권 명시 -->
    <strong>Copyright &copy; 2023-2024 <a href="trainerHome">TEAM HARIBO</a>.</strong> All rights reserved.
  </footer>


  <div class="control-sidebar-bg"></div>
</div>
<!-- REQUIRED JS SCRIPTS -->

<!-- fullCalendar -->
<script src="../bower_components/moment/moment.js"></script>
<script src="../bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="emp/dist/js/adminlte.min.js"></script>

</body>
</html>