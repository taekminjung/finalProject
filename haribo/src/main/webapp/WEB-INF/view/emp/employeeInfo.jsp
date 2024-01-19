<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <title>마이페이지</title>
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

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        마이페이지
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-5">
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">About Me</h3>
              <div class="col-xs-4" style="float:right">
         	     <a href="${pageContext.request.contextPath}/updateEmployeePw?employeeNo=${loginEmployee.employeeNo}" class="btn btn-primary mb-2">비밀번호 변경</a>
              </div>
            </div>
            
            <div class="box-body">
             <form id="form" name="form" method="post" action="${pageContext.request.contextPath}/updateEmployeeImg" enctype="multipart/form-data">
              <strong><i class="fa fa-user margin-r-5"></i>직원명</strong>
              <p class="text-muted">
					<input type="text" name="employeeName" value="${empInfo.employeeName}" readonly style="border:none">
              </p>
              <hr>
              <strong><i class="fa fa-circle margin-r-5"></i>직원 ID</strong>
              <p>		
             		<input type="text" name="employeeId" value="${empInfo.employeeId}" readonly style="border:none">
              </p>
              <hr>
              <strong><i class="fa fa-envelope margin-r-5"></i> Email</strong>
              <p>
     				<input type="text" name="employeeEmail" value="${empInfo.employeeEmail}" readonly style="border:none">
              </p>
              <hr>
              <strong><i class="fa fa-mobile-phone margin-r-5"></i>전화번호</strong>
              <p>
              		<input type="text" name="employeePhone" value="${empInfo.employeePhone}" readonly style="border:none">
              </p>
              <hr>
             
                <div class="form-group">
                	<label for="eImg">이미지</label>
                	<input type="file" id="eImg" name="eImg" accept=".jpg, .jpeg, .png">
                	<input type="hidden" name="employeeNo" value="${loginEmployee.employeeNo}">
        	    </div>                    
          		</form>
          		<div class="col-xs-4">
          			<button type="submit" id="formImg" class="btn btn-success">사진 변경</button>
          		</div>	
            </div>
          </div>
        </div>
        </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.13
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
  </aside>

  <div class="control-sidebar-bg"></div>
</div>

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
