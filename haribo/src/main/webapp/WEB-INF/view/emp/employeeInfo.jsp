<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="emp/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="emp/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="emp/bower_components/Ionicons/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="emp/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="emp/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="emp/dist/css/skins/skin-blue.min.css">

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/inc/adminHeader.jsp" %>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        User Profile
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
              <strong><i class="fa fa-user margin-r-5"></i>Employee Name</strong>
              <p class="text-muted">
					<input type="text" name="employeeName" value="${empInfo.employeeName}" readonly style="border:none">
              </p>
              <hr>
              <strong><i class="fa fa-circle margin-r-5"></i> Employee ID</strong>
             		<input type="text" name="employeeId" value="${empInfo.employeeId}" readonly style="border:none">
              <hr>
              <strong><i class="fa fa-envelope margin-r-5"></i> Email</strong>
              <p>
     				<input type="text" name="employeeEmail" value="${empInfo.employeeEmail}" readonly style="border:none">
              </p>
              <hr>
              <strong><i class="fa fa-mobile-phone margin-r-5"></i> Phone</strong>
              <p>
              		<input type="text" name="employeePhone" value="${empInfo.employeePhone}" readonly style="border:none">
              </p>
              <hr>
             
                <div class="form-group">
                	<label for="eImg">Image</label>
                	<input type="file" id="eImg" name="eImg" accept=".png">
                	<input type="hidden" name="employeeNo" value="${loginEmployee.employeeNo}">
        	    </div>                    
              
              	<div class="col-xs-4">
          			<button type="submit" id="form" class="btn btn-success">사진 변경</button>
          		</div>		
          		</form>
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
</body>
</html>
