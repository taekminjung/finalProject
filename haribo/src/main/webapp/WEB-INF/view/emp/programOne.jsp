<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>프로그램 상세 정보</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- 파비콘 코드 -->
  <link rel="icon" type="image/x-icon" href="emp/img/starfavi.png">
  <!-- 공통 스타일 폰트 -->
  <link rel="stylesheet" href="common/css/main.css">
  
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="emp/dist/css/skins/skin-yellow.min.css">
  

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-yellow sidebar-mini">

<div class="wrapper">
  <!-- 헤더 -->
  <jsp:include page="/inc/adminHeader.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        프로그램 상세페이지
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
              <div class="box-body">
 			  <div class="form-group">
			  <label for="trainerName">트레이너명</label>
			  <input type="text" class="form-control" id="employeeId" name="employeeId" value="${resultProgram.employeeId}" readonly>
			  </div>
			  <input type="hidden" name="programNo" value="${resultProgram.programNo}">
			  <div class="form-group">
			    <label for="programName">프로그램명</label>
			    <input type="text" class="form-control" id="programName" name="programName" placeholder="${resultProgram.programName}" readonly>
			  </div>
			  <div class="form-group">
			    <label for="programMaxCustomer">수용 인원</label>
			    <input type="text" class="form-control" id="programMaxCustomer" name="programMaxCustomer" placeholder="${resultProgram.programMaxCustomer }" readonly>
			  </div>
			  <div class="form-group">
			    <label for="programMemo">프로그램 내용</label>
			    <textarea style="height: 150px; width: 600px;" class="form-control" id="programMemo" name="programMemo" placeholder="${resultProgram.programMemo}" readonly></textarea>
			  </div>
			  <div class="form-group">
			    <label for="programDay">프로그램 일자 <br> 예시) 토 / 월, 수, 금 / 화, 목</label>
			    <input type="text" class="form-control" id="programDay" name="programDay" placeholder="${resultProgram.programDay }" readonly>
			  </div>
			  <div style="text-align: center">
			  	<img id="img" src="${pageContext.request.contextPath}/upload/emp/" 
			  		class="rounded-circle" onerror="this.src='${pageContext.request.contextPath}/upload/emp/programdefault.png'" width="250" height="150">
			  </div>
		       <a class="btn bg-navy" href="${pageContext.request.contextPath}/programList">뒤로</a>
   		       <a class="btn btn-primary" id="updateBtn" href="${pageContext.request.contextPath}/updateProgram?programNo=${resultProgram.programNo}">수정</a>
              <div class="box-footer">
  
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    </section>
</div>
  <footer class="main-footer">
    <!-- 맨 오른쪽 표시되는 것 -->
    <div class="pull-right hidden-xs">
      팀 하리보
    </div>
    <!-- 저작권 명시 -->
    <strong>Copyright &copy; 2023-2024 <a href="trainerHome">TEAM HARIBO</a>.</strong> All rights reserved.
  </footer>
</div>

<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="emp/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="emp/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="emp/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="emp/dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="emp/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="emp/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="emp/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="emp/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="emp/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="emp/dist/js/demo.js"></script>

<script>
	$(document).ready(function(){
		$.ajax({
			url:'/haribo/programImg',
			method:'get',
			data:{'programNo': ${resultProgram.programNo}},
			success:function(json){
				console.log(json);	
				$('#img').attr('src','upload/emp/'+json);
			},
			error:function(err){
				console.log(err);
			}
		})
	})
</script>

</body>
</html>
