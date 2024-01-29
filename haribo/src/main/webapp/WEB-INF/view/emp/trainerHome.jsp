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
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
  <!-- 프로필 스타일 -->
  <link rel="stylesheet" href="emp/css/trainerHome.css">
  
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
        안녕하세요, ${loginEmployee.employeeName}님😀<small>오늘도 힘찬 하루 되세요💪🏻</small>
      </h1>
      <br>
      <div class="callout callout-info">
        <h4>📢팀 하리보 공지사항📢</h4>
		<p>한달치 스케줄 결재는 매달 19일에 이루어지니 미리 결재 올려주세요. 📅본인 프로그램 스케줄 확인 필수!!📅</p>
      </div>
    </section>

    <!-- 페이지 메인 내용 시작 -->
    <div class="row">
    	<!-- 달력 시작 -->
	    <div class="col-md-8">
	    <section class="content container-fluid">
		<div class="box box-info">
			<div style="text-align: center;">
				<h2>📅${loginEmployee.employeeName}님의 ${calMap.targetYear}년 ${calMap.targetMonth +1}월 스케줄📅</h2>
				
				<a style="float:left" class="btn btn-outline-secondary" 
				href="${pageContext.request.contextPath}/trainerHome?employeeNo=${loginEmployee.employeeNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth -1}">
					이전 달
				</a>
				<a style="float:right" class="btn btn-outline-secondary" 
				href="${pageContext.request.contextPath}/trainerHome?employeeNo=${loginEmployee.employeeNo}&targetYear=${calMap.targetYear}&targetMonth=${calMap.targetMonth +1}">
					다음 달
				</a>
			</div>
			<br><br>
			<!-- 달력 부분 -->
			<table class="table table-bordered" style="font-size:15px; table-layout: fixed;" >
					<tr>
						<th class="col-lg-1" style="color:red; text-align:center;">일</th>
						<th class="col-lg-1" style="text-align:center;">월</th>
						<th class="col-lg-1" style="text-align:center;">화</th>
						<th class="col-lg-1" style="text-align:center;">수</th>
						<th class="col-lg-1" style="text-align:center;">목</th>
						<th class="col-lg-1" style="text-align:center;">금</th>
						<th class="col-lg-1" style="text-align:center;">토</th>
					</tr>
					<tr style="height:130px;">
					<c:forEach var="i" begin="1" end="${calMap.totalTd}" step="1">
						<c:set var="d" value="${i - calMap.beginBlank }"></c:set>
						
						<!-- 첫번째 칸(일요일) -->
						<c:if test="${i % 7 == 1 }">
							<td style="color:red;">
						</c:if>
						
						<!-- 그 외 칸(월화수목금토) -->
						<c:if test="${!(i % 7 == 1)}">
							<td>
						</c:if>
						
						<!-- 날짜 추가하기 -->
						<c:if test="${d < 1 || d > calMap.lastDate}">
							&nbsp;
						</c:if>
						
						<!-- 스케줄 불러오기 -->
						<c:if test="${!(d < 1 || d > calMap.lastDate)}">
							${d}<br>
							<c:forEach var="pd" items="${pdList}" varStatus="status">
								<c:if test="${d == pd.programDateDay}">
									<span 
										class="badge program-badge" 
										style="color: black;
										<c:choose>
											<c:when test="${pd.programNo % 5 == 0 }">
											 background-color: #5CEEE6;
											</c:when>
											<c:when test="${pd.programNo % 5 == 1 }">
											 background-color: #AAB9FF;
											</c:when>
											<c:when test="${pd.programNo % 5 == 2 }">
											 background-color: #FFC0CB;
											</c:when>
											<c:when test="${pd.programNo % 5 == 3 }">
											 background-color: #FAF58C;
											</c:when>
											<c:when test="${pd.programNo % 5 == 4 }">
											 background-color: #DD78F6;
											</c:when>
											<c:otherwise>
											 background-color: #3CC8C8; 
											</c:otherwise>
										</c:choose>
									">
		    						${pd.programName}
									</span>
								</c:if>
							</c:forEach>
						</c:if>
						</td>
						
						<c:if test="${i < calMap.totalTd && i % 7 == 0}">
							</tr><tr style="height:130px;">	
						</c:if>
					</c:forEach>
			</table>
	    </div>
	    </section>
	    <!-- 페이지 메인 내용 끝 -->
	    </div>
	    <!-- 
	     NEW ALERT 창
        <div class="col-md-4">
		<section class="content container-fluid">
		  <div class="box box-info">
			 <div class="box-header with-border">
		       <h3 class="box-title">상담 신청 <a href="${pageContext.request.contextPath}/contactCustomer?branchNo=${loginEmployee.branchNo}"><span class="badge">NEW 몇 개인지</span></a></h3>
		         <div class="box-tools pull-right">
		           <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		         </div>
		     </div>
		     
             <div class="box-body">
               <table class="tbl tbl-hobber">
                 <tr>
                 <th>여기에</th>
                 </tr>
                 
                 <tr>
                 <td>새로운 문의사항 알람 넣을 예정</td>
                 </tr>
               </table>
             </div>
	      </div>
		</section>
	    </div>
	     -->
	    <!-- 뭔가 알림창? 정보 시작 -->
	    <div class="col-md-4">
	    <section class="content container-fluid">
        <!-- 하리보 팀 트레이너 목록 -->
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">팀 하리보 트레이너</h3>
            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
          </div>
          <!-- 트레이너 정보 -->
          <div class="box-body">
            <ul class="users-list trainer-list clearfix">
              <c:forEach var="t" items="${list}">
              <li class="trainer-info">
                <img src="${pageContext.request.contextPath}/upload/emp/${t.employeeImgFileName}" onerror="this.src='${pageContext.request.contextPath}/upload/emp/man.png'">
                <strong>${t.employeeName}</strong>
                <span class="users-list-date">${t.branchName} 지점</span>
              </li>
              </c:forEach>
            </ul>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
          <div class="btn-group" style="display: flex; justify-content: center;">
	        <c:if test="${currentPage > 1}">
	        <a href="${pageContext.request.contextPath}/trainerHome?currentPage=${currentPage-1}" class="btn btn-info">이전</a>
	        </c:if>
	        <a class="btn btn-info active">${currentPage}</a>
	        <c:if test="${currentPage < lastPage}">
	        <a href="${pageContext.request.contextPath}/trainerHome?currentPage=${currentPage+1}" class="btn btn-info">다음</a>
	      	</c:if>
	      </div>
	      </div>
        </div>
        </section>
        </div>
	    
     </div>
     </div>
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

<!-- REQUIRED JS SCRIPTS -->
<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="emp/dist/js/adminlte.min.js"></script>

</body>
</html>