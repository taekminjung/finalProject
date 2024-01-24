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
    </section>
    <br>
    <!-- 페이지 메인 내용 시작 -->
    <section class="content-body">
        <div class="col-md-4">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">🔑비밀번호 변경🔑</h3>
            </div>
            <div class="box-body">
            <form id="form" method="post" action="${pageContext.request.contextPath}/updateTrainerPw">
              
                <div class="form-group" class="col-sm-2">
                  <label for="pw" >현재 비밀번호</label>
                    <input type="password" class="form-control" id="pw" name="employeePw" placeholder="현재 비밀번호를 입력하세요 ...">
                </div>
            
                <div class="form-group" class="col-sm-10">
                  <label for="newPw" >새 비밀번호(변경할 비밀번호)</label>
                    <input type="password" class="form-control" id="newPw" name="newEmployeePw" placeholder="새 비밀번호를 입력하세요 ...">
                </div>
                <div class="form-group" class="col-sm-10">
                  <label for="newPwCk" >새 비밀번호 일치 확인</label>
                <input type="password" class="form-control" id="newPwCk" placeholder="새 비밀번호 일치 여부 확인 ...">
                </div>
              <div>
               	<input type="hidden" id="employeeId" name="employeeId" value="${loginEmployee.employeeId}">
              	<input type="hidden" id="employeeNo" name="employeeNo" value="${loginEmployee.employeeNo}">
              </div>
            </form>
            <a href="${pageContext.request.contextPath}/trainerOne?employeeNo=${loginEmployee.employeeNo}" class="btn btn-default">돌아가기</a>
        	<button type="submit" id="formBtn" class="btn btn-info pull-right">비밀번호 변경하기</button>
            </div>
          </div>
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
	$('#formBtn').click(function(){
		if($('#pw').val().length < 1){
			alert('현재 비밀번호를 입력하세요');
			$('#pw').focus();
		} else if ($('#newPw').val().length < 1){
			alert('새로운 비밀번호를 입력하세요');
			$('#newPw').focus();
		} else if ($('#newPwCk').val().length < 1){
			alert('새로운 비밀번호 확인을 입력하세요');
			$('#newPwCk').focus();
		} else if ($('#newPw').val() != $('#newPwCk').val()){
			alert('비밀번호 확인이 일치하지 않습니다');
			$('#newPwCk').focus();
		} else{
			$.ajax({
				url:'/haribo/employeePwCk',
				method:'post',
				data:{
					'employeePw':$('#pw').val(),
					'employeeId':$('#employeeId').val()},
				success:function(json){
					if(json != 1){
						$('#pw').val('');
						alert('현재 비밀번호가 일치하지 않습니다')
					} else{
						if($('#pw').val() == $('#newPw').val()){
							alert('기존 비밀번호와 같습니다. 다른 비밀번호를 입력하세요')
							$('#newPw').focus();
						} else{
							$('#form').submit();
						}
					}
				},
				error:function(err){
					console.log(err);
				}
		});
	}
});
</script>
</body>
</html>