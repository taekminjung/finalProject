<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>트레이너 마이페이지</title>
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
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
      <h1>📅${loginEmployee.employeeName}님의 마이페이지📅</h1>
      <br>
      <div class="callout callout-info">
        <h4>팀 하리보 공지사항</h4>
		<p>📢처음 오신 트레이너 분들께서는 본인 프로필 사진 업데이트 부탁드립니다.
		<br>📢기존 트레이너 분들께서도 프로필 사진은 항상 최근 사진으로 수정 부탁드립니다.</p>
      </div>
    </section>
    
    <!-- 페이지 메인 내용 시작 -->
    <section class="content-body">
    <div class="col-md-4">
    <!-- 트레이너 마이페이지 -->
       <div class="box box-info">
        
         <div class="box-body box-profile">
         <form id="form" name="form" method="post" action="${pageContext.request.contextPath}/updateTrainerImg" enctype="multipart/form-data">
           <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath}/upload/emp/${empInfo.employeeImgFileName}" onerror="this.src='${pageContext.request.contextPath}/upload/emp/man.png'">

           <h3 class="profile-username text-center">${empInfo.employeeName}</h3>
           
           <input type="hidden" name="employeeName" value="${empInfo.employeeName}">
           <input type="hidden" name="employeeId" value="${empInfo.employeeId}">
           <input type="hidden" name="employeeEmail" value="${empInfo.employeeEmail}">
           <input type="hidden" name="employeePhone" value="${empInfo.employeePhone}">
           <input type="hidden" name="employeeNo" value="${loginEmployee.employeeNo}">

           <p class="text-muted text-center">${loginEmployee.branchName}지점 트레이너</p>
           
           <ul class="list-group list-group-unbordered">
             <li class="list-group-item">
               <b><i class="fa fa-user margin-r-5"></i>아이디</b> <span class="text-muted pull-right">${empInfo.employeeId}</span>
             </li>
             <li class="list-group-item">
               <b><i class="fa fa-envelope margin-r-5"></i>이메일</b> <span class="text-muted pull-right">${empInfo.employeeEmail}</span>
             </li>
             <li class="list-group-item">
               <b><i class="fa fa-phone margin-r-5"></i>전화번호</b><span class="text-muted pull-right">${empInfo.employeePhone}</span>
             </li>
           	<li class="list-group-item">
               <b><i class="fa fa-heart margin-r-5"></i>입사일</b><span class="text-muted pull-right">${empInfo.createdate}</span>
             </li>
           	<li class="list-group-item">
	           <b><i class="fa fa-lock margin-r-5"></i>비밀번호 변경</b>
		  	   <a href="${pageContext.request.contextPath}/updateTrainerPw?employeeNo=${loginEmployee.employeeNo}" class="btn btn-info pull-right btn-xs">비밀번호 변경</a>
           	</li>
           	<li class="list-group-item">
           	   <b><i class="fa fa-photo margin-r-5"></i>프로필 사진</b>
	           <input type="file" class="form-control" id="eImg" name="eImg" accept=".jpg, .jpeg, .png">
           	</li>
           </ul>
           </form>
           <a href="${pageContext.request.contextPath}/trainerHome" class="btn btn-default">돌아가기</a>
           <button type="submit" id="formImg" class="btn btn-success pull-right">사진변경</button>
         </div>
         </div>
      <!-- /.box -->
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

<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="emp/dist/js/adminlte.min.js"></script>

<script>
	$('#formImg').click(function(){
		if($('#eImg').val().length<1){
			alert('변경할 사진을 추가해주세요')
			$('#eimg').focus()
		} else{
			$('#form').submit()
		}
	})
</script>
</body>
</html>